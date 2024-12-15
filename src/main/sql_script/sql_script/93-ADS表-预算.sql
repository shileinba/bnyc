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
  amount_acc decimal(32, 6) comment '本年累计数',
  amount_month decimal(32, 6) comment '本月实际数',
  amount_acc_form decimal(32, 6) comment '去年累计数',
  amount_month_form decimal(32, 6) comment '去年同月实际数',
  amount_month_form_hb decimal(32, 6) comment '本年上月实际数',
  amount_pre decimal(32, 6) comment '本年预算数',   -- 全年预算
  amount_month_pre decimal(32, 6) comment '本月预算数',  --  进度预算
  amount_current_month_pre decimal(32, 6) comment '当月预算数',  --  滚动预算
  bbh varchar(64) comment '版本号',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='预算宽表';
**/


-- 插入105实际数据，版本一  : 包能汇总
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','86','111','126','114','117','139','145','17','16','20','21','28','25','29','32','53');   


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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','86','111','126','114','117','139','145','17','16','20','21','28','25','29','32','53');   


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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '90' ;
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '91' ;
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '91' ;


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
      d.version_code,
      now(),
      now()
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
            on substr(a.date,1,4) = d.year ;

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
      d.version_code,
      now(),
      now()
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
            on substr(a.date,1,4) = d.year ;

/**  三公经费  **/
-- DJMCB2001   行政公车使用费  index_code = 205
-- DJMCB2002   招待费  index_code = 204
-- DJMCB2006   出国经费 index_code = 208
--  三公经费合计 index_code = 214
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
      c.version_code,
      now(),
      now()
      from data_center.ads_seven_fee_info a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
      where index_code in (1,2,3,4,5,6,7,8,9,10,11);


-- 在预算表中插入 三公经费的合计值  2024年预算取的是 NCYSS
delete from ods_budget_operating_value where account = 'SGJF_TOTAL' and scenario = 'NCYSS';
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


-- 来自YGL0083 财务信息补充指标表， 人均工资底表实际数据 包能汇总合并  215 开始  一共38各指标 到252 .
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
      c.version_code,
      now(),
      now()
      from data_center.ods_financial_info_sup_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
      where index_code in ('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38') ;
-- 来自YGL0083 财务信息补充指标表， 人均工资底表实际数据 各厂矿数据
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
      c.version_code,
      now(),
      now()
      from data_center.ods_financial_info_sup_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
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
            a.bbh,
            now(),
            now()
      from 
      (
            select * from data_center.ads_budget_broad_chart_1 
            where index_code in ('217') and date >= '2024-01'
      ) a
      left join 
      (
            select * from data_center.ads_budget_broad_chart_1 
            where index_code in ('222') and date >= '2024-01'
      ) b
            on a.org_code = b.org_code and a.date = b.date and a.bbh = b.bbh ;


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
      c.version_code,
      now(),
      now()
      from data_center.ads_five_rate_2 a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year ;


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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year ;


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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
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
      d.version_code,
      now(),
      now()
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
            on substr(a.date,1,4) = d.year ;

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
      d.version_code,
      now(),
      now()
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
            on substr(a.date,1,4) = d.year ;

-- 2024-11-14 ： 搬家倒面费， 厂矿数据
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '搬家倒面费',
      '398',
      a.unit_acc,
      a.unit_month,
      a.unit_last_year,
      '0',   
      '0',
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ads_coal_produce_other_fee a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year 
      where index_code in ('32');

/** 临时数据，搬家倒面，插入9-12月份的数据 **/
insert into data_center.ads_budget_broad_chart_1
select
      'GY2F00',
      '包头能源',
      '100',
      '2024-09',
      '搬家倒面费',
      '398',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      'JYYS1',
      now(),
      now();

insert into data_center.ads_budget_broad_chart_1
select
      'GY2F00',
      '包头能源',
      '100',
      '2024-10',
      '搬家倒面费',
      '398',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      'JYYS1',
      now(),
      now();

