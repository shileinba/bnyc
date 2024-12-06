/**
drop table data_center.ads_report_coal_produce;
CREATE TABLE data_center.ads_report_coal_produce (
  org_code varchar(64) DEFAULT NULL COMMENT '单位编码',
  org_name varchar(64) DEFAULT NULL COMMENT '单位名称',
  date varchar(64) DEFAULT NULL COMMENT '日期',
  index_name varchar(64) DEFAULT NULL COMMENT '指标名称',
  index_code varchar(64) DEFAULT NULL COMMENT '指标编码',
  unit varchar(64) DEFAULT NULL COMMENT '指标单位',
  unit_price_pre decimal(15,2) DEFAULT NULL COMMENT '本年预算单位价',
  total_amount_pre decimal(15,2) DEFAULT NULL COMMENT '本年预算总额',
  unit_price decimal(15,2) DEFAULT NULL COMMENT '本月实际单位价',
  total_amount decimal(15,2) DEFAULT NULL COMMENT '本月实际总额',
  unit_price_lastyear decimal(15,2) DEFAULT NULL COMMENT '上年本月单位价',
  total_amount_lastyear decimal(15,2) DEFAULT NULL COMMENT '上年本月实际总额',
  unit_price_lastmonth decimal(15,2) DEFAULT NULL COMMENT '上月实际单位价',
  total_amount_lastmonth decimal(15,2) DEFAULT NULL COMMENT '上月实际总额',
  unit_price_acc decimal(15,2) DEFAULT NULL COMMENT '本年实际累计单位价',
  total_amount_acc decimal(15,2) DEFAULT NULL COMMENT '本年实际累计总额',
  unit_price_acc_lastyear decimal(15,2) DEFAULT NULL COMMENT '上年同期实际累计单位价',
  total_amount_acc_lastyear decimal(15,2) DEFAULT NULL COMMENT '上年同期实际累计总额',
  unit_price_vs_pre decimal(15,2) DEFAULT NULL COMMENT '单位价实际预算比',
  total_amount_vs_pre decimal(15,2) DEFAULT NULL COMMENT '累计金额实际预算比',
  total_amount_vs_pre_zjl decimal(15,2) DEFAULT NULL COMMENT '累计金额实际预算比增减利',
  unit_price_vs_lastmonth decimal(15,2) DEFAULT NULL COMMENT '单位价环比增减',
  total_amount_vs_lastmonth decimal(15,2) DEFAULT NULL COMMENT '环比增减_本年实际比本年上月',
  total_amount_vs_lastmonth_zjl decimal(15,2) DEFAULT NULL COMMENT '环比增减_因素分析',
  unit_price_vs_lastyear decimal(15,2) DEFAULT NULL COMMENT '单位价同比增减',
  total_amount_vs_lastyear decimal(15,2) DEFAULT NULL COMMENT '同比增减_本年累计比上年',
  total_amount_vs_lastyear_zjl decimal(15,2) DEFAULT NULL COMMENT '同比增减_因素分析',
  year varchar(64) DEFAULT NULL COMMENT '年份',
  month varchar(64) DEFAULT NULL COMMENT '月份'
) COMMENT='煤炭生产经营-report-ads';
**/

truncate table data_center.ads_report_coal_produce;
-- 能源合并数据
insert into data_center.ads_report_coal_produce
select 
  org_code,
  org_name,
  date ,
  index_name,
  index_code,
  unit,
  unit_price_pre,
  total_amount_pre,
  unit_price,
  total_amount,
  unit_price_lastyear,
  total_amount_lastyear,
  unit_price_lastmonth,
  total_amount_lastmonth,
  unit_price_acc,
  total_amount_acc,
  unit_price_acc_lastyear,
  total_amount_acc_lastyear,
  unit_price_vs_pre,
  total_amount_vs_pre,
  total_amount_vs_pre_zjl,
  unit_price_vs_lastmonth,
  total_amount_vs_lastmonth,
  total_amount_vs_lastmonth_zjl,
  unit_price_vs_lastyear,
  total_amount_vs_lastyear,
  total_amount_vs_lastyear_zjl,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
	else substr(date,6,2) end
from data_center.ods_coal_produce_hq;

