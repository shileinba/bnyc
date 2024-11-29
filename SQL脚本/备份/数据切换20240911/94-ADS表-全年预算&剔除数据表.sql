/**
drop table data_center.ads_index_code_account_ref;
CREATE TABLE data_center.ads_index_code_account_ref (
  index_code varchar(64) comment '指标编码',
  index_name varchar(64) comment '指标名称',
  account varchar(64) comment '科目',
  scenario varchar(64) comment '场景',
  synthesis varchar(64) comment '业务综合',
  exclude varchar(64) comment '是否剔除 1 是 0 否',
  origin_index_code varchar(64) comment '原始 index_code',
  table_name varchar(64) comment '底表名称',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间'
) COMMENT='指标科目关系对照表';
**/

/**
drop table data_center.ads_budget_broad_chart_2;
CREATE TABLE data_center.ads_budget_broad_chart_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  account varchar(64) comment '科目',
  scenario varchar(64) comment '场景',
  synthesis varchar(64) comment '业务综合',
  version_code varchar(64) comment '版本号',
  amount decimal(32, 6) comment '预算数',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间'
) COMMENT='全年预算宽表';
**/

-- 2025年预算取的是 Budget
-- 插入2025年三公经费预算 
delete from ods_budget_operating_value where account = 'SGJF_TOTAL' and scenario = 'Budget';
insert into ods_budget_operating_value
  select
    a.entity ,
    'SGJF_TOTAL',
    a.currency,
    a.years,
    a.period,
    a.version,
    a.scenario,
    -- a.sjfl,
    -- a.zcw,
    -- a.industry,
    a.type,
    a.synthesis,
    a.bywy,
    a.bywe,
    a.byws,
    a.amount + (select b.amount from ods_budget_operating_value b 
    where b.entity = a.entity 
        and b.years = a.years 
        and b.version = a.version 
        and b.account = 'DJMCB2002'
        and b.scenario = 'Budget' 
        and b.synthesis = 'ZE'
      ) + (select b.amount from ods_budget_operating_value b 
    where b.entity = a.entity 
        and b.years = a.years 
        and b.version = a.version 
        and b.account = 'DJMCB2006'
        and b.scenario = 'Budget' 
        and b.synthesis = 'ZE'
      ),
    RAND() * 10000000
  from ods_budget_operating_value a
  where a.account = 'DJMCB2001'
      and a.scenario = 'Budget' and a.synthesis = 'ZE'
  ;

-- 2025年预算 ： 剥离费BOLIFEI =  剥离费DJMCB08 + 长期摊销费用 GDZB07
delete from ods_budget_operating_value where account = 'BOLIFEI' and scenario = 'Budget';
insert into ods_budget_operating_value
select
    a.entity ,
    'BOLIFEI',
    a.currency,
    a.years,
    a.period,
    a.version,
    a.scenario,
    a.type,
    a.synthesis,
    a.bywy,
    a.bywe,
    a.byws,
    a.amount + case when b.amount is null then 0 else b.amount end,
    RAND() * 10000000  -- id
  from 
    (select * from ods_budget_operating_value where account = 'DJMCB08' and scenario = 'Budget' and synthesis = 'DWJE') a   -- 剥离费
  left join 
    (select * from ods_budget_operating_value where account = 'GDZB07' and scenario = 'Budget' and synthesis = 'DWJE') b  -- 长期摊销费用
  on 
      a.entity = b.entity and a.years = b.years and a.version = b.version 
  ;


-- 2024年是 scenario = NCYSS 
-- 2025年是 scenario = Budget 
  truncate table data_center.ads_budget_broad_chart_2;
  insert into data_center.ads_budget_broad_chart_2
  select 
    a.org_code,
    a.org_name,
    a.level_code,
    a.year,
    a.index_name,
    a.index_code,
    a.account,
    a.scenario,
    a.synthesis,
    a.version_code,
    b.amount,
    now()
  from 
  (
    select 
      t1.*,
      t2.*,
      t3.*
    from ads_index_code_account_ref t1,
          ads_ys_version_info t2, 
          ads_orgnization t3
    where t1.account <> '' and (t1.exclude <> '1'  or t1.exclude is null)  and t2.year = '2024' -- 是2024年的，取NCYSS 年初预算数
  )  a
  left join ods_budget_operating_value b
    on b.entity = a.org_code
      and b.years = a.year
      and b.version = a.version_code
      and b.scenario = 'NCYSS'
      and b.SYNTHESIS = a.synthesis
      and b.account = a.account;

