-- 宽表
-- 2024-10-30 周三 预算主题的整体切换ads切换语句
/**
drop table data_center.ads_budget_broad_chart_1;
CREATE TABLE data_center.ads_budget_broad_chart_1 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 利润总额75，净利润77，自产煤利润90，外购煤利润91，EBITDA(利润总额 + 利息支出 即财务费用58 + 资产折旧 + 无形资产摊销)，产量93，自产煤产量94，外购煤产量95，销售量97，自产煤销量98，外购煤销量102，营业收入1，营业成本13，营业利润69，自产煤销售收入3，外购煤销售收入7，自产煤售价107，外购煤售价108，外购煤成本45，自产煤完全成本83，自产煤变动成本84，自产煤固定成本85，自产煤可控成本86，专项储备年初数111，年末数126，提取数114，使用数117，剥离量139，掘进进尺145,  人工成本 17 ，材料 16 ， 电力 20， 修理费 21 ， 剥离费38 （报表里的剥离费38 = 长期摊销费用28 ），矿务工程费 25，洗选加工费 29 ， 管理费用53
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数',
  bbh varchar(64) comment '版本号'
) COMMENT='预算宽表';
**/


-- 插入实际数据，版本一  : 包能汇总
truncate table data_center.ads_budget_broad_chart_1;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.total_amount_acc,
      a.total_amount,
      a.total_amount_acc_lastyear,
      a.total_amount_lastyear,
      a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','86','111','126','114','117','139','145','17','16','20','21','28','25','29','53');


insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.total_amount_acc,
      a.total_amount,
      a.total_amount_acc_lastyear,
      a.total_amount_lastyear,
      a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','86','111','126','114','117','139','145','17','16','20','21','28','25','29','53');


-- 自产煤吨煤利润 unit_price 实际值 201
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤吨煤利润',
      '201',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '90' ;

-- 外购煤吨煤利润 unit_price 实际值  202  
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '外购煤吨煤利润',
      '202',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '91' ;

/** 更新预算值 **/
--  更新利润总额
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'NJYLRZE'
      AND a.index_code = '75'
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)), a.amount_pre = b.amount ;
      
-- 自产煤收入
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'SPMXSSR01'   
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)), a.amount_pre = b.amount 
where a.index_code = '3' ;

-- 外购煤收入
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'SPMXSSR02'
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)), a.amount_pre = b.amount 
where a.index_code = '7' ;

-- 插入ods 自产煤利润 
-- 2024-11-04 自产煤利润直接取数了，不需要 计算 （利润总额 - 外购煤利润）
-- delete from ods_budget_operating_value where account = 'JSCZCMLR';
-- insert into ods_budget_operating_value
--   select
--     a.entity ,
--     'JSCZCMLR',
--     a.currency,
--     a.years,
--     a.period,
--     a.version,
--     a.scenario,
--     a.sjfl,
--     a.zcw,
--     a.industry,
--     a.type,
--     a.synthesis,
--     a.bywy,
--     a.bywe,
--     a.byws,
--     a.amount - (select b.amount from ods_budget_operating_value b 
--     where b.entity = a.entity 
--         and b.years = a.years 
--         and b.version = a.version 
--         and b.account = 'JYWGMLR'
--         and b.scenario = 'NCYSS' 
--         and b.synthesis = 'ZE'
--       ),
--     RAND() * 10000000
--   from ods_budget_operating_value a
--   where a.account = 'NJYLRZE';

-- 更新ads 自产煤利润
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'JSCZCMLR'
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)), a.amount_pre = b.amount 
where a.index_code = '90' ;


-- 外购煤利润
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'JYWGMLR'
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)), a.amount_pre = b.amount 
where a.index_code = '91' ;

-- 自产煤吨煤利润
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'JSCZCMLR'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '201' ;


-- 外购煤吨煤利润
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'JYWGMLR'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '202' ;