insert into data_center.ads_report_coal_produce
select 
  org_code,
  org_name,
  date ,
  index_name,
  index_code,
  unit,
  unit_price_pre,
  total_amount_pre,
  unit_price,
  total_amount,
  unit_price_lastyear,
  total_amount_lastyear,
  unit_price_lastmonth,
  total_amount_lastmonth,
  unit_price_acc,
  total_amount_acc,
  unit_price_acc_lastyear,
  total_amount_acc_lastyear,
  unit_price_vs_pre,
  total_amount_vs_pre,
  total_amount_vs_pre_zjl,
  unit_price_vs_lastmonth,
  total_amount_vs_lastmonth,
  total_amount_vs_lastmonth_zjl,
  unit_price_vs_lastyear,
  total_amount_vs_lastyear,
  total_amount_vs_lastyear_zjl,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
	else substr(date,6,2) end
from data_center.ods_coal_produce_bo;


-- data_center.ads_report_coal_settlement 
-- 智能报告各煤种结算汇总表
/** 
drop table data_center.ads_report_coal_settlement; 
CREATE TABLE data_center.ads_report_coal_settlement (
  org_code varchar(64) DEFAULT NULL COMMENT '单位编码',
  org_name varchar(64) DEFAULT NULL COMMENT '单位名称',
  date varchar(64) DEFAULT NULL COMMENT '日期',
  index_name varchar(64) DEFAULT NULL COMMENT '指标名称',
  index_code varchar(64) DEFAULT NULL COMMENT '指标编码',
  amount_month decimal(15,2) DEFAULT NULL COMMENT '本月结算数量',
  price_taxex_month decimal(15,2) DEFAULT NULL COMMENT '本月不含税单价',
  income_taxex_month decimal(15,2) DEFAULT NULL COMMENT '本月不含税销售收入',
  tax_month decimal(15,2) DEFAULT NULL COMMENT '本月税金',
  price_month decimal(15,2) DEFAULT NULL COMMENT '本月含税单价',
  total_month decimal(15,2) DEFAULT NULL COMMENT '本月含税合计',
  amount_acc decimal(15,2) DEFAULT NULL COMMENT '累计结算数量',
  price_taxex_acc decimal(15,2) DEFAULT NULL COMMENT '累计不含税单价',
  income_taxex_acc decimal(15,2) DEFAULT NULL COMMENT '累计不含税销售收入',
  tax_acc decimal(15,2) DEFAULT NULL COMMENT '累计税金',
  price_acc decimal(15,2) DEFAULT NULL COMMENT '累计含税单价',
  total_acc decimal(15,2) DEFAULT NULL COMMENT '累计含税合计',
	year varchar(64) DEFAULT NULL COMMENT '年份',
  month varchar(64) DEFAULT NULL COMMENT '月份'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='智能报告各煤种结算汇总表';
**/
truncate table data_center.ads_report_coal_settlement;
insert into data_center.ads_report_coal_settlement
select 
  org_code,
  org_name,
  date,
  index_name,
  index_code,
  amount_month,
  price_taxex_month,
  income_taxex_month,
  tax_month,
  price_month,
  total_month,
  amount_acc,
  price_taxex_acc,
  income_taxex_acc,
  tax_acc,
  price_acc,
  total_acc,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
	else substr(date,6,2) end
from data_center.ods_coal_settlement;

update ads_report_coal_settlement set date = substr(date,1,7);


/** 1014 财务费用情况
drop table data_center.ads_report_coal_produce_finance;
CREATE TABLE data_center.ads_report_coal_produce_finance (
  org_code varchar(64) DEFAULT NULL COMMENT '单位编码',
  org_name varchar(64) DEFAULT NULL COMMENT '单位名称',
  date varchar(64) DEFAULT NULL COMMENT '日期',
  index_name varchar(64) DEFAULT NULL COMMENT '指标名称',
  index_code varchar(64) DEFAULT NULL COMMENT '指标编码',
  amount decimal(15,2) DEFAULT NULL COMMENT '数额',
  year varchar(64) DEFAULT NULL COMMENT '年份',
  month varchar(64) DEFAULT NULL COMMENT '月份'
)  COMMENT='财务费用情况-report-ads';
**/

truncate table data_center.ads_report_coal_produce_finance;
-- 总部汇总
insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '今年值',
  '10_101',
  total_amount,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '58';

insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '去年值',
  '10_102',
  total_amount_lastyear,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '58';

-- 厂矿数据
insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '今年值',
  '10_101',
  total_amount,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '58';

insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '去年值',
  '10_102',
  total_amount_lastyear,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '58';

-- 累计数据，定义month = 13 为本年累计数据
insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '本年累计值',
  '10_103',
  total_amount_acc,
  substr(date,1,4),
  '13' as month 
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '58'
and date = (select max(date) from data_center.ods_coal_produce_bo);

insert into data_center.ads_report_coal_produce_finance
select 
  org_code,
  org_name,
  date ,
  '本年累计值',
  '10_103',
  total_amount_acc,
  substr(date,1,4),
  '13' as month 
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '58'
and date = (select max(date) from data_center.ods_coal_produce_bo);

/** 1014 各单位利润指标 ppt 第18页
drop table data_center.ads_report_coal_produce_profit;
CREATE TABLE data_center.ads_report_coal_produce_profit (
  org_code varchar(64) DEFAULT NULL COMMENT '单位编码',
  org_name varchar(64) DEFAULT NULL COMMENT '单位名称',
  date varchar(64) DEFAULT NULL COMMENT '日期',
  index_name varchar(64) DEFAULT NULL COMMENT '指标名称',
  index_code varchar(64) DEFAULT NULL COMMENT '指标编码',
  amount decimal(15,2) DEFAULT NULL COMMENT '数额',
  year varchar(64) DEFAULT NULL COMMENT '年份',
  month varchar(64) DEFAULT NULL COMMENT '月份'
)  COMMENT='各单位利润指标-report-ads';
**/


truncate table data_center.ads_report_coal_produce_profit;
-- 总部汇总
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '今年值',
  '10_101',
  total_amount,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '75';


-- 厂矿数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '今年值',
  '10_101',
  total_amount,
  substr(date,1,4),
  case when substr(date,6,1) = '0' then substr(date,7,1) 
 else substr(date,6,2) end
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '75';


-- 累计数据，定义month = 13 为本年累计数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '本年累计值',
  '10_103',
  total_amount_acc,
  substr(date,1,4),
  '13' as month 
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_hq);

insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '本年累计值',
  '10_103',
  total_amount_acc,
  substr(date,1,4),
  '13' as month 
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_bo);


-- 插入总部预算值 定义month = 14 为本年预算数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '本年预算值',
  '10_104',
  total_amount_pre,
  substr(date,1,4),
  '14' as month 
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_hq);

-- 插入各下级预算值 定义month = 14 为本年预算数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '本年预算值',
  '10_104',
  total_amount_pre,
  substr(date,1,4),
  '14' as month 
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_bo);

-- 插入总部预算值 定义month = 15 为上年同期数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '上年同期值',
  '10_105',
  total_amount_acc_lastyear,
  substr(date,1,4),
  '15' as month 
from data_center.ods_coal_produce_hq
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_hq);

-- 插入各下级预算值 定义month = 15 为上年同期数据
insert into data_center.ads_report_coal_produce_profit
select 
  org_code,
  org_name,
  date ,
  '上年同期值',
  '10_105',
  total_amount_acc_lastyear,
  substr(date,1,4),
  '15' as month 
from data_center.ods_coal_produce_bo
where substr(date,1,4) >= year(curdate())
and index_code = '75'
and date = (select max(date) from data_center.ods_coal_produce_bo);

-- 能源公司合计
insert into data_center.ads_report_coal_produce_profit
select 
'GC2F00' as org_code,
'能源公司' as org_name,
date,
index_name,
index_code,
sum(amount),
year,
month
from ads_report_coal_produce_profit
where org_name in ('李家壕煤矿','万利一矿','神山露天矿','水泉露天矿','洗选分公司','运销分公司','能源本部','水泉洗煤厂')
group by 
date,index_name,index_code , year , month;

-- 矿业公司合计
insert into data_center.ads_report_coal_produce_profit
select 
'GC2300' as org_code,
'矿业公司' as org_name,
date,
index_name,
index_code,
sum(amount),
year,
month
from ads_report_coal_produce_profit
where org_name in ('公路分公司','集装站','建安公司','蒙格沁','矿业本部')
group by 
date,index_name,index_code , year , month;