insert into data_center.ads_budget_broad_chart_1
select
      'GY2F00',
      '包头能源',
      '100',
      '2024-11',
      '搬家倒面费',
      '398',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      'JYYS1',
      now(),
      now();

insert into data_center.ads_budget_broad_chart_1
select
      'GY2F00',
      '包头能源',
      '100',
      '2024-12',
      '搬家倒面费',
      '398',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      '4.77',
      'JYYS1',
      now(),
      now();
-- 2024-11-14 ： 插入厂矿的搬家倒面费



--  (1)材料_单位 431
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(1)材料_单位',
      '431',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '16' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(1)材料_单位',
      '431',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '16' ;

--  (2)人工成本_单位 432
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(2)人工成本_单位',
      '432',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '17' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(2)人工成本_单位',
      '432',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '17' ;

--  (4)电力_单位 433
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(4)电力_单位',
      '433',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '20' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(4)电力_单位',
      '433',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '20' ;

-- （5）修理费_单位 434
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '（5）修理费_单位',
      '434',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '21' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '（5）修理费_单位',
      '434',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '21' ;

-- (7)矿务工程费_单位 435
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(7)矿务工程费_单位',
      '435',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '25' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(7)矿务工程费_单位',
      '435',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '25' ;

-- (10)长期摊销费用_单位 436
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(10)长期摊销费用_单位',
      '436',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '28' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(10)长期摊销费用_单位',
      '436',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '28' ;

-- (11)洗选加工费_单位 437
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(11)洗选加工费_单位',
      '437',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '29' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '(11)洗选加工费_单位',
      '437',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '29' ;

-- 管理费用_单位 438
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '管理费用_单位',
      '438',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '53' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '管理费用_单位',
      '438',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '53' ;

-- 洗选修理费用_单位 446
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '洗选修理费_单位',
      '446',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '32' ;
insert into data_center.ads_budget_broad_chart_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '洗选修理费_单位',
      '446',
      a.unit_price_acc,       --       a.total_amount_acc,
      a.unit_price,           --       a.total_amount,
      a.unit_price_acc_lastyear,          --       a.total_amount_acc_lastyear,
      a.unit_price_lastyear,        --       a.total_amount_lastyear,
      a.unit_price_lastmonth,       --       a.total_amount_lastmonth,
      '0',
      '0',
      '0',
      c.version_code,
      now(),
      now()
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      left join data_center.ads_ys_version_info c
      on substr(a.date,1,4) = c.year
      where index_code = '32' ;

update ads_budget_broad_chart_1 a
join ads_index_code_account_ref r
on a.index_code = r.index_code
join ods_budget_operating_value b 
on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = r.scenario
      and b.SYNTHESIS = r.synthesis
      and b.account = r.account
set a.amount_month_pre = b.amount / 12 * (IF(substr(a.date,6,2) REGEXP '^-?[0-9]+$', CAST(substr(a.date,6,2) AS SIGNED), NULL)) , a.amount_pre = b.amount ,
      a.updated_time  = now()
where r.synthesis = 'ZE';

update ads_budget_broad_chart_1 a
join ads_index_code_account_ref r
on a.index_code = r.index_code
join ods_budget_operating_value b 
on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = r.scenario
      and b.SYNTHESIS = r.synthesis
      and b.account = r.account
set a.amount_month_pre = b.amount , a.amount_pre = b.amount ,
a.updated_time  = now()
where r.synthesis = 'DWJE';


update ads_budget_broad_chart_1 a
join ads_index_code_account_ref r
on a.index_code = r.index_code
join ods_budget_operating_value b 
on b.entity = (case when a.org_code like '00%' then substr(a.org_code,3,4) else a.org_code end)
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = r.scenario
      and b.SYNTHESIS = r.synthesis
      and b.account = r.account
set a.amount_month_pre = b.amount , a.amount_pre = b.amount ,
a.updated_time  = now()
where r.synthesis = '[None]';