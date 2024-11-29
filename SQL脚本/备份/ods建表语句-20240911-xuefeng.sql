/*
-- 煤炭生产经营情况
drop table data_center.ods_coal_produce_ref;
CREATE TABLE data_center.ods_coal_produce_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='煤炭生产经营情况录入表-对照表';

-- 对照表数据灌入
insert into data_center.ods_coal_produce_ref
select distinct(index_name), index_code from data_center.ods_coal_produce_hq;

drop table data_center.ods_coal_produce_hq;
CREATE TABLE data_center.ods_coal_produce_hq (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  unit varchar(64) comment '指标单位',
  unit_price_pre decimal(15, 2) comment '本年预算单位价',
  total_amount_pre decimal(15, 2) comment '本年预算总额',
  unit_price decimal(15, 2) comment '本月实际单位价',
  total_amount decimal(15, 2) comment '本月实际总额',
  unit_price_lastyear decimal(15, 2) comment '上年本月单位价',
  total_amount_lastyear decimal(15, 2) comment '上年本月实际总额',
  unit_price_lastmonth decimal(15, 2) comment '上月实际单位价', 
  total_amount_lastmonth decimal(15, 2) comment '上月实际总额', 
  unit_price_acc decimal(15, 2) comment '本年实际累计单位价', 
  total_amount_acc decimal(15, 2) comment '本年实际累计总额', 
  unit_price_acc_lastyear decimal(15, 2) comment '上年同期实际累计单位价', 
  total_amount_acc_lastyear decimal(15, 2) comment '上年同期实际累计总额', 
  unit_price_vs_pre decimal(15, 2) comment '单位价实际预算比', 
  total_amount_vs_pre decimal(15, 2) comment '累计金额实际预算比', 
  total_amount_vs_pre_zjl decimal(15, 2) comment '累计金额实际预算比增减利', 
  unit_price_vs_lastmonth decimal(15, 2) comment '单位价环比增减', 
  total_amount_vs_lastmonth decimal(15, 2) comment '环比增减_本年实际比本年上月', 
  total_amount_vs_lastmonth_zjl decimal(15, 2) comment '环比增减_因素分析', 
  unit_price_vs_lastyear decimal(15, 2) comment '单位价同比增减', 
  total_amount_vs_lastyear decimal(15, 2) comment '同比增减_本年累计比上年', 
  total_amount_vs_lastyear_zjl decimal(15, 2) comment '同比增减_因素分析'
) COMMENT='煤炭生产经营情况录入表-总部';

drop table data_center.ods_coal_produce_bo;
CREATE TABLE data_center.ods_coal_produce_bo (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  unit varchar(64) comment '指标单位',
  unit_price_pre decimal(15, 2) comment '本年预算单位价',
  total_amount_pre decimal(15, 2) comment '本年预算总额',
  unit_price decimal(15, 2) comment '本月实际单位价',
  total_amount decimal(15, 2) comment '本月实际总额',
  unit_price_lastyear decimal(15, 2) comment '上年本月单位价',
  total_amount_lastyear decimal(15, 2) comment '上年本月实际总额',
  unit_price_lastmonth decimal(15, 2) comment '上月实际单位价', 
  total_amount_lastmonth decimal(15, 2) comment '上月实际总额', 
  unit_price_acc decimal(15, 2) comment '本年实际累计单位价', 
  total_amount_acc decimal(15, 2) comment '本年实际累计总额', 
  unit_price_acc_lastyear decimal(15, 2) comment '上年同期实际累计单位价', 
  total_amount_acc_lastyear decimal(15, 2) comment '上年同期实际累计总额', 
  unit_price_vs_pre decimal(15, 2) comment '单位价实际预算比', 
  total_amount_vs_pre decimal(15, 2) comment '累计金额实际预算比', 
  total_amount_vs_pre_zjl decimal(15, 2) comment '累计金额实际预算比增减利', 
  unit_price_vs_lastmonth decimal(15, 2) comment '单位价环比增减', 
  total_amount_vs_lastmonth decimal(15, 2) comment '环比增减_本年实际比本年上月', 
  total_amount_vs_lastmonth_zjl decimal(15, 2) comment '环比增减_因素分析', 
  unit_price_vs_lastyear decimal(15, 2) comment '单位价同比增减', 
  total_amount_vs_lastyear decimal(15, 2) comment '同比增减_本年累计比上年', 
  total_amount_vs_lastyear_zjl decimal(15, 2) comment '同比增减_因素分析'
) COMMENT='煤炭生产经营情况录入表-厂矿';
*/