/**
智能报告 -- 科技研发 ppt 21页
drop table data_center.ads_report_technology_expense;
CREATE TABLE data_center.ads_report_technology_expense (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '年度预算',
  amount_acc_form decimal(15, 2) comment '上年同期',
  amount_acc decimal(15, 2) comment '本年累计',
  compare_pre decimal(15, 2) comment '比进度预算',
 annual_estimate decimal(15, 2) comment '全年预计'
) COMMENT='ads智能报告_科技支出和研发费用明细表';
**/
truncate table ads_report_technology_expense;
insert into ads_report_technology_expense
select
b.org_code,
b.org_name,
b.level_code,
a.date,
a.index_name,
a.index_code,
a.amount_pre,
a.amount_acc_form,
a.amount_acc,
a.compare_pre,
a.annual_estimate
from ods_technology_expense_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code;
insert into ads_report_technology_expense
select
b.org_code,
b.org_name,
b.level_code,
a.date,
a.index_name,
a.index_code,
a.amount_pre,
a.amount_acc_form,
a.amount_acc,
a.compare_pre,
a.annual_estimate
from ods_technology_expense_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code;


/** 
drop table data_center.ads_report_asset_balance;
CREATE TABLE data_center.ads_report_asset_balance (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '期末余额',
  amount_acc_form decimal(15, 2) comment '上年同期数',
  begin_balance decimal(15, 2) comment '期初余额',
  year varchar(64) comment '年份',
  month varchar(64) comment '月份'
) COMMENT='ads智能报告_资产负债表';
**/
-- 融合 0102资产负债表中的 资产 和 负债数据 ， 融合0078中的资产负债率


truncate table ads_report_asset_balance;
insert into ads_report_asset_balance 
select 
org_code,
org_name,
date,
index_name,
index_code,
end_balance  / 100000000,
amount_acc_form  / 100000000,
begin_balance  / 100000000,
substr(date,1,4) ,
substr(date,6,2)
from ods_asset_balance_hq;

insert into ads_report_asset_balance
select 
org_code,
org_name,
date,
index_name,
index_code,
acc_year,
pre_last_year_month,
null as begin_balance,
substr(date,1,4),
substr(date,6,2)
from ods_summary_index_hq
where index_code  = '37'; -- 资产负债率


/** 
drop table data_center.ads_report_inventory;
CREATE TABLE data_center.ads_report_inventory (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  book_balance_now decimal(15, 2) comment '本年账面余额',
  book_balance_lastyear decimal(15, 2) comment '上年同期数',
  amount_pre decimal(15, 2) comment '预算值',
  year varchar(64) comment '年份',
  month varchar(64) comment '月份'
) COMMENT='ads智能报告_两金存货表';
**/
truncate table ads_report_inventory;
insert into ads_report_inventory
select
org_code,
org_name,
date,
index_name,
index_code,
book_balance_now
,(select book_balance_now from ods_inventory_class_stat_hq  b where  b.org_code = a.org_code and b.index_code = a.index_code and b.date = 
  DATE_FORMAT(DATE_SUB(STR_TO_DATE(concat(a.date,'-01'), '%Y-%m-%d'), INTERVAL 1 YEAR), '%Y-%m')  limit 1
) as book_balance_lastyear,
(case when index_code = 3
then 2570000 else null end ) as amount_pre, -- 预算值
substr(date,1,4) as year ,
substr(date,6,2) as month
from ods_inventory_class_stat_hq a
where index_code in ('3','20','21'); -- 3 非正常  20 正常 21 存货合计
-- and date in ('2023-07','2024-07')



/** 
drop table data_center.ads_report_accounts_receivable;
CREATE TABLE data_center.ads_report_accounts_receivable (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  begin_balance_networth decimal(15, 2) comment '年初余额净值',
  end_balance_networth decimal(15, 2) comment '期末余额净值',
  year varchar(64) comment '年份',
  month varchar(64) comment '月份'
) COMMENT='ads智能报告_两金应收账款表';
**/
truncate table ads_report_accounts_receivable;
insert into ads_report_accounts_receivable
select
org_code,
org_name,
substr(date,1,7) as date ,
index_name,
index_code,
begin_balance_networth,
end_balance_networth,
substr(date,1,4) as year ,
substr(date,6,2) as month
from ods_accounts_receivable_hq a
;