-- 完全成本
-- 自产煤完全成本83，自产煤变动成本84，自产煤固定成本85，自产煤可控成本86
-- WQCB   二十三、完全成本
-- BKCCB  不可控成本 
-- KKCB   二十一、可控成本
-- BDCB   二十、变动成本
-- GDZB    十九、固定成本
--
-- 插入不可控成本的[实际值]
insert into data_center.ads_budget_broad_chart_1
select
      c.org_code,
      c.org_name,
      c.level_code,
      substr(a.date,1,7),
      '不可控成本',
      '203',
      a.total_amount_acc - b.total_amount_acc,
      a.total_amount - b.total_amount,
      a.total_amount_acc_lastyear - b.total_amount_acc_lastyear,
      a.total_amount_lastyear - b.total_amount_lastyear,
      a.total_amount_lastmonth - b.total_amount_lastmonth,
      '0',
      '0',
      '0',
      d.version_code
      from 
      (
            select * from data_center.ods_coal_produce_hq where index_code = '83'  -- 完全成本
      ) a
      left join 
      (
            select * from data_center.ods_coal_produce_hq where index_code = '86'   -- 可控成本
      ) b
            on a.org_code = b.org_code and a.date = b.date 
      left join data_center.ads_orgnization c
            on a.org_code = c.org_code
      left join data_center.ads_ys_version_info d
            on 1 = 1 ;

insert into data_center.ads_budget_broad_chart_1
select
      c.org_code,
      c.org_name,
      c.level_code,
      substr(a.date,1,7),
      '不可控成本',
      '203',
      a.total_amount_acc - b.total_amount_acc,
      a.total_amount - b.total_amount,
      a.total_amount_acc_lastyear - b.total_amount_acc_lastyear,
      a.total_amount_lastyear - b.total_amount_lastyear,
      a.total_amount_lastmonth - b.total_amount_lastmonth,
      '0',
      '0',
      '0',
      d.version_code
      from 
      (
            select * from data_center.ods_coal_produce_bo where index_code = '83'  -- 完全成本
      ) a
      left join 
      (
            select * from data_center.ods_coal_produce_bo where index_code = '86'   -- 可控成本
      ) b
            on a.org_code = b.org_code and a.date = b.date 
      left join data_center.ads_orgnization c
            on a.org_code = c.org_code
      left join data_center.ads_ys_version_info d
            on 1 = 1 ;

-- 完全成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'WQCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '83' ;
-- 变动成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'BDCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '84' ;

-- 固定成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'GDZB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '85' ;

-- 可控成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'KKCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '86' ;

-- 不可控成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'BKCCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '203' ;

-- 重点成本 105表的 人工成本 17 ，材料 16 ， 电力 20， 修理费 21 ， 剥离费38 （报表里的剥离费38 = 长期摊销费用28 ），矿务工程费 25，洗选加工费 29 ， 管理费用53

-- 人工成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'NJYQKJRGCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '17' ;

-- 材料
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'KKCB01'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '16' ;

-- 电力
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'KKCB02'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '20' ;

-- 修理费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB15'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '21' ;

-- 剥离费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'GDZB07'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '28' ;
-- 矿务工程费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB07'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '25' ;
-- 洗选加工费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB13'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '29' ;
-- 管理费用
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'NJYYYZCB04'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '53' ;


/**  三公经费  **/
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      (203 + a.index_code),
      a.total_year_acc,
      a.total_current_month,
      a.total_lastyear_acc,
      '0',   
      '0',
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ads_seven_fee_info a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code in (1,2,3,4,5,6,7,8,9,10,11);

-- DJMCB2001   行政公车使用费  index_code = 205
-- DJMCB2002   招待费  index_code = 204
-- DJMCB2006   出国经费 index_code = 208
--  三公经费合计 index_code = 214


-- DJMCB2002   招待费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB2002'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '204' ;

-- DJMCB2001   行政公车使用费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB2001'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '205' ;

-- DJMCB2006   出国经费
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB2006'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '208' ;

-- 在预算表中插入 三公经费的合计值 
delete from ods_budget_operating_value where account = 'SGJF_TOTAL';
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
        and b.scenario = 'NCYSS' 
        and b.synthesis = 'ZE'
      ) + (select b.amount from ods_budget_operating_value b 
    where b.entity = a.entity 
        and b.years = a.years 
        and b.version = a.version 
        and b.account = 'DJMCB2006'
        and b.scenario = 'NCYSS' 
        and b.synthesis = 'ZE'
      ),
    RAND() * 10000000
  from ods_budget_operating_value a
  where a.account = 'DJMCB2001'
      and a.scenario = 'NCYSS' and a.synthesis = 'ZE'
  ;

update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'SGJF_TOTAL'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '214' ;