-- 数据治理平台数据灌入
truncate table data_center.ods_coal_produce_hq;
insert into data_center.ods_coal_produce_hq 
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      '0',
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      '0',
      '0',
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z11 is null,0,a.Z11),2),
      round(if(a.Z12 is null,0,a.Z12),2),
      round(if(a.Z13 is null,0,a.Z13),2),
      '0',
      '0',
      '0',
      round(if(a.Z14 is null,0,a.Z14),2),
      round(if(a.Z15 is null,0,a.Z15),2),
      round(if(a.Z16 is null,0,a.Z16),2)
      from data_center.ygl0105__zygl0105 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_coal_produce_ref c
      on a.rid = c.index_code
      where org in ('GY2F00');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_coal_produce_bo;
insert into data_center.ods_coal_produce_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      '0',
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      '0',
      '0',
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z11 is null,0,a.Z11),2),
      round(if(a.Z12 is null,0,a.Z12),2),
      round(if(a.Z13 is null,0,a.Z13),2),
      '0',
      '0',
      '0',
      round(if(a.Z14 is null,0,a.Z14),2),
      round(if(a.Z15 is null,0,a.Z15),2),
      round(if(a.Z16 is null,0,a.Z16),2)
      from data_center.ygl0105__zygl0105 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_coal_produce_ref c
      on a.rid = c.index_code
      where org not in ('GY2F00');



/*
-- 利润表
drop table data_center.ods_profit_ref;
CREATE TABLE data_center.ods_profit_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='利润表-对照表';

-- 对照表数据灌入
insert into data_center.ods_profit_ref
select distinct(index_name), index_code from data_center.ods_profit_hq
where index_name not like '△%' and index_name not like '☆%' and index_name not like '*%' and index_name  <> '归属于本公司股东的综合收益总额';

drop table data_center.ods_profit_hq;
CREATE TABLE data_center.ods_profit_hq (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_code varchar(64) comment '指标编码',
  index_name varchar(64) comment '指标名称',
  amount_month decimal(15, 2) comment '本月数',
  amount_year decimal(15, 2) comment '本年累计数',
  amount_lastyear decimal(15, 2) comment '上年同期'
) COMMENT='利润表-总部';

drop table data_center.ods_profit_bo;
CREATE TABLE data_center.ods_profit_bo (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_code varchar(64) comment '指标编码',
  index_name varchar(64) comment '指标名称',
  amount_month decimal(15, 2) comment '本月数',
  amount_year decimal(15, 2) comment '本年累计数',
  amount_lastyear decimal(15, 2) comment '上年同期'
) COMMENT='利润表-厂矿';
*/

-- 数据治理平台数据灌入
truncate table data_center.ods_profit_hq;
insert into data_center.ods_profit_hq 
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.yzb0002__zyzb0002 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_profit_ref c
      on a.rid = c.index_code
      where org in ('GY2F00');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_profit_bo;
insert into data_center.ods_profit_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.yzb0002__zyzb0002 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_profit_ref c
      on a.rid = c.index_code
      where org not in ('GY2F00');