insert into data_center.ads_budget_broad_chart_2
  select 
    a.org_code,
    a.org_name,
    a.level_code,
    a.year,
    a.index_name,
    a.index_code,
    a.account,
    a.scenario,
    a.synthesis,
    a.version_code,
    b.amount,
    now()
  from 
  (
    select 
      t1.*,
      t2.*,
      t3.*
    from ads_index_code_account_ref t1,
          ads_ys_version_info t2, 
          ads_orgnization t3
    where t1.account <> '' and (t1.exclude <> '1'  or t1.exclude is null)  and t2.year <> '2024'   -- 不是2024年的，取Budget 预算数
  )  a
  left join ods_budget_operating_value b
    on b.entity = a.org_code
      and b.years = a.year
      and b.version = a.version_code
      and b.scenario = 'Budget'
      and b.SYNTHESIS = a.synthesis
      and b.account = a.account;

-- 2024-11-14 ： 五率指标特殊处理 ， 2024年的预算数值 取 Budget 且业务为 None的。
delete from data_center.ads_budget_broad_chart_2 where index_code in ('254','255','256','257','258') and date  = '2024' and account = 'NCYSS';
insert into data_center.ads_budget_broad_chart_2
select 
    a.org_code,
    a.org_name,
    a.level_code,
    a.year,
    a.index_name,
    a.index_code,
    a.account,
    a.scenario,
    a.synthesis,
    a.version_code,
    b.amount,
    now()
  from 
  (
    select 
      t1.*,
      t2.*,
      t3.*
    from ads_index_code_account_ref t1,
          ads_ys_version_info t2, 
          ads_orgnization t3
    where t1.index_code in ('254','255','256','257','258')  and t2.year = '2024'  -- 不是2024年的，取Budget 预算数
  )  a
  left join ods_budget_operating_value b
    on b.entity = a.org_code
      and b.years = a.year
      and b.version = a.version_code
      and b.scenario = 'Budget'
      and b.SYNTHESIS = a.synthesis
      and b.account = a.account;

/** 
    *************
    剔除指标 
    *************
**/
/**
drop table data_center.ads_index_exclude;
CREATE TABLE data_center.ads_index_exclude (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  exclude_amount decimal(32, 6) comment '剔除数',
  reason varchar(255) comment '剔除原因',
  account varchar(64) comment '科目',
  years varchar(64) comment '年份',
  version_code varchar(64) comment '版本号',
  scenario varchar(64) comment '场景',
  synthesis varchar(64) comment '业务综合',
  budget_amount decimal(32, 6) comment '预算数',  -- 全年预算
  amount_acc decimal(32, 6) comment '实际数'
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间'
) COMMENT='指标数据剔除表';
**/
-- 105表剔除数据表
truncate table ads_index_exclude;
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数 
  t1.amount_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