-- 人均工资底表实际数据 包能汇总合并  215 开始  一共38各指标 到252 .
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      (214 + a.index_code),
      a.amount_year,
      a.amount_month,
      a.amount_lastyear,
      '0',
      '0',
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_financial_info_sup_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code in ('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38') ;
-- 人均工资底表实际数据 各厂矿数据
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      (214 + a.index_code),
      a.amount_year,
      a.amount_month,
      a.amount_lastyear,
      '0',
      '0',
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_financial_info_sup_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code in ('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38') ;
-- 人均工资 ，新定义的index_code = 253 
insert into data_center.ads_budget_broad_chart_1
      select 
            a.org_code,
            a.org_name,
            a.level_code,
            substr(a.date,1,7),
            '人均工资',
            '253' ,
            (case when b.amount_acc = null or b.amount_acc = 0 then 0 else a.amount_acc / b.amount_acc end),
            (case when b.amount_month = null or b.amount_month = 0 then 0 else a.amount_month / b.amount_month end),
            (case when b.amount_acc_form = null or b.amount_acc_form = 0 then 0 else a.amount_acc_form / b.amount_acc_form end),
            '0',
            '0',
            '0',
            '0',
            '0',
            a.bbh
      from 
      (
            select * from data_center.ads_budget_broad_chart_1 
            where index_code in ('220') and date >= '2024-01'
      ) a
      left join 
      (
            select * from data_center.ads_budget_broad_chart_1 
            where index_code in ('226') and date >= '2024-01'
      ) b
            on a.org_code = b.org_code and a.date = b.date and a.bbh = b.bbh ;
-- 人均工资 ，新定义的index_code = 253 
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.SYNTHESIS = 'ZE'
      and b.account = 'DJMCB0206'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '253' ;

-- 五率  index_code 从254开始 
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
                  (case when index_name = '净资产收益率' then '254'
                        when index_name = '资产负债率' then '255'
                        when index_name = '全民劳动生产率' then '256'
                        when index_name = '技术投入比率%' then '257'
                        when index_name = '营业现金比率' then '258'
                        else '' end 
                  ),
      a.amount_acc,
      a.current_month,
      a.amount_acc_form,
      '0',
      a.last_month,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ads_five_rate_2 a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 ;

/**   
WLVYS08 净资产收益率  254
WLVYS03 资产负债率  255
WLVYS24 全员劳动生产率  256
WLVYS13 研发投入强度   257
WLVYS11 营业现金比率  258
**/
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.account = 'WLVYS08'
set a.amount_month_pre = b.amount, a.amount_pre = b.amount
where a.index_code = '254' ;

update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.account = 'WLVYS03'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '255' ;

update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.account = 'WLVYS24'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount
where a.index_code = '256' ;

update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.account = 'WLVYS13'
set a.amount_month_pre = b.amount, a.amount_pre = b.amount 
where a.index_code = '257' ;

update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'Budget' 
      and b.account = 'WLVYS11'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount
where a.index_code = '258' ;

/** 售价分析 各煤种结算表 _售价  **/ 
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      (259 + a.index_code),
      a.price_taxex_acc,
      a.price_taxex_month,
      '0',
      '0',
      '0',
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 ;
-- 外购煤收入——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSR02'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount
where a.index_code = '292' ;
-- 自产煤收入——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSR01'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '293' ;
-- 区内4500合计——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSRQN01'
set a.amount_month_pre = b.amount  , a.amount_pre = b.amount 
where a.index_code = '306' ;
-- 区内3800合计——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSRQN02'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '307' ;
-- 区外5000合计——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSRQW01'
set a.amount_month_pre = b.amount, a.amount_pre = b.amount 
where a.index_code = '308' ;
-- 区外4500合计——单价
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.synthesis = 'DWJE'
      and b.scenario = 'NCYSS' 
      and b.account = 'SPMXSSRQW03'
set a.amount_month_pre = b.amount  , a.amount_pre = b.amount  
where a.index_code = '309' ;

-- 增加完全成本实际值 - 单位值  从310开始
-- 完全成本 83
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤完全成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '83' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤完全成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '83' ;

-- 变动成本 84
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤变动成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '84' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤变动成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '84' ;

-- 固定成本 85
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤固定成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '85' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤固定成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '85' ;