/*
-- 应上交应弥补款项情况表
drop table data_center.ods_payable_tax_ref;
CREATE TABLE data_center.ods_payable_tax_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='应上交应弥补款项情况表-对照表';

-- 对照表数据灌入
insert into data_center.ods_payable_tax_ref
select distinct(index_name), index_code from data_center.ods_payable_tax_hq;

drop table data_center.ods_payable_tax_hq;
CREATE TABLE data_center.ods_payable_tax_hq (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  beginning_balance decimal(15, 2) comment '年初余额 ',
  beginning_balance_reclass decimal(15, 2) comment '年初余额重分类转出 ',
  increase_month_payable decimal(15, 2) comment '本年增加_本月应交 ',
  increase_month_reclass decimal(15, 2) comment '本年增加_本月重分类 ',
  increase_year_payable decimal(15, 2) comment '本年增加_本年应交 ',
  increase_year_reclass decimal(15, 2) comment '本年增加_本年重分类 ',
  decrease_month_submitted decimal(15, 2) comment '本年减少_本月已交 ',
  decrease_year_submitted decimal(15, 2) comment '本年减少_本年已交 ',
  end_balance decimal(15, 2) comment '期末余额 ',
  end_balance_reclass decimal(15, 2) comment '期末余额_重分类转出'
) COMMENT='应上交应弥补款项情况表-总部';

drop table data_center.ods_payable_tax_bo;
CREATE TABLE data_center.ods_payable_tax_bo (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  beginning_balance decimal(15, 2) comment '年初余额 ',
  beginning_balance_reclass decimal(15, 2) comment '年初余额重分类转出 ',
  increase_month_payable decimal(15, 2) comment '本年增加_本月应交 ',
  increase_month_reclass decimal(15, 2) comment '本年增加_本月重分类 ',
  increase_year_payable decimal(15, 2) comment '本年增加_本年应交 ',
  increase_year_reclass decimal(15, 2) comment '本年增加_本年重分类 ',
  decrease_month_submitted decimal(15, 2) comment '本年减少_本月已交 ',
  decrease_year_submitted decimal(15, 2) comment '本年减少_本年已交 ',
  end_balance decimal(15, 2) comment '期末余额 ',
  end_balance_reclass decimal(15, 2) comment '期末余额_重分类转出'
) COMMENT='应上交应弥补款项情况表-厂矿';
*/

-- 总部
truncate table data_center.ods_payable_tax_hq;
insert into data_center.ods_payable_tax_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.ucode,9,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2)
      from data_center.ygl0106__zygl0106 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,6) = b.org_code
      left join data_center.ods_payable_tax_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('GY2F00');

-- 厂矿
truncate table data_center.ods_payable_tax_bo;
insert into data_center.ods_payable_tax_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.ucode,7,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2)
      from data_center.ygl0106__zygl0106 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,4) = b.org_code
      left join data_center.ods_payable_tax_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,4) in ('2F00','2F01','2F02','2F04','2F05','2F06','2F08','2F09');

insert into data_center.ods_payable_tax_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.ucode,9,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2)
      from data_center.ygl0106__zygl0106 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,6) = b.org_code
      left join data_center.ods_payable_tax_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('002300','002301','002302','002303','002305');


/* -- 完全成本目前无人使用
drop table data_center.ods_full_cost_hq;
CREATE TABLE data_center.ods_full_cost_hq (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',

  unit varchar(64) comment '数量单位',
  unit_price_pre decimal(15, 2) comment '本年预算单位价',
  amount_pre decimal(15, 2) comment '本年预算总额',  
  unit_price_month decimal(15, 2) comment '本年实际单位价',
  amount_month decimal(15, 2) comment '本月实际总额',
  unit_price_pre_month decimal(15, 2) comment '本年上月单位价',

  amount_pre_month decimal(15, 2) comment '本年上月总额',
  unit_price_acc decimal(15, 2) comment '本年累计单位价',
  amount_acc decimal(15, 2) comment '本年累计总额',
  unit_price_acc_pre decimal(15, 2) comment '上年同期累计单位',
  amount_acc_pre decimal(15, 2) comment '上年同期累计总额'
) COMMENT='完全成本-总部';
*/



/*
drop table data_center.ods_coal_settlement;
CREATE TABLE data_center.ods_coal_settlement (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '本月结算数量',
  price_taxex_month decimal(15, 2) comment '本月不含税单价', 
  income_taxex_month decimal(15, 2) comment '本月不含税销售收入',
  tax_month decimal(15, 2) comment '本月税金',
  price_month decimal(15, 2) comment '本月含税单价',
  total_month decimal(15, 2) comment '本月含税合计',
  amount_acc decimal(15, 2) comment '累计结算数量',
  price_taxex_acc decimal(15, 2) comment '累计不含税单价', 
  income_taxex_acc decimal(15, 2) comment '累计不含税销售收入',
  tax_acc decimal(15, 2) comment '累计税金',
  price_acc decimal(15, 2) comment '累计含税单价',
  total_acc decimal(15, 2) comment '累计含税合计'
) COMMENT='各煤种结算汇总表';
*/