--           b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from ads_coal_cockpit_month_1 m
      left join  (select * from ads_index_code_account_ref where table_name  = 'YGL0105' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = t.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
  and v.scenario = 'NCYSS'
  and v.synthesis = 'ZE'
;


-- 0102资产负债 表剔除数据表
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,  -- index_code
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数 
  t1.amount_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
--           b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          r.account,
          ver.version_code
  from ads_asset_core m
      left join  (select * from ads_index_code_account_ref where table_name  = 'YZB0102' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = t.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
  ;


-- 特殊处理 ： 2024-11-12 ， 针对 所有者权益 资产负债表 0102 ， 需要取年初数。
delete from ads_index_exclude where index_code  = '405';
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数  
  t1.amount_acc_begin , -- 实际值
  now() 
  from 
(       
  select
          m.*,
--           b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from 
      (select * from ads_asset_core where index_code  = '155') m
      left join (select * from data_center.ods_tcys where hc = '405') t 
          on t.org_code = m.org_code and t.date = m.date
      left join  (select * from ads_index_code_account_ref where table_name  = 'YZB0102' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join data_center.ads_orgnization b 
          on  b.org_code = t.org_code
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
  ;


-- YGL0072 科技支出 表剔除数据表
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数 
  t1.amount_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
--           b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from ads_report_technology_expense m
      left join  (select * from ads_index_code_account_ref where table_name  = 'YGL0072' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = t.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
  ;



-- YZB0003 现金流量 表剔除数据表
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数  
  t1.amount_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
          b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from (
            select * from ods_cash_flow_hq
              where index_code  = '28'
            union all 
            select * from ods_cash_flow_bo
              where index_code  = '28') m
      left join  (select * from ads_index_code_account_ref where table_name  = 'YZB0003' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = m.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION;

-- YGL0078 集团汇总指标 表剔除数据表
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数 
  t1.acc_year , -- 实际值
  now() 
  from 
(       
  select
          m.*,
          b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from (
         select * from ods_summary_index_hq
          union all
          select * from ods_summary_index_bo) m
      left join (select * from ads_index_code_account_ref 
                        where  table_name  = 'YGL0078'
                            and scenario = 'NCYSS'
                            and synthesis = 'ZE') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = m.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
;

-- YGL0102 职工福利费明细 表剔除数据表
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  v.scenario,
  v.synthesis,
  v.AMOUNT  / 12 * (IF(substr(t1.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(t1.date,6,2) AS SIGNED), NULL)),   -- 进度预算数 
  t1.amount_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
--           b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          ver.version_code
  from ads_employee_benefits m
      left join  (select * from ads_index_code_account_ref where table_name  = 'YGL0102' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
          on r.origin_index_code  = m.index_code 
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = t.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
;

  -- ---  2024.11.12 begin a1  上面是 总额ZE 的 ，下面是单位金额 DWJE  unit_price_acc,目前只有105表里有单位金额的数据需要处理。  ----------
insert into ads_index_exclude
select 
  t1.org_code,
  t1.org_name,
  t1.level_code,
  t1.date,
  t1.r_index_name,
  t1.r_index_code,
  (case when t1.tcz is null then 0 else t1.tcz end ),  --  剔除值
  t1.tcyy,
  t1.account,
  v.years,
  t1.version_code,
 -- v.VERSION,
  t1.scenario,
  t1.synthesis,
  v.AMOUNT,   -- 进度预算数 
  t1.unit_price_acc , -- 实际值
  now() 
  from 
(       
  select
          m.*,
          b.level_code, 
          t.tcxm,
          t.hc,
          t.tcz,
          t.tcyy,
          r.account,
          r.index_code as r_index_code,
          r.index_name as r_index_name,
          r.scenario,
          r.synthesis,
          ver.version_code
  from (select * from data_center.ods_coal_produce_hq
          union all
         select * from data_center.ods_coal_produce_bo
    ) m
      left join ads_ys_version_info ver 
          on substr(m.date,1,4) = ver.year
      left join (select * from  ads_index_code_account_ref 
                      where table_name  = 'YGL0105'
                          and scenario = 'NCYSS'
                          and synthesis = 'DWJE' )   r  
          on r.origin_index_code  = m.index_code 
      left join data_center.ods_tcys t 
          on t.org_code = m.org_code 
          and t.date = m.date
          and t.hc = r.index_code
      left join data_center.ads_orgnization b 
          on  b.org_code = m.org_code
) t1
left join ods_budget_operating_value v
on t1.org_code = v.entity 
  and t1.account = v.ACCOUNT
  and substr(t1.date,1,4)  = v.YEARS
  and t1.version_code  = v.VERSION
  and v.scenario = 'NCYSS'
  and v.synthesis = 'DWJE'
  ;

-- ---   end a1 ---------------------------------------------------
  
-- 资产负债率index_code  =  441 , 表剔除数据表
insert into ads_index_exclude
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '资产负债率_剔除',
  '441',
  (a.amount_acc - a.exclude_amount ) / (b.amount_acc - b.exclude_amount),
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
  (a.amount_acc / b.amount_acc),
  now()
from 
  (
    select * from ads_index_exclude where index_code  =  '400'   -- 负债总额
  ) a
left join 
  (
    select * from ads_index_exclude where index_code  =  '401'   -- 资产总额
  ) b
on 
  a.date = b.date 
  and a.level_code = b.level_code 
  and a.org_code  =  b.org_code 
  and a.version_code  = b.version_code 
left join (select * from ods_budget_operating_value where account  = 'WLVYS03' and scenario = 'Budget' and synthesis = '[None]') v
on a.org_code  = v.entity and substr(a.date,1,4)  = v.years  and v.version = a.version_code
--   and a.scenario = b.scenario
--   and a.synthesis = b.synthesis
 ;

-- 研发投入强度index_code  =  442 , 表剔除数据表
insert into ads_index_exclude
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '研发投入强度_剔除',
  '442',
  ( case when ( b.amount_acc - b.exclude_amount) = 0 then 0 else  (a.amount_acc - a.exclude_amount )  / ((b.amount_acc - b.exclude_amount) * 10000) end  )  , 
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
  (case when b.amount_acc = 0 then 0 else  a.amount_acc / b.amount_acc  end ) ,
  now()
from 
  (
    select * from ads_index_exclude where index_code  =  '402'   -- 科技支出_剔除
  ) a
left join 
  (
    select * from ads_index_exclude where index_code  =  '403'   -- 营业总收入_剔除
  ) b
on 
  a.date = b.date 
  and a.level_code = b.level_code 
  and a.org_code  =  b.org_code 
  and a.version_code  = b.version_code 
left join (select * from ods_budget_operating_value where account  = 'WLVYS13' and scenario = 'Budget' and synthesis = '[None]') v
on a.org_code  = v.entity and substr(a.date,1,4)  = v.years  and v.version = a.version_code
--   and a.scenario = b.scenario
--   and a.synthesis = b.synthesis
 ;

-- 净资产收益率index_code  =  443 , 表剔除数据表
insert into ads_index_exclude
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '净资产收益率_剔除',
  '443',
     ( case when 
       ( (case when b.amount_acc is null then 0 else b.amount_acc end ) - (case when b.exclude_amount is null then 0 else b.exclude_amount end )) 
        + 
      ((case when c.amount_acc is null then 0 else c.amount_acc end ) - (case when c.exclude_amount is null then 0 else c.exclude_amount end )) = 0 then 0 
      else 
          (a.amount_acc - a.exclude_amount ) * 10000 / (( (case when b.amount_acc is null then 0 else b.amount_acc end ) - (case when b.exclude_amount is null then 0 else b.exclude_amount end )) 
          + 
          ((case when c.amount_acc is null then 0 else c.amount_acc end ) - (case when c.exclude_amount is null then 0 else c.exclude_amount end )) )
     end )
      ,
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
  (case when b.amount_acc is null  then 0 else a.amount_acc / b.amount_acc end ),
  now()
from 
  (
    select * from ads_index_exclude where index_code  =  '404'   -- 净利润_剔除
  ) a
left join 
  (
    select * from ads_index_exclude where index_code  =  '405'   -- 期初所有者权益_剔除
  ) b
on 
  a.date = b.date 
  and a.level_code = b.level_code 
  and a.org_code  =  b.org_code 
  and a.version_code  = b.version_code 
left join (select * from ods_budget_operating_value where account  = 'WLVYS08' and scenario = 'Budget' and synthesis = '[None]') v
on a.org_code  = v.entity and substr(a.date,1,4)  = v.years  and v.version = a.version_code
  -- and a.scenario = b.scenario
  -- and a.synthesis = b.synthesis
left join 
  (
    select * from ads_index_exclude where index_code  =  '406'   -- 期末所者权益_剔除
  ) c
on 
  a.date = c.date 
  and a.level_code = c.level_code 
  and a.org_code  =  c.org_code 
  and a.version_code  = c.version_code   and v.version = a.version_code
--   and a.scenario = c.scenario
--   and a.synthesis = c.synthesis
  ;


-- 营业现金比index_code  =  444 , 表剔除数据表
insert into ads_index_exclude
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '营业现金比_剔除',
  '444',
  (
    case when  ((case when b.amount_acc is null then 0 else b.amount_acc end ) - (case when b.exclude_amount is null then 0 else b.exclude_amount end )) = 0 then 0 
    else (a.amount_acc - a.exclude_amount ) / 10000 / (b.amount_acc - b.exclude_amount) end
  ),
  
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
  (case when b.amount_acc = 0 then 0 else a.amount_acc / b.amount_acc end ),
  now()
from 
  (
    select * from ads_index_exclude where index_code  =  '407'   -- 现金流_剔除
  ) a
left join 
  (
    select * from ads_index_exclude where index_code  =  '403'   -- 营业总收入_剔除
  ) b
on 
  a.date = b.date 
  and a.level_code = b.level_code 
  and a.org_code  =  b.org_code 
  and a.version_code  = b.version_code 
left join (select * from ods_budget_operating_value where account  = 'WLVYS11' and scenario = 'Budget' and synthesis = '[None]') v
on a.org_code  = v.entity and substr(a.date,1,4)  = v.years  and v.version = a.version_code
--   and a.scenario = b.scenario
--   and a.synthesis = b.synthesis
 ;

-- 全员劳动生产率index_code  =  445 , 表剔除数据表
insert into ads_index_exclude
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '全员劳动生产率_剔除',
  '445',
  (
      case when ( (case when b.amount_acc is null then 0 else b.amount_acc end ) - (case when b.exclude_amount is null then 0 else b.exclude_amount end )) = 0 then 0 
      else 
        (a.amount_acc - (case when a.exclude_amount is null then 0 else  a.exclude_amount end ) ) / (b.amount_acc - b.exclude_amount)
      end 
  ),
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
   (case when b.amount_acc = 0 then 0 else  a.amount_acc / b.amount_acc end ),
  now()
from 
  (
    select * from ads_index_exclude where index_code  =  '408'   -- 劳动生产总值_剔除
  ) a
left join 
  (
    select * from ads_index_exclude where index_code  =  '409'   -- 平均职工人数_剔除
  ) b
on 
  a.date = b.date 
  and a.level_code = b.level_code 
  and a.org_code  =  b.org_code 
  and a.version_code  = b.version_code 
left join (select * from ods_budget_operating_value where account  = 'WLVYS24' and scenario = 'Budget' and synthesis = '[None]') v
on a.org_code  = v.entity and substr(a.date,1,4)  = v.years  and v.version = a.version_code
--   and a.scenario = b.scenario
--   and a.synthesis = b.synthesis
 ;


 --  451  不可控成本  = 完全成本  -  可控成本 
insert into ads_index_exclude 
select 
  a.org_code,
  a.org_name,
  a.level_code ,
  a.date,
  '不可控成本_单位_剔除',
  '451',
  a.exclude_amount - b.exclude_amount,
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
  a.amount_acc - b.amount_acc,
  now() from
  (select * from ads_index_exclude where index_code  = '447') a   -- 447 完全成本
  left join 
   (select * from ads_index_exclude where index_code  = '450')  b   -- 450 可控成本
   on a.org_code  = b.org_code 
   and a.date = b.date
   and a.version_code  = b.version_code 
   -- and a.scenario = b.scenario
   -- and a.synthesis = b.synthesis
 left join (select * from ods_budget_operating_value 
            where account  = 'BKCCB' and scenario  = 'NCYSS' and synthesis = 'DWJE') v
 on v.ENTITY = a.org_code 
 and v.years = substr(a.date,1,4) and v.version = a.version_code 
   ;

delete from ads_index_exclude where index_code  = '456';
insert into ads_index_exclude 
select 
  a.org_code,
  a.org_name,
  c.level_code ,
  a.date,
  '剥离费_单位_剔除',
  '456',
  (case when b.tcz is null then 0 else b.tcz end ),  --  剔除值
  '剔除后',
  ref.account,
  v.years,
  ver.version_code,
  ref.scenario,
  ref.synthesis,
  v.amount,
  a.unit_price_acc,
  now() from
  (select * from ods_coal_produce_hq where index_code  = '28'
    union all 
    select * from ods_coal_produce_bo where index_code  = '28') a   -- 28 长期摊销费用
    left join (select * from ads_index_code_account_ref where index_code = '456') ref
        on ref.origin_index_code  =  a.index_code
    left join ads_ys_version_info ver 
          on substr(a.date,1,4) = ver.year
     left join (select * from ods_tcys where hc  = '456' ) b
      on b.org_code = a.org_code
        and b.date =  a.date
        and b.hc = ref.index_code
     left join (select * from ods_budget_operating_value 
                where account  = 'BOLIFEI' and scenario  = 'Budget' and synthesis = 'DWJE') v
          on v.ENTITY = a.org_code 
            and v.years = substr(a.date,1,4)
            and v.VERSION = ver.version_code
    left join data_center.ads_orgnization c
      on a.org_code = c.org_code
;

-- 2024-11-12修理费
delete from ads_index_exclude where index_code  = '455';
insert into ads_index_exclude 
select 
a.org_code,
a.org_name,
c.level_code,
a.date,
'修理费_单位_剔除',
'455',
(case when b.tcz is null then 0 else b.tcz end ),  --  剔除值
'剔除后',
ref.account,
  v.years,
  ver.version_code,
  ref.scenario,
  ref.synthesis,
  v.amount,
  a.unit_price_acc,
  now()
 from
  (select * from ods_coal_produce_hq where index_code  = '21' 
    union all 
    select * from ods_coal_produce_bo where index_code  = '21') a   -- 21 修理费 实际
        left join (select * from ads_index_code_account_ref where index_code = '455') ref
        on ref.origin_index_code  =  a.index_code
  left join ads_ys_version_info ver 
          on substr(a.date,1,4) = ver.year
     left join (select * from ods_tcys where hc  = '455' ) b
      on b.org_code = a.org_code
        and b.date =  a.date
  left join 
        (select * from ods_budget_operating_value 
            where account  = 'DJMCB15' and scenario  = 'NCYSS' and synthesis = 'DWJE') v -- DJMCB15 修理费预算
    on a.org_code = v.entity and v.years = substr(a.date,1,4) and v.version = ver.version_code
  left join data_center.ads_orgnization c
      on a.org_code = c.org_code;

-- 2024-11-12 洗选修理费
delete from ads_index_exclude where index_code  = '461';
insert into ads_index_exclude 
select 
a.org_code,
a.org_name,
c.level_code,
a.date,
'洗选修理费_单位_剔除',
'461',
(case when b.tcz is null then 0 else b.tcz end ),  --  剔除值
'剔除后',
ref.account,
  v.years,
  ver.version_code,
  ref.scenario,
  ref.synthesis,
  v.amount,
  a.unit_price_acc,
  now()
 from
  (select * from ods_coal_produce_hq where index_code  = '32' 
    union all 
    select * from ods_coal_produce_bo where index_code  = '32') a   -- 32 洗选修理费 实际
  left join (select * from ads_index_code_account_ref where index_code = '461') ref
        on ref.origin_index_code  =  a.index_code
  left join ads_ys_version_info ver 
          on substr(a.date,1,4) = ver.year
     left join (select * from ods_tcys where hc  = '461' ) b
      on b.org_code = a.org_code
        and b.date =  a.date
  left join 
        (select * from ods_budget_operating_value 
            where account  = 'DJMCB1310' and scenario  = 'NCYSS' and synthesis = 'DWJE') v -- DJMCB1310 洗选修理费预算
    on a.org_code = v.entity and v.years = substr(a.date,1,4) and v.version = ver.version_code
  left join data_center.ads_orgnization c
      on a.org_code = c.org_code
      where a.org_code  = 'GY2F00' and a.date  = '2024-09'
  ;