-- 可控成本 86
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤可控成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '86' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '自产煤可控成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '86' ;
-- 不可控成本
insert into data_center.ads_budget_broad_chart_1
select
      c.org_code,
      c.org_name,
      c.level_code,
      substr(a.date,1,7),
      '自产煤不可控成本_单位',
      '397',
      a.unit_price_acc - b.unit_price_acc,
      a.unit_price - b.unit_price,
      a.unit_price_acc_lastyear - b.unit_price_acc_lastyear,
      a.unit_price_lastyear - b.unit_price_lastyear,
      a.unit_price_lastmonth - b.unit_price_lastmonth,
      '0',
      '0',
      '0',
      d.version_code
      from 
      (
            select * from data_center.ods_coal_produce_hq where index_code = '83'  -- 完全成本
      ) a
      left join 
      (
            select * from data_center.ods_coal_produce_hq where index_code = '86'   -- 可控成本
      ) b
            on a.org_code = b.org_code and a.date = b.date 
      left join data_center.ads_orgnization c
            on a.org_code = c.org_code
      left join data_center.ads_ys_version_info d
            on 1 = 1 ;

insert into data_center.ads_budget_broad_chart_1
select
      c.org_code,
      c.org_name,
      c.level_code,
      substr(a.date,1,7),
      '自产煤不可控成本_单位',
      '397',
      a.unit_price_acc - b.unit_price_acc,
      a.unit_price - b.unit_price,
      a.unit_price_acc_lastyear - b.unit_price_acc_lastyear,
      a.unit_price_lastyear - b.unit_price_lastyear,
      a.unit_price_lastmonth - b.unit_price_lastmonth,
      '0',
      '0',
      '0',
      d.version_code
      from 
      (
            select * from data_center.ods_coal_produce_bo where index_code = '83'  -- 完全成本
      ) a
      left join 
      (
            select * from data_center.ods_coal_produce_bo where index_code = '86'   -- 可控成本
      ) b
            on a.org_code = b.org_code and a.date = b.date 
      left join data_center.ads_orgnization c
            on a.org_code = c.org_code
      left join data_center.ads_ys_version_info d
            on 1 = 1 ;
-- 完全成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'WQCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '393' ;
-- 变动成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'BDCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '394' ;

-- 固定成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'GDZB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '395' ;

-- 可控成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'KKCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '396' ;

-- 不可控成本
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'BKCCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '397' ;

/** 临时数据，搬家倒面，插入9月份的数据 **/
insert into data_center.ads_budget_broad_chart_1
select
      'GY2F00',
      '包头能源',
      '100',
      '2024-09',
      '搬家倒面费',
      '398',
      '0',
      '0',
      '0',
      '0',
      '0',
      '4.77',
      '4.77',
      '4.77',
      'JYYS1';

-- (1)材料_单位 431
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(1)材料_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '431' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(1)材料_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '431' ;

-- (2)人工成本_单位 432
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(2)人工成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '432' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(2)人工成本_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '432' ;

-- (4)电力_单位 433
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(4)电力_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '433' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(4)电力_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '433' ;

--（5）修理费_单位 434
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '（5）修理费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '434' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '（5）修理费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '434' ;

--(7)矿务工程费_单位 435
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(7)矿务工程费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '435' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(7)矿务工程费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '435' ;

--(10)长期摊销费用_单位 436
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(10)长期摊销费用_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '436' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(10)长期摊销费用_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '436' ;

--(11)洗选加工费_单位 437
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(11)洗选加工费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '437' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(11)洗选加工费_单位',
      (310 + a.index_code),
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on 1 = 1 
      where index_code = '437' ;

-- (1)材料_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'KKCB01'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '431' ;

-- (2)人工成本_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'NJYQKJRGCB'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '432' ;

-- (4)电力_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'KKCB02'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '433' ;

-- （5）修理费_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'DJMCB15'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '434' ;

-- (7)矿务工程费_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'DJMCB07'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '435' ;

--(10)长期摊销费用_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'GDZB07'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '436' ;

-- (11)洗选加工费_单位
update ads_budget_broad_chart_1 a
join ods_budget_operating_value b 
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = 'NCYSS' 
      and b.SYNTHESIS = 'DWJE'
      and b.account = 'DJMCB13'
set a.amount_month_pre = b.amount , a.amount_pre = b.amount 
where a.index_code = '437' ;