/*
-- 经济增加值
drop table data_center.ods_eva_ref;
CREATE TABLE data_center.ods_eva_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='经济增加值-对照表';

-- 对照表数据灌入
insert into data_center.ods_eva_ref
select distinct(index_name), index_code from data_center.ods_eva_hq;

drop table data_center.ods_eva_hq;
CREATE TABLE data_center.ods_eva_hq (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  units varchar(64) comment '计量单位',
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',  
  amount_acc decimal(15, 2) comment '本年累计',
  amount_acc_pre decimal(15, 2) comment '上年同期累计总额',
  amount_vs_lastyear decimal(15, 2) comment '同比',
  amount_vs_pre decimal(15, 2) comment '进度比'
) COMMENT='经济增加值-总部';

drop table data_center.ods_eva_bo;
CREATE TABLE data_center.ods_eva_bo (
  id varchar(64) comment 'id',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  units varchar(64) comment '计量单位',
  index_code varchar(64) comment '指标编码',

  amount_pre decimal(15, 2) comment '本年预算',  
  amount_acc decimal(15, 2) comment '本年累计',
  amount_acc_pre decimal(15, 2) comment '上年同期累计总额',
  amount_vs_lastyear decimal(15, 2) comment '同比',
  amount_vs_pre decimal(15, 2) comment '进度比'
) COMMENT='经济增加值-厂矿';
*/

-- 总部
truncate table data_center.ods_eva_hq;
insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z01 else 0 end),
      sum(case when rid = 2 then a.Z01 else 0 end),
      sum(case when rid = 3 then a.Z01 else 0 end),
      sum(case when rid = 4 then a.Z01 else 0 end),
      sum(case when rid = 5 then a.Z01 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 1) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z02 else 0 end),
      sum(case when rid = 2 then a.Z02 else 0 end),
      sum(case when rid = 3 then a.Z02 else 0 end),
      sum(case when rid = 4 then a.Z02 else 0 end),
      sum(case when rid = 5 then a.Z02 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 2) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z03 else 0 end),
      sum(case when rid = 2 then a.Z03 else 0 end),
      sum(case when rid = 3 then a.Z03 else 0 end),
      sum(case when rid = 4 then a.Z03 else 0 end),
      sum(case when rid = 5 then a.Z03 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 3) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z04 else 0 end),
      sum(case when rid = 2 then a.Z04 else 0 end),
      sum(case when rid = 3 then a.Z04 else 0 end),
      sum(case when rid = 4 then a.Z04 else 0 end),
      sum(case when rid = 5 then a.Z04 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 4) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z05 else 0 end),
      sum(case when rid = 2 then a.Z05 else 0 end),
      sum(case when rid = 3 then a.Z05 else 0 end),
      sum(case when rid = 4 then a.Z05 else 0 end),
      sum(case when rid = 5 then a.Z05 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 5) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z06 else 0 end),
      sum(case when rid = 2 then a.Z06 else 0 end),
      sum(case when rid = 3 then a.Z06 else 0 end),
      sum(case when rid = 4 then a.Z06 else 0 end),
      sum(case when rid = 5 then a.Z06 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 6) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z07 else 0 end),
      sum(case when rid = 2 then a.Z07 else 0 end),
      sum(case when rid = 3 then a.Z07 else 0 end),
      sum(case when rid = 4 then a.Z07 else 0 end),
      sum(case when rid = 5 then a.Z07 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 7) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z08 else 0 end),
      sum(case when rid = 2 then a.Z08 else 0 end),
      sum(case when rid = 3 then a.Z08 else 0 end),
      sum(case when rid = 4 then a.Z08 else 0 end),
      sum(case when rid = 5 then a.Z08 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 8) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z09 else 0 end),
      sum(case when rid = 2 then a.Z09 else 0 end),
      sum(case when rid = 3 then a.Z09 else 0 end),
      sum(case when rid = 4 then a.Z09 else 0 end),
      sum(case when rid = 5 then a.Z09 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 9) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z10 else 0 end),
      sum(case when rid = 2 then a.Z10 else 0 end),
      sum(case when rid = 3 then a.Z10 else 0 end),
      sum(case when rid = 4 then a.Z10 else 0 end),
      sum(case when rid = 5 then a.Z10 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 10) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z11 else 0 end),
      sum(case when rid = 2 then a.Z11 else 0 end),
      sum(case when rid = 3 then a.Z11 else 0 end),
      sum(case when rid = 4 then a.Z11 else 0 end),
      sum(case when rid = 5 then a.Z11 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 11) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z12 else 0 end),
      sum(case when rid = 2 then a.Z12 else 0 end),
      sum(case when rid = 3 then a.Z12 else 0 end),
      sum(case when rid = 4 then a.Z12 else 0 end),
      sum(case when rid = 5 then a.Z12 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 12) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z13 else 0 end),
      sum(case when rid = 2 then a.Z13 else 0 end),
      sum(case when rid = 3 then a.Z13 else 0 end),
      sum(case when rid = 4 then a.Z13 else 0 end),
      sum(case when rid = 5 then a.Z13 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 13) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z14 else 0 end),
      sum(case when rid = 2 then a.Z14 else 0 end),
      sum(case when rid = 3 then a.Z14 else 0 end),
      sum(case when rid = 4 then a.Z14 else 0 end),
      sum(case when rid = 5 then a.Z14 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 14) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z15 else 0 end),
      sum(case when rid = 2 then a.Z15 else 0 end),
      sum(case when rid = 3 then a.Z15 else 0 end),
      sum(case when rid = 4 then a.Z15 else 0 end),
      sum(case when rid = 5 then a.Z15 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 15) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z16 else 0 end),
      sum(case when rid = 2 then a.Z16 else 0 end),
      sum(case when rid = 3 then a.Z16 else 0 end),
      sum(case when rid = 4 then a.Z16 else 0 end),
      sum(case when rid = 5 then a.Z16 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 16) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z17 else 0 end),
      sum(case when rid = 2 then a.Z17 else 0 end),
      sum(case when rid = 3 then a.Z17 else 0 end),
      sum(case when rid = 4 then a.Z17 else 0 end),
      sum(case when rid = 5 then a.Z17 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 17) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z18 else 0 end),
      sum(case when rid = 2 then a.Z18 else 0 end),
      sum(case when rid = 3 then a.Z18 else 0 end),
      sum(case when rid = 4 then a.Z18 else 0 end),
      sum(case when rid = 5 then a.Z18 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 18) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z19 else 0 end),
      sum(case when rid = 2 then a.Z19 else 0 end),
      sum(case when rid = 3 then a.Z19 else 0 end),
      sum(case when rid = 4 then a.Z19 else 0 end),
      sum(case when rid = 5 then a.Z19 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 19) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z20 else 0 end),
      sum(case when rid = 2 then a.Z20 else 0 end),
      sum(case when rid = 3 then a.Z20 else 0 end),
      sum(case when rid = 4 then a.Z20 else 0 end),
      sum(case when rid = 5 then a.Z20 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 20) c
      on 1 = 1
      where org in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;



