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
    RAND() * 100000000 -- ID
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
    RAND() * 100000000  -- id
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
    b.scenario,  -- 2024.12.12 : 替换 b.scenario
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
    on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
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
    b.scenario,  -- 2024.12.12 : 替换 b.scenario
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
    on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
      and b.years = a.year
      and b.version = a.version_code
      and b.scenario = 'Budget'
      and b.SYNTHESIS = a.synthesis
      and b.account = a.account;

-- 2024-11-14 ： 五率指标特殊处理 ， 2024年的预算数值 取 Budget 且业务为 None的。
delete from data_center.ads_budget_broad_chart_2 where index_code in ('254','255','256','257','258') and date  = '2024' and scenario = 'Budget';
insert into data_center.ads_budget_broad_chart_2
select 
    a.org_code,
    a.org_name,
    a.level_code,
    a.year,
    a.index_name,
    a.index_code,
    a.account,
    b.scenario,
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
    on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
      and b.years = a.year
      and b.version = a.version_code
      and b.scenario = 'Budget'
      and b.SYNTHESIS = a.synthesis
      and b.account = a.account;