-- 厂矿数据治理平台数据插入
truncate table data_center.ods_eva_bo;
insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z01 else 0 end),
      sum(case when rid = 2 then a.Z01 else 0 end),
      sum(case when rid = 3 then a.Z01 else 0 end),
      sum(case when rid = 4 then a.Z01 else 0 end),
      sum(case when rid = 5 then a.Z01 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 1) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z02 else 0 end),
      sum(case when rid = 2 then a.Z02 else 0 end),
      sum(case when rid = 3 then a.Z02 else 0 end),
      sum(case when rid = 4 then a.Z02 else 0 end),
      sum(case when rid = 5 then a.Z02 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 2) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z03 else 0 end),
      sum(case when rid = 2 then a.Z03 else 0 end),
      sum(case when rid = 3 then a.Z03 else 0 end),
      sum(case when rid = 4 then a.Z03 else 0 end),
      sum(case when rid = 5 then a.Z03 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 3) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z04 else 0 end),
      sum(case when rid = 2 then a.Z04 else 0 end),
      sum(case when rid = 3 then a.Z04 else 0 end),
      sum(case when rid = 4 then a.Z04 else 0 end),
      sum(case when rid = 5 then a.Z04 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 4) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z05 else 0 end),
      sum(case when rid = 2 then a.Z05 else 0 end),
      sum(case when rid = 3 then a.Z05 else 0 end),
      sum(case when rid = 4 then a.Z05 else 0 end),
      sum(case when rid = 5 then a.Z05 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 5) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z06 else 0 end),
      sum(case when rid = 2 then a.Z06 else 0 end),
      sum(case when rid = 3 then a.Z06 else 0 end),
      sum(case when rid = 4 then a.Z06 else 0 end),
      sum(case when rid = 5 then a.Z06 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 6) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z07 else 0 end),
      sum(case when rid = 2 then a.Z07 else 0 end),
      sum(case when rid = 3 then a.Z07 else 0 end),
      sum(case when rid = 4 then a.Z07 else 0 end),
      sum(case when rid = 5 then a.Z07 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 7) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z08 else 0 end),
      sum(case when rid = 2 then a.Z08 else 0 end),
      sum(case when rid = 3 then a.Z08 else 0 end),
      sum(case when rid = 4 then a.Z08 else 0 end),
      sum(case when rid = 5 then a.Z08 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 8) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z09 else 0 end),
      sum(case when rid = 2 then a.Z09 else 0 end),
      sum(case when rid = 3 then a.Z09 else 0 end),
      sum(case when rid = 4 then a.Z09 else 0 end),
      sum(case when rid = 5 then a.Z09 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 9) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z10 else 0 end),
      sum(case when rid = 2 then a.Z10 else 0 end),
      sum(case when rid = 3 then a.Z10 else 0 end),
      sum(case when rid = 4 then a.Z10 else 0 end),
      sum(case when rid = 5 then a.Z10 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 10) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z11 else 0 end),
      sum(case when rid = 2 then a.Z11 else 0 end),
      sum(case when rid = 3 then a.Z11 else 0 end),
      sum(case when rid = 4 then a.Z11 else 0 end),
      sum(case when rid = 5 then a.Z11 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 11) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z12 else 0 end),
      sum(case when rid = 2 then a.Z12 else 0 end),
      sum(case when rid = 3 then a.Z12 else 0 end),
      sum(case when rid = 4 then a.Z12 else 0 end),
      sum(case when rid = 5 then a.Z12 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 12) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z13 else 0 end),
      sum(case when rid = 2 then a.Z13 else 0 end),
      sum(case when rid = 3 then a.Z13 else 0 end),
      sum(case when rid = 4 then a.Z13 else 0 end),
      sum(case when rid = 5 then a.Z13 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 13) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z14 else 0 end),
      sum(case when rid = 2 then a.Z14 else 0 end),
      sum(case when rid = 3 then a.Z14 else 0 end),
      sum(case when rid = 4 then a.Z14 else 0 end),
      sum(case when rid = 5 then a.Z14 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 14) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z15 else 0 end),
      sum(case when rid = 2 then a.Z15 else 0 end),
      sum(case when rid = 3 then a.Z15 else 0 end),
      sum(case when rid = 4 then a.Z15 else 0 end),
      sum(case when rid = 5 then a.Z15 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 15) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z16 else 0 end),
      sum(case when rid = 2 then a.Z16 else 0 end),
      sum(case when rid = 3 then a.Z16 else 0 end),
      sum(case when rid = 4 then a.Z16 else 0 end),
      sum(case when rid = 5 then a.Z16 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 16) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z17 else 0 end),
      sum(case when rid = 2 then a.Z17 else 0 end),
      sum(case when rid = 3 then a.Z17 else 0 end),
      sum(case when rid = 4 then a.Z17 else 0 end),
      sum(case when rid = 5 then a.Z17 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 17) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z18 else 0 end),
      sum(case when rid = 2 then a.Z18 else 0 end),
      sum(case when rid = 3 then a.Z18 else 0 end),
      sum(case when rid = 4 then a.Z18 else 0 end),
      sum(case when rid = 5 then a.Z18 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 18) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z19 else 0 end),
      sum(case when rid = 2 then a.Z19 else 0 end),
      sum(case when rid = 3 then a.Z19 else 0 end),
      sum(case when rid = 4 then a.Z19 else 0 end),
      sum(case when rid = 5 then a.Z19 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 19) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      '0',
      c.index_code,
      sum(case when rid = 1 then a.Z20 else 0 end),
      sum(case when rid = 2 then a.Z20 else 0 end),
      sum(case when rid = 3 then a.Z20 else 0 end),
      sum(case when rid = 4 then a.Z20 else 0 end),
      sum(case when rid = 5 then a.Z20 else 0 end)
      from data_center.ygl0070__zygl0070 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join (select * from data_center.ods_eva_ref where index_code = 20) c
      on 1 = 1
      where org not in ('GY2F00')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;