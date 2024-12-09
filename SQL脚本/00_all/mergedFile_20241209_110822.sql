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

update data_center.ygl0070__zygl0070 set org = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
  --  ----------  更新 month字段-------------------------------------------
update data_center.ygl0105__zygl0105 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ygl0105__zygl0105 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ygl0105__zygl0105 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.yzb0002__zyzb0002 set org = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
  --  ----------  更新 month字段-------------------------------------------
update data_center.yzb0002__zyzb0002 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.yzb0002__zyzb0002 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.yzb0002__zyzb0002 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';


-- 数据治理平台数据灌入
truncate table data_center.ods_coal_produce_hq;
insert into data_center.ods_coal_produce_hq 
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      on a.org_code = b.org_code
      left join data_center.ods_coal_produce_ref c
      on a.rid = c.index_code
      where a.org_code in ('GY2F00')
      and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_coal_produce_bo;
insert into data_center.ods_coal_produce_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      on a.org_code = b.org_code
      left join data_center.ods_coal_produce_ref c
      on a.rid = c.index_code
      where a.org_code not in ('GY2F00')
      and ucode like ('%_r');



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
      concat(a.per ,'-',a.month),
      c.index_code,
      c.index_name,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.yzb0002__zyzb0002 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_profit_ref c
      on a.rid = c.index_code
      where org in ('GY2F00')
      and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_profit_bo;
insert into data_center.ods_profit_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
      c.index_code,
      c.index_name,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.yzb0002__zyzb0002 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_profit_ref c
      on a.rid = c.index_code
      where org not in ('GY2F00')
      and ucode like ('%_r');



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
      where substr(a.ucode,1,6) in ('GY2F00')
      and ucode like ('%_r');

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
      where substr(a.ucode,1,4) in ('2F00','2F01','2F02','2F04','2F05','2F06','2F08','2F09')
      and ucode like ('%_r');

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
      where substr(a.ucode,1,6) in ('002300','002301','002302','002303','002305')
      and ucode like ('%_r');


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
      concat(a.per ,'-',a.month),
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
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 2) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 3) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 4) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 5) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 6) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 7) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 8) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 9) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 10) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 11) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 12) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 13) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 14) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 15) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 16) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 17) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 18) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 19) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_eva_hq
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 20) c
      on 1 = 1
      where org in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;



-- 厂矿数据治理平台数据插入
truncate table data_center.ods_eva_bo;
insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 2) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 3) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 4) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 5) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 6) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 7) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 8) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 9) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 10) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 11) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 12) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 13) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 14) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 15) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 16) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 17) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 18) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 19) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;

insert into data_center.ods_eva_bo
select
      '0',
      b.org_code,
      b.org_name,
      concat(a.per ,'-',a.month),
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
      left join (select * from data_center.ods_eva_ref where index_code = 20) c
      on 1 = 1
      where org not in ('GY2F00') and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code,a.per, a.month;
/*
-- 时间表
CREATE TABLE data_center.ads_time_month (
  year varchar(64) comment '年度',
  month varchar(64) comment '月度',
  month_ref varchar(64) comment '月度参考'
) COMMENT='时间表';

insert into data_center.ads_time_month values ('2024','2024-01','1');
insert into data_center.ads_time_month values ('2024','2024-02','2');
insert into data_center.ads_time_month values ('2024','2024-03','3');
insert into data_center.ads_time_month values ('2024','2024-04','4');
insert into data_center.ads_time_month values ('2024','2024-05','5');
insert into data_center.ads_time_month values ('2024','2024-06','6');
insert into data_center.ads_time_month values ('2024','2024-07','7');
insert into data_center.ads_time_month values ('2024','2024-08','8');
insert into data_center.ads_time_month values ('2024','2024-09','9');
insert into data_center.ads_time_month values ('2024','2024-10','10');
insert into data_center.ads_time_month values ('2024','2024-11','11');
insert into data_center.ads_time_month values ('2024','2024-12','12');
insert into data_center.ads_time_month values ('2025','2025-01','1');
insert into data_center.ads_time_month values ('2025','2025-02','2');
insert into data_center.ads_time_month values ('2025','2025-03','3');
insert into data_center.ads_time_month values ('2025','2025-04','4');
insert into data_center.ads_time_month values ('2025','2025-05','5');
insert into data_center.ads_time_month values ('2025','2025-06','6');
insert into data_center.ads_time_month values ('2025','2025-07','7');
insert into data_center.ads_time_month values ('2025','2025-08','8');
insert into data_center.ads_time_month values ('2025','2025-09','9');
insert into data_center.ads_time_month values ('2025','2025-10','10');
insert into data_center.ads_time_month values ('2025','2025-11','11');
insert into data_center.ads_time_month values ('2025','2025-12','12');
insert into data_center.ads_time_month values ('2026','2026-01','1');
insert into data_center.ads_time_month values ('2026','2026-02','2');
insert into data_center.ads_time_month values ('2026','2026-03','3');
insert into data_center.ads_time_month values ('2026','2026-04','4');
insert into data_center.ads_time_month values ('2026','2026-05','5');
insert into data_center.ads_time_month values ('2026','2026-06','6');
insert into data_center.ads_time_month values ('2026','2026-07','7');
insert into data_center.ads_time_month values ('2026','2026-08','8');
insert into data_center.ads_time_month values ('2026','2026-09','9');
insert into data_center.ads_time_month values ('2026','2026-10','10');
insert into data_center.ads_time_month values ('2026','2026-11','11');
insert into data_center.ads_time_month values ('2026','2026-12','12');
insert into data_center.ads_time_month values ('2027','2027-01','1');
insert into data_center.ads_time_month values ('2027','2027-02','2');
insert into data_center.ads_time_month values ('2027','2027-03','3');
insert into data_center.ads_time_month values ('2027','2027-04','4');
insert into data_center.ads_time_month values ('2027','2027-05','5');
insert into data_center.ads_time_month values ('2027','2027-06','6');
insert into data_center.ads_time_month values ('2027','2027-07','7');
insert into data_center.ads_time_month values ('2027','2027-08','8');
insert into data_center.ads_time_month values ('2027','2027-09','9');
insert into data_center.ads_time_month values ('2027','2027-10','10');
insert into data_center.ads_time_month values ('2027','2027-11','11');
insert into data_center.ads_time_month values ('2027','2027-12','12');


-- 组织机构表
drop table data_center.ads_orgnization;
CREATE TABLE data_center.ads_orgnization (
  f_org_code varchar(64) comment '总部机构编码',
  f_org_name varchar(64) comment '总部机构名称',
  org_code varchar(64) comment '机构编码',
  org_name varchar(64) comment '机构名称',
  level_code varchar(64) comment '权限编码',
  rank_no int(10) comment '排序编码'
) COMMENT='组织机构表';

insert into data_center.ads_orgnization values ('GY2F00','包头能源','GY2F00','包头能源','100','1');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F00','能源本部',  '10000','8');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F01','运销分公司','10001','7');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F02','万利一矿',  '10002','3');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F04','水泉露天矿','10004','5');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F05','水泉选煤厂','10005','6');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F06','李家壕煤矿','10006','2');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F08','神山露天矿','10008','4');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','2F09','洗选分公司','10009','9');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','002300','矿业本部','10010','13');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','002303','公路分公司','10013','10');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','002305','集装站','10015','11');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','002301','建安公司','10011','12');
insert into data_center.ads_orgnization values ('GY2F00','包头能源','002302','蒙格沁','10012','14');
*/

/*
-- 一级页面 商品煤经营驾驶舱
drop table data_center.ads_coal_cockpit_month_1;
CREATE TABLE data_center.ads_coal_cockpit_month_1 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 利润总额75，净利润77，自产煤利润90，外购煤利润91，EBITDA(利润总额 + 利息支出 即财务费用58 + 资产折旧 + 无形资产摊销)，产量93，自产煤产量94，外购煤产量95，销售量97，自产煤销量98，外购煤销量102，营业收入1，营业成本13，营业利润69，自产煤销售收入3，外购煤销售收入7，自产煤售价107，外购煤售价108，外购煤成本45，自产煤完全成本83，自产煤变动成本84，自产煤固定成本85，专项储备年初数111，年末数126，提取数114，使用数117，剥离量139，掘进进尺145
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'
) COMMENT='商品煤经营驾驶舱';
*/

truncate table data_center.ads_coal_cockpit_month_1;
insert into data_center.ads_coal_cockpit_month_1
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','111','126','114','117','139','145','17','16','20','21','28','25','29','32','53');  -- 20241112 : 增加 20、21、32、53、25 指标

insert into data_center.ads_coal_cockpit_month_1
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('75','77','90','91','58','93','94','95','97','98','102','1','13','69','3','7','107','108','45','83','84','85','111','126','114','117','139','145','17','16','20','21','28','25','29','32','53');  -- 20241112 : 增加 20、21、32、53、25 指标

-- 资产折旧，无形资产摊销
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '固定资产折旧',
      '178',
      a.total_amount/10000,
      '0',
      a.total_amount_lastyear/10000,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_dep_and_amo_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2');

insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '固定资产折旧',
      '178',
      a.total_amount/10000,
      '0',
      a.total_amount_lastyear/10000,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_dep_and_amo_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2');

insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '无形资产摊销',
      '179',
      a.total_amount/10000,
      '0',
      a.total_amount_lastyear/10000,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_dep_and_amo_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2');

insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '无形资产摊销',
      '179',
      a.total_amount/10000,
      '0',
      a.total_amount_lastyear/10000,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_dep_and_amo_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2');

-- 资产总额
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '资产总额',
      '176',
      a.end_balance,
      '0',
      a.amount_acc_form,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_asset_balance_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('78');

insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '资产总额',
      '176',
      a.end_balance,
      '0',
      a.amount_acc_form,
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_asset_balance_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('78');

-- 资产负债率
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '资产负债率',
      '177',
      a.acc_year,
      '0',
      a.pre_last_year_month,
      '0',
      '0',
      a.pre_year,
      '0'
      from data_center.ods_summary_index_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('7');

insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '资产负债率',
      '177',
      a.acc_year,
      '0',
      a.pre_last_year_month,
      '0',
      '0',
      a.pre_year,
      '0'
      from data_center.ods_summary_index_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('7');

insert into data_center.ads_coal_cockpit_month_1
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤每吨完全成本',
      '170',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      case when coalesce(a.amount_month_form_hb,0) = 0 then 0 else coalesce(b.amount_month_form_hb,0)/coalesce(a.amount_month_form_hb,0) end,
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end       
      from (select * from data_center.ads_coal_cockpit_month_1 where index_code = '94') a
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '83') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_cockpit_month_1
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤每吨变动成本',
      '171',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      case when coalesce(a.amount_month_form_hb,0) = 0 then 0 else coalesce(b.amount_month_form_hb,0)/coalesce(a.amount_month_form_hb,0) end,
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end       
      from (select * from data_center.ads_coal_cockpit_month_1 where index_code = '94') a
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '84') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_cockpit_month_1
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤吨煤固定成本',
      '174',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      case when coalesce(a.amount_month_form_hb,0) = 0 then 0 else coalesce(b.amount_month_form_hb,0)/coalesce(a.amount_month_form_hb,0) end,
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end       
      from (select * from data_center.ads_coal_cockpit_month_1 where index_code = '94') a
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '85') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_cockpit_month_1
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '外购煤吨煤成本',
      '175',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      case when coalesce(a.amount_month_form_hb,0) = 0 then 0 else coalesce(b.amount_month_form_hb,0)/coalesce(a.amount_month_form_hb,0) end,
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end       
      from (select * from data_center.ads_coal_cockpit_month_1 where index_code = '95') a
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '45') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_cockpit_month_1
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      'EBITDA',
      '172',
      coalesce(b.amount_acc,0) + coalesce(a.amount_acc,0) + coalesce(c.amount_acc,0) + coalesce(d.amount_acc,0),
      coalesce(b.amount_month,0) + coalesce(a.amount_month,0) + coalesce(c.amount_month,0) + coalesce(d.amount_month,0),
      coalesce(b.amount_acc_form,0) + coalesce(a.amount_acc_form,0) + coalesce(c.amount_acc_form,0) + coalesce(d.amount_acc_form,0),
      coalesce(b.amount_month_form,0) + coalesce(a.amount_month_form,0) + coalesce(c.amount_month_form,0) + coalesce(d.amount_month_form,0),
      coalesce(b.amount_month_form_hb,0) + coalesce(a.amount_month_form_hb,0) + coalesce(c.amount_month_form_hb,0) + coalesce(d.amount_month_form_hb,0),
      coalesce(b.amount_pre,0) + coalesce(a.amount_pre,0) + coalesce(c.amount_pre,0) + coalesce(d.amount_pre,0),
      coalesce(b.amount_month_pre,0) + coalesce(a.amount_month_pre,0) + coalesce(c.amount_month_pre,0) + coalesce(d.amount_month_pre,0)
      from (select * from data_center.ads_coal_cockpit_month_1 where index_code = '75') a     -- 利润总额
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '58') b    -- 利息支出 ，即财务费用指标
      on a.org_code = b.org_code and a.date = b.date
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '178') c
      on a.org_code = c.org_code and a.date = c.date
      left join (select * from data_center.ads_coal_cockpit_month_1 where index_code = '179') d
      on a.org_code = d.org_code and a.date = d.date     
;

-- 包能，运销取结算汇总
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '车板价',
      '173',
      a.price_taxex_acc,
      a.price_taxex_month,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31','32');

-- 四大煤矿取0105
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '车板价',
      '173',
      a.unit_price_acc,
      a.unit_price,
      a.unit_price_acc_lastyear,
      a.unit_price_lastyear,
      a.unit_price_lastmonth,
      a.unit_price_pre,
      '0'
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2')
      and b.org_name in ('万利一矿','水泉露天矿','李家壕煤矿','神山露天矿');

-- 洗选取0105
insert into data_center.ads_coal_cockpit_month_1
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '车板价',
      '173',
      a.unit_price_acc,
      a.unit_price,
      a.unit_price_acc_lastyear,
      a.unit_price_lastyear,
      a.unit_price_lastmonth,
      a.unit_price_pre,
      '0'
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('7')
      and b.org_name in ('洗选分公司');

update data_center.ads_coal_cockpit_month_1
   set amount_acc = '255.7' where date = '2024-09' and org_code = 'GY2F00' and index_code = '170';
update data_center.ads_coal_cockpit_month_1
   set amount_acc = '252.44' where date = '2024-08' and org_code = 'GY2F00' and index_code = '170';
update data_center.ads_coal_cockpit_month_1
   set amount_acc = '256.56' where date = '2024-07' and org_code = 'GY2F00' and index_code = '170';
update data_center.ads_coal_cockpit_month_1
   set amount_acc = '232.37' where date = '2024-06' and org_code = 'GY2F00' and index_code = '170';



/*
-- 二级页面 商品煤销售收入分析
drop table data_center.ads_coal_income_month_2;
CREATE TABLE data_center.ads_coal_income_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 自产煤，外购煤，公路收费
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',  
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'  
) COMMENT='商品煤销售收入分析';
*/

truncate table data_center.ads_coal_income_month_2;
insert into data_center.ads_coal_income_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('3','7')
      and b.org_name <> '运销分公司';

insert into data_center.ads_coal_income_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('3','7')
      and b.org_name <> '运销分公司';

-- 插入公路收费
insert into data_center.ads_coal_income_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2')
      and b.org_name = '公路分公司';

-- 插入包能 公路收费
insert into data_center.ads_coal_income_month_2
select
      'GY2F00',
      '包头能源',
      '100',
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.total_amount_acc,
      a.total_amount,
      a.total_amount_acc_lastyear,
      a.total_amount_lastyear,
      a.total_amount_lastmonth,
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2')
      and b.org_name = '公路分公司';

-- 插入运销
insert into data_center.ads_coal_income_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '2.外购煤销售收入',
      '7',
      a.total_acc/10000,
      a.total_month/10000,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31');


/*
-- 二级页面 商品煤产量与销量分析
drop table data_center.ads_coal_yield_sales_month_2;
CREATE TABLE data_center.ads_coal_yield_sales_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 商品煤量，自产煤量，外购煤量，商品煤销量，自产煤销量，外购煤销量
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',  
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'  
) COMMENT='商品煤产量与销量分析';
*/

truncate table data_center.ads_coal_yield_sales_month_2;
insert into data_center.ads_coal_yield_sales_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('93','94','95','97','98','102')
      and b.org_name <> '运销分公司';

insert into data_center.ads_coal_yield_sales_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('93','94','95','97','98','102')
      and b.org_name <> '运销分公司';

-- 插入运销
insert into data_center.ads_coal_yield_sales_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '一、产量',
      '93',
      a.amount_acc/10000,
      a.amount_month/10000,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31');

insert into data_center.ads_coal_yield_sales_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '外购煤量',
      '95',
      a.amount_acc/10000,
      a.amount_month/10000,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31');

insert into data_center.ads_coal_yield_sales_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '二、销售量',
      '97',
      a.amount_acc/10000,
      a.amount_month/10000,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31');

insert into data_center.ads_coal_yield_sales_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '外购煤销量',
      '102',
      a.amount_acc/10000,
      a.amount_month/10000,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31');

/*
-- 二级页面 商品煤销售单价分析
drop table data_center.ads_coal_sale_price_month_2;
CREATE TABLE data_center.ads_coal_sale_price_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 自产煤售价，外购煤售价
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',  
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'  
) COMMENT='商品煤销售单价分析';
*/

truncate table data_center.ads_coal_sale_price_month_2;
insert into data_center.ads_coal_sale_price_month_2
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
      a.total_amount_pre,
      a.total_amount_pre
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('107','108');

insert into data_center.ads_coal_sale_price_month_2
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
      a.total_amount_pre,
      a.total_amount_pre
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('107','108');

-- 包能，运销取结算汇总
insert into data_center.ads_coal_sale_price_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '车板价',
      '173',
      a.price_taxex_acc,
      a.price_taxex_month,
      '0',
      '0',
      '0',
      '0',
      '0'
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('31','32');

-- 四大煤矿、洗选取0105
insert into data_center.ads_coal_sale_price_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      '车板价',
      '173',
      a.unit_price_acc,
      a.unit_price,
      a.unit_price_acc_lastyear,
      a.unit_price_lastyear,
      a.unit_price_lastmonth,
      a.unit_price_pre,
      '0'
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('2')
      and b.org_name in ('万利一矿','水泉露天矿','李家壕煤矿','神山露天矿','洗选分公司');


/*
-- 二级页面 商品煤营业成本分析
drop table data_center.ads_coal_operating_cost_month_2;
CREATE TABLE data_center.ads_coal_operating_cost_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 自产煤固定成本，自产煤变动成本，自产煤完全成本，外购煤主营业务成本
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'
) COMMENT='商品煤营业成本分析';
*/

truncate table data_center.ads_coal_operating_cost_month_2;
insert into data_center.ads_coal_operating_cost_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('83','45','84','85','94','102');

insert into data_center.ads_coal_operating_cost_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('83','45','84','85','94','102');

insert into data_center.ads_coal_operating_cost_month_2
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤每吨完全成本',
      '170',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      '0',
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end   
      from (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '94') a
      left join (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '83') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_operating_cost_month_2
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤每吨变动成本',
      '171',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      '0',
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end   
      from (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '94') a
      left join (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '84') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_operating_cost_month_2
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '自产煤每吨固定成本',
      '172',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      '0',
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end   
      from (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '94') a
      left join (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '85') b
      on a.org_code = b.org_code and a.date = b.date
;

insert into data_center.ads_coal_operating_cost_month_2
select
      a.org_code,
      a.org_name,
      a.level_code,
      a.date,
      '外购煤每吨成本',
      '173',
      case when coalesce(a.amount_acc,0) = 0 then 0 else coalesce(b.amount_acc,0)/coalesce(a.amount_acc,0) end,
      case when coalesce(a.amount_month,0) = 0 then 0 else coalesce(b.amount_month,0)/coalesce(a.amount_month,0) end,
      case when coalesce(a.amount_acc_form,0) = 0 then 0 else coalesce(b.amount_acc_form,0)/coalesce(a.amount_acc_form,0) end,
      case when coalesce(a.amount_month_form,0) = 0 then 0 else coalesce(b.amount_month_form,0)/coalesce(a.amount_month_form,0) end,
      '0',
      case when coalesce(a.amount_pre,0) = 0 then 0 else coalesce(b.amount_pre,0)/coalesce(a.amount_pre,0) end,
      case when coalesce(a.amount_month_pre,0) = 0 then 0 else coalesce(b.amount_month_pre,0)/coalesce(a.amount_month_pre,0) end   
      from (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '102') a
      left join (select * from data_center.ads_coal_operating_cost_month_2 where index_code = '45') b
      on a.org_code = b.org_code and a.date = b.date
;

/*
-- 二级页面 商品煤利润情况分析
drop table data_center.ads_coal_profit_month_2;
CREATE TABLE data_center.ads_coal_profit_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 利润总额，自产煤利润，外购煤利润，净利润
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_month decimal(15, 2) comment '本月实际数',
  amount_acc_form decimal(15, 2) comment '去年累计数',
  amount_month_form decimal(15, 2) comment '去年同月实际数',
  amount_month_form_hb decimal(15, 2) comment '本年上月实际数',
  amount_pre decimal(15, 2) comment '本年预算数',
  amount_month_pre decimal(15, 2) comment '本月预算数'
) COMMENT='商品煤利润情况分析';
*/

truncate table data_center.ads_coal_profit_month_2;
insert into data_center.ads_coal_profit_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('75','77','90','91');

insert into data_center.ads_coal_profit_month_2
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
      a.total_amount_pre,
      a.total_amount_pre/12
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('75','77','90','91');

/*
-- 二级页面 不同燃值商品煤分析
drop table data_center.ads_coal_fuel_value_month_2;
CREATE TABLE data_center.ads_coal_fuel_value_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 5000合计，4500合计，3800合计，煤矸石合计
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '本月结算数量',
  price_taxex_month decimal(15, 2) comment '本月不含税单价', 
  income_taxex_month decimal(15, 2) comment '本月不含税销售收入',
  amount_acc decimal(15, 2) comment '累计结算数量',
  price_taxex_acc decimal(15, 2) comment '累计不含税单价', 
  income_taxex_acc decimal(15, 2) comment '累计不含税销售收入'
) COMMENT='不同燃值商品煤分析';
*/

truncate table data_center.ads_coal_fuel_value_month_2;
insert into data_center.ads_coal_fuel_value_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.amount_month,
      a.price_taxex_month,
      a.income_taxex_month,
      a.amount_acc,
      a.price_taxex_acc,
      a.income_taxex_acc
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code
      where index_code in ('37','38','39','40','41','42','43','44','45','46');

/*
-- 二级页面 商品煤按区域销售分析
drop table data_center.ads_coal_sale_area_month_2;
CREATE TABLE data_center.ads_coal_sale_area_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 区内，区外，神混5000煤种(区外），神混4500煤种(区外），神混4500煤种(区内），神混3800煤种(区内），贫瘦3800煤种（区内）
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '本月结算数量',
  price_taxex_month decimal(15, 2) comment '本月不含税单价', 
  income_taxex_month decimal(15, 2) comment '本月不含税销售收入',
  amount_acc decimal(15, 2) comment '累计结算数量',
  price_taxex_acc decimal(15, 2) comment '累计不含税单价', 
  income_taxex_acc decimal(15, 2) comment '累计不含税销售收入'
) COMMENT='商品煤按区域销售分析';
*/

truncate table data_center.ads_coal_sale_area_month_2;
insert into data_center.ads_coal_sale_area_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.amount_month,
      a.price_taxex_month,
      a.income_taxex_month,
      a.amount_acc,
      a.price_taxex_acc,
      a.income_taxex_acc
      from data_center.ods_coal_settlement a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code      
      where index_code in ('35','36','1','4','7','8','10','13','14','16','17','20');

/*
-- 二级页面 经济增加值
drop table data_center.ads_eva_month_2;
CREATE TABLE data_center.ads_eva_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 经济增加值19，税后净营业利润1，平均资本成本率14，调整后资本10，净利润2，平均所有者权益11，利息支出3，研究开发费4，平均带息负债12，平均在建工程13
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',  
  amount_acc decimal(15, 2) comment '本年累计',
  amount_acc_pre decimal(15, 2) comment '上年同期累计总额',
  amount_vs_lastyear decimal(15, 2) comment '同比',
  amount_vs_pre decimal(15, 2) comment '进度比'
) COMMENT='经济增加值分析';
*/

truncate table data_center.ads_eva_month_2;
insert into data_center.ads_eva_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.amount_pre,
      a.amount_acc,
      a.amount_acc_pre,
      a.amount_vs_lastyear,
      a.amount_vs_pre
      from data_center.ods_eva_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code      
      where index_code in ('19','1','14','10','2','11','3','4','12','13');

insert into data_center.ads_eva_month_2
select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7),
      a.index_name,
      a.index_code,
      a.amount_pre,
      a.amount_acc,
      a.amount_acc_pre,
      a.amount_vs_lastyear,
      a.amount_vs_pre
      from data_center.ods_eva_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code    
      where index_code in ('19','1','14','10','2','11','3','4','12','13');

/*
-- 二级页面 专项储备
drop table data_center.ads_special_reserve_month_2;
CREATE TABLE data_center.ads_special_reserve_month_2 (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  reserve decimal(15, 2) comment '本年储备结余',  
  reserve_pre decimal(15, 2) comment '本年储备结余预算',
  extract_safe decimal(15, 2) comment '本年安全费提取',  
  extract_safe_pre decimal(15, 2) comment '本年安全费提取预算',
  use_safe decimal(15, 2) comment '本年安全费使用',  
  use_safe_pre decimal(15, 2) comment '本年安全费使用预算',
  extract_maintain decimal(15, 2) comment '本年维简费提取',  
  extract_maintain_pre decimal(15, 2) comment '本年维简费提取预算',
  use_maintain decimal(15, 2) comment '本年维简费使用',  
  use_maintain_pre decimal(15, 2) comment '本年维简费使用预算'
) COMMENT='专项储备情况--二级页面';
*/

truncate table data_center.ads_special_reserve_month_2;
insert into data_center.ads_special_reserve_month_2
select 
      org_code,
      org_name,
      level_code,
      date1,
      sum(reserve),
      sum(reserve_pre),
      sum(extract_safe),
      sum(extract_safe_pre),
      sum(use_safe),
      sum(use_safe_pre),
      sum(extract_maintain),
      sum(extract_maintain_pre),
      sum(use_maintain),
      sum(use_maintain_pre)
      from
      (select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7) as date1,
      case when a.index_code = '126' then a.total_amount_acc else '0' end as reserve,
      case when a.index_code = '126' then a.total_amount_pre else '0' end as reserve_pre,
      case when a.index_code = '116' then a.total_amount_acc else '0' end as extract_safe,
      case when a.index_code = '116' then a.total_amount_pre else '0' end as extract_safe_pre,
      case when a.index_code = '119' then a.total_amount_acc else '0' end as use_safe,
      case when a.index_code = '119' then a.total_amount_pre else '0' end as use_safe_pre,
      case when a.index_code = '115' then a.total_amount_acc else '0' end as extract_maintain,
      case when a.index_code = '115' then a.total_amount_pre else '0' end as extract_maintain_pre,
      case when a.index_code = '118' then a.total_amount_acc else '0' end as use_maintain,
      case when a.index_code = '118' then a.total_amount_pre else '0' end as use_maintain_pre
      from data_center.ods_coal_produce_hq a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code) a
      group by org_code, org_name, level_code, date1;


insert into data_center.ads_special_reserve_month_2   
select 
      org_code,
      org_name,
      level_code,
      date1,
      sum(reserve),
      sum(reserve_pre),
      sum(extract_safe),
      sum(extract_safe_pre),
      sum(use_safe),
      sum(use_safe_pre),
      sum(extract_maintain),
      sum(extract_maintain_pre),
      sum(use_maintain),
      sum(use_maintain_pre)
      from
      (select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7) as date1,
      case when a.index_code = '126' then a.total_amount_acc else '0' end as reserve,
      case when a.index_code = '126' then a.total_amount_pre else '0' end as reserve_pre,
      case when a.index_code = '116' then a.total_amount_acc else '0' end as extract_safe,
      case when a.index_code = '116' then a.total_amount_pre else '0' end as extract_safe_pre,
      case when a.index_code = '119' then a.total_amount_acc else '0' end as use_safe,
      case when a.index_code = '119' then a.total_amount_pre else '0' end as use_safe_pre,
      case when a.index_code = '115' then a.total_amount_acc else '0' end as extract_maintain,
      case when a.index_code = '115' then a.total_amount_pre else '0' end as extract_maintain_pre,
      case when a.index_code = '118' then a.total_amount_acc else '0' end as use_maintain,
      case when a.index_code = '118' then a.total_amount_pre else '0' end as use_maintain_pre
      from data_center.ods_coal_produce_bo a
      left join data_center.ads_orgnization b
      on a.org_code = b.org_code) a
      group by org_code, org_name, level_code, date1;

/* -- 现金流量表 YZB0003
drop table data_center.ods_cash_flow_ref;
CREATE TABLE data_center.ods_cash_flow_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='现金流量表-对照表';


-- 对照表数据灌入
insert into data_center.ods_cash_flow_ref
select distinct(index_name), index_code from data_center.ods_cash_flow_hq;


drop table data_center.ods_cash_flow_hq;
CREATE TABLE data_center.ods_cash_flow_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 专项储备： 年初数（维简费、安全费）、提取数、使用数、年末数
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_acc_form decimal(15, 2) comment '去年累计数'
) COMMENT='现金流量';


drop table data_center.ods_cash_flow_bo;
CREATE TABLE data_center.ods_cash_flow_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 专项储备： 年初数（维简费、安全费）、提取数、使用数、年末数
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年累计数',
  amount_acc_form decimal(15, 2) comment '去年累计数'
) COMMENT='现金流量';

*/

--  ----  现金流量  yzb0003__zyzb0003      -----
--  ----------  更新 org_code 字段---------------------------------
update data_center.yzb0003__zyzb0003
set org =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
--  ----------  更新 month字段-------------------------------------------
update data_center.yzb0003__zyzb0003
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.yzb0003__zyzb0003
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.yzb0003__zyzb0003
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';


update data_center.ygl0100__zygl0100
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ygl0100__zygl0100
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ygl0100__zygl0100
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ygl0100__zygl0100
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ygl0078__zygl0078
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ygl0078__zygl0078
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ygl0078__zygl0078
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ygl0078__zygl0078
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ygl0072__zygl0072
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ygl0072__zygl0072
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ygl0072__zygl0072
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ygl0072__zygl0072
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybcb013__zybcb013
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybcb013__zybcb013
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybcb013__zybcb013
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybcb013__zybcb013
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.yzb0102__zyzb0102
set org =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.yzb0102__zyzb0102
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.yzb0102__zyzb0102
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.yzb0102__zyzb0102
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybzc022__zybzc022
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybzc022__zybzc022
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybzc022__zybzc022
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybzc022__zybzc022
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybgl017__zybgl017
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybgl017__zybgl017
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybgl017__zybgl017
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybgl017__zybgl017
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybcb016__zybcb016
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybcb016__zybcb016
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybcb016__zybcb016
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybcb016__zybcb016
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybcb039__zybcb039
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybcb039__zybcb039
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybcb039__zybcb039
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybcb039__zybcb039
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ybcb019__zybcb019_01
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ybcb019__zybcb019_01
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ybcb019__zybcb019_01
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ybcb019__zybcb019_01
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

update data_center.ygl0083__zygl0083
set org_code =
        case
            when substr(ucode, 1, 1) = '2' then substr(ucode, 1, 4)
            else substr(ucode, 1, 6) end;
update data_center.ygl0083__zygl0083
set month = substr(ucode, -4, 2)
where ucode like '%_r';
update data_center.ygl0083__zygl0083
set month = substr(ucode, -4, 2)
where ucode like '%_j';
update data_center.ygl0083__zygl0083
set month = substr(ucode, -2, 2)
where ucode not like '%_r'
  and ucode not like '%_j';

-- 数据治理平台数据灌入
-- 现金流
truncate table data_center.ods_cash_flow_hq;
insert into data_center.ods_cash_flow_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2)
from data_center.yzb0003__zyzb0003 a
         left join data_center.ads_orgnization b
                   on substr(a.ucode, 1, 6) = b.org_code
         left join data_center.ods_cash_flow_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) in ('GY2F00')
  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_cash_flow_bo;
insert into data_center.ods_cash_flow_bo
select b.org_code,
       b.org_name,
       (case
            when
                substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2)
from data_center.yzb0003__zyzb0003 a
         left join data_center.ads_orgnization b
                   on (case
                           when substr(a.ucode, 5, 1) = '_' then substr(a.ucode, 1, 4)
                           else substr(a.ucode, 1, 6) end) = b.org_code
         left join data_center.ods_cash_flow_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) not in ('GY2F00')
  and ucode like ('%_r');

/**
drop table data_center.ods_fund_income_expense_hq;
CREATE TABLE data_center.ods_fund_income_expense_hq (
  id varchar(64) comment '序号',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 资金收支情况： 计划数、实际数、差额
  index_code varchar(64) comment '指标编码',
  plan_amount decimal(15, 2) comment '计划数',
 act_amount decimal(15, 2) comment '实际数',
  amount_diff decimal(15, 2) comment '差额'

) COMMENT='资金收支情况-总部';

drop table data_center.ods_fund_income_expense_bo;
CREATE TABLE data_center.ods_fund_income_expense_bo (
  id varchar(64) comment '序号',
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', -- 资金收支情况： 计划数、实际数、差额
  index_code varchar(64) comment '指标编码',
  plan_amount decimal(15, 2) comment '计划数',
 act_amount decimal(15, 2) comment '实际数',
  amount_diff decimal(15, 2) comment '差额'
**/


/* -- 存货分类统计
drop table data_center.ods_inventory_class_stat_ref;
CREATE TABLE data_center.ods_inventory_class_stat_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='存货分类统计-对照表';


-- 对照表数据灌入
insert into data_center.ods_inventory_class_stat_ref
select distinct(index_name), index_code from data_center.ods_inventory_class_stat_hq;

-- 业务表
drop table data_center.ods_inventory_class_stat_hq;
CREATE TABLE data_center.ods_inventory_class_stat_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  book_balance_20191231 decimal(15, 2) comment '账面余额（截至2019年12月31日）',
  decrease_value_prepare_20191231 decimal(15, 2) comment '去跌价准备/减值准备（截至2019年12月31日）',
 book_balance_now decimal(15, 2) comment '账面余额（截至本月底）',
  decrease_value_prepare_now decimal(15, 2) comment '跌价准备/减值准备（截至本月底）'
) COMMENT='存货分类统计';

drop table data_center.ods_inventory_class_stat_bo;
CREATE TABLE data_center.ods_inventory_class_stat_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  book_balance_20191231 decimal(15, 2) comment '账面余额（截至2019年12月31日）',
  decrease_value_prepare_20191231 decimal(15, 2) comment '去跌价准备/减值准备（截至2019年12月31日）',
 book_balance_now decimal(15, 2) comment '账面余额（截至本月底）',
  decrease_value_prepare_now decimal(15, 2) comment '跌价准备/减值准备（截至本月底）'
) COMMENT='存货分类统计';
*/


-- 数据治理平台数据灌入
-- 存货分类统计
truncate table data_center.ods_inventory_class_stat_hq;
insert into data_center.ods_inventory_class_stat_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2),
       round(if(a.Z03 is null, 0, a.Z03), 2),
       round(if(a.Z04 is null, 0, a.Z04), 2)
from data_center.ygl0100__zygl0100 a
         left join data_center.ads_orgnization b
                   on substr(a.ucode, 1, 6) = b.org_code
         left join data_center.ods_inventory_class_stat_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) in ('GY2F00')
  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_inventory_class_stat_bo;
insert into data_center.ods_inventory_class_stat_bo
select b.org_code,
       b.org_name,
       (case
            when
                substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2),
       round(if(a.Z03 is null, 0, a.Z03), 2),
       round(if(a.Z04 is null, 0, a.Z04), 2)
from data_center.ygl0100__zygl0100 a
         left join data_center.ads_orgnization b
                   on (case
                           when substr(a.ucode, 5, 1) = '_' then substr(a.ucode, 1, 4)
                           else substr(a.ucode, 1, 6) end) = b.org_code
         left join data_center.ods_inventory_class_stat_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) not in ('GY2F00')
  and ucode like ('%_r');


/* -- 汇总指标
drop table data_center.ods_summary_index_ref;
CREATE TABLE data_center.ods_summary_index_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='汇总指标-对照表';


-- 对照表数据灌入
insert into data_center.ods_summary_index_ref
select distinct(index_name), index_code from data_center.ods_summary_index_hq;

-- 业务表
drop table data_center.ods_summary_index_hq;
CREATE TABLE data_center.ods_summary_index_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
 f_index_name varchar(64) comment '父指标名称',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
 unit varchar(64) comment '单位',
  pre_year decimal(15, 2) comment '年度预算',
  pre_last_month decimal(15, 2) comment '上月',
 pre_current_month decimal(15, 2) comment '本月',
  pre_last_year_month decimal(15, 2) comment '上年同期',
 acc_year decimal(15, 2) comment '本年累计'
) COMMENT='汇总指标-总部';

drop table data_center.ods_summary_index_bo;
CREATE TABLE data_center.ods_summary_index_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
 f_index_name varchar(64) comment '父指标名称',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
 unit varchar(64) comment '单位',
  pre_year decimal(15, 2) comment '年度预算',
  pre_last_month decimal(15, 2) comment '上月',
 pre_current_month decimal(15, 2) comment '本月',
  pre_last_year_month decimal(15, 2) comment '上年同期',
 acc_year decimal(15, 2) comment '本年累计'
) COMMENT='汇总指标-厂矿';
*/


-- 数据治理平台数据灌入
-- 集团汇总指标
truncate table data_center.ods_summary_index_hq;
insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z01 else 0 end),
       sum(case when rid = 2 then a.Z01 else 0 end),
       sum(case when rid = 3 then a.Z01 else 0 end),
       sum(case when rid = 4 then a.Z01 else 0 end),
       sum(case when rid = 5 then a.Z01 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on substr(a.ucode, 1, 6) = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 1) c
                   on 1 = 1
where substr(a.ucode, 1, 6) in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;


insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z02 else 0 end),
       sum(case when rid = 2 then a.Z02 else 0 end),
       sum(case when rid = 3 then a.Z02 else 0 end),
       sum(case when rid = 4 then a.Z02 else 0 end),
       sum(case when rid = 5 then a.Z02 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on substr(a.ucode, 1, 6) = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 2) c
                   on 1 = 1
where substr(a.ucode, 1, 6) in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z03 else 0 end),
       sum(case when rid = 2 then a.Z03 else 0 end),
       sum(case when rid = 3 then a.Z03 else 0 end),
       sum(case when rid = 4 then a.Z03 else 0 end),
       sum(case when rid = 5 then a.Z03 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 3) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z04 else 0 end),
       sum(case when rid = 2 then a.Z04 else 0 end),
       sum(case when rid = 3 then a.Z04 else 0 end),
       sum(case when rid = 4 then a.Z04 else 0 end),
       sum(case when rid = 5 then a.Z04 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 4) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z05 else 0 end),
       sum(case when rid = 2 then a.Z05 else 0 end),
       sum(case when rid = 3 then a.Z05 else 0 end),
       sum(case when rid = 4 then a.Z05 else 0 end),
       sum(case when rid = 5 then a.Z05 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 5) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z06 else 0 end),
       sum(case when rid = 2 then a.Z06 else 0 end),
       sum(case when rid = 3 then a.Z06 else 0 end),
       sum(case when rid = 4 then a.Z06 else 0 end),
       sum(case when rid = 5 then a.Z06 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 6) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z07 else 0 end),
       sum(case when rid = 2 then a.Z07 else 0 end),
       sum(case when rid = 3 then a.Z07 else 0 end),
       sum(case when rid = 4 then a.Z07 else 0 end),
       sum(case when rid = 5 then a.Z07 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 7) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z08 else 0 end),
       sum(case when rid = 2 then a.Z08 else 0 end),
       sum(case when rid = 3 then a.Z08 else 0 end),
       sum(case when rid = 4 then a.Z08 else 0 end),
       sum(case when rid = 5 then a.Z08 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 8) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z09 else 0 end),
       sum(case when rid = 2 then a.Z09 else 0 end),
       sum(case when rid = 3 then a.Z09 else 0 end),
       sum(case when rid = 4 then a.Z09 else 0 end),
       sum(case when rid = 5 then a.Z09 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 9) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z10 else 0 end),
       sum(case when rid = 2 then a.Z10 else 0 end),
       sum(case when rid = 3 then a.Z10 else 0 end),
       sum(case when rid = 4 then a.Z10 else 0 end),
       sum(case when rid = 5 then a.Z10 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 10) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z11 else 0 end),
       sum(case when rid = 2 then a.Z11 else 0 end),
       sum(case when rid = 3 then a.Z11 else 0 end),
       sum(case when rid = 4 then a.Z11 else 0 end),
       sum(case when rid = 5 then a.Z11 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 11) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z12 else 0 end),
       sum(case when rid = 2 then a.Z12 else 0 end),
       sum(case when rid = 3 then a.Z12 else 0 end),
       sum(case when rid = 4 then a.Z12 else 0 end),
       sum(case when rid = 5 then a.Z12 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 12) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z13 else 0 end),
       sum(case when rid = 2 then a.Z13 else 0 end),
       sum(case when rid = 3 then a.Z13 else 0 end),
       sum(case when rid = 4 then a.Z13 else 0 end),
       sum(case when rid = 5 then a.Z13 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 13) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z14 else 0 end),
       sum(case when rid = 2 then a.Z14 else 0 end),
       sum(case when rid = 3 then a.Z14 else 0 end),
       sum(case when rid = 4 then a.Z14 else 0 end),
       sum(case when rid = 5 then a.Z14 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 14) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z15 else 0 end),
       sum(case when rid = 2 then a.Z15 else 0 end),
       sum(case when rid = 3 then a.Z15 else 0 end),
       sum(case when rid = 4 then a.Z15 else 0 end),
       sum(case when rid = 5 then a.Z15 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 15) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z16 else 0 end),
       sum(case when rid = 2 then a.Z16 else 0 end),
       sum(case when rid = 3 then a.Z16 else 0 end),
       sum(case when rid = 4 then a.Z16 else 0 end),
       sum(case when rid = 5 then a.Z16 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 16) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z17 else 0 end),
       sum(case when rid = 2 then a.Z17 else 0 end),
       sum(case when rid = 3 then a.Z17 else 0 end),
       sum(case when rid = 4 then a.Z17 else 0 end),
       sum(case when rid = 5 then a.Z17 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 17) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z18 else 0 end),
       sum(case when rid = 2 then a.Z18 else 0 end),
       sum(case when rid = 3 then a.Z18 else 0 end),
       sum(case when rid = 4 then a.Z18 else 0 end),
       sum(case when rid = 5 then a.Z18 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 18) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z19 else 0 end),
       sum(case when rid = 2 then a.Z19 else 0 end),
       sum(case when rid = 3 then a.Z19 else 0 end),
       sum(case when rid = 4 then a.Z19 else 0 end),
       sum(case when rid = 5 then a.Z19 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 19) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z20 else 0 end),
       sum(case when rid = 2 then a.Z20 else 0 end),
       sum(case when rid = 3 then a.Z20 else 0 end),
       sum(case when rid = 4 then a.Z20 else 0 end),
       sum(case when rid = 5 then a.Z20 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 20) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z21 else 0 end),
       sum(case when rid = 2 then a.Z21 else 0 end),
       sum(case when rid = 3 then a.Z21 else 0 end),
       sum(case when rid = 4 then a.Z21 else 0 end),
       sum(case when rid = 5 then a.Z21 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 21) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z22 else 0 end),
       sum(case when rid = 2 then a.Z22 else 0 end),
       sum(case when rid = 3 then a.Z22 else 0 end),
       sum(case when rid = 4 then a.Z22 else 0 end),
       sum(case when rid = 5 then a.Z22 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 22) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z23 else 0 end),
       sum(case when rid = 2 then a.Z23 else 0 end),
       sum(case when rid = 3 then a.Z23 else 0 end),
       sum(case when rid = 4 then a.Z23 else 0 end),
       sum(case when rid = 5 then a.Z23 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 23) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z24 else 0 end),
       sum(case when rid = 2 then a.Z24 else 0 end),
       sum(case when rid = 3 then a.Z24 else 0 end),
       sum(case when rid = 4 then a.Z24 else 0 end),
       sum(case when rid = 5 then a.Z24 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 24) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z25 else 0 end),
       sum(case when rid = 2 then a.Z25 else 0 end),
       sum(case when rid = 3 then a.Z25 else 0 end),
       sum(case when rid = 4 then a.Z25 else 0 end),
       sum(case when rid = 5 then a.Z25 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 25) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z26 else 0 end),
       sum(case when rid = 2 then a.Z26 else 0 end),
       sum(case when rid = 3 then a.Z26 else 0 end),
       sum(case when rid = 4 then a.Z26 else 0 end),
       sum(case when rid = 5 then a.Z26 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 26) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z27 else 0 end),
       sum(case when rid = 2 then a.Z27 else 0 end),
       sum(case when rid = 3 then a.Z27 else 0 end),
       sum(case when rid = 4 then a.Z27 else 0 end),
       sum(case when rid = 5 then a.Z27 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 27) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z28 else 0 end),
       sum(case when rid = 2 then a.Z28 else 0 end),
       sum(case when rid = 3 then a.Z28 else 0 end),
       sum(case when rid = 4 then a.Z28 else 0 end),
       sum(case when rid = 5 then a.Z28 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 28) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z29 else 0 end),
       sum(case when rid = 2 then a.Z29 else 0 end),
       sum(case when rid = 3 then a.Z29 else 0 end),
       sum(case when rid = 4 then a.Z29 else 0 end),
       sum(case when rid = 5 then a.Z29 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 29) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z30 else 0 end),
       sum(case when rid = 2 then a.Z30 else 0 end),
       sum(case when rid = 3 then a.Z30 else 0 end),
       sum(case when rid = 4 then a.Z30 else 0 end),
       sum(case when rid = 5 then a.Z30 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 30) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z31 else 0 end),
       sum(case when rid = 2 then a.Z31 else 0 end),
       sum(case when rid = 3 then a.Z31 else 0 end),
       sum(case when rid = 4 then a.Z31 else 0 end),
       sum(case when rid = 5 then a.Z31 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 31) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z32 else 0 end),
       sum(case when rid = 2 then a.Z32 else 0 end),
       sum(case when rid = 3 then a.Z32 else 0 end),
       sum(case when rid = 4 then a.Z32 else 0 end),
       sum(case when rid = 5 then a.Z32 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 32) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z33 else 0 end),
       sum(case when rid = 2 then a.Z33 else 0 end),
       sum(case when rid = 3 then a.Z33 else 0 end),
       sum(case when rid = 4 then a.Z33 else 0 end),
       sum(case when rid = 5 then a.Z33 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 33) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z34 else 0 end),
       sum(case when rid = 2 then a.Z34 else 0 end),
       sum(case when rid = 3 then a.Z34 else 0 end),
       sum(case when rid = 4 then a.Z34 else 0 end),
       sum(case when rid = 5 then a.Z34 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 34) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z35 else 0 end),
       sum(case when rid = 2 then a.Z35 else 0 end),
       sum(case when rid = 3 then a.Z35 else 0 end),
       sum(case when rid = 4 then a.Z35 else 0 end),
       sum(case when rid = 5 then a.Z35 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 35) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z36 else 0 end),
       sum(case when rid = 2 then a.Z36 else 0 end),
       sum(case when rid = 3 then a.Z36 else 0 end),
       sum(case when rid = 4 then a.Z36 else 0 end),
       sum(case when rid = 5 then a.Z36 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 36) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z37 else 0 end),
       sum(case when rid = 2 then a.Z37 else 0 end),
       sum(case when rid = 3 then a.Z37 else 0 end),
       sum(case when rid = 4 then a.Z37 else 0 end),
       sum(case when rid = 5 then a.Z37 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 37) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z38 else 0 end),
       sum(case when rid = 2 then a.Z38 else 0 end),
       sum(case when rid = 3 then a.Z38 else 0 end),
       sum(case when rid = 4 then a.Z38 else 0 end),
       sum(case when rid = 5 then a.Z38 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 38) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z39 else 0 end),
       sum(case when rid = 2 then a.Z39 else 0 end),
       sum(case when rid = 3 then a.Z39 else 0 end),
       sum(case when rid = 4 then a.Z39 else 0 end),
       sum(case when rid = 5 then a.Z39 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 39) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z40 else 0 end),
       sum(case when rid = 2 then a.Z40 else 0 end),
       sum(case when rid = 3 then a.Z40 else 0 end),
       sum(case when rid = 4 then a.Z40 else 0 end),
       sum(case when rid = 5 then a.Z40 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 40) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z41 else 0 end),
       sum(case when rid = 2 then a.Z41 else 0 end),
       sum(case when rid = 3 then a.Z41 else 0 end),
       sum(case when rid = 4 then a.Z41 else 0 end),
       sum(case when rid = 5 then a.Z41 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 41) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z42 else 0 end),
       sum(case when rid = 2 then a.Z42 else 0 end),
       sum(case when rid = 3 then a.Z42 else 0 end),
       sum(case when rid = 4 then a.Z42 else 0 end),
       sum(case when rid = 5 then a.Z42 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 42) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z43 else 0 end),
       sum(case when rid = 2 then a.Z43 else 0 end),
       sum(case when rid = 3 then a.Z43 else 0 end),
       sum(case when rid = 4 then a.Z43 else 0 end),
       sum(case when rid = 5 then a.Z43 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 43) c
                   on 1 = 1
where a.org_code in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;



-- 厂矿数据治理平台数据灌入
-- 数据治理平台数据灌入
truncate table data_center.ods_summary_index_bo;
insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z01 else 0 end),
       sum(case when rid = 2 then a.Z01 else 0 end),
       sum(case when rid = 3 then a.Z01 else 0 end),
       sum(case when rid = 4 then a.Z01 else 0 end),
       sum(case when rid = 5 then a.Z01 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 1) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;


insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z02 else 0 end),
       sum(case when rid = 2 then a.Z02 else 0 end),
       sum(case when rid = 3 then a.Z02 else 0 end),
       sum(case when rid = 4 then a.Z02 else 0 end),
       sum(case when rid = 5 then a.Z02 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 2) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z03 else 0 end),
       sum(case when rid = 2 then a.Z03 else 0 end),
       sum(case when rid = 3 then a.Z03 else 0 end),
       sum(case when rid = 4 then a.Z03 else 0 end),
       sum(case when rid = 5 then a.Z03 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 3) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z04 else 0 end),
       sum(case when rid = 2 then a.Z04 else 0 end),
       sum(case when rid = 3 then a.Z04 else 0 end),
       sum(case when rid = 4 then a.Z04 else 0 end),
       sum(case when rid = 5 then a.Z04 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 4) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z05 else 0 end),
       sum(case when rid = 2 then a.Z05 else 0 end),
       sum(case when rid = 3 then a.Z05 else 0 end),
       sum(case when rid = 4 then a.Z05 else 0 end),
       sum(case when rid = 5 then a.Z05 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 5) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z06 else 0 end),
       sum(case when rid = 2 then a.Z06 else 0 end),
       sum(case when rid = 3 then a.Z06 else 0 end),
       sum(case when rid = 4 then a.Z06 else 0 end),
       sum(case when rid = 5 then a.Z06 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 6) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z07 else 0 end),
       sum(case when rid = 2 then a.Z07 else 0 end),
       sum(case when rid = 3 then a.Z07 else 0 end),
       sum(case when rid = 4 then a.Z07 else 0 end),
       sum(case when rid = 5 then a.Z07 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 7) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z08 else 0 end),
       sum(case when rid = 2 then a.Z08 else 0 end),
       sum(case when rid = 3 then a.Z08 else 0 end),
       sum(case when rid = 4 then a.Z08 else 0 end),
       sum(case when rid = 5 then a.Z08 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 8) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z09 else 0 end),
       sum(case when rid = 2 then a.Z09 else 0 end),
       sum(case when rid = 3 then a.Z09 else 0 end),
       sum(case when rid = 4 then a.Z09 else 0 end),
       sum(case when rid = 5 then a.Z09 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 9) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z10 else 0 end),
       sum(case when rid = 2 then a.Z10 else 0 end),
       sum(case when rid = 3 then a.Z10 else 0 end),
       sum(case when rid = 4 then a.Z10 else 0 end),
       sum(case when rid = 5 then a.Z10 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 10) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z11 else 0 end),
       sum(case when rid = 2 then a.Z11 else 0 end),
       sum(case when rid = 3 then a.Z11 else 0 end),
       sum(case when rid = 4 then a.Z11 else 0 end),
       sum(case when rid = 5 then a.Z11 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 11) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z12 else 0 end),
       sum(case when rid = 2 then a.Z12 else 0 end),
       sum(case when rid = 3 then a.Z12 else 0 end),
       sum(case when rid = 4 then a.Z12 else 0 end),
       sum(case when rid = 5 then a.Z12 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 12) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z13 else 0 end),
       sum(case when rid = 2 then a.Z13 else 0 end),
       sum(case when rid = 3 then a.Z13 else 0 end),
       sum(case when rid = 4 then a.Z13 else 0 end),
       sum(case when rid = 5 then a.Z13 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 13) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z14 else 0 end),
       sum(case when rid = 2 then a.Z14 else 0 end),
       sum(case when rid = 3 then a.Z14 else 0 end),
       sum(case when rid = 4 then a.Z14 else 0 end),
       sum(case when rid = 5 then a.Z14 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 14) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z15 else 0 end),
       sum(case when rid = 2 then a.Z15 else 0 end),
       sum(case when rid = 3 then a.Z15 else 0 end),
       sum(case when rid = 4 then a.Z15 else 0 end),
       sum(case when rid = 5 then a.Z15 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 15) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z16 else 0 end),
       sum(case when rid = 2 then a.Z16 else 0 end),
       sum(case when rid = 3 then a.Z16 else 0 end),
       sum(case when rid = 4 then a.Z16 else 0 end),
       sum(case when rid = 5 then a.Z16 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 16) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z17 else 0 end),
       sum(case when rid = 2 then a.Z17 else 0 end),
       sum(case when rid = 3 then a.Z17 else 0 end),
       sum(case when rid = 4 then a.Z17 else 0 end),
       sum(case when rid = 5 then a.Z17 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 17) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z18 else 0 end),
       sum(case when rid = 2 then a.Z18 else 0 end),
       sum(case when rid = 3 then a.Z18 else 0 end),
       sum(case when rid = 4 then a.Z18 else 0 end),
       sum(case when rid = 5 then a.Z18 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 18) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z19 else 0 end),
       sum(case when rid = 2 then a.Z19 else 0 end),
       sum(case when rid = 3 then a.Z19 else 0 end),
       sum(case when rid = 4 then a.Z19 else 0 end),
       sum(case when rid = 5 then a.Z19 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 19) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z20 else 0 end),
       sum(case when rid = 2 then a.Z20 else 0 end),
       sum(case when rid = 3 then a.Z20 else 0 end),
       sum(case when rid = 4 then a.Z20 else 0 end),
       sum(case when rid = 5 then a.Z20 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 20) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z21 else 0 end),
       sum(case when rid = 2 then a.Z21 else 0 end),
       sum(case when rid = 3 then a.Z21 else 0 end),
       sum(case when rid = 4 then a.Z21 else 0 end),
       sum(case when rid = 5 then a.Z21 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 21) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z22 else 0 end),
       sum(case when rid = 2 then a.Z22 else 0 end),
       sum(case when rid = 3 then a.Z22 else 0 end),
       sum(case when rid = 4 then a.Z22 else 0 end),
       sum(case when rid = 5 then a.Z22 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 22) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z23 else 0 end),
       sum(case when rid = 2 then a.Z23 else 0 end),
       sum(case when rid = 3 then a.Z23 else 0 end),
       sum(case when rid = 4 then a.Z23 else 0 end),
       sum(case when rid = 5 then a.Z23 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 23) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z24 else 0 end),
       sum(case when rid = 2 then a.Z24 else 0 end),
       sum(case when rid = 3 then a.Z24 else 0 end),
       sum(case when rid = 4 then a.Z24 else 0 end),
       sum(case when rid = 5 then a.Z24 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 24) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z25 else 0 end),
       sum(case when rid = 2 then a.Z25 else 0 end),
       sum(case when rid = 3 then a.Z25 else 0 end),
       sum(case when rid = 4 then a.Z25 else 0 end),
       sum(case when rid = 5 then a.Z25 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 25) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z26 else 0 end),
       sum(case when rid = 2 then a.Z26 else 0 end),
       sum(case when rid = 3 then a.Z26 else 0 end),
       sum(case when rid = 4 then a.Z26 else 0 end),
       sum(case when rid = 5 then a.Z26 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 26) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z27 else 0 end),
       sum(case when rid = 2 then a.Z27 else 0 end),
       sum(case when rid = 3 then a.Z27 else 0 end),
       sum(case when rid = 4 then a.Z27 else 0 end),
       sum(case when rid = 5 then a.Z27 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 27) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z28 else 0 end),
       sum(case when rid = 2 then a.Z28 else 0 end),
       sum(case when rid = 3 then a.Z28 else 0 end),
       sum(case when rid = 4 then a.Z28 else 0 end),
       sum(case when rid = 5 then a.Z28 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 28) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z29 else 0 end),
       sum(case when rid = 2 then a.Z29 else 0 end),
       sum(case when rid = 3 then a.Z29 else 0 end),
       sum(case when rid = 4 then a.Z29 else 0 end),
       sum(case when rid = 5 then a.Z29 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 29) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z30 else 0 end),
       sum(case when rid = 2 then a.Z30 else 0 end),
       sum(case when rid = 3 then a.Z30 else 0 end),
       sum(case when rid = 4 then a.Z30 else 0 end),
       sum(case when rid = 5 then a.Z30 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 30) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z31 else 0 end),
       sum(case when rid = 2 then a.Z31 else 0 end),
       sum(case when rid = 3 then a.Z31 else 0 end),
       sum(case when rid = 4 then a.Z31 else 0 end),
       sum(case when rid = 5 then a.Z31 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 31) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z32 else 0 end),
       sum(case when rid = 2 then a.Z32 else 0 end),
       sum(case when rid = 3 then a.Z32 else 0 end),
       sum(case when rid = 4 then a.Z32 else 0 end),
       sum(case when rid = 5 then a.Z32 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 32) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z33 else 0 end),
       sum(case when rid = 2 then a.Z33 else 0 end),
       sum(case when rid = 3 then a.Z33 else 0 end),
       sum(case when rid = 4 then a.Z33 else 0 end),
       sum(case when rid = 5 then a.Z33 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 33) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z34 else 0 end),
       sum(case when rid = 2 then a.Z34 else 0 end),
       sum(case when rid = 3 then a.Z34 else 0 end),
       sum(case when rid = 4 then a.Z34 else 0 end),
       sum(case when rid = 5 then a.Z34 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 34) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z35 else 0 end),
       sum(case when rid = 2 then a.Z35 else 0 end),
       sum(case when rid = 3 then a.Z35 else 0 end),
       sum(case when rid = 4 then a.Z35 else 0 end),
       sum(case when rid = 5 then a.Z35 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 35) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z36 else 0 end),
       sum(case when rid = 2 then a.Z36 else 0 end),
       sum(case when rid = 3 then a.Z36 else 0 end),
       sum(case when rid = 4 then a.Z36 else 0 end),
       sum(case when rid = 5 then a.Z36 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 36) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z37 else 0 end),
       sum(case when rid = 2 then a.Z37 else 0 end),
       sum(case when rid = 3 then a.Z37 else 0 end),
       sum(case when rid = 4 then a.Z37 else 0 end),
       sum(case when rid = 5 then a.Z37 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 37) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z38 else 0 end),
       sum(case when rid = 2 then a.Z38 else 0 end),
       sum(case when rid = 3 then a.Z38 else 0 end),
       sum(case when rid = 4 then a.Z38 else 0 end),
       sum(case when rid = 5 then a.Z38 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 38) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z39 else 0 end),
       sum(case when rid = 2 then a.Z39 else 0 end),
       sum(case when rid = 3 then a.Z39 else 0 end),
       sum(case when rid = 4 then a.Z39 else 0 end),
       sum(case when rid = 5 then a.Z39 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 39) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z40 else 0 end),
       sum(case when rid = 2 then a.Z40 else 0 end),
       sum(case when rid = 3 then a.Z40 else 0 end),
       sum(case when rid = 4 then a.Z40 else 0 end),
       sum(case when rid = 5 then a.Z40 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 40) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z41 else 0 end),
       sum(case when rid = 2 then a.Z41 else 0 end),
       sum(case when rid = 3 then a.Z41 else 0 end),
       sum(case when rid = 4 then a.Z41 else 0 end),
       sum(case when rid = 5 then a.Z41 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 41) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z42 else 0 end),
       sum(case when rid = 2 then a.Z42 else 0 end),
       sum(case when rid = 3 then a.Z42 else 0 end),
       sum(case when rid = 4 then a.Z42 else 0 end),
       sum(case when rid = 5 then a.Z42 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 42) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

insert into data_center.ods_summary_index_bo
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       '' as f_index_name,
       c.index_name,
       c.index_code,
       '' as unit,
       sum(case when rid = 1 then a.Z43 else 0 end),
       sum(case when rid = 2 then a.Z43 else 0 end),
       sum(case when rid = 3 then a.Z43 else 0 end),
       sum(case when rid = 4 then a.Z43 else 0 end),
       sum(case when rid = 5 then a.Z43 else 0 end)
from data_center.ygl0078__zygl0078 a
         left join data_center.ads_orgnization b
                   on a.org_code = b.org_code
         left join (select * from data_center.ods_summary_index_ref where index_code = 43) c
                   on 1 = 1
where a.org_code not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;



/* -- 科技支出和研发费用明细表
drop table data_center.ods_technology_expense_ref;
CREATE TABLE data_center.ods_technology_expense_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='科技支出和研发费用明细表-对照表';


-- 对照表数据灌入
insert into data_center.ods_technology_expense_ref
select distinct(index_name), index_code from data_center.ods_technology_expense_hq;

-- 业务表
drop table data_center.ods_technology_expense_hq;
CREATE TABLE data_center.ods_technology_expense_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '年度预算',    -- Z01
  amount_acc_form decimal(15, 2) comment '上年同期',  -- Z05
 amount_acc decimal(15, 2) comment '本年累计',   -- Z02
  compare_pre decimal(15, 2) comment '比进度预算',  -- Z03
 annual_estimate decimal(15, 2) comment '全年预计'  -- Z04
) COMMENT='科技支出和研发费用明细表-总部';

drop table data_center.ods_technology_expense_bo;
CREATE TABLE data_center.ods_technology_expense_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '年度预算',
  amount_acc_form decimal(15, 2) comment '上年同期',
 amount_acc decimal(15, 2) comment '本年累计',
  compare_pre decimal(15, 2) comment '比进度预算',
 annual_estimate decimal(15, 2) comment '全年预计'
) COMMENT='科技支出和研发费用明细表-厂矿';
*/


-- 数据治理平台数据灌入
truncate table data_center.ods_technology_expense_hq;
insert into data_center.ods_technology_expense_hq
select b.org_code,
       b.org_name,
       concat(per, '-', a.month),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z05 is null, 0, a.Z05), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2),
       round(if(a.Z03 is null, 0, a.Z03), 2),
       round(if(a.Z04 is null, 0, a.Z04), 2)
from data_center.ygl0072__zygl0072 a
         left join data_center.ads_orgnization b
                   on substr(a.ucode, 1, 6) = b.org_code
         left join data_center.ods_technology_expense_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) in ('GY2F00')
  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_technology_expense_bo;
insert into data_center.ods_technology_expense_bo
select b.org_code,
       b.org_name,
       (case
            when
                substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       round(if(a.Z01 is null, 0, a.Z01), 2),
       round(if(a.Z05 is null, 0, a.Z05), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2),
       round(if(a.Z03 is null, 0, a.Z03), 2),
       round(if(a.Z04 is null, 0, a.Z04), 2)
from data_center.ygl0072__zygl0072 a
         left join data_center.ads_orgnization b
                   on (case
                           when substr(a.ucode, 5, 1) = '_' then substr(a.ucode, 1, 4)
                           else substr(a.ucode, 1, 6) end) = b.org_code
         left join data_center.ods_technology_expense_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) not in ('GY2F00')
  and ucode like ('%_r');



/* -- 非经营性损益  YBCB013
drop table data_center.ods_no_operating_income_ref;
CREATE TABLE data_center.ods_no_operating_income_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='非经营性损益-对照表';


-- 对照表数据灌入
insert into data_center.ods_no_operating_income_ref
select distinct(index_name), index_code from data_center.ods_no_operating_income_bo;

-- 业务表
-- 非经营性损益  YBCB013 只有厂矿数据，没有总部数据。

drop table data_center.ods_no_operating_income_bo;
CREATE TABLE data_center.ods_no_operating_income_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '本月值',
  amount_year decimal(15, 2) comment '本年累计值',
  pre_year  decimal(15, 2) comment '本年预算',
  amount_lastyear decimal(15, 2) comment '上年同期'
) COMMENT='非经营性损益-厂矿';
*/


-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_no_operating_income_bo;
insert into data_center.ods_no_operating_income_bo
select b.org_code,
       b.org_name,
       (case
            when
                substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       round(if(a.Z03 is null, 0, a.Z03), 2),
       round(if(a.Z04 is null, 0, a.Z04), 2),
       round(if(a.Z02 is null, 0, a.Z02), 2),
       round(if(a.Z01 is null, 0, a.Z01), 2)
from data_center.ybcb013__zybcb013 a
         left join data_center.ads_orgnization b
                   on (case
                           when substr(a.ucode, 5, 1) = '_' then substr(a.ucode, 1, 4)
                           else substr(a.ucode, 1, 6) end) = b.org_code
         left join data_center.ods_no_operating_income_ref c
                   on a.rid = c.index_code
where substr(a.ucode, 1, 6) not in ('GY2F00')
  and ucode like ('%_r');



/* -- 资产负债统计
drop table data_center.ods_asset_balance_ref;
CREATE TABLE data_center.ods_asset_balance_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='资产负债-对照表';


-- 对照表数据灌入
insert into data_center.ods_asset_balance_ref
select distinct(index_name), index_code from data_center.ods_asset_balance_hq;

-- 业务表
drop table data_center.ods_asset_balance_hq;
CREATE TABLE data_center.ods_asset_balance_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  end_balance decimal(15, 2) comment '期末余额',
  amount_acc_form decimal(15, 2) comment '上年同期数',
  begin_balance decimal(15, 2) comment '期初余额'
) COMMENT='资产负债表-总部';
drop table data_center.ods_asset_balance_bo;
CREATE TABLE data_center.ods_asset_balance_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码',
  end_balance decimal(15, 2) comment '期末余额',
  amount_acc_form decimal(15, 2) comment '上年同期数',
  begin_balance decimal(15, 2) comment '期初余额'
) COMMENT='资产负债表-厂矿';
 -- update data_center.ods_asset_balance_hq
 -- set org_code = 'GY2F00' ,org_name = '包头能源（管理）'
*/


-- 数据治理平台数据灌入
truncate table data_center.ods_asset_balance_hq;

-- 第 1 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z01 else 0 end),
       sum(case when rid = 2 then a.Z01 else 0 end),
       sum(case when rid = 3 then a.Z01 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '1') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z02 else 0 end),
       sum(case when rid = 2 then a.Z02 else 0 end),
       sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '2') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z03 else 0 end),
       sum(case when rid = 2 then a.Z03 else 0 end),
       sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '3') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z04 else 0 end),
       sum(case when rid = 2 then a.Z04 else 0 end),
       sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '4') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z05 else 0 end),
       sum(case when rid = 2 then a.Z05 else 0 end),
       sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '5') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z06 else 0 end),
       sum(case when rid = 2 then a.Z06 else 0 end),
       sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '6') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z07 else 0 end),
       sum(case when rid = 2 then a.Z07 else 0 end),
       sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '7') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z08 else 0 end),
       sum(case when rid = 2 then a.Z08 else 0 end),
       sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '8') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z09 else 0 end),
       sum(case when rid = 2 then a.Z09 else 0 end),
       sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '9') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z10 else 0 end),
       sum(case when rid = 2 then a.Z10 else 0 end),
       sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '10') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z11 else 0 end),
       sum(case when rid = 2 then a.Z11 else 0 end),
       sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '11') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z12 else 0 end),
       sum(case when rid = 2 then a.Z12 else 0 end),
       sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '12') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z13 else 0 end),
       sum(case when rid = 2 then a.Z13 else 0 end),
       sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '13') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z14 else 0 end),
       sum(case when rid = 2 then a.Z14 else 0 end),
       sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '14') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z15 else 0 end),
       sum(case when rid = 2 then a.Z15 else 0 end),
       sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '15') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z16 else 0 end),
       sum(case when rid = 2 then a.Z16 else 0 end),
       sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '16') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z17 else 0 end),
       sum(case when rid = 2 then a.Z17 else 0 end),
       sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '17') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z18 else 0 end),
       sum(case when rid = 2 then a.Z18 else 0 end),
       sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '18') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z19 else 0 end),
       sum(case when rid = 2 then a.Z19 else 0 end),
       sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '19') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z20 else 0 end),
       sum(case when rid = 2 then a.Z20 else 0 end),
       sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '20') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z21 else 0 end),
       sum(case when rid = 2 then a.Z21 else 0 end),
       sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '21') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z22 else 0 end),
       sum(case when rid = 2 then a.Z22 else 0 end),
       sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '22') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z23 else 0 end),
       sum(case when rid = 2 then a.Z23 else 0 end),
       sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '23') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z24 else 0 end),
       sum(case when rid = 2 then a.Z24 else 0 end),
       sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '24') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z25 else 0 end),
       sum(case when rid = 2 then a.Z25 else 0 end),
       sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '25') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z26 else 0 end),
       sum(case when rid = 2 then a.Z26 else 0 end),
       sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '26') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z27 else 0 end),
       sum(case when rid = 2 then a.Z27 else 0 end),
       sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '27') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z28 else 0 end),
       sum(case when rid = 2 then a.Z28 else 0 end),
       sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '28') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z29 else 0 end),
       sum(case when rid = 2 then a.Z29 else 0 end),
       sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '29') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z30 else 0 end),
       sum(case when rid = 2 then a.Z30 else 0 end),
       sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '30') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z31 else 0 end),
       sum(case when rid = 2 then a.Z31 else 0 end),
       sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '31') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z32 else 0 end),
       sum(case when rid = 2 then a.Z32 else 0 end),
       sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '32') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z33 else 0 end),
       sum(case when rid = 2 then a.Z33 else 0 end),
       sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '33') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z34 else 0 end),
       sum(case when rid = 2 then a.Z34 else 0 end),
       sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '34') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z35 else 0 end),
       sum(case when rid = 2 then a.Z35 else 0 end),
       sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '35') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z36 else 0 end),
       sum(case when rid = 2 then a.Z36 else 0 end),
       sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '36') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z37 else 0 end),
       sum(case when rid = 2 then a.Z37 else 0 end),
       sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '37') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z38 else 0 end),
       sum(case when rid = 2 then a.Z38 else 0 end),
       sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '38') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z39 else 0 end),
       sum(case when rid = 2 then a.Z39 else 0 end),
       sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '39') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z40 else 0 end),
       sum(case when rid = 2 then a.Z40 else 0 end),
       sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '40') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z41 else 0 end),
       sum(case when rid = 2 then a.Z41 else 0 end),
       sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '41') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z42 else 0 end),
       sum(case when rid = 2 then a.Z42 else 0 end),
       sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '42') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z43 else 0 end),
       sum(case when rid = 2 then a.Z43 else 0 end),
       sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '43') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z44 else 0 end),
       sum(case when rid = 2 then a.Z44 else 0 end),
       sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '44') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z45 else 0 end),
       sum(case when rid = 2 then a.Z45 else 0 end),
       sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '45') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z46 else 0 end),
       sum(case when rid = 2 then a.Z46 else 0 end),
       sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '46') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z47 else 0 end),
       sum(case when rid = 2 then a.Z47 else 0 end),
       sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '47') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z48 else 0 end),
       sum(case when rid = 2 then a.Z48 else 0 end),
       sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '48') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z49 else 0 end),
       sum(case when rid = 2 then a.Z49 else 0 end),
       sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '49') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z50 else 0 end),
       sum(case when rid = 2 then a.Z50 else 0 end),
       sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '50') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z51 else 0 end),
       sum(case when rid = 2 then a.Z51 else 0 end),
       sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '51') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z52 else 0 end),
       sum(case when rid = 2 then a.Z52 else 0 end),
       sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '52') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z53 else 0 end),
       sum(case when rid = 2 then a.Z53 else 0 end),
       sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '53') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z54 else 0 end),
       sum(case when rid = 2 then a.Z54 else 0 end),
       sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '54') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z55 else 0 end),
       sum(case when rid = 2 then a.Z55 else 0 end),
       sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '55') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z56 else 0 end),
       sum(case when rid = 2 then a.Z56 else 0 end),
       sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '56') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z57 else 0 end),
       sum(case when rid = 2 then a.Z57 else 0 end),
       sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '57') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z58 else 0 end),
       sum(case when rid = 2 then a.Z58 else 0 end),
       sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '58') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z59 else 0 end),
       sum(case when rid = 2 then a.Z59 else 0 end),
       sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '59') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z60 else 0 end),
       sum(case when rid = 2 then a.Z60 else 0 end),
       sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '60') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z61 else 0 end),
       sum(case when rid = 2 then a.Z61 else 0 end),
       sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '61') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z62 else 0 end),
       sum(case when rid = 2 then a.Z62 else 0 end),
       sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '62') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z63 else 0 end),
       sum(case when rid = 2 then a.Z63 else 0 end),
       sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '63') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z64 else 0 end),
       sum(case when rid = 2 then a.Z64 else 0 end),
       sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '64') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z65 else 0 end),
       sum(case when rid = 2 then a.Z65 else 0 end),
       sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '65') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z66 else 0 end),
       sum(case when rid = 2 then a.Z66 else 0 end),
       sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '66') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z67 else 0 end),
       sum(case when rid = 2 then a.Z67 else 0 end),
       sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '67') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z68 else 0 end),
       sum(case when rid = 2 then a.Z68 else 0 end),
       sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '68') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z69 else 0 end),
       sum(case when rid = 2 then a.Z69 else 0 end),
       sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '69') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z70 else 0 end),
       sum(case when rid = 2 then a.Z70 else 0 end),
       sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '78') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z71 else 0 end),
       sum(case when rid = 2 then a.Z71 else 0 end),
       sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '79') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z72 else 0 end),
       sum(case when rid = 2 then a.Z72 else 0 end),
       sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '80') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z73 else 0 end),
       sum(case when rid = 2 then a.Z73 else 0 end),
       sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '81') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z74 else 0 end),
       sum(case when rid = 2 then a.Z74 else 0 end),
       sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '82') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z75 else 0 end),
       sum(case when rid = 2 then a.Z75 else 0 end),
       sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '83') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z76 else 0 end),
       sum(case when rid = 2 then a.Z76 else 0 end),
       sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '84') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z77 else 0 end),
       sum(case when rid = 2 then a.Z77 else 0 end),
       sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '85') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z78 else 0 end),
       sum(case when rid = 2 then a.Z78 else 0 end),
       sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '86') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z79 else 0 end),
       sum(case when rid = 2 then a.Z79 else 0 end),
       sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '87') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z80 else 0 end),
       sum(case when rid = 2 then a.Z80 else 0 end),
       sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '88') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z81 else 0 end),
       sum(case when rid = 2 then a.Z81 else 0 end),
       sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '89') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z82 else 0 end),
       sum(case when rid = 2 then a.Z82 else 0 end),
       sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '90') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z83 else 0 end),
       sum(case when rid = 2 then a.Z83 else 0 end),
       sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '91') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z84 else 0 end),
       sum(case when rid = 2 then a.Z84 else 0 end),
       sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '92') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z85 else 0 end),
       sum(case when rid = 2 then a.Z85 else 0 end),
       sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '93') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z86 else 0 end),
       sum(case when rid = 2 then a.Z86 else 0 end),
       sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '94') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z87 else 0 end),
       sum(case when rid = 2 then a.Z87 else 0 end),
       sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '95') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z88 else 0 end),
       sum(case when rid = 2 then a.Z88 else 0 end),
       sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '96') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z89 else 0 end),
       sum(case when rid = 2 then a.Z89 else 0 end),
       sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '97') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z90 else 0 end),
       sum(case when rid = 2 then a.Z90 else 0 end),
       sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '98') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z91 else 0 end),
       sum(case when rid = 2 then a.Z91 else 0 end),
       sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '99') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z92 else 0 end),
       sum(case when rid = 2 then a.Z92 else 0 end),
       sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '100') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z93 else 0 end),
       sum(case when rid = 2 then a.Z93 else 0 end),
       sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '101') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z94 else 0 end),
       sum(case when rid = 2 then a.Z94 else 0 end),
       sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '102') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z95 else 0 end),
       sum(case when rid = 2 then a.Z95 else 0 end),
       sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '103') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z96 else 0 end),
       sum(case when rid = 2 then a.Z96 else 0 end),
       sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '104') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z97 else 0 end),
       sum(case when rid = 2 then a.Z97 else 0 end),
       sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '105') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z98 else 0 end),
       sum(case when rid = 2 then a.Z98 else 0 end),
       sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '106') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z99 else 0 end),
       sum(case when rid = 2 then a.Z99 else 0 end),
       sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '107') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z100 else 0 end),
       sum(case when rid = 2 then a.Z100 else 0 end),
       sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '108') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z101 else 0 end),
       sum(case when rid = 2 then a.Z101 else 0 end),
       sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '109') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z102 else 0 end),
       sum(case when rid = 2 then a.Z102 else 0 end),
       sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '110') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z103 else 0 end),
       sum(case when rid = 2 then a.Z103 else 0 end),
       sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '111') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z104 else 0 end),
       sum(case when rid = 2 then a.Z104 else 0 end),
       sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '112') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z105 else 0 end),
       sum(case when rid = 2 then a.Z105 else 0 end),
       sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '113') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z106 else 0 end),
       sum(case when rid = 2 then a.Z106 else 0 end),
       sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '114') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z107 else 0 end),
       sum(case when rid = 2 then a.Z107 else 0 end),
       sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '115') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z108 else 0 end),
       sum(case when rid = 2 then a.Z108 else 0 end),
       sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '116') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z109 else 0 end),
       sum(case when rid = 2 then a.Z109 else 0 end),
       sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '117') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z110 else 0 end),
       sum(case when rid = 2 then a.Z110 else 0 end),
       sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '118') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z111 else 0 end),
       sum(case when rid = 2 then a.Z111 else 0 end),
       sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '119') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z112 else 0 end),
       sum(case when rid = 2 then a.Z112 else 0 end),
       sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '120') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z113 else 0 end),
       sum(case when rid = 2 then a.Z113 else 0 end),
       sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '121') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z114 else 0 end),
       sum(case when rid = 2 then a.Z114 else 0 end),
       sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '122') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z115 else 0 end),
       sum(case when rid = 2 then a.Z115 else 0 end),
       sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '123') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z116 else 0 end),
       sum(case when rid = 2 then a.Z116 else 0 end),
       sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '124') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z117 else 0 end),
       sum(case when rid = 2 then a.Z117 else 0 end),
       sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '125') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z118 else 0 end),
       sum(case when rid = 2 then a.Z118 else 0 end),
       sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '126') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z119 else 0 end),
       sum(case when rid = 2 then a.Z119 else 0 end),
       sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '127') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z120 else 0 end),
       sum(case when rid = 2 then a.Z120 else 0 end),
       sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '128') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z121 else 0 end),
       sum(case when rid = 2 then a.Z121 else 0 end),
       sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '129') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z122 else 0 end),
       sum(case when rid = 2 then a.Z122 else 0 end),
       sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '130') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z123 else 0 end),
       sum(case when rid = 2 then a.Z123 else 0 end),
       sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '131') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z124 else 0 end),
       sum(case when rid = 2 then a.Z124 else 0 end),
       sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '132') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z125 else 0 end),
       sum(case when rid = 2 then a.Z125 else 0 end),
       sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '133') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z126 else 0 end),
       sum(case when rid = 2 then a.Z126 else 0 end),
       sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '134') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z127 else 0 end),
       sum(case when rid = 2 then a.Z127 else 0 end),
       sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '135') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z128 else 0 end),
       sum(case when rid = 2 then a.Z128 else 0 end),
       sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '136') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z129 else 0 end),
       sum(case when rid = 2 then a.Z129 else 0 end),
       sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '137') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z130 else 0 end),
       sum(case when rid = 2 then a.Z130 else 0 end),
       sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '138') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z131 else 0 end),
       sum(case when rid = 2 then a.Z131 else 0 end),
       sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '139') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z132 else 0 end),
       sum(case when rid = 2 then a.Z132 else 0 end),
       sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '140') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z133 else 0 end),
       sum(case when rid = 2 then a.Z133 else 0 end),
       sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '141') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z134 else 0 end),
       sum(case when rid = 2 then a.Z134 else 0 end),
       sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '142') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z135 else 0 end),
       sum(case when rid = 2 then a.Z135 else 0 end),
       sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '143') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z136 else 0 end),
       sum(case when rid = 2 then a.Z136 else 0 end),
       sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '144') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z137 else 0 end),
       sum(case when rid = 2 then a.Z137 else 0 end),
       sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '145') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z138 else 0 end),
       sum(case when rid = 2 then a.Z138 else 0 end),
       sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '146') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z139 else 0 end),
       sum(case when rid = 2 then a.Z139 else 0 end),
       sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '147') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z140 else 0 end),
       sum(case when rid = 2 then a.Z140 else 0 end),
       sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '148') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z141 else 0 end),
       sum(case when rid = 2 then a.Z141 else 0 end),
       sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '149') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z142 else 0 end),
       sum(case when rid = 2 then a.Z142 else 0 end),
       sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '150') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z143 else 0 end),
       sum(case when rid = 2 then a.Z143 else 0 end),
       sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '151') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z144 else 0 end),
       sum(case when rid = 2 then a.Z144 else 0 end),
       sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '152') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z145 else 0 end),
       sum(case when rid = 2 then a.Z145 else 0 end),
       sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '153') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z146 else 0 end),
       sum(case when rid = 2 then a.Z146 else 0 end),
       sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '154') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z147 else 0 end),
       sum(case when rid = 2 then a.Z147 else 0 end),
       sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '155') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_hq
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z148 else 0 end),
       sum(case when rid = 2 then a.Z148 else 0 end),
       sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '156') c on 1 = 1
where a.org in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;


-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_asset_balance_bo;
-- 第 1 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z01 else 0 end),
       sum(case when rid = 2 then a.Z01 else 0 end),
       sum(case when rid = 3 then a.Z01 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '1') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z02 else 0 end),
       sum(case when rid = 2 then a.Z02 else 0 end),
       sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '2') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z03 else 0 end),
       sum(case when rid = 2 then a.Z03 else 0 end),
       sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '3') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z04 else 0 end),
       sum(case when rid = 2 then a.Z04 else 0 end),
       sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '4') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z05 else 0 end),
       sum(case when rid = 2 then a.Z05 else 0 end),
       sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '5') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z06 else 0 end),
       sum(case when rid = 2 then a.Z06 else 0 end),
       sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '6') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z07 else 0 end),
       sum(case when rid = 2 then a.Z07 else 0 end),
       sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '7') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z08 else 0 end),
       sum(case when rid = 2 then a.Z08 else 0 end),
       sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '8') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z09 else 0 end),
       sum(case when rid = 2 then a.Z09 else 0 end),
       sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '9') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z10 else 0 end),
       sum(case when rid = 2 then a.Z10 else 0 end),
       sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '10') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z11 else 0 end),
       sum(case when rid = 2 then a.Z11 else 0 end),
       sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '11') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z12 else 0 end),
       sum(case when rid = 2 then a.Z12 else 0 end),
       sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '12') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z13 else 0 end),
       sum(case when rid = 2 then a.Z13 else 0 end),
       sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '13') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z14 else 0 end),
       sum(case when rid = 2 then a.Z14 else 0 end),
       sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '14') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z15 else 0 end),
       sum(case when rid = 2 then a.Z15 else 0 end),
       sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '15') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z16 else 0 end),
       sum(case when rid = 2 then a.Z16 else 0 end),
       sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '16') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z17 else 0 end),
       sum(case when rid = 2 then a.Z17 else 0 end),
       sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '17') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z18 else 0 end),
       sum(case when rid = 2 then a.Z18 else 0 end),
       sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '18') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z19 else 0 end),
       sum(case when rid = 2 then a.Z19 else 0 end),
       sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '19') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z20 else 0 end),
       sum(case when rid = 2 then a.Z20 else 0 end),
       sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '20') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z21 else 0 end),
       sum(case when rid = 2 then a.Z21 else 0 end),
       sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '21') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z22 else 0 end),
       sum(case when rid = 2 then a.Z22 else 0 end),
       sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '22') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z23 else 0 end),
       sum(case when rid = 2 then a.Z23 else 0 end),
       sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '23') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z24 else 0 end),
       sum(case when rid = 2 then a.Z24 else 0 end),
       sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '24') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z25 else 0 end),
       sum(case when rid = 2 then a.Z25 else 0 end),
       sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '25') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z26 else 0 end),
       sum(case when rid = 2 then a.Z26 else 0 end),
       sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '26') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z27 else 0 end),
       sum(case when rid = 2 then a.Z27 else 0 end),
       sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '27') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z28 else 0 end),
       sum(case when rid = 2 then a.Z28 else 0 end),
       sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '28') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z29 else 0 end),
       sum(case when rid = 2 then a.Z29 else 0 end),
       sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '29') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z30 else 0 end),
       sum(case when rid = 2 then a.Z30 else 0 end),
       sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '30') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z31 else 0 end),
       sum(case when rid = 2 then a.Z31 else 0 end),
       sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '31') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z32 else 0 end),
       sum(case when rid = 2 then a.Z32 else 0 end),
       sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '32') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z33 else 0 end),
       sum(case when rid = 2 then a.Z33 else 0 end),
       sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '33') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z34 else 0 end),
       sum(case when rid = 2 then a.Z34 else 0 end),
       sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '34') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z35 else 0 end),
       sum(case when rid = 2 then a.Z35 else 0 end),
       sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '35') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z36 else 0 end),
       sum(case when rid = 2 then a.Z36 else 0 end),
       sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '36') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z37 else 0 end),
       sum(case when rid = 2 then a.Z37 else 0 end),
       sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '37') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z38 else 0 end),
       sum(case when rid = 2 then a.Z38 else 0 end),
       sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '38') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z39 else 0 end),
       sum(case when rid = 2 then a.Z39 else 0 end),
       sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '39') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z40 else 0 end),
       sum(case when rid = 2 then a.Z40 else 0 end),
       sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '40') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z41 else 0 end),
       sum(case when rid = 2 then a.Z41 else 0 end),
       sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '41') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z42 else 0 end),
       sum(case when rid = 2 then a.Z42 else 0 end),
       sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '42') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z43 else 0 end),
       sum(case when rid = 2 then a.Z43 else 0 end),
       sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '43') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z44 else 0 end),
       sum(case when rid = 2 then a.Z44 else 0 end),
       sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '44') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z45 else 0 end),
       sum(case when rid = 2 then a.Z45 else 0 end),
       sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '45') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z46 else 0 end),
       sum(case when rid = 2 then a.Z46 else 0 end),
       sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '46') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z47 else 0 end),
       sum(case when rid = 2 then a.Z47 else 0 end),
       sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '47') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z48 else 0 end),
       sum(case when rid = 2 then a.Z48 else 0 end),
       sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '48') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z49 else 0 end),
       sum(case when rid = 2 then a.Z49 else 0 end),
       sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '49') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z50 else 0 end),
       sum(case when rid = 2 then a.Z50 else 0 end),
       sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '50') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z51 else 0 end),
       sum(case when rid = 2 then a.Z51 else 0 end),
       sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '51') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z52 else 0 end),
       sum(case when rid = 2 then a.Z52 else 0 end),
       sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '52') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z53 else 0 end),
       sum(case when rid = 2 then a.Z53 else 0 end),
       sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '53') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z54 else 0 end),
       sum(case when rid = 2 then a.Z54 else 0 end),
       sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '54') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z55 else 0 end),
       sum(case when rid = 2 then a.Z55 else 0 end),
       sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '55') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z56 else 0 end),
       sum(case when rid = 2 then a.Z56 else 0 end),
       sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '56') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z57 else 0 end),
       sum(case when rid = 2 then a.Z57 else 0 end),
       sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '57') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z58 else 0 end),
       sum(case when rid = 2 then a.Z58 else 0 end),
       sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '58') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z59 else 0 end),
       sum(case when rid = 2 then a.Z59 else 0 end),
       sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '59') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z60 else 0 end),
       sum(case when rid = 2 then a.Z60 else 0 end),
       sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '60') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z61 else 0 end),
       sum(case when rid = 2 then a.Z61 else 0 end),
       sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '61') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z62 else 0 end),
       sum(case when rid = 2 then a.Z62 else 0 end),
       sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '62') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z63 else 0 end),
       sum(case when rid = 2 then a.Z63 else 0 end),
       sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '63') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z64 else 0 end),
       sum(case when rid = 2 then a.Z64 else 0 end),
       sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '64') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z65 else 0 end),
       sum(case when rid = 2 then a.Z65 else 0 end),
       sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '65') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z66 else 0 end),
       sum(case when rid = 2 then a.Z66 else 0 end),
       sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '66') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z67 else 0 end),
       sum(case when rid = 2 then a.Z67 else 0 end),
       sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '67') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z68 else 0 end),
       sum(case when rid = 2 then a.Z68 else 0 end),
       sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '68') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z69 else 0 end),
       sum(case when rid = 2 then a.Z69 else 0 end),
       sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '69') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z70 else 0 end),
       sum(case when rid = 2 then a.Z70 else 0 end),
       sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '78') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z71 else 0 end),
       sum(case when rid = 2 then a.Z71 else 0 end),
       sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '79') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z72 else 0 end),
       sum(case when rid = 2 then a.Z72 else 0 end),
       sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '80') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z73 else 0 end),
       sum(case when rid = 2 then a.Z73 else 0 end),
       sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '81') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z74 else 0 end),
       sum(case when rid = 2 then a.Z74 else 0 end),
       sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '82') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z75 else 0 end),
       sum(case when rid = 2 then a.Z75 else 0 end),
       sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '83') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z76 else 0 end),
       sum(case when rid = 2 then a.Z76 else 0 end),
       sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '84') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z77 else 0 end),
       sum(case when rid = 2 then a.Z77 else 0 end),
       sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '85') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z78 else 0 end),
       sum(case when rid = 2 then a.Z78 else 0 end),
       sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '86') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z79 else 0 end),
       sum(case when rid = 2 then a.Z79 else 0 end),
       sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '87') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z80 else 0 end),
       sum(case when rid = 2 then a.Z80 else 0 end),
       sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '88') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z81 else 0 end),
       sum(case when rid = 2 then a.Z81 else 0 end),
       sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '89') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z82 else 0 end),
       sum(case when rid = 2 then a.Z82 else 0 end),
       sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '90') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z83 else 0 end),
       sum(case when rid = 2 then a.Z83 else 0 end),
       sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '91') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z84 else 0 end),
       sum(case when rid = 2 then a.Z84 else 0 end),
       sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '92') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z85 else 0 end),
       sum(case when rid = 2 then a.Z85 else 0 end),
       sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '93') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z86 else 0 end),
       sum(case when rid = 2 then a.Z86 else 0 end),
       sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '94') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z87 else 0 end),
       sum(case when rid = 2 then a.Z87 else 0 end),
       sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '95') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z88 else 0 end),
       sum(case when rid = 2 then a.Z88 else 0 end),
       sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '96') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z89 else 0 end),
       sum(case when rid = 2 then a.Z89 else 0 end),
       sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '97') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z90 else 0 end),
       sum(case when rid = 2 then a.Z90 else 0 end),
       sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '98') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z91 else 0 end),
       sum(case when rid = 2 then a.Z91 else 0 end),
       sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '99') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z92 else 0 end),
       sum(case when rid = 2 then a.Z92 else 0 end),
       sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '100') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z93 else 0 end),
       sum(case when rid = 2 then a.Z93 else 0 end),
       sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '101') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z94 else 0 end),
       sum(case when rid = 2 then a.Z94 else 0 end),
       sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '102') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z95 else 0 end),
       sum(case when rid = 2 then a.Z95 else 0 end),
       sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '103') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z96 else 0 end),
       sum(case when rid = 2 then a.Z96 else 0 end),
       sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '104') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z97 else 0 end),
       sum(case when rid = 2 then a.Z97 else 0 end),
       sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '105') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z98 else 0 end),
       sum(case when rid = 2 then a.Z98 else 0 end),
       sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '106') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z99 else 0 end),
       sum(case when rid = 2 then a.Z99 else 0 end),
       sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '107') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z100 else 0 end),
       sum(case when rid = 2 then a.Z100 else 0 end),
       sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '108') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z101 else 0 end),
       sum(case when rid = 2 then a.Z101 else 0 end),
       sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '109') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z102 else 0 end),
       sum(case when rid = 2 then a.Z102 else 0 end),
       sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '110') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z103 else 0 end),
       sum(case when rid = 2 then a.Z103 else 0 end),
       sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '111') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z104 else 0 end),
       sum(case when rid = 2 then a.Z104 else 0 end),
       sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '112') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z105 else 0 end),
       sum(case when rid = 2 then a.Z105 else 0 end),
       sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '113') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z106 else 0 end),
       sum(case when rid = 2 then a.Z106 else 0 end),
       sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '114') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z107 else 0 end),
       sum(case when rid = 2 then a.Z107 else 0 end),
       sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '115') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z108 else 0 end),
       sum(case when rid = 2 then a.Z108 else 0 end),
       sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '116') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z109 else 0 end),
       sum(case when rid = 2 then a.Z109 else 0 end),
       sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '117') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z110 else 0 end),
       sum(case when rid = 2 then a.Z110 else 0 end),
       sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '118') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z111 else 0 end),
       sum(case when rid = 2 then a.Z111 else 0 end),
       sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '119') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z112 else 0 end),
       sum(case when rid = 2 then a.Z112 else 0 end),
       sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '120') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z113 else 0 end),
       sum(case when rid = 2 then a.Z113 else 0 end),
       sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '121') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z114 else 0 end),
       sum(case when rid = 2 then a.Z114 else 0 end),
       sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '122') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z115 else 0 end),
       sum(case when rid = 2 then a.Z115 else 0 end),
       sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '123') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z116 else 0 end),
       sum(case when rid = 2 then a.Z116 else 0 end),
       sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '124') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z117 else 0 end),
       sum(case when rid = 2 then a.Z117 else 0 end),
       sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '125') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z118 else 0 end),
       sum(case when rid = 2 then a.Z118 else 0 end),
       sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '126') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z119 else 0 end),
       sum(case when rid = 2 then a.Z119 else 0 end),
       sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '127') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z120 else 0 end),
       sum(case when rid = 2 then a.Z120 else 0 end),
       sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '128') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z121 else 0 end),
       sum(case when rid = 2 then a.Z121 else 0 end),
       sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '129') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z122 else 0 end),
       sum(case when rid = 2 then a.Z122 else 0 end),
       sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '130') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z123 else 0 end),
       sum(case when rid = 2 then a.Z123 else 0 end),
       sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '131') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z124 else 0 end),
       sum(case when rid = 2 then a.Z124 else 0 end),
       sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '132') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z125 else 0 end),
       sum(case when rid = 2 then a.Z125 else 0 end),
       sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '133') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z126 else 0 end),
       sum(case when rid = 2 then a.Z126 else 0 end),
       sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '134') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z127 else 0 end),
       sum(case when rid = 2 then a.Z127 else 0 end),
       sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '135') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z128 else 0 end),
       sum(case when rid = 2 then a.Z128 else 0 end),
       sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '136') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z129 else 0 end),
       sum(case when rid = 2 then a.Z129 else 0 end),
       sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '137') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z130 else 0 end),
       sum(case when rid = 2 then a.Z130 else 0 end),
       sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '138') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z131 else 0 end),
       sum(case when rid = 2 then a.Z131 else 0 end),
       sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '139') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z132 else 0 end),
       sum(case when rid = 2 then a.Z132 else 0 end),
       sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '140') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z133 else 0 end),
       sum(case when rid = 2 then a.Z133 else 0 end),
       sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '141') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z134 else 0 end),
       sum(case when rid = 2 then a.Z134 else 0 end),
       sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '142') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z135 else 0 end),
       sum(case when rid = 2 then a.Z135 else 0 end),
       sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '143') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z136 else 0 end),
       sum(case when rid = 2 then a.Z136 else 0 end),
       sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '144') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z137 else 0 end),
       sum(case when rid = 2 then a.Z137 else 0 end),
       sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '145') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z138 else 0 end),
       sum(case when rid = 2 then a.Z138 else 0 end),
       sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '146') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z139 else 0 end),
       sum(case when rid = 2 then a.Z139 else 0 end),
       sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '147') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z140 else 0 end),
       sum(case when rid = 2 then a.Z140 else 0 end),
       sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '148') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z141 else 0 end),
       sum(case when rid = 2 then a.Z141 else 0 end),
       sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '149') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z142 else 0 end),
       sum(case when rid = 2 then a.Z142 else 0 end),
       sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '150') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z143 else 0 end),
       sum(case when rid = 2 then a.Z143 else 0 end),
       sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '151') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z144 else 0 end),
       sum(case when rid = 2 then a.Z144 else 0 end),
       sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '152') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z145 else 0 end),
       sum(case when rid = 2 then a.Z145 else 0 end),
       sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '153') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z146 else 0 end),
       sum(case when rid = 2 then a.Z146 else 0 end),
       sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '154') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z147 else 0 end),
       sum(case when rid = 2 then a.Z147 else 0 end),
       sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '155') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_bo
select b.org_code,
       b.org_name,
       (case
            when substr(a.ucode, 5, 1) = '_' then concat(per, '-', substr(a.ucode, 7, 2))
            else concat(per, '-', substr(a.ucode, 9, 2)) end),
       c.index_name,
       c.index_code,
       sum(case when rid = 1 then a.Z148 else 0 end),
       sum(case when rid = 2 then a.Z148 else 0 end),
       sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a
         left join data_center.ads_orgnization b
                   on a.org = b.org_code
         left join (select *
                    from data_center.ods_asset_balance_ref
                    where index_code = '156') c on 1 = 1
where a.org not in ('GY2F00')
  and ucode like ('%_r')
group by b.org_code, b.org_name, c.index_name, c.index_code, a.per, a.month;

/* -- 固定资产原值及累计折旧表
drop table data_center.ods_original_asset_value_ref;
CREATE TABLE data_center.ods_original_asset_value_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='固定资产原值及累计折旧表-对照表';


-- 对照表数据灌入
insert into data_center.ods_original_asset_value_ref
select distinct(index_name), index_code from data_center.ods_original_asset_value_bo;

-- 业务表
-- 总部合并
drop TABLE data_center.ods_original_asset_value_hq;
CREATE TABLE data_center.ods_original_asset_value_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  house decimal(15, 2) comment '房屋',
  structure decimal(15, 2) comment '构筑物',
 general_equipment decimal(15, 2) comment '通用设备',
  coal_underground_mine_eq decimal(15, 2) comment '煤炭井工矿专用设备',
 coal_open_pit_mine_eq decimal(15, 2) comment '煤炭露天矿专用设备',
  electric_power_eq decimal(15, 2) comment '电力专用设备',
 railway_special_eq decimal(15, 2) comment '铁路专用设备',
  port_industry_special_eq decimal(15, 2) comment '港口行业专用设备',
 shipping_special_eq decimal(15, 2) comment '航运专用设备',
  coal_to_oil_chemical_eq decimal(15, 2) comment '煤制油化工专用设备',
 washing_selection_eq decimal(15, 2) comment '洗选专用设备',
  coal_deep_processing_eq decimal(15, 2) comment '煤炭深加工专用设备',
 seawater_desalination_eq decimal(15, 2) comment '海水淡化专用设备',
  tech_environmental_eq decimal(15, 2) comment '科技环保专用设备',
 medical_special_eq decimal(15, 2) comment '医疗专用设备',
  tunnel_trench_assets decimal(15, 2) comment '井巷资产',
 disposal_costs decimal(15, 2) comment '弃置费用',
  other_industry_special_eq decimal(15, 2) comment '其他行业专用设备',
 total decimal(15, 2) comment '合计'
) COMMENT='固定资产原值及累计折旧表-总部';
'-- 各厂矿
drop table data_center.ods_original_asset_value_bo;
CREATE TABLE data_center.ods_original_asset_value_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  house decimal(15, 2) comment '房屋',
  structure decimal(15, 2) comment '构筑物',
 general_equipment decimal(15, 2) comment '通用设备',
  coal_underground_mine_eq decimal(15, 2) comment '煤炭井工矿专用设备',
 coal_open_pit_mine_eq decimal(15, 2) comment '煤炭露天矿专用设备',
  electric_power_eq decimal(15, 2) comment '电力专用设备',
 railway_special_eq decimal(15, 2) comment '铁路专用设备',
  port_industry_special_eq decimal(15, 2) comment '港口行业专用设备',
 shipping_special_eq decimal(15, 2) comment '航运专用设备',
  coal_to_oil_chemical_eq decimal(15, 2) comment '煤制油化工专用设备',
 washing_selection_eq decimal(15, 2) comment '洗选专用设备',
  coal_deep_processing_eq decimal(15, 2) comment '煤炭深加工专用设备',
 seawater_desalination_eq decimal(15, 2) comment '海水淡化专用设备',
  tech_environmental_eq decimal(15, 2) comment '科技环保专用设备',
 medical_special_eq decimal(15, 2) comment '医疗专用设备',
  tunnel_trench_assets decimal(15, 2) comment '井巷资产',
 disposal_costs decimal(15, 2) comment '弃置费用',
  other_industry_special_eq decimal(15, 2) comment '其他行业专用设备',
 total decimal(15, 2) comment '合计'

) COMMENT='固定资产原值及累计折旧表-厂矿';
/** 
房屋：house
构筑物：structure
通用设备：general_equipment
煤炭井工矿专用设备：coal_underground_mine_eq
煤炭露天矿专用设备：coal_open_pit_mine_eq
电力专用设备：electric_power_eq
铁路专用设备：railway_special_eq
港口行业专用设备：port_industry_special_eq
航运专用设备：shipping_special_eq
煤制油化工专用设备：coal_to_oil_chemical_eq
洗选专用设备：washing_selection_eq
煤炭深加工专用设备：coal_deep_processing_eq
海水淡化专用设备：seawater_desalination_eq
科技环保专用设备：tech_environmental_eq
医疗专用设备：medical_special_eq
井巷资产：tunnel_trench_assets
弃置费用：disposal_costs
其他行业专用设备：other_industry_special_eq
**/




-- 数据治理平台数据灌入
-- 总部的ODS合并数据通过后面的汇总语句执行。

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_original_asset_value_bo;
insert into data_center.ods_original_asset_value_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
	    round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
	    round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
	    round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2),
	    round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z10 is null,0,a.Z10),2),
	    round(if(a.Z11 is null,0,a.Z11),2),
      round(if(a.Z12 is null,0,a.Z12),2),
	    round(if(a.Z13 is null,0,a.Z13),2),
      round(if(a.Z14 is null,0,a.Z14),2),
	    round(if(a.Z15 is null,0,a.Z15),2),
      round(if(a.Z16 is null,0,a.Z16),2),
	    round(if(a.Z17 is null,0,a.Z17),2),
	    round(if(a.Z18 is null,0,a.Z18),2),
      round(if(a.Z19 is null,0,a.Z19),2)
    from data_center.ybzc022__zybzc022 a
      left join data_center.ads_orgnization b
        on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_original_asset_value_ref c
        on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');
	  
	  

truncate table data_center.ods_original_asset_value_hq;
insert into data_center.ods_original_asset_value_hq
select 
'GY2F00',
'包头能源',
date,
index_name,
index_code,
sum(house),
sum(structure),
sum(general_equipment),
sum(coal_underground_mine_eq),
sum(coal_open_pit_mine_eq),
sum(electric_power_eq),
sum(railway_special_eq),
sum(port_industry_special_eq),
sum(shipping_special_eq),
sum(coal_to_oil_chemical_eq),
sum(washing_selection_eq),
sum(coal_deep_processing_eq),
sum(seawater_desalination_eq),
sum(tech_environmental_eq),
sum(medical_special_eq),
sum(tunnel_trench_assets),
sum(disposal_costs),
sum(other_industry_special_eq),
sum(total)
from data_center.ods_original_asset_value_bo
group by 
date,
index_code,
index_name;





/* -- 七项费用统计
drop table data_center.ods_seven_fee_info_ref;
CREATE TABLE data_center.ods_seven_fee_info_ref (
  index_name varchar(64) comment '指标名称',
  index_code varchar(64) comment '指标编码'
) COMMENT='存货分类统计-对照表';


-- 对照表数据灌入
insert into data_center.ods_seven_fee_info_ref
select distinct(index_name), index_code from data_center.ods_seven_fee_info_hq;

-- 业务表
drop table data_center.ods_seven_fee_info_hq;
CREATE TABLE data_center.ods_seven_fee_info_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  avg_staff_no_dispatch decimal(15, 2) comment '平均在岗职工人数（不含劳务派遣）',
  total_last_year decimal(15, 2) comment '上年全年发生',
  annual_budget decimal(15, 2) comment '年度预算',
  total_current_month decimal(15, 2) comment '合计-本月数',
  total_year_acc decimal(15, 2) comment '合计-本年累计数',
  total_lastyear_acc decimal(15, 2) comment '合计-上年同期数',
  const_current_month decimal(15, 2) comment '在建工程（不含前期）-本月数',
  const_year_acc decimal(15, 2) comment '在建工程（不含前期）-本年累计数',
  const_lastyear_acc decimal(15, 2) comment '在建工程（不含前期）-上年同期数',
  pre_project_current_month decimal(15, 2) comment '项目前期费-本月数',
 pre_project_year_acc decimal(15, 2) comment '项目前期费-本年累计数',
  pre_project_lastyear_acc decimal(15, 2) comment '项目前期费-上年同期数',
  project_current_month decimal(15, 2) comment '工程施工-本月数',
  project_year_acc decimal(15, 2) comment '工程施工-本年累计数',
  project_lastyear_acc decimal(15, 2) comment '工程施工-上年同期数',
  production_cost_current_month decimal(15, 2) comment '生产成本-本月数',
  production_cost_year_acc decimal(15, 2) comment '生产成本-本年累计数',
  production_cost_lastyear_acc decimal(15, 2) comment '生产成本-上年同期数',
  admin_cost_current_month decimal(15, 2) comment '管理费用-本月数',
  admin_cost_year_acc decimal(15, 2) comment '管理费用-本年累计数',
 
 admin_cost_lastyear_acc decimal(15, 2) comment '管理费用-上年同期数',
  sales_cost_current_month decimal(15, 2) comment '销售费用-本月数',
  sales_cost_year_acc decimal(15, 2) comment '销售费用-本年累计数',
  sales_cost_lastyear_acc decimal(15, 2) comment '销售费用-上年同期数',
  other_current_month decimal(15, 2) comment '其他-本月数',
  other_year_acc decimal(15, 2) comment '其他-本年累计数',
  other_lastyear_acc decimal(15, 2) comment '其他-上年同期数'
) COMMENT='七项费用支出情况表-总部';
data_center.ods_seven_fee_info_bo;
CREATE TABLE data_center.ods_seven_fee_info_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  avg_staff_no_dispatch decimal(15, 2) comment '平均在岗职工人数（不含劳务派遣）',
  total_last_year decimal(15, 2) comment '上年全年发生',
  annual_budget decimal(15, 2) comment '年度预算',
  total_current_month decimal(15, 2) comment '合计-本月数',
  total_year_acc decimal(15, 2) comment '合计-本年累计数',
  total_lastyear_acc decimal(15, 2) comment '合计-上年同期数',
  const_current_month decimal(15, 2) comment '在建工程（不含前期）-本月数',
  const_year_acc decimal(15, 2) comment '在建工程（不含前期）-本年累计数',
  const_lastyear_acc decimal(15, 2) comment '在建工程（不含前期）-上年同期数',
  pre_project_current_month decimal(15, 2) comment '项目前期费-本月数',
 pre_project_year_acc decimal(15, 2) comment '项目前期费-本年累计数',
  pre_project_lastyear_acc decimal(15, 2) comment '项目前期费-上年同期数',
  project_current_month decimal(15, 2) comment '工程施工-本月数',
  project_year_acc decimal(15, 2) comment '工程施工-本年累计数',
  project_lastyear_acc decimal(15, 2) comment '工程施工-上年同期数',
  production_cost_current_month decimal(15, 2) comment '生产成本-本月数',
  production_cost_year_acc decimal(15, 2) comment '生产成本-本年累计数',
  production_cost_lastyear_acc decimal(15, 2) comment '生产成本-上年同期数',
  admin_cost_current_month decimal(15, 2) comment '管理费用-本月数',
  admin_cost_year_acc decimal(15, 2) comment '管理费用-本年累计数',
 
 admin_cost_lastyear_acc decimal(15, 2) comment '管理费用-上年同期数',
  sales_cost_current_month decimal(15, 2) comment '销售费用-本月数',
  sales_cost_year_acc decimal(15, 2) comment '销售费用-本年累计数',
  sales_cost_lastyear_acc decimal(15, 2) comment '销售费用-上年同期数',
  other_current_month decimal(15, 2) comment '其他-本月数',
  other_year_acc decimal(15, 2) comment '其他-本年累计数',
  other_lastyear_acc decimal(15, 2) comment '其他-上年同期数'
) COMMENT='七项费用支出情况表-厂矿';
*/



-- 数据治理平台数据灌入
--  数据库里没有总部的数据。

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_seven_fee_info_bo;
insert into data_center.ods_seven_fee_info_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
	  round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
	  round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
	  round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2),
	  round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z10 is null,0,a.Z10),2),
	  round(if(a.Z11 is null,0,a.Z11),2),
      round(if(a.Z12 is null,0,a.Z12),2),
	  round(if(a.Z13 is null,0,a.Z13),2),
      round(if(a.Z14 is null,0,a.Z14),2),
	  round(if(a.Z15 is null,0,a.Z15),2),
      round(if(a.Z16 is null,0,a.Z16),2),
	  round(if(a.Z17 is null,0,a.Z17),2),
	  round(if(a.Z18 is null,0,a.Z18),2),
      round(if(a.Z19 is null,0,a.Z19),2),
	  round(if(a.Z20 is null,0,a.Z20),2),
	  round(if(a.Z21 is null,0,a.Z21),2),
      round(if(a.Z22 is null,0,a.Z22),2),
	  round(if(a.Z23 is null,0,a.Z23),2),
      round(if(a.Z24 is null,0,a.Z24),2),
	  round(if(a.Z25 is null,0,a.Z25),2),
      round(if(a.Z26 is null,0,a.Z26),2),
	  round(if(a.Z27 is null,0,a.Z27),2)
      from data_center.ybgl017__zybgl017 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_seven_fee_info_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');



-- 2024-10-22 待补充YGL0102 职工福利表
/**
drop table data_center.ods_employee_benefits_hq;
CREATE TABLE data_center.ods_employee_benefits_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年金额',
 ratio decimal(15, 2) comment '本年占比',
 amount_acc_lastyear decimal(15, 2) comment '上年同期',
 ratio_lastyear decimal(15, 2) comment '上年占比'
) COMMENT='职工福利费用情况表ygl0102-总部';

drop table data_center.ods_employee_benefits_bo;
CREATE TABLE data_center.ods_employee_benefits_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_acc decimal(15, 2) comment '本年金额',
 ratio decimal(15, 2) comment '本年占比',
 amount_acc_lastyear decimal(15, 2) comment '上年同期',
 ratio_lastyear decimal(15, 2) comment '上年占比'
) COMMENT='职工福利费用情况表ygl0102-厂矿';
**/
-- 目前数据还没有同步，使用的是线下的表格手工导入的数据。



/**  2024-10-24  折旧与摊销表ybcb016
drop table data_center.ods_dep_and_amo_bo;
CREATE TABLE data_center.ods_dep_and_amo_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  total_amount_lastyear decimal(15, 2) comment '去年合计',
  main_biz_cost_lastyear decimal(15, 2) comment '去年主营业务成本',
  manage_fee_lastyear decimal(15, 2) comment '去年管理费用',
  sales_fee_lastyear decimal(15, 2) comment '去年销售费用',
  other_biz_cost_lastyear decimal(15, 2) comment '去年其他业务成本',
  cip_project_lastyear decimal(15, 2) comment '去年在建工程',
  total_amount decimal(15, 2) comment '本年合计',
  main_biz_cost decimal(15, 2) comment '本年主营业务成本',
  manage_fee decimal(15, 2) comment '本年管理费用',
  sales_fee decimal(15, 2) comment '本年销售费用',
  other_biz_cost decimal(15, 2) comment '本年其他业务成本',
  cip_project decimal(15, 2) comment '本年在建工程'
) COMMENT='折旧与摊销表ybcb016-厂矿';

drop table data_center.ods_dep_and_amo_hq;
CREATE TABLE data_center.ods_dep_and_amo_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  total_amount_lastyear decimal(15, 2) comment '去年合计',
  main_biz_cost_lastyear decimal(15, 2) comment '去年主营业务成本',
  manage_fee_lastyear decimal(15, 2) comment '去年管理费用',
  sales_fee_lastyear decimal(15, 2) comment '去年销售费用',
  other_biz_cost_lastyear decimal(15, 2) comment '去年其他业务成本',
  cip_project_lastyear decimal(15, 2) comment '去年在建工程',
  total_amount decimal(15, 2) comment '本年合计',
  main_biz_cost decimal(15, 2) comment '本年主营业务成本',
  manage_fee decimal(15, 2) comment '本年管理费用',
  sales_fee decimal(15, 2) comment '本年销售费用',
  other_biz_cost decimal(15, 2) comment '本年其他业务成本',
  cip_project decimal(15, 2) comment '本年在建工程'
) COMMENT='折旧与摊销表ybcb016-总部';
**/

truncate table data_center.ods_dep_and_amo_bo;
insert into data_center.ods_dep_and_amo_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      (
        case when a.rid = 1 then '合计'
         when a.rid = 2 then '固定资产折旧'
         when a.rid = 3 then '无形资产摊销'
         when a.rid = 4 then '其中：矿产权摊销'
         when a.rid = 5 then '长期待摊费用摊销'
        else '' end 
      ),
      a.rid,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2),
      round(if(a.Z09 is null,0,a.Z09),2),
      round(if(a.Z10 is null,0,a.Z10),2),
      round(if(a.Z11 is null,0,a.Z11),2),
      round(if(a.Z12 is null,0,a.Z12),2)
      from data_center.ybcb016__zybcb016 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');
          
truncate table data_center.ods_dep_and_amo_hq;
insert into data_center.ods_dep_and_amo_hq
      select 
        'GY2F00',
        '包头能源',
        date,
        index_name,
        index_code,
        sum(total_amount_lastyear),
        sum(main_biz_cost_lastyear),
        sum(manage_fee_lastyear),
        sum(sales_fee_lastyear),
        sum(other_biz_cost_lastyear),
        sum(cip_project_lastyear),
        sum(total_amount),
        sum(main_biz_cost),
        sum(manage_fee),
        sum(sales_fee),
        sum(other_biz_cost),
        sum(cip_project)
    from data_center.ods_dep_and_amo_bo
      group by date, index_name,index_code ;


/**  2024-10-24 ： 资产处置收益（损失）明细表ybcb039
drop table data_center.ods_asset_dispose_bo;
CREATE TABLE data_center.ods_asset_dispose_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_acc_lastyear decimal(15, 2) comment '上年同期',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_month decimal(15, 2) comment '本月实际',
  amount_acc decimal(15, 2) comment '本年实际'
) COMMENT='资产处置收益（损失）明细表ybcb039-厂矿';

drop table data_center.ods_asset_dispose_hq;
CREATE TABLE data_center.ods_asset_dispose_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_acc_lastyear decimal(15, 2) comment '上年同期',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_month decimal(15, 2) comment '本月实际',
  amount_acc decimal(15, 2) comment '本年实际'
) COMMENT='资产处置收益（损失）明细表ybcb039-总部';
**/
truncate table data_center.ods_asset_dispose_bo;
insert into data_center.ods_asset_dispose_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      (
        case when a.rid = 1 then '一、资产处置收益合计'
         when a.rid = 2 then '1、资产处置收益-处置固定资产利得'
         when a.rid = 3 then '2、资产处置收益-处置无形资产利得'
         when a.rid = 4 then '3、资产处置收益-处置工程物资利得'
         when a.rid = 5 then '4、资产处置收益-处置在建工程利得'
         when a.rid = 6 then '5、资产处置收益-因债务重组间接处置非流动资产利得'
         when a.rid = 7 then '6、资产处置收益-非货币资产交换利得'
         when a.rid = 8 then '二、资产处置损失合计'
         when a.rid = 9 then '1、资产处置损失-处置固定资产损失'
         when a.rid = 10 then '2、资产处置损失-处置无形资产损失'
         when a.rid = 11 then '3、资产处置损失-处置工程物资损失'
         when a.rid = 12 then '4、资产处置损失-处置在建工程损失'
         when a.rid = 13 then '5、资产处置损失-因债务重组间接处置非流动资产损失'
         when a.rid = 14 then '6、资产处置损失-非货币资产交换损失'
        else '' end 
      ),
      a.rid,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2)
      from data_center.ybcb039__zybcb039 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');
      
      
    truncate table data_center.ods_asset_dispose_hq;
    insert into data_center.ods_asset_dispose_hq
      select 
        'GY2F00',
        '包头能源',
        date,
        index_name,
        index_code,
        sum(amount_acc_lastyear),
        sum(amount_pre),
        sum(amount_month),
        sum(amount_acc)
    from data_center.ods_asset_dispose_bo
      group by date, index_name,index_code ;
      
/**
drop table ods_device_maintain;
CREATE TABLE ods_device_maintain (  
    year INT NOT NULL COMMENT '年度',  
    month INT NOT NULL COMMENT '月',  
    org_code VARCHAR(20) NOT NULL COMMENT '单位编号',  
    org_name VARCHAR(20) NOT NULL COMMENT '单位名称',  
    asset_id VARCHAR(20) NOT NULL COMMENT '资产编号',  
    asset_name VARCHAR(20) NOT NULL COMMENT '资产名称',  
    asset_catalog_code VARCHAR(255) NOT NULL COMMENT '资产目录编码',  
    asset_catalog_name VARCHAR(255NOT NULL COMMENT '资产目录名称',  
    specification_model VARCHAR(255) NOT NULL COMMENT '规格型号',  
    planned_operation_hours FLOAT NOT NULL COMMENT '计划作业时间(H)',  
    planned_downtime_hours FLOAT NOT NULL COMMENT '计划停止时间(H)',  
    actual_operation_hours FLOAT NOT NULL COMMENT '实际作业时间(H)',  
    shutdown_loss_hours FLOAT NOT NULL COMMENT '停机损失时间(H)',  
    raw_coal_tonnage FLOAT NOT NULL COMMENT '原煤量（吨）',  
    gangue_tonnage FLOAT NOT NULL COMMENT '矸石（吨）',  
    ideal_cycle_time_per_ton FLOAT NOT NULL COMMENT '理想周期时间（每吨煤计划操作时间 H）'
) COMMENT='Asset Maintenance Table';
**/


/*
-- 2024-10-31 线下创建的表，导入的 index_name 和 index_code , ods_coal_produce_other_fee_ref;

drop table data_center.ods_coal_produce_other_fee_bo;
CREATE TABLE data_center.ods_coal_produce_other_fee_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  unit_last_year decimal(15, 2) comment '单位成本上年同期',
  unit_budget decimal(15, 2) comment '单位成本本年预算',
  unit_month decimal(15, 2) comment '单位成本本月实际',
  unit_acc decimal(15, 2) comment '单位成本本年实际',
  cost_last_year decimal(15, 2) comment '总成本上年同期',
  cost_budget decimal(15, 2) comment '总成本本年预算',
  cost_month decimal(15, 2) comment '总成本本月实际',
  cost_acc decimal(15, 2) comment '总成本本年实际'

) COMMENT='煤炭制造费用－其他支出明细表-厂矿';

drop table data_center.ods_coal_produce_other_fee_hq;
CREATE TABLE data_center.ods_coal_produce_other_fee_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  unit_last_year decimal(15, 2) comment '单位成本上年同期',
  unit_budget decimal(15, 2) comment '单位成本本年预算',
  unit_month decimal(15, 2) comment '单位成本本月实际',
  unit_acc decimal(15, 2) comment '单位成本本年实际',
  cost_last_year decimal(15, 2) comment '总成本上年同期',
  cost_budget decimal(15, 2) comment '总成本本年预算',
  cost_month decimal(15, 2) comment '总成本本月实际',
  cost_acc decimal(15, 2) comment '总成本本年实际'

) COMMENT='煤炭制造费用－其他支出明细表-总部';
*/
-- ybcb019 煤炭制造费用－其他支出明细表               

truncate table data_center.ods_coal_produce_other_fee_bo;
insert into data_center.ods_coal_produce_other_fee_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
      round(if(a.Z05 is null,0,a.Z05),2),
      round(if(a.Z06 is null,0,a.Z06),2),
      round(if(a.Z07 is null,0,a.Z07),2),
      round(if(a.Z08 is null,0,a.Z08),2)
      from data_center.ybcb019__zybcb019_01 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_coal_produce_other_fee_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');
/**
搬家道面费的合计值没有计算 2024-10-31 需要和李瑞芳老师再确认，目前煤炭制造费用－其他支出明细表 中的合计值计算不了，单位成本无法汇总。
insert into data_center.ods_coal_produce_other_fee_hq
select
      'GY2F00',
      '包头能源',
      date,
      index_name,
      index_code,
--       sum(),
--      sum(),
--      sum(),
--      sum(),
      sum(cost_last_year),
      sum(cost_budget),
      sum(cost_month),
      sum(cost_acc)
      from data_center.ods_coal_produce_other_fee_bo
      group by date ,index_name,index_code ;

**/


/**  人均工资 ：实际值 ： YGL0083 企业财务信息补充指标表  人工工资 元/人 月/年  YGL0083，6其中：实际发放职工工资总额/12全年平均职工人数     **/ 
/**
--table data_center.ods_financial_info_sup_ref ;
-- update  data_center.ods_financial_info_sup_ref set index_name = trim(index_name);
drop table data_center.ods_financial_info_sup_bo;
CREATE TABLE data_center.ods_financial_info_sup_bo (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '单位成本上年同期',
  amount_year decimal(15, 2) comment '单位成本本年预算',
  amount_lastyear decimal(15, 2) comment '单位成本本月实际'
) COMMENT='企业财务信息补充指标表-厂矿';

drop table data_center.ods_financial_info_sup_hq;
CREATE TABLE data_center.ods_financial_info_sup_hq (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_month decimal(15, 2) comment '单位成本上年同期',
  amount_year decimal(15, 2) comment '单位成本本年预算',
  amount_lastyear decimal(15, 2) comment '单位成本本月实际'
) COMMENT='企业财务信息补充指标表-包能汇总合计';
**/

truncate table data_center.ods_financial_info_sup_bo;
insert into data_center.ods_financial_info_sup_bo
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.ygl0083__zygl0083 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_financial_info_sup_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00') and ucode like ('%_r');

truncate table data_center.ods_financial_info_sup_hq;
insert into data_center.ods_financial_info_sup_hq
select
      b.org_code,
      b.org_name,
      (case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2)
      from data_center.ygl0083__zygl0083 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_financial_info_sup_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('GY2F00') and ucode like ('%_r');
      
      
/**
-- 2024-10-31 : 各煤种结算表，增加 区内区外 各煤种合计
insert into ods_coal_settlement(org_code,org_name,date,index_name,index_code,amount_acc,price_taxex_acc,income_taxex_acc)
values('GY2F00','包头能源','2024-09-30','区内4500合计','47',1049436.05 ,329.73 ,346031621.76 );
insert into ods_coal_settlement(org_code,org_name,date,index_name,index_code,amount_acc,price_taxex_acc,income_taxex_acc)
values('GY2F00','包头能源','2024-09-30','区内3800合计','48',3142318.40  ,224.26  ,704702205.11 );
insert into ods_coal_settlement(org_code,org_name,date,index_name,index_code,amount_acc,price_taxex_acc,income_taxex_acc)
values('GY2F00','包头能源','2024-09-30','区外5000合计','49',610610.27  , 424.19 , 259014528.39 );
insert into ods_coal_settlement(org_code,org_name,date,index_name,index_code,amount_acc,price_taxex_acc,income_taxex_acc)
values('GY2F00','包头能源','2024-09-30','区外4500合计','50',9537121.41  , 354.91 ,3384778032.33  );
**/

  -- DDL语句
  /**
  CREATE TABLE data_center.ads_device_type (
    device_type_no varchar(64) comment '设备类型编码',
    device_type_name varchar(64) comment '设备类型名称'

  ) COMMENT='设备类型编码-ads';
  INSERT INTO `data_center`.`ads_device_type`(`device_type_no`, `device_type_name`) VALUES ('0001', '采煤机');
  INSERT INTO `data_center`.`ads_device_type`(`device_type_no`, `device_type_name`) VALUES ('0002', '刮板输送机');
  INSERT INTO `data_center`.`ads_device_type`(`device_type_no`, `device_type_name`) VALUES ('0003', '掘锚机');
  INSERT INTO `data_center`.`ads_device_type`(`device_type_no`, `device_type_name`) VALUES ('0004', '支架');
  INSERT INTO `data_center`.`ads_device_type`(`device_type_no`, `device_type_name`) VALUES ('0099', '其他');

  CREATE TABLE data_center.ads_ys_version_info (
    version_code varchar(64) comment '预算编码',
    version_name varchar(64) comment '预算名称'
  ) COMMENT='预算版本表-ads';

  INSERT INTO `data_center`.`ads_ys_version_info`(`version_code`, `version_name`) VALUES ('JYYS1', '年度预算第一版');
  INSERT INTO `data_center`.`ads_ys_version_info`(`version_code`, `version_name`) VALUES ('JYYS2', '年度预算第二版');
  INSERT INTO `data_center`.`ads_ys_version_info`(`version_code`, `version_name`) VALUES ('JYYS3', '年度预算第三版');
  INSERT INTO `data_center`.`ads_ys_version_info`(`version_code`, `version_name`) VALUES ('JYYS4', '年度预算第四版');

  create table data_center.ads_cwfl_type (
    cwfl_no varchar(64) comment '财务分类编码',
    cwfl_name varchar(64) comment '财务分类名称'

  ) COMMENT='财务分类-ads';


  insert into data_center.ads_cwfl_type
  select distinct cwfl_name, cl_name 
  from xh_cl_cw;

  **/


  /**
  drop table data_center.ads_special_reverse_1;
  CREATE TABLE data_center.ads_special_reverse_1 (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', -- 专项储备： 年初数（维简费、安全费）、提取数、使用数、年末数
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年累计数',
    amount_month decimal(15, 2) comment '本月实际数',
    amount_acc_form decimal(15, 2) comment '去年累计数',
    amount_month_form decimal(15, 2) comment '去年同月实际数',
    amount_month_form_hb decimal(15, 2) comment '本年上月实际数',  
    amount_pre decimal(15, 2) comment '本年预算数',
    amount_month_pre decimal(15, 2) comment '本月预算数'  
  ) COMMENT='专项储备-一级页面';

  **/

  -- 专项储备-一级页面
  -- 0814 ：增加使用数 118,119
  truncate table data_center.ads_special_reverse_1;
  -- 插入汇总合并数据
  insert into data_center.ads_special_reverse_1
  select
        b.org_code,
        b.org_name,
        b.level_code,
        substr(a.date,1,7) as date,
        a.index_name,
        a.index_code,
        a.total_amount_acc,
        a.total_amount,
        a.total_amount_acc_lastyear,
        a.total_amount_lastyear,
        a.total_amount_lastmonth,
        a.total_amount_pre,
        a.total_amount_pre/12
        from data_center.ods_coal_produce_hq a
        left join data_center.ads_orgnization b
        on a.org_code = b.org_code
        where a.index_code in ('111','114','115','116','117','118','119','126','129')
  ;
  -- 插入厂矿数据
  insert into data_center.ads_special_reverse_1
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
        a.total_amount_pre,
        a.total_amount_pre/12
        from data_center.ods_coal_produce_bo a
     left join data_center.ads_orgnization b
        on a.org_code = b.org_code
        where a.index_code in ('111','114','115','116','117','118','119','126','129');
  	  
  -- 专项储备-二级
  -- 0814 ：增加使用数 118,119
  /**
  drop table data_center.ads_special_reverse_2;
  CREATE TABLE data_center.ads_special_reverse_2 (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', -- 专项储备： 年初数（维简费、安全费）、提取数、使用数、年末数
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年累计数',
    amount_month decimal(15, 2) comment '本月实际数',
    amount_acc_form decimal(15, 2) comment '去年累计数',
    amount_month_form decimal(15, 2) comment '去年同月实际数',
    amount_month_form_hb decimal(15, 2) comment '本年上月实际数',  
    amount_pre decimal(15, 2) comment '本年预算数',
    amount_month_pre decimal(15, 2) comment '本月预算数'  
  ) COMMENT='专项储备-二级';
  **/
  truncate table data_center.ads_special_reverse_2;
  insert into data_center.ads_special_reverse_2
  select
        b.org_code,
        b.org_name,
        b.level_code,
        substr(a.date,1,7) as date,
        a.index_name,
        a.index_code,
        a.total_amount_acc,
        a.total_amount,
        a.total_amount_acc_lastyear,
        a.total_amount_lastyear,
        a.total_amount_lastmonth,
        a.total_amount_pre,
        a.total_amount_pre/12
        from data_center.ods_coal_produce_hq a
        left join data_center.ads_orgnization b
        on a.org_code = b.org_code
        where a.index_code in ('111','114','115','116','117','118','119','126','129')
  ;
  insert into data_center.ads_special_reverse_2
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
        a.total_amount_pre,
        a.total_amount_pre/12
        from data_center.ods_coal_produce_bo a
     left join data_center.ads_orgnization b
        on a.org_code = b.org_code
        where a.index_code in ('111','114','115','116','117','118','119','126','129');
  	  
  -- 两金 
  /**
  drop table data_center.ads_two_gold_2;
  CREATE TABLE data_center.ads_two_gold_2 (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    begin_balance_networth decimal(15, 2) comment '期初净值',
    end_balance_networth decimal(15, 2) comment '期末净值',
    book_balance_20191231 decimal(15, 2) comment '账面余额截止2019' ,
    book_balance_now decimal(15, 2) comment '账面余额截止本月'  
  ) COMMENT='两金';
  **/
  truncate table data_center.ads_two_gold_2;
  insert into data_center.ads_two_gold_2
  with ods_accounts_receivable as(
   select * from data_center.ods_accounts_receivable_hq
    union all
   select * from data_center.ods_accounts_receivable_bo
  )
  select  
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.begin_balance_networth, -- 期初净值
   a.end_balance_networth, -- 期末净值
   0 as book_balance_20191231, -- 账面余额截止2019
   0 as book_balance_now   -- 账面余额
  from ods_accounts_receivable a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code = '1'; -- 应收账款

  insert into data_center.ads_two_gold_2
  with ods_inventory_class_stat as(
   select * from data_center.ods_inventory_class_stat_hq
    union all
   select * from data_center.ods_inventory_class_stat_bo
  )
  select  
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   0 as begin_balance_networth, -- 期初净值
   0 as end_balance_networth, -- 期末净值
   a.book_balance_20191231, -- 账面余额截止2019
   a.book_balance_now -- 账面余额
  from ods_inventory_class_stat a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code = '21'; -- 存货分类统计


  -- 五率
  /**
  drop table data_center.ads_five_rate_2;
  create table data_center.ads_five_rate_2(
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_pre decimal(15, 2) comment '预算值',
   last_month decimal(15, 2) comment '上月值',
   current_month decimal(15, 2) comment '本月值',
   amount_acc_form decimal(15, 2) comment '去年同期值',
    amount_acc decimal(15, 2) comment '本年累计'
  ) COMMENT='五率';
  **/
  truncate table data_center.ads_five_rate_2;
  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_hq a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '29'); -- 净资产收益率(ROE)

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_bo a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '29'); -- 净资产收益率(ROE)

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_hq a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '7'); -- 净资负债率

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_bo a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '7'); -- 净资负债率


  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_hq a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '12'); -- 劳动生产率

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.pre_year, -- 年度预算
   a.pre_last_month, -- 上月值
   a.pre_current_month, -- 本月值
   a.pre_last_year_month, -- 去年同期值
   a.acc_year -- 本年累计
  from data_center.ods_summary_index_bo a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '12'); -- 劳动生产率

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.amount_pre, -- 年度预算
   null, -- 上月值
   null, -- 本月值
   a.amount_acc_form, -- 去年同期值
   a.amount_acc -- 本年累计
  from data_center.ods_technology_expense_hq a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '22'); -- 研发投入强度

  insert  into data_center.ads_five_rate_2
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7 ) as date,
   a.index_name,
   a.index_code,
   a.amount_pre, -- 年度预算
   null, -- 上月值
   null, -- 本月值
   a.amount_acc_form, -- 去年同期值
   a.amount_acc -- 本年累计
  from data_center.ods_technology_expense_bo a
  left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in( '22'); -- 研发投入强度


  insert  into data_center.ads_five_rate_2
  select 
   c.org_code, 
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
    '营业现金比率',
    '1-28',
   null, -- 年度预算
   null, -- 上月值
   null, -- 本月值
   case when amount_lastyear = 0 then 0 else b.amount_acc_form / amount_lastyear end , -- 去年同期值
   case when a.amount_year = 0 then 0 else b.amount_acc / a.amount_year end -- 本年累计
  from 
  (select * from  data_center.ods_profit_hq where index_code = '1') a
  left join 
  (select * from data_center.ods_cash_flow_hq where index_code = '28') b 
  on a.org_code = b.org_code and a.org_name = b.org_name and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

  insert  into data_center.ads_five_rate_2
  select 
   c.org_code, 
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
    '营业现金比率',
    '1-28',
   null, -- 年度预算
   null, -- 上月值
   null, -- 本月值
   case when amount_lastyear = 0 then 0 else b.amount_acc_form / amount_lastyear end , -- 去年同期值
   case when a.amount_year = 0 then 0 else b.amount_acc / a.amount_year end -- 本年累计
  from 
  (select * from  data_center.ods_profit_bo where index_code = '1') a
  left join 
  (select * from data_center.ods_cash_flow_bo where index_code = '28') b 
  on a.org_code = b.org_code and a.org_name = b.org_name and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

  -- 税费情况
  -- 0816 : 增加组织关联
  /**
  drop table data_center.ads_payable_tax_1;
  create table data_center.ads_payable_tax_1(
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    end_balance decimal(15, 2) comment '本年增加值'  --2024-10-17 周四 包能7层  期末值 改为 本年增加值 increase_year_payable, 但该表的字段名并没有修改
  ) COMMENT='税费-一级';
  **/
  truncate table data_center.ads_payable_tax_1;
  insert into data_center.ads_payable_tax_1
  with tt as(
   select * from data_center.ods_payable_tax_hq
   union all 
   select * from data_center.ods_payable_tax_bo
   )
   select 
   b.org_code,
    b.org_name,
    b.level_code,
    substr(a.date,1,7) as date,
    a.index_name,
    a.index_code,
   -- a.end_balance  2024-10-17替换为本年增加值 
    a.increase_year_payable
   from tt a
   left join data_center.ads_orgnization b
  on a.org_code = b.org_code
   where a.index_code in('1','3','5','13','14','34','7','10','8','12','50')
   ;
   -- 栏次1 ： 合计
  update data_center.ads_payable_tax_1 set date = substr(date,1,7) ;
  update data_center.ads_payable_tax_1 set index_name = '房产税' where index_code = 8;
  update data_center.ads_payable_tax_1 set index_name = '增值税' where index_code = 3;
  update data_center.ads_payable_tax_1 set index_name = '企业所得税' where index_code = 5;
  update data_center.ads_payable_tax_1 set index_name = '城市维护建设税' where index_code = 7;
  update data_center.ads_payable_tax_1 set index_name = '土地使用税' where index_code = 10;
  update data_center.ads_payable_tax_1 set index_name = '耕地占用税' where index_code = 12;
  update data_center.ads_payable_tax_1 set index_name = '个人所得税' where index_code = 13;
  update data_center.ads_payable_tax_1 set index_name = '资源税' where index_code = 14;
  update data_center.ads_payable_tax_1 set index_name = '水土保持补偿费' where index_code = 34;
  update data_center.ads_payable_tax_1 set index_name = '其他' where index_code = 50;

  -- 0827 增加综合税负率 指标编码 111
  insert into data_center.ads_payable_tax_1
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
   '综合税负率' as index_name,
   '111' as index_code,
   a.increase_year_payable / b.amount_year as zhsfl
  from 
  (select * from ods_payable_tax_hq where index_code = '1') a    -- 应上交应弥补表的 应缴税费总额 
  left join 
  (select * from ods_profit_hq where index_code = '1') b    -- 利润表的 营业总收入
  on a.org_code = b.org_code and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

  insert into data_center.ads_payable_tax_1
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
   '综合税负率' as index_name,
   '111' as index_code,
   (case when b.amount_year = 0 then 0 else a.increase_year_payable / b.amount_year  end ) as zhsfl
  from 
  (select * from ods_payable_tax_bo where index_code = '1') a    -- 应上交应弥补表的 应缴税费总额 
  left join 
  (select * from ods_profit_bo where index_code = '1') b    -- 利润表的 营业总收入
  on a.org_code = b.org_code and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;


  -- 税费-二级
  -- 2024-08-29 新增模型，页面调整为图形，且模型调整为行模式。
  /**
  drop table data_center.ads_payable_tax_2_1 ;
  create table data_center.ads_payable_tax_2_1 
  (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    end_balance decimal(15, 2) comment '本年增加值'  --2024-10-17 周四 包能7层  期末值 改为 本年增加值 increase_year_payable, 但该表的字段名并没有修改
  ) COMMENT='税费-二级-调整为行模式-0829';
  **/
  truncate table data_center.ads_payable_tax_2_1;
  insert into  data_center.ads_payable_tax_2_1
  (org_code,org_name,level_code,date,index_name,index_code,end_balance)
   select 
     b.org_code,
    b.org_name,
    b.level_code,
    substr(a.date,1,7) as date,
    a.index_name,
    a.index_code,
    a.increase_year_payable -- 2024-10-17替换为本年增加值 
   from
   data_center.ods_payable_tax_hq a
   left join data_center.ads_orgnization b
   on a.org_code = b.org_code
   where a.index_code in ('1','3','5','13','14','34','7','10','8','12','50');
   
  insert into  data_center.ads_payable_tax_2_1
  (org_code,org_name,level_code,date,index_name,index_code,end_balance)
   select 
     b.org_code,
    b.org_name,
    b.level_code,
    substr(a.date,1,7) as date,
    a.index_name,
    a.index_code,
    a.increase_year_payable -- 2024-10-17替换为本年增加值
   from
   data_center.ods_payable_tax_bo a
   left join data_center.ads_orgnization b
   on a.org_code = b.org_code
   where a.index_code in ('1','3','5','13','14','34','7','10','8','12','50');
   
  -- 20240829 - 更新指标名称
  update data_center.ads_payable_tax_2_1 set index_name = '增值税' where index_name = '1、增值税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '企业所得税' where index_name = '3、企业所得税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '城市维护建设税' where index_name = '5、城市维护建设税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '房产税' where index_name = '6、房产税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '土地使用税' where index_name = '8、土地使用税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '耕地占用税' where index_name = '10、耕地占用税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '个人所得税' where index_name = '11、个人所得税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '资源税' where index_name = '12、资源税' ;
  update data_center.ads_payable_tax_2_1 set index_name = '水土保持补偿费' where index_name = '10、水土保持补偿费' ;
  update data_center.ads_payable_tax_2_1 set index_name = '其他' where index_name = '26、其他' ;

  -- 增加税费按地区统计百分比
  -- 0816 ：增加组织关联
  /**
  drop table data_center.ads_tax_region;
  CREATE TABLE data_center.ads_tax_region (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '地区名称',
    index_code varchar(64) comment '指标编码',
    total decimal(15, 2) comment '合计',
    zzs decimal(15, 2) comment '增值税',
    qysds varchar(64) comment '企业所得税',
    zys varchar(64) comment '资源税',
    hjbhs decimal(15, 2) comment '环境保护税',
    cjs decimal(15, 2) comment '城建税',
    fcs decimal(15, 2) comment '房产税',
    tdsys decimal(15, 2) comment '土地使用税',
    grsds decimal(15, 2) comment '个人所得税',
    stbcbcf decimal(15, 2) comment '水土保持补偿费',
    yhs decimal(15, 2) comment '印花税',
    gdzys decimal(15, 2) comment '耕地占用税',
    qt decimal(15, 2) comment '其他税费',
    percent_rate decimal(15, 2) comment '占比'
  ) COMMENT='税费按地区统计-ads';
  **/
  truncate table data_center.ads_tax_region;
  insert into data_center.ads_tax_region
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   a.total,
   a.zzs,
   a.qysds,
   a.zys,
   a.hjbhs,
   a.cjs,
   a.fcs,
   a.tdsys,
   a.grsds,
   a.stbcbcf,
   a.yhs,
   a.gdzys,
   a.qt,
   a.total / (select sum(total) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      )
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21');

  update data_center.ads_tax_region set index_name = '石拐区' where index_code = 2;
  update data_center.ads_tax_region set index_name = '土右旗' where index_code = 7;
  update data_center.ads_tax_region set index_name = '高新开发区' where index_code = 12;
  update data_center.ads_tax_region set index_name = '东胜区' where index_code = 15;
  update data_center.ads_tax_region set index_name = '准格尔旗' where index_code = 19;
  update data_center.ads_tax_region set index_name = '乌审旗' where index_code = 21;

  update data_center.ads_tax_region set date = substr(date,1,7);

  /**
  drop table data_center.ads_tax_region_detail;
  CREATE TABLE data_center.ads_tax_region_detail (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '地区名称',
    index_code varchar(64) comment '指标编码',
  	index_name_2 varchar(64) comment '税种名称',
    index_code_2 varchar(64) comment '税种编码', 
    amount decimal(15, 2) comment '数额',
  	percent decimal(15, 2) comment '百分比'
  ) COMMENT='税费按地区统计—按税种-ads';
  **/

  truncate table data_center.ads_tax_region_detail;
  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '合计' as index_name_2,
   '1' as index_code_2,
   a.total,
   case when (select sum(total) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.total / (select sum(total) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  -- 增值税 3
  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '增值税' as index_name_2,
   '3' as index_code_2,
   a.zzs,
   case when (select sum(zzs) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.zzs / (select sum(zzs) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '企业所得税' as index_name_2,
   '5' as index_code_2,
   a.qysds,
   case when (select sum(qysds) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.qysds / (select sum(qysds) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '资源税' as index_name_2,
   '14' as index_code_2,
   a.zys,
   case when (select sum(zys) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.zys / (select sum(zys) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '环境保护税' as index_name_2,
   '21' as index_code_2,
   a.hjbhs,
   case when (select sum(hjbhs) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.hjbhs / (select sum(hjbhs) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '城建税' as index_name_2,
   '7' as index_code_2,
   a.cjs,
   case when (select sum(cjs) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.cjs / (select sum(cjs) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '房产税' as index_name_2,
   '8' as index_code_2,
   a.fcs,
   case when (select sum(fcs) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.fcs / (select sum(fcs) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '土地使用税' as index_name_2,
   '10' as index_code_2,
   a.tdsys,
   case when (select sum(tdsys) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.tdsys / (select sum(tdsys) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '个人所得税' as index_name_2,
   '13' as index_code_2,
   a.grsds,
   case when (select sum(grsds) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.grsds / (select sum(grsds) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '水土保持补偿费' as index_name_2,
   '34' as index_code_2,
   a.stbcbcf,
   case when (select sum(stbcbcf) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.stbcbcf / (select sum(stbcbcf) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '印花税' as index_name_2,
   '11' as index_code_2,
   a.yhs,
   case when (select sum(yhs) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.yhs / (select sum(yhs) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '耕地占用税' as index_name_2,
   '12' as index_code_2,
   a.gdzys,
   case when (select sum(gdzys) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.gdzys / (select sum(gdzys) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  insert into data_center.ads_tax_region_detail
  select 
   c.org_code,
   c.org_name,
   c.level_code,
   a.date,
   a.index_name,
   a.index_code,
   '其他税费' as index_name_2,
   '23' as index_code_2,
   a.qt,
   case when (select sum(qt) 
      from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
      ) = 0 then 0 else (
      a.qt / (select sum(qt) 
          from data_center.ods_tax_region b where b.date = a.date and index_code in ('2','7','12','15','19','21') group by org_code,date
        ) ) end 
  from 
  data_center.ods_tax_region a
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  where a.index_code in ('2','7','12','15','19','21','24');

  update data_center.ads_tax_region_detail set index_name = '石拐区' where index_code = 2;
  update data_center.ads_tax_region_detail set index_name = '土右旗' where index_code = 7;
  update data_center.ads_tax_region_detail set index_name = '高新开发区' where index_code = 12;
  update data_center.ads_tax_region_detail set index_name = '东胜区' where index_code = 15;
  update data_center.ads_tax_region_detail set index_name = '准格尔旗' where index_code = 19;
  update data_center.ads_tax_region_detail set index_name = '乌审旗' where index_code = 21;

  update data_center.ads_tax_region_detail set date = substr(date,1,7);



  -- 非经营性损益
  /**
  drop table data_center.ads_no_operating_income_1;
  CREATE TABLE data_center.ads_no_operating_income_1 (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_month decimal(15, 2) comment '本月值',
    amount_year decimal(15, 2) comment '本年累计值',
   pre_year  decimal(15, 2) comment '本年预算',
    amount_lastyear decimal(15, 2) comment '上年同期'
  ) COMMENT='非经营性损益';
  **/

  -- !!! 导入bo csv数据

  -- 3 ，插入厂矿ads数据
  truncate table data_center.ads_no_operating_income_1 ;
  insert into data_center.ads_no_operating_income_1 
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   a.index_name,
   a.index_code,
   a.amount_month,
   a.amount_year,
   a.pre_year,
   a.amount_lastyear
  from data_center.ods_no_operating_income_bo a
    left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('31','30','23');

  -- 4. 插入合并数据
  insert into data_center.ads_no_operating_income_1 
  select 
   'GY2F00', -- org_code,
   '包头能源', -- org_name,
   '100' , -- level_code
   date,
   index_name,
   index_code,
   sum(amount_month),
   sum(amount_year),
   sum(pre_year),
   sum(amount_lastyear)
  from data_center.ods_no_operating_income_bo
  where index_code in ('23','30','31')  -- 23 总支出  31 捐赠   新补充指标 30 ：“7、罚款滞纳违约金”
  group by date,index_name,index_code
  ;

  -- 插入利润表中的其它6个指标
  insert into data_center.ads_no_operating_income_1 
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   a.index_name,
   a.index_code,
   a.amount_month,
   a.amount_year,
   0,
   a.amount_lastyear
  from data_center.ods_profit_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('36','35','28','29','34','37');

  insert into data_center.ads_no_operating_income_1 
  select
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   a.index_name,
   a.index_code,
   a.amount_month,
   a.amount_year,
   0,
   a.amount_lastyear
  from data_center.ods_profit_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('36','35','28','29','34','37');

  update  data_center.ads_no_operating_income_1 set date = substr(date,1,7);

  -- 0724： 0913重新调整，页面没有其他损失事项了
  -- 计算其他损失事项  
  -- insert into data_center.ads_no_operating_income_1 
  -- select 
  -- t1.org_code,
  -- t1.org_name,
  -- t1.level_code,
  -- t1.date,
  -- '其他损失事项' , -- index_name
  -- 2331 ,  -- index_code
  -- 0 , -- as amount_month
  -- ((select amount_year from data_center.ads_no_operating_income_1 t23 where t23.org_code = t1.org_code and t23.date = t1.date and t23.index_code = '23') - (select amount_year from data_center.ads_no_operating_income_1 t31 where t31.org_code = t1.org_code and t31.date = t1.date and t31.index_code = '31') ) -- amount_year
  -- ,0  -- pre_year
  -- ,((select amount_lastyear from data_center.ads_no_operating_income_1 t23 where t23.org_code = t1.org_code and t23.date = t1.date and t23.index_code = '23') - (select amount_lastyear from data_center.ads_no_operating_income_1 t31 where t31.org_code = t1.org_code and t31.date = t1.date and t31.index_code = '31') )  -- amount_lastyear
  -- from data_center.ads_no_operating_income_1 t1
  -- where t1.index_code in ('23');

  -- 0730：
  update data_center.ads_no_operating_income_1 set index_name = '营业外支出' where index_code = '23';
  update data_center.ads_no_operating_income_1 set index_name = '捐赠支出' where index_code = '31';
  update data_center.ads_no_operating_income_1 set index_name = '其他收益' where index_code = '28';
  update data_center.ads_no_operating_income_1 set index_name = '投资收益' where index_code = '29';
  update data_center.ads_no_operating_income_1 set index_name = '公允价值变动收益' where index_code = '34';
  update data_center.ads_no_operating_income_1 set index_name = '信用减值损失' where index_code = '35';
  update data_center.ads_no_operating_income_1 set index_name = '资产减值损失' where index_code = '36';
  update data_center.ads_no_operating_income_1 set index_name = '资产处置收益' where index_code = '37';
  -- 1010 ： 增加罚款滞纳金
  -- 1023 ： 利润表 值保留了 36 和 37 ，资产处置 和 资产减值
  update data_center.ads_no_operating_income_1 set index_name = '罚款滞纳违约金' where index_code = '30';


  /**
  资金收支情况  -- 目前来源于线下手动做的离线excel报表 预算实际表

  drop table data_center.ads_fund_income_expense;
  CREATE TABLE data_center.ads_fund_income_expense (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '累计值',
   amount_acc_form decimal(15, 2) comment '去年累计值',
   plan_amount decimal(15, 2) comment '计划值'

  ) COMMENT='资金收支情况表ads';
  **/

  -- 0816 ：增加组织关联
  truncate table data_center.ads_fund_income_expense;
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code ,
   substr(a.date,1,7) ,
   '资金流入' as index_name,
   'A0003' as index_code,
   SUM(a.act_amount) as amount_acc,
   0,
   sum(a.plan_amount)
  from  data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('6','74')
  group by b.org_name,b.org_code,a.date
  ; 
  --  资金收支表
  -- 6  （一）经营活动资金流入
  -- 74 （一）投资活动资金流入
  -- 30 （二）经营活动资金流出
  -- 86 （二）投资活动资金流出
  -- 111 （二）筹资活动资金流出
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code ,
   substr(a.date,1,7) as date,
   '资金流出' as index_name,
   'A0004' as index_code,
   SUM(a.act_amount) as amount_acc,
    0,
   sum(a.plan_amount)
  from  data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('30','86','111') -- 2024-11-28 : 补充 指标111  ， （二）筹资活动资金流出
  group by b.org_name, b.org_code, a.date
  ; 

  -- 期末货币资金余额 
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7),
   '期末货币资金余额' ,
   'A0002',
  ifnull(a.end_balance,0) + ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_hq where substr(date,1,7) = substr(a.date,1,7) ),0)
    as amount_acc,
   a.amount_acc_form +  ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_hq where substr(date,1,7) = substr(cast(concat(a.date,'-01') as date) + interval '-1' year,1,7) ),0)  
  as amount_acc_form,
   0 as plan_amount
  from  data_center.ods_asset_balance_hq  a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('2')
  AND substr(a.date,6,7) <= '12';   
  -- 资产负债表  2- 货币资金  
  -- 其他应用款项表 18 期末余额-账面净额

  -- 期初货币资金余额

  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(cast(concat(a.date,'-01') as date) + interval '1' month,1,7)  as date ,
   '期初货币资金余额' ,
   'A0001',
   ifnull(a.end_balance,0) + ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_hq where substr(date,1,7) = substr(a.date,1,7) ),0)
   as amount_acc,
   a.amount_acc_form +  ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_hq where substr(date,1,7) = substr(cast(concat(a.date,'-01') as date) + interval '-1' year,1,7) ),0)  
   as amount_acc_form,
   0 as plan_amount
  from  data_center.ods_asset_balance_hq  a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where index_code in ('2')
  AND substr(a.date,6,7) <= '12';
  -- 资产负债表  2- 货币资金   
  -- 其他应用款项表 18 期末余额-账面净额

  -- ------------------  导入厂矿数据 ------------------------------------
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code ,
   substr(a.date,1,7) ,
   '资金流入' as index_name,
   'A0003' as index_code,
   SUM(a.act_amount) as amount_acc,
    0,
   sum(a.plan_amount)
  from  data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('6','74')
  group by b.org_name,b.org_code,a.date
  ; 
  --  资金收支表
  -- 6  （一）经营活动资金流入
  -- 74 （一）投资活动资金流入
  -- 30 （二）经营活动资金流出
  -- 86 （二）投资活动资金流出
  -- 111 （二）筹资活动资金流出
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code ,
   substr(a.date,1,7) as date,
   '资金流出' as index_name,
   'A0004' as index_code,
   SUM(a.act_amount) as amount_acc,
    0,
   sum(a.plan_amount)
  from  data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('30','86','111')
  group by b.org_name,b.org_code,a.date
  ; 

  -- 期末货币资金余额 
  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   '期末货币资金余额' ,
   'A0002',
   ifnull(a.end_balance,0) + ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_bo where substr(date,1,7) = substr(a.date,1,7) and org_code = a.org_code ),0)
   as amount_acc,
   a.amount_acc_form +  ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_bo where substr(date,1,7) = substr(cast(concat(a.date,'-01') as date) + interval '-1' year,1,7) and org_code = a.org_code),0)  
   as amount_acc_form,
   0 as plan_amount
  from  data_center.ods_asset_balance_bo  a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('2');   
  -- 资产负债表  2- 货币资金  
  -- 其他应用款项表 18 期末余额-账面净额

  -- 期初货币资金余额

  insert into data_center.ads_fund_income_expense
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(cast(concat(a.date,'-01') as date) + interval '1' month,1,7)  as date ,
   '期初货币资金余额' ,
   'A0001',
    ifnull(end_balance,0) + ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_bo where substr(date,1,7) = substr(a.date,1,7) and org_code = a.org_code ),0)
   as amount_acc,
   a.amount_acc_form +  ifnull((select endofyearbalance_booknetvalue from   data_center.ods_other_amount_due_bo where substr(date,1,7) = substr(cast(concat(a.date,'-01') as date) + interval '-1' year,1,7) and org_code = a.org_code),0)  
   as amount_acc_form,
   0 as plan_amount
  from  data_center.ods_asset_balance_bo  a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('2')
  AND substr(a.date,6,7) <= '12';
  -- 资产负债表  2- 货币资金   
  -- 其他应用款项表 18 期末余额-账面净额

  /**
  资金收支情况明细表

   资金流入
   14  煤炭产业
   19 其他产业 只有 公路分公司的数据
   20 其他收款
   资金流出
   32 燃料费
   56 运输费
   33 材料费
   41 接受服务
   42 修理费
   86 投资活动流出
   67 税费
   66 人工成本
   35 水费
   36 电费
   42 修理费
   71 其他经营支出
   68 七项费用
   
  drop table data_center.ads_fund_income_expense_detail_2;
  CREATE TABLE data_center.ads_fund_income_expense_detail_2 (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    mtsr decimal(15, 2) comment '煤炭收入',  
   cltxsr decimal(15, 2) comment '车辆通信收入',
   ddfyjqt decimal(15, 2) comment '代垫费用及其他',
   wgmkjyf decimal(15, 2) comment '外购煤款及运费',
   clsbjgck decimal(15, 2) comment '材料、设备及工程款',
   gxsf decimal(15, 2) comment '各项税费',
   zgxcjfl decimal(15, 2) comment '职工薪酬及福利',
   sdejwxf decimal(15, 2) comment '水电费及维修费',
   qtzc decimal(15, 2) comment '其他支出'

  ) COMMENT='资金收支情况明细表ads_2';
  **/
  truncate table  data_center.ads_fund_income_expense_detail_2;
  -- 14 煤炭收入
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,mtsr)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '14';

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,mtsr)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '14';

  -- 19 车辆通信收入
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,cltxsr)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '19';

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,cltxsr)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '19';

  -- 20 代垫费用及其他
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,ddfyjqt)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '20';

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,ddfyjqt)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code = '20';

  -- 32 56 外购煤款及运费
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,wgmkjyf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '32','56');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,wgmkjyf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '32','56');

  -- '33','41','42','86' 材料、设备及工程款
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,clsbjgck)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '33','41','42','86');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,clsbjgck)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '33','41','42','86');

  -- '67' 各项税费
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,gxsf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ('67');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,gxsf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '67');

  -- '66' 职工薪酬及福利
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,zgxcjfl)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ('66');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,zgxcjfl)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '66');

  --  '35','36','42' 水电费及维修费
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,sdejwxf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '35','36','42');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,sdejwxf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in (  '35','36','42');

  --  '68' 其他支出
  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,sdejwxf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in ( '68');

  insert into data_center.ads_fund_income_expense_detail_2
  (org_code,org_name,level_code,date,sdejwxf)
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7) as date,
  a.act_amount
  from data_center.ods_fund_income_expense_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code  in (  '68');

  /**
   杜邦分析
   
   drop table data_center.ads_dubang_analyse;
  CREATE TABLE data_center.ads_dubang_analyse (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年累计数',
   amount_acc_lastyear decimal(15, 2) comment '去年累计数'

  ) COMMENT='杜邦分析-ads';

  **/

  truncate table data_center.ads_dubang_analyse ;
  /** 
   29 净资产收益率（ROE）
   30 总资产报酬率
   7 资产负债率        
   2 净利润
   24 营业总收入
   33 总资产周转率
  **/ 
  insert into data_center.ads_dubang_analyse 
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.acc_year,
   a.pre_year
  from  data_center.ods_summary_index_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('2','7','24','29','30','33')
  and substr(a.date,6,7) <= '12';


  insert into data_center.ads_dubang_analyse 
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.acc_year,
   a.pre_year
  from  data_center.ods_summary_index_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('2','7','24','29','30','33')
  and substr(a.date,6,7) <= '12';


  -- 平均资产总额
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   '平均资产总额',
   781,
   (a.begin_balance + a.end_balance) / 20000,
   null
  from data_center.ods_asset_balance_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('78');  

  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   '平均资产总额',
   781,
   (a.begin_balance + a.end_balance) / 20000,
   null
  from data_center.ods_asset_balance_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('78');  

  -- 所有者权益;
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance /10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('155');  

  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance /10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('155'); 

  -- 负债合计;
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance /10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('126');  
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance /10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('126');  

  -- 营业净利润率（NPM）
  insert into data_center.ads_dubang_analyse
  select 
  -- a.amount_acc , b.amount_acc, a.amount_acc / b.amount_acc, a.index_code, b.index_code, a.org_code, b.org_code 
   c.org_code,
   c.org_name,
   c.level_code,
   substr(a.date,1,7) as date,
   '营业净利润率（NPM）',
   224,
   case when b.amount_acc = 0 then 0  else a.amount_acc / b.amount_acc end ,
   case when b.amount_acc_lastyear = 0 then 0  else a.amount_acc_lastyear / b.amount_acc_lastyear end
  from
  (select * from data_center.ads_dubang_analyse where index_code = '2') a 
  left join data_center.ads_orgnization c
    on a.org_code = c.org_code
  left join (select * from data_center.ads_dubang_analyse where index_code = '24') b
  on a.date = b.date
  and a.org_code = b.org_code;

  -- 权益乘数（EM）
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   '权益乘数（EM）',
   227,
   case when (1 - a.amount_acc/100) = 0 then 0 else 1 / (1 - a.amount_acc/100) end,
   case when (1 - a.amount_acc_lastyear/100 )  then 0 else  1 / (1 - a.amount_acc_lastyear/100) end
   from data_center.ads_dubang_analyse a
   left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where
  a.index_code  = 7;

  -- 资产合计
  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance / 10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_hq a
   left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('78');   

  insert into data_center.ads_dubang_analyse
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance / 10000,
   a.amount_acc_form / 10000
  from data_center.ods_asset_balance_bo a
   left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where a.index_code in ('78');   

  /**
  三公经费
  drop table data_center.ads_seven_fee_info;
  CREATE TABLE data_center.ads_seven_fee_info (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
   index_code varchar(64) comment '指标编码',
    index_name varchar(64) comment '指标名称', 
    total_last_year decimal(15, 2) comment '上年全年发生',
    annual_budget decimal(15, 2) comment '年度预算',
    total_current_month decimal(15, 2) comment '合计-本月数',
    total_year_acc decimal(15, 2) comment '合计-本年累计数',
    total_lastyear_acc decimal(15, 2) comment '合计-上年同期数'
  ) COMMENT='七项费用支出情况表-ads';

  **/
  truncate table data_center.ads_seven_fee_info;
  insert into data_center.ads_seven_fee_info
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  substr(a.date,1,7),
  a.index_code,
  a.index_name,
  a.total_last_year,
  a.annual_budget,
  a.total_current_month,
  a.total_year_acc,
  a.total_lastyear_acc
  from data_center.ods_seven_fee_info_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
    where index_code in (1,2,3,4,5,6,7,8,9,10) ;
  -- 插入总七项合并数据 index_code = 100
  insert into data_center.ads_seven_fee_info
  select 
  'GY2F00',
  '包头能源',
  '100',
  substr(a.date,1,7),
  a.index_code,
  a.index_name,
  sum(a.total_last_year),
  sum(a.annual_budget),
  sum(a.total_current_month),
  sum(a.total_year_acc),
  sum(a.total_lastyear_acc)
  from data_center.ods_seven_fee_info_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
    where index_code in (1,2,3,4,5,6,7,8,9,10) 
  group by 
  substr(a.date,1,7),
  a.index_code,
  a.index_name;
    
  update data_center.ads_seven_fee_info set index_name = '业务招待费' where index_name = '1、业务招待费';
  update data_center.ads_seven_fee_info set index_name = '车辆购置及使用费' where index_name = '2、车辆购置及使用费';
  update data_center.ads_seven_fee_info set index_name = '购置费' where index_name = '其中：购置费';
  update data_center.ads_seven_fee_info set index_name = '出国（境）经费' where index_name = '3、出国（境）经费';
  update data_center.ads_seven_fee_info set index_name = '办公费' where index_name = '4、办公费';
  update data_center.ads_seven_fee_info set index_name = '差旅费' where index_name = '5、差旅费';
  update data_center.ads_seven_fee_info set index_name = '会议费' where index_name = '6、会议费';
  update data_center.ads_seven_fee_info set index_name = '广告宣传费' where index_name = '7、广告宣传费';

  -- 新增插入三公经费的合并数据 index_code = 11
  insert into data_center.ads_seven_fee_info
  select 
  a.org_code,
  a.org_name,
  a.level_code,
  substr(a.date,1,7),
  '11',
  '三公经费合计',
  sum(a.total_last_year),
  sum(a.annual_budget),
  sum(a.total_current_month),
  sum(a.total_year_acc),
  sum(a.total_lastyear_acc)
  from data_center.ads_seven_fee_info a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
    where index_code in (1,2,5) 
  group by 
  substr(a.date,1,7),
  a.level_code,
  a.org_code,
  a.org_name;
    
  /**
  资产核心指标

   78 资产合计
   52 固定资产净值
   54 固定资产净额 - 0813补充
   50 固定资产原值
   37 流动资产
   69 非流动资产
   51 减-累计折旧
   126 - 负债合计 ： 10月23日增加指标

   drop table data_center.ads_asset_core;
   CREATE TABLE data_center.ads_asset_core (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '期末值',
    amount_acc_form decimal(15, 2) comment '同期值',
    amount_acc_begin decimal(15, 2) comment '期初值',
    rank_no varchar(16) comment '单位顺序' -- 2024-12-05 : 增加单位组织顺序
  ) COMMENT='资产核心指标';
   
  **/

  truncate table data_center.ads_asset_core;
  insert into data_center.ads_asset_core
  with asset_balance as(
   select * from data_center.ods_asset_balance_hq
    union all 
   select * from data_center.ods_asset_balance_bo
  )
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance,
   a.amount_acc_form,
   a.begin_balance,
   b.rank_no
  from asset_balance a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where index_code in ('9','27','28','29','30','31','32','37','50','51' ,'52','54','55','61','62','63','69','78','126','155')  -- 20241023：增加了两金 9 和27 应收账款和存货
  ;
  update data_center.ads_asset_core
  set index_name = '流动资产' where index_name = '流动资产合计';
  update data_center.ads_asset_core
  set index_name = '固定资产原值' where index_name = '固定资产原价';
  update data_center.ads_asset_core
  set index_name = '累计折旧' where index_name = '减：累计折旧';
  update data_center.ads_asset_core
  set index_name = '固定资产' where index_name = '固定资产净值';
  update data_center.ads_asset_core
  set index_name = '非流动资产' where index_name = '非流动资产合计';
  update data_center.ads_asset_core
  set index_name = '总资产' where index_name = '资产总计';

-- 2024-10-23 : 补充 ‘两金合计’指标
insert into data_center.ads_asset_core
select
  org_code,
  org_name,
  level_code,
  date,
  '两金合计',
  '9-27',
  sum(amount_acc),
  sum(amount_acc_form),
  sum(amount_acc_begin),
  rank_no
from data_center.ads_asset_core
where index_code in ('9','27')
group by 
  org_code,
  org_name,
  level_code,
  date,
  rank_no
  ;

  /**
   【集团汇总指标】YGL0078
   29 资产收益率 
   33 总资产周转率
   2  净利润
   24 营业总收入
   1  总利润
  【资产负债表】YZB0102
    78 资产合计
   52 固定资产净值
   
   drop table data_center.ads_asset_5_rate;
   CREATE TABLE data_center.ads_asset_5_rate (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '累计值'

  ) COMMENT='资产五率';
  **/
   
  truncate table data_center.ads_asset_5_rate;

  insert into data_center.ads_asset_5_rate
  with summary_index as(
   select * from ods_summary_index_hq
    union all 
   select * from ods_summary_index_bo
  )
  select 
   org_code,
   org_name,
   '' as level_code,
   substr(date,1,7) as date,
   index_name,
   index_code,
   acc_year,
   pre_last_year_month
  from summary_index
  where index_code in ('29','33','2','24','1');
  -- 资产收益率  29
  -- 总资产周转率 33

  -- 总资产利润率 = 净利润/总资产 
  insert into data_center.ads_asset_5_rate
  with asset_balance as(
   select * from ods_asset_balance_hq
    union all 
   select * from ods_asset_balance_bo
  ),
  summary_index as(
   select * from ods_summary_index_hq
    union all 
   select * from ods_summary_index_bo
  )
  select 
   a.org_code,
   a.org_name,
   '' as level_code,
   substr(a.date,1,7) as date,
   '总资产利润率' as index_name,
   301 as index_code,
  --  b.end_balance as end_balance, 
  --  a.acc_year as acc_year,
   case when a.acc_year = 0 then 0  
  			when b.end_balance = 0 then 0
  		else  a.acc_year * 10000 / b.end_balance end ,
   
   case when a.pre_last_year_month = 0 then 0  
  			when b.amount_acc_form = 0 then 0 
  		else  a.pre_last_year_month * 10000 / b.amount_acc_form end 
  from 
  (select * from summary_index  where index_code = '2') a    -- 2  净利润
  left join (select * from asset_balance where index_code = '78') b   -- 78 总资产
  on a.date = b.date
  and a.org_code = b.org_code;


  -- 固定资产周转率 = 营收/固定资产净值
  -- 集团汇总指标YGL0078
  -- 营业总收入
  -- index_code = 24
  -- 资产负债表
  -- YZB0102
  -- 固定资产净值-52
  insert into data_center.ads_asset_5_rate
  with asset_balance as(
   select * from ods_asset_balance_hq
    union all 
   select * from ods_asset_balance_bo
  ),
  summary_index as(
   select * from ods_summary_index_hq
    union all 
   select * from ods_summary_index_bo
  )
  select 
   a.org_code,
   a.org_name,
   '' as level_code,
   substr(a.date,1,7) as date,
   '固定资产周转率' as index_name,
   302 as index_code,
  --  b.end_balance as end_balance, 
  --  a.acc_year as acc_year,
   case when a.acc_year = 0 then 0  
  			when b.end_balance = 0 then 0
  		else  a.acc_year * 10000 / b.end_balance end ,
   
   case when a.pre_last_year_month = 0 then 0  
  			when b.amount_acc_form = 0 then 0 
  		else  a.pre_last_year_month * 10000 / b.amount_acc_form end 
  from 
  (select * from summary_index  where index_code = '24') a    -- 24  营业总收入
  left join (select * from asset_balance where index_code = '52') b   -- 52 固定资产净值
  on a.date = b.date
  and a.org_code = b.org_code;

  -- 固定资产占比 = 固定资产净值/总资产
  -- 资产负债表
  -- YZB0102
  -- 固定资产净值-52
  -- 资产负债表
  -- YZB0102
  -- 资产合计-78
  insert into data_center.ads_asset_5_rate
  with asset_balance as(
   select * from ods_asset_balance_hq
    union all 
   select * from ods_asset_balance_bo
  )
  select 
   a.org_code,
   a.org_name,
   '' as level_code,
   substr(a.date,1,7) as date,
   '固定资产占比' as index_name,
   303 as index_code,
  --  b.end_balance as end_balance, 
  --  a.acc_year as acc_year,
   case when b.end_balance = 0 then 0  else  a.end_balance / b.end_balance end ,
   case when b.amount_acc_form = 0 then 0  else  a.amount_acc_form / b.amount_acc_form end 
  from 
  (select * from asset_balance  where index_code = '52') a    -- 52 固定资产净值
  left join (select * from asset_balance where index_code = '78') b   -- 资产合计-78
  on a.date = b.date
  and a.org_code = b.org_code;


  -- 总资产报酬率 = 总利润/总资产
  -- 集团汇总指标YGL0078
  -- 总利润
  -- index_code = 1
  -- 资产负债表
  -- YZB0102
  -- 资产合计-78
  insert into data_center.ads_asset_5_rate
  with asset_balance as(
   select * from ods_asset_balance_hq
    union all 
   select * from ods_asset_balance_bo
  ),
  summary_index as(
   select * from ods_summary_index_hq
    union all 
   select * from ods_summary_index_bo
  )
  select 
   a.org_code,
   a.org_name,
   '' as level_code,
   substr(a.date,1,7) as date,
   '总资产报酬率' as index_name,
   304 as index_code,
  --  b.end_balance as end_balance, 
  --  a.acc_year as acc_year,
   case when a.acc_year = 0 then 0  
  			when b.end_balance = 0 then 0
  		else  a.acc_year * 10000 / b.end_balance end ,
   
   case when a.pre_last_year_month = 0 then 0  
  			when b.amount_acc_form = 0 then 0 
  		else  a.pre_last_year_month * 10000 / b.amount_acc_form end 
  from 
  (select * from summary_index  where index_code = '1') a    -- 1  总利润
  left join (select * from asset_balance where index_code = '78') b   -- 资产合计-78
  on a.date = b.date
  and a.org_code = b.org_code;

  /**
  设备运行情况
   drop table data_center.ads_device_running;
   CREATE TABLE data_center.ads_device_running (
   device_code varchar(64) comment '设备编码',
   device_name varchar(64) comment '设备名称',
   device_type varchar(64) comment '设备类型',
   status varchar(64) comment '设备状态',
    org_code varchar(64) comment '管理单位编码',
    org_name varchar(64) comment '管理单位名称',
   using_org_code varchar(64) comment '使用单位编码',
    using_org_name varchar(64) comment '使用单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    standard_runtime decimal(15, 2) comment '标准运行时长',
   effective_runtime decimal(15, 2) comment '有效运行时长',
   downtime decimal(15, 2) comment '停机时长',
   planned_downtime decimal(15, 2) comment '计划停机时长',
   unplanned_downtime decimal(15, 2) comment '非计划停机时长',
   fault_downtime decimal(15, 2) comment '故障停机时长'
  ) COMMENT='设备运行情况';
  **/

  /**
  资产折旧情况
  drop table data_center.ads_original_asset_value;
  CREATE TABLE data_center.ads_original_asset_value (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年累计数',
    amount_acc_lastyear decimal(15, 2) comment '去年累计数'

  ) COMMENT='资产原值折旧情况模型-ads';

  **/
  -- 2024-09-13 周五中秋前 数据治理平台的数据index_code和 报表的不一致。重新梳理的
  truncate table data_center.ads_original_asset_value;
  insert into data_center.ads_original_asset_value
  with _original_asset_value as (
   select 
    org_code,
    org_name,
    substr(date,1,7) as date,
    case 
     when index_code = 2 then '固定资产原值-年初余额' 
     when index_code = 3 then '固定资产原值-本期增加' 
     when index_code = 17 then '固定资产原值-本期减少' 
     when index_code = 25 then '固定资产原值-期末余额' 
     when index_code = 27 then '固定资产累计折旧-年初余额' 
     when index_code = 28 then '固定资产累计折旧-本期增加' 
     when index_code = 40 then '固定资产累计折旧-本期转出' 
     when index_code = 47 then '固定资产累计折旧-期末余额' 
  	 when index_code = 55 then '年/期初固定资产净值' 
     when index_code = 56 then '年/期末固定资产净值' 
     else index_name 
     end as index_name,
    index_code,
    total 
   from data_center.ods_original_asset_value_hq 
    where index_code in (2,3,17,25,27,28,40,47,55,56) 
   union all 
   select 
    org_code,
    org_name,
   substr(date,1,7) as date,
    case 
     when index_code = 2 then '固定资产原值-年初余额' 
     when index_code = 3 then '固定资产原值-本期增加' 
     when index_code = 17 then '固定资产原值-本期减少' 
     when index_code = 25 then '固定资产原值-期末余额' 
     when index_code = 27 then '固定资产累计折旧-年初余额' 
     when index_code = 28 then '固定资产累计折旧-本期增加' 
     when index_code = 40 then '固定资产累计折旧-本期转出' 
     when index_code = 47 then '固定资产累计折旧-期末余额' 
  	 when index_code = 55 then '年/期初固定资产净值' 
     when index_code = 56 then '年/期末固定资产净值' 
     else index_name 
     end as index_name,
    index_code,
    total 
   from data_center.ods_original_asset_value_bo 
  where index_code in (2,3,17,25,27,28,40,47,55,56) 

  )
  select 
  b.org_code,
  b.org_name,
  b.level_code,
  a.date,
  a.index_name,
  a.index_code,
  a.total,
  null 
  from _original_asset_value a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  ;

  /**
  资产增减情况
  2024-09-09：
  列转行，关联组织表，拆分union.
  drop table data_center.ads_asset_add_sub_column;
  CREATE TABLE data_center.ads_asset_add_sub_column (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
   asset_type varchar(64) comment '资产类型',
    amount_add decimal(15, 2) comment '增加数',
    amount_sub decimal(15, 2) comment '减少数'

  ) COMMENT='资产增减情况模型-ads-列模式';

  **/
  truncate table data_center.ads_asset_add_sub_column;
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '房屋' as asset_type,
    case when a.index_code = 3 then a.house else 0 end as amount_add,
    case when a.index_code = 17 then a.house else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3, 17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '房屋' as asset_type,
    case when a.index_code = 3 then a.house else 0 end as amount_add,
    case when a.index_code = 17 then a.house else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
   
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '构筑物' as asset_type,
    case when a.index_code = 3 then a.structure else 0 end as amount_add,
    case when a.index_code = 17 then a.structure else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '构筑物' as asset_type,
    case when a.index_code = 3 then a.structure else 0 end as amount_add,
    case when a.index_code = 17 then a.structure else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '通用设备' as asset_type,
    case when a.index_code = 3 then a.general_equipment else 0 end as amount_add,
    case when a.index_code = 17 then a.general_equipment else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '通用设备' as asset_type,
    case when a.index_code = 3 then a.general_equipment else 0 end as amount_add,
    case when a.index_code = 17 then a.general_equipment else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
   
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭井工矿专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_underground_mine_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_underground_mine_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭井工矿专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_underground_mine_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_underground_mine_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭露天矿专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_open_pit_mine_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_open_pit_mine_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭露天矿专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_open_pit_mine_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_open_pit_mine_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '电力专用设备' as asset_type,
    case when a.index_code = 3 then a.electric_power_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.electric_power_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '电力专用设备' as asset_type,
    case when a.index_code = 3 then a.electric_power_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.electric_power_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '铁路专用设备' as asset_type,
    case when a.index_code = 3 then a.railway_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.railway_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '铁路专用设备' as asset_type,
    case when a.index_code = 3 then a.railway_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.railway_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '港口行业专用设备' as asset_type,
    case when a.index_code = 3 then a.port_industry_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.port_industry_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '港口行业专用设备' as asset_type,
    case when a.index_code = 3 then a.port_industry_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.port_industry_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '航运专用设备' as asset_type,
    case when a.index_code = 3 then a.shipping_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.shipping_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '航运专用设备' as asset_type,
    case when a.index_code = 3 then a.shipping_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.shipping_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤制油化工专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_to_oil_chemical_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_to_oil_chemical_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤制油化工专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_to_oil_chemical_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_to_oil_chemical_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '洗选专用设备' as asset_type,
    case when a.index_code = 3 then a.washing_selection_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.washing_selection_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '洗选专用设备' as asset_type,
    case when a.index_code = 3 then a.washing_selection_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.washing_selection_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭深加工专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_deep_processing_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_deep_processing_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '煤炭深加工专用设备' as asset_type,
    case when a.index_code = 3 then a.coal_deep_processing_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.coal_deep_processing_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '海水淡化专用设备' as asset_type,
    case when a.index_code = 3 then a.seawater_desalination_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.seawater_desalination_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '海水淡化专用设备' as asset_type,
    case when a.index_code = 3 then a.seawater_desalination_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.seawater_desalination_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '科技环保专用设备' as asset_type,
    case when a.index_code = 3 then a.tech_environmental_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.tech_environmental_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '科技环保专用设备' as asset_type,
    case when a.index_code = 3 then a.tech_environmental_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.tech_environmental_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '医疗专用设备' as asset_type,
    case when a.index_code = 3 then a.medical_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.medical_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '医疗专用设备' as asset_type,
    case when a.index_code = 3 then a.medical_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.medical_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '井巷资产' as asset_type,
    case when a.index_code = 3 then a.tunnel_trench_assets else 0 end as amount_add,
    case when a.index_code = 17 then a.tunnel_trench_assets else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '井巷资产' as asset_type,
    case when a.index_code = 3 then a.tunnel_trench_assets else 0 end as amount_add,
    case when a.index_code = 17 then a.tunnel_trench_assets else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '弃置费用' as asset_type,
    case when a.index_code = 3 then a.disposal_costs else 0 end as amount_add,
    case when a.index_code = 17 then a.disposal_costs else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '弃置费用' as asset_type,
    case when a.index_code = 3 then a.disposal_costs else 0 end as amount_add,
    case when a.index_code = 17 then a.disposal_costs else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '其他行业专用设备' as asset_type,
    case when a.index_code = 3 then a.other_industry_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.other_industry_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '其他行业专用设备' as asset_type,
    case when a.index_code = 3 then a.other_industry_special_eq else 0 end as amount_add,
    case when a.index_code = 17 then a.other_industry_special_eq else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);

  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '合计' as asset_type,  -- 汇总 - 固定资产原值 增加 和减少的合计
    case when a.index_code = 3 then a.total else 0 end as amount_add,
    case when a.index_code = 17 then a.total else 0 end as amount_sub
  from   data_center.ods_original_asset_value_hq a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
  insert into data_center.ads_asset_add_sub_column
  select 
   b.org_code,
   b.org_name,
   b.level_code,
   a.date,
   '合计' as asset_type,  -- 厂矿 - 固定资产原值 增加 和减少的合计
    case when a.index_code = 3 then a.total else 0 end as amount_add,
    case when a.index_code = 17 then a.total else 0 end as amount_sub
  from   data_center.ods_original_asset_value_bo a
  left join data_center.ads_orgnization b
    on a.org_code = b.org_code
  where 
   a.index_code in (3,17);
   

  -- 2024-10-22 待补充YGL0102 职工福利表
  /** drop table data_center.ads_employee_benefits;
  CREATE TABLE data_center.ads_employee_benefits (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年金额',
    ratio decimal(15, 2) comment '本年占比',
    amount_acc_lastyear decimal(15, 2) comment '上年同期',
    ratio_lastyear decimal(15, 2) comment '上年占比'
  ) COMMENT='职工福利费用情况表ygl0102';
  **/

  truncate table data_center.ads_employee_benefits;
  insert into data_center.ads_employee_benefits
  with a as(
  select * from data_center.ods_employee_benefits_hq
  union all
  select * from data_center.ods_employee_benefits_bo)
  select
    c.org_code,
    c.org_name,
    c.level_code,
    a.date,
    a.index_name, 
    a.index_code,
    a.amount_acc,
    a.ratio,
    a.amount_acc_lastyear,
    a.ratio_lastyear
  from a
  left join data_center.ads_orgnization c on a.org_code = c.org_code 
  ;

  update data_center.ads_employee_benefits set date = substr(date,1,7) ;

  /**
  drop table data_center.ads_yyxjb;
  CREATE TABLE data_center.ads_yyxjb (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', -- 专项储备： 年初数（维简费、安全费）、提取数、使用数、年末数
    index_code varchar(64) comment '指标编码',
    amount_cash_month decimal(15, 2) comment '本月现金流量',
    amount_cash_year decimal(15, 2) comment '本年累计现金流量',
    amount_income_month decimal(15, 2) comment '本月营业收入',
    amount_income_year decimal(15, 2) comment '本年累计营业收入',
    amount_yyxjb_month decimal(15, 2) comment '本月营业现金比率',
    amount_yyxjb_year decimal(15, 2) comment '本年累计营业现金比率'
  ) COMMENT='营业现金比';
  **/


  truncate table data_center.ads_yyxjb;
  -- 插入汇总合并数据
  insert into data_center.ads_yyxjb
  select 
   c.org_code, 
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
    '营业现金比率',
    '1-28',
    case when substr(b.date,6,2) = '01' then b.amount_acc 
      else
       b.amount_acc - (select d.amount_acc from data_center.ods_cash_flow_hq d where d.org_code = b.org_code and d.date = substr(cast(concat(b.date,'-01') as date) + interval '-1' month,1,7) and d.index_code = '28')
       end , -- 本月现金流量
   b.amount_acc,-- 本年累计现金流量
  a.amount_month,-- 本月营业收入
  a.amount_year,-- 本年累计营业收入
    (case when substr(b.date,6,2) = '01' then b.amount_acc 
      else
       b.amount_acc - (select d.amount_acc from data_center.ods_cash_flow_hq d where d.org_code = b.org_code and d.date = substr(cast(concat(b.date,'-01') as date) + interval '-1' month,1,7) and d.index_code = '28')
       end ) / a.amount_month, -- 本月现金流量
  -- 本月营业现金比率
  case when a.amount_year = 0 then 0 else b.amount_acc / a.amount_year end -- 本年累计营业现金比率 ,现金流 / 营收
  from 
  (select * from  data_center.ods_profit_hq where index_code = '1') a
  left join 
  (select * from data_center.ods_cash_flow_hq where index_code = '28') b 
  on a.org_code = b.org_code and a.org_name = b.org_name and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

  -- 插入厂矿数据
  insert into data_center.ads_yyxjb
  select 
   c.org_code, 
   c.org_name,
   c.level_code,
   substr(a.date,1,7 ) as date,
    '营业现金比率',
    '1-28',
    case when substr(b.date,6,2) = '01' then b.amount_acc 
      else
       b.amount_acc - (select d.amount_acc from data_center.ods_cash_flow_bo d where d.org_code = b.org_code and d.date = substr(cast(concat(b.date,'-01') as date) + interval '-1' month,1,7) and d.index_code = '28')
       end , -- 本月现金流量
   b.amount_acc,-- 本年累计现金流量
  a.amount_month,-- 本月营业收入
  a.amount_year,-- 本年累计营业收入
  case when a.amount_month = 0 then 0  else
    ((case when substr(b.date,6,2) = '01' then b.amount_acc 
      else
       b.amount_acc - (select d.amount_acc from data_center.ods_cash_flow_bo d where d.org_code = b.org_code and d.date = substr(cast(concat(b.date,'-01') as date) + interval '-1' month,1,7) and d.index_code = '28')
       end ) / a.amount_month) end , -- 本月现金流量
  -- 本月营业现金比率
  case when a.amount_year = 0 then 0 else b.amount_acc / a.amount_year end -- 本年累计营业现金比率 ,现金流 / 营收
  from 
  (select * from  data_center.ods_profit_bo where index_code = '1') a
  left join 
  (select * from data_center.ods_cash_flow_bo where index_code = '28') b 
  on a.org_code = b.org_code and a.org_name = b.org_name and a.date = b.date
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;


  /** 2024-10-24   资产折旧与摊销 ybcb016
  drop table data_center.ads_dep_and_amo;
  CREATE TABLE data_center.ads_dep_and_amo (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    total_amount_lastyear decimal(15, 2) comment '去年合计',
    main_biz_cost_lastyear decimal(15, 2) comment '去年主营业务成本',
    manage_fee_lastyear decimal(15, 2) comment '去年管理费用',
    sales_fee_lastyear decimal(15, 2) comment '去年销售费用',
    other_biz_cost_lastyear decimal(15, 2) comment '去年其他业务成本',
    cip_project_lastyear decimal(15, 2) comment '去年在建工程',
    total_amount decimal(15, 2) comment '本年合计',
    main_biz_cost decimal(15, 2) comment '本年主营业务成本',
    manage_fee decimal(15, 2) comment '本年管理费用',
    sales_fee decimal(15, 2) comment '本年销售费用',
    other_biz_cost decimal(15, 2) comment '本年其他业务成本',
    cip_project decimal(15, 2) comment '本年在建工程',
    version_code varchar(64) comment '版本号',
    amount decimal(15, 2) comment '预算数'
  ) COMMENT='折旧与摊销ads';
  ***/

/** 2024-12-03 折旧与摊销预算，来自贺占军老师的线下表 
  drop table data_center.ods_budget_dep_and_amo;
  CREATE TABLE data_center.ods_budget_dep_and_amo (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    date varchar(64) comment '日期',
    year varchar(64) comment '年份',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    budget_amount decimal(15, 2) comment '本年预算数',
    budget_amount_sy decimal(15, 2) comment '本年预算-损益部分',
    act_amount decimal(15, 2) comment '本年实际',
    act_amount_sy decimal(15, 2) comment '本年实际-损益部分'
  ) COMMENT='折旧与摊销预算表-hzj';
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('GY2F00', '包头能源', '2024-10', '2024', '无形资产摊销', '3', 7563.71, 7557.71, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F02', '万利一矿', '2024-10', '2024', '无形资产摊销', '3', 3054.00, 3054.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F08', '神山露天矿', '2024-10', '2024', '无形资产摊销', '3', 85.00, 85.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F04', '水泉矿', '2024-10', '2024', '无形资产摊销', '3', 2.00, 2.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F06', '李家壕', '2024-10', '2024', '无形资产摊销', '3', 1910.00, 1910.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F00', '能源本部', '2024-10', '2024', '无形资产摊销', '3', NULL, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F01', '运销公司', '2024-10', '2024', '无形资产摊销', '3', NULL, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F05', '水泉选煤厂', '2024-10', '2024', '无形资产摊销', '3', 9.00, 9.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002305', '集装站', '2024-10', '2024', '无形资产摊销', '3', 78.46, 78.46, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F09', '洗选公司', '2024-10', '2024', '无形资产摊销', '3', 90.00, 90.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002303', '公路', '2024-10', '2024', '无形资产摊销', '3', 2329.25, 2329.25, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002302', '蒙格沁', '2024-10', '2024', '无形资产摊销', '3', 6.00, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('GY2F00', '包头能源', '2024-10', '2024', '固定资产折旧', '2', 31556.80, 31536.80, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F02', '万利一矿', '2024-10', '2024', '固定资产折旧', '2', 7856.80, 7856.80, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F08', '神山露天矿', '2024-10', '2024', '固定资产折旧', '2', 774.36, 774.36, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F04', '水泉矿', '2024-10', '2024', '固定资产折旧', '2', 290.00, 290.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F06', '李家壕', '2024-10', '2024', '固定资产折旧', '2', 16306.00, 16306.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F00', '能源本部', '2024-10', '2024', '固定资产折旧', '2', 253.64, 253.64, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F01', '运销公司', '2024-10', '2024', '固定资产折旧', '2', 38.00, 38.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F05', '水泉选煤厂', '2024-10', '2024', '固定资产折旧', '2', 10.00, 10.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002305', '集装站', '2024-10', '2024', '固定资产折旧', '2', 176.00, 176.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('2F09', '洗选公司', '2024-10', '2024', '固定资产折旧', '2', 5580.00, 5580.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002303', '公路', '2024-10', '2024', '固定资产折旧', '2', 252.00, 252.00, NULL, NULL);
INSERT INTO `data_center`.`ods_budget_dep_and_amo`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `budget_amount`, `budget_amount_sy`, `act_amount`, `act_amount_sy`) VALUES ('002302', '蒙格沁', '2024-10', '2024', '固定资产折旧', '2', 20.00, NULL, NULL, NULL);


  ***/
  truncate table data_center.ads_dep_and_amo;
  -- 20241203 : 下面关联的是预算模块
--   insert into data_center.ads_dep_and_amo
--   with ods_dep_and_amo as (
--       select * from data_center.ods_dep_and_amo_hq
--       union all
--       select * from data_center.ods_dep_and_amo_bo
--   )
--   select
--       a.org_code,
--       a.org_name,
--       c.level_code,
--       date,
--       a.index_name,
--       a.index_code,
--       a.total_amount_lastyear,
--       a.main_biz_cost_lastyear,
--       a.manage_fee_lastyear,
--       a.sales_fee_lastyear,
--       a.other_biz_cost_lastyear,
--       a.cip_project_lastyear,
--       a.total_amount,
--       a.main_biz_cost,
--       a.manage_fee,
--       a.sales_fee,
--       a.other_biz_cost,
--       a.cip_project,
--       v.version_code,
--       bud.amount
--   from ods_dep_and_amo a
--       left join data_center.ads_orgnization c
--   on a.org_code = c.org_code
--       left join ads_ys_version_info v
--       on v.year = substr(a.date,1,4)
--       left join ods_budget_operating_value bud
--       on bud.entity = a.org_code
--       and bud.years = substr(a.date,1,4)
--       and bud.version = v.version_code
--       and bud.scenario = 'NCYSS'
--       and bud.SYNTHESIS = 'ZE'
--       and bud.account = 'DJMCB04'   -- 固定资产折旧
--   where a.index_code = '2';

-- insert into data_center.ads_dep_and_amo
--   with ods_dep_and_amo as (
--       select * from data_center.ods_dep_and_amo_hq
--       union all
--       select * from data_center.ods_dep_and_amo_bo
--   )
--   select
--       a.org_code,
--       a.org_name,
--       c.level_code,
--       date,
--       a.index_name,
--       a.index_code,
--       a.total_amount_lastyear,
--       a.main_biz_cost_lastyear,
--       a.manage_fee_lastyear,
--       a.sales_fee_lastyear,
--       a.other_biz_cost_lastyear,
--       a.cip_project_lastyear,
--       a.total_amount,
--       a.main_biz_cost,
--       a.manage_fee,
--       a.sales_fee,
--       a.other_biz_cost,
--       a.cip_project,
--       v.version_code,
--       bud.amount
--   from ods_dep_and_amo a
--       left join data_center.ads_orgnization c
--   on a.org_code = c.org_code
--       left join ads_ys_version_info v
--       on v.year = substr(a.date,1,4)
--       left join ods_budget_operating_value bud
--       on bud.entity = a.org_code
--       and bud.years = substr(a.date,1,4)
--       and bud.version = v.version_code
--       and bud.scenario = 'NCYSS'
--       and bud.SYNTHESIS = 'ZE'
--       and bud.account = 'DJMCB09'   -- 无形资产摊销
--   where a.index_code = '3';

truncate table data_center.ads_dep_and_amo;
insert into data_center.ads_dep_and_amo
with ods_dep_and_amo as (
      select * from data_center.ods_dep_and_amo_hq
      union all
      select * from data_center.ods_dep_and_amo_bo
  )
  select
      a.org_code,
      a.org_name,
      c.level_code,
      a.date,
      a.index_name,
      a.index_code,
      a.total_amount_lastyear,
      a.main_biz_cost_lastyear,
      a.manage_fee_lastyear,
      a.sales_fee_lastyear,
      a.other_biz_cost_lastyear,
      a.cip_project_lastyear,
      a.total_amount,
      a.main_biz_cost,
      a.manage_fee,
      a.sales_fee,
      a.other_biz_cost,
      a.cip_project,
      '' as version_code,
      o.budget_amount * 10000
  from ods_dep_and_amo a
      left join data_center.ads_orgnization c
        on a.org_code = c.org_code
      left join ods_budget_dep_and_amo o
        on o.org_code = a.org_code 
          and o.year = substr(a.date,1,4)
          and o.index_code = a.index_code 
          ;


  /** 2024-10-24 资产处置ybcb039
  drop table data_center.ads_asset_dispose;
  CREATE TABLE data_center.ads_asset_dispose (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc_lastyear decimal(15, 2) comment '上年同期',
    amount_pre decimal(15, 2) comment '本年预算',
    amount_month decimal(15, 2) comment '本月实际',
    amount_acc decimal(15, 2) comment '本年实际'
  ) COMMENT='资产处置ads';
  ***/
  truncate table data_center.ads_asset_dispose;
  insert into data_center.ads_asset_dispose
  with asset_dispose as (
    select * from data_center.ods_asset_dispose_hq
    union all
    select * from data_center.ods_asset_dispose_bo
  ) 
  select
    a.org_code,
    a.org_name,
    c.level_code,
    date,
    a.index_name,
    a.index_code,
    a.amount_acc_lastyear,
    a.amount_pre,
    a.amount_month,
    a.amount_acc
  from asset_dispose a
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

/** 
 * 2024-12-03 资产处置-线下表 HZJ
  drop table data_center.ods_asset_dispose_offline;
  CREATE TABLE data_center.ods_asset_dispose_offline (
    org_code varchar(16) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    date varchar(16) comment '日期',
    year varchar(16) comment '年',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(32) comment '指标编码',
    plan_asset_original_value decimal(15, 2) comment '资产原值计划数',
    plan_accumulated_depreciation decimal(15, 2) comment '累计折旧（累计摊销）计划数',
    plan_asset_net_value decimal(15, 2) comment '资产净值计划数',
    plan_impairment_provision decimal(15, 2) comment '减值准备计划数',
    plan_asset_net_amount decimal(15, 2) comment '资产净额计划数',
    act_asset_original_value decimal(15, 2) comment '资产原值实际数',
    act_accumulated_depreciation decimal(15, 2) comment '累计折旧（累计摊销）实际数',
    act_asset_net_value decimal(15, 2) comment '资产净值实际数',
    act_impairment_provision decimal(15, 2) comment '减值准备实际数',
    act_asset_net_amount decimal(15, 2) comment '资产净额实际数',
    id varchar(32) comment '唯一标识ID',
    created_time varchar(32) comment '创建时间',
    updated_time varchar(32) comment '更新时间'
  ) COMMENT='资产处置-线下表 HZJ';
-- 线下表，导入的11月数据 2024-12-03
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('GY2F00', '包头能源', '2024-11', '2024', NULL, NULL, 75789.39, 59665.51, 16123.88, 11396.95, 4726.93, 10065.88, 9830.41, 235.47, NULL, 235.47);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F06', '李家壕', '2024-11', '2024', NULL, NULL, 4069.84, 3046.16, 1023.68, NULL, 1023.68, 1712.14, 1677.49, 34.65, NULL, 34.65);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F02', '万利矿', '2024-11', '2024', NULL, NULL, 59299.16, 51436.16, 7863.00, 5340.79, 2522.21, 6975.61, 6956.29, 19.32, NULL, 19.32);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F08', '神山矿', '2024-11', '2024', NULL, NULL, 1616.54, 1359.41, 257.13, 0.00, 257.13, NULL, 0.00, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F09', '洗选分公司', '2024-11', '2024', NULL, NULL, 669.28, 632.73, 36.55, 0.00, 36.55, 1378.13, 1196.63, 181.50, NULL, 181.50);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F00', '能源公司', '2024-11', '2024', NULL, NULL, 368.10, 333.94, 34.16, 0.00, 34.16, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_asset_dispose_offline`(`org_code`, `org_name`, `date`, `year`, `index_name`, `index_code`, `plan_asset_original_value`, `plan_accumulated_depreciation`, `plan_asset_net_value`, `plan_impairment_provision`, `plan_asset_net_amount`, `act_asset_original_value`, `act_accumulated_depreciation`, `act_asset_net_value`, `act_impairment_provision`, `act_asset_net_amount`) VALUES ('2F05', '水泉选煤厂', '2024-11', '2024', NULL, NULL, 9766.47, 2857.11, 6909.36, 6056.16, 853.20, NULL, NULL, NULL, NULL, NULL);
**/

/**
-- 线下的 资产处置表 2024-12-03 HZJ
drop table data_center.ads_asset_dispose_offline;
CREATE TABLE data_center.ads_asset_dispose_offline (
    org_code varchar(16) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(16) comment '日期',
    year varchar(16) comment '年份',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(32) comment '指标编码',
    plan_asset_original_value decimal(15, 2) comment '资产原值计划数',
    plan_accumulated_depreciation decimal(15, 2) comment '累计折旧（累计摊销）计划数',
    plan_asset_net_value decimal(15, 2) comment '资产净值计划数',
    plan_impairment_provision decimal(15, 2) comment '减值准备计划数',
    plan_asset_net_amount decimal(15, 2) comment '资产净额计划数',
    act_asset_original_value decimal(15, 2) comment '资产原值实际数',
    act_accumulated_depreciation decimal(15, 2) comment '累计折旧（累计摊销）实际数',
    act_asset_net_value decimal(15, 2) comment '资产净值实际数',
    act_impairment_provision decimal(15, 2) comment '减值准备实际数',
    act_asset_net_amount decimal(15, 2) comment '资产净额实际数',
    created_time varchar(32) comment '创建时间',
    updated_time varchar(32) comment '更新时间'
  ) COMMENT='资产处置-线下表 HZJ';

***/
truncate table data_center.ads_asset_dispose_offline;
insert into data_center.ads_asset_dispose_offline
select 
    a.org_code,
    a.org_name,
    c.level_code,
    a.date,
    a.`year`,
    a.index_name, 
    a.index_code,
    a.plan_asset_original_value,
    a.plan_accumulated_depreciation,
    a.plan_asset_net_value,
    a.plan_impairment_provision,
    a.plan_asset_net_amount,
    a.act_asset_original_value,
    a.act_accumulated_depreciation,
    a.act_asset_net_value,
    a.act_impairment_provision,
    a.act_asset_net_amount,
    now(),
    now()
from data_center.ods_asset_dispose_offline a
  left join data_center.ads_orgnization c
  on a.org_code = c.org_code;

/**
drop table data_center.ads_asset_dispose_offline_convert;
CREATE TABLE data_center.ads_asset_dispose_offline_convert (
    org_code varchar(16) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(16) comment '日期',
    year varchar(16) comment '年份',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(32) comment '指标编码',
    is_plan varchar(8) comment '是否计划', -- 1 是  0 否
    asset_original_value decimal(15, 2) comment '资产原值数',
    accumulated_depreciation decimal(15, 2) comment '累计折旧（累计摊销）数',
    asset_net_value decimal(15, 2) comment '资产净值数',
    impairment_provision decimal(15, 2) comment '减值准备数',
    asset_net_amount decimal(15, 2) comment '资产净额数',
    created_time varchar(32) comment '创建时间',
    updated_time varchar(32) comment '更新时间'
  ) COMMENT='资产处置-线下表-转化 HZJ';
**/
truncate table data_center.ads_asset_dispose_offline_convert;
insert into data_center.ads_asset_dispose_offline_convert
select 
    org_code,
    org_name,
    level_code,
    date,
    `year`,
    index_name, 
    index_code,
    '1', -- plan
    plan_asset_original_value,
    plan_accumulated_depreciation,
    plan_asset_net_value,
    plan_impairment_provision,
    plan_asset_net_amount,
    now(),
    now()
from data_center.ads_asset_dispose_offline ;

insert into data_center.ads_asset_dispose_offline_convert
select 
    org_code,
    org_name,
    level_code,
    date,
    `year`,
    index_name, 
    index_code,
    '0', -- 实际
    act_asset_original_value,
    act_accumulated_depreciation,
    act_asset_net_value,
    act_impairment_provision,
    act_asset_net_amount,
    now(),
    now()
from data_center.ads_asset_dispose_offline ;

/**
drop table data_center.ads_two_gold_budget;
CREATE TABLE data_center.ads_two_gold_budget (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年金额',
    amount_acc_form decimal(15, 2) comment '去年金额',
    amount_acc_begin decimal(15, 2) comment '年初金额',
    account varchar(64) comment '科目',
    amount decimal(15, 2) comment '预算值',
    ac_rate decimal(15, 2) comment '预算完成率',
    version_code  varchar(64) comment '版本',
    rank_no varchar(16) comment '组织单位顺序',
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='两金预算模型';
  **/
  truncate table data_center.ads_two_gold_budget;
  insert into ads_two_gold_budget
  select asset.org_code,
          asset.org_name,
          asset.level_code,
          asset.date,
          asset.index_name,
          asset.index_code,
          asset.amount_acc,
          asset.amount_acc_form,
          asset.amount_acc_begin,
          bud.ACCOUNT,
          bud.AMOUNT,
          (case when bud.AMOUNT = 0 then null else asset.amount_acc / bud.AMOUNT end ) ac_rate ,
          v.version_code,
          asset.rank_no,
          now(),
          now()
    from ads_asset_core asset
    left join ads_ys_version_info v   -- 2024-11-25 : flag 1 是 集团报送版本
        on v.year = substr(asset.date,1,4)
    left join ods_budget_operating_value  bud 
        on asset.org_code = (case when bud.ENTITY like '23%' then concat('00', bud.ENTITY) else bud.ENTITY end ) 
        and bud.years = substr(asset.date,1,4) 
        and bud.VERSION = v.version_code  -- 版本
            and bud.account  = 
            (case 
                when asset.index_name =  '应收账款' then   'LJINHJ02'
                when asset.index_name =  '存货' then 'LJINLB'
                when asset.index_name =  '其中：原材料' then  'LJINLB1'
                when asset.index_name =  '其中：煤炭' then  'LJINLB2'
                when asset.index_name =  '两金合计' then  'LJINHJ'
                else  ''  end )
            and bud.SCENARIO = 'Budget';


  /**
  -- 福利费预算模型
  drop table data_center.ads_emp_benefit_budget;
  CREATE TABLE data_center.ads_emp_benefit_budget (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    amount_acc decimal(15, 2) comment '本年金额',
    ratio decimal(15, 2) comment '本年占比',
    amount_acc_lastyear decimal(15, 2) comment '上年同期',
    ratio_lastyear decimal(15, 2) comment '上年占比',
    account varchar(64) comment '科目',
    amount decimal(15, 2) comment '预算数值',
    ac_rate decimal(15, 2) comment '预算完成率',
    version_code  varchar(64) comment '版本',
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='职工福利费预算表';

  **/ 
  /**
   2024-10-30 晚： 在同步福利费预算表之前，需要把人均职工福利费 0102表的第22行指标，需要进行计算好。   
  **/
  delete from ods_empwelf_detail_value where account = 'RJZGFLF';
  insert into ods_empwelf_detail_value
    select
      a.entity ,
      'RJZGFLF',
      a.currency,
      a.years,
      a.period,
      a.version,
      a.scenario,
      a.sjfl,
      a.zcw,
      a.industry,
      a.type,
      a.synthesis,
      a.bywy,
      a.bywe,
      a.byws,
      a.amount / (select b.amount from ods_empwelf_detail_value b 
      where b.entity = a.entity 
          and b.years = a.years 
          and b.version = a.version 
          and b.account = 'QNPJZGRS'  -- 全年平均职工人数
          and b.scenario = 'Budget' 
        ),   --  
      RAND() * 10000000
    from ods_empwelf_detail_value a
    where a.account = 'ZGFLFHJ';  -- 职工福利费合计

  truncate table ads_emp_benefit_budget;
  insert into ads_emp_benefit_budget
  select emp.org_code,
          emp.org_name,
          emp.level_code,
          emp.date,
          emp.index_name,
          emp.index_code,
          emp.amount_acc,
          emp.ratio,
          emp.amount_acc_lastyear,
          emp.ratio_lastyear,
          bud.ACCOUNT,
          bud.AMOUNT ,
          (case when bud.AMOUNT = 0 then null else emp.amount_acc / bud.AMOUNT end ) ac_rate ,
          v.version_code,
          now(),
          now()
    from ads_employee_benefits emp
    left join ads_ys_version_info v
        on v.year = substr(emp.date,1,4)
    left join ods_empwelf_detail_value bud 
        on emp.org_code  = (case when bud.ENTITY like '23%' then concat('00', bud.ENTITY) else bud.ENTITY end ) 
        and bud.years = substr(emp.date,1,4) 
        and bud.VERSION = v.version_code  -- 版本
          --  and synthesis = 'ZE'   -- 综合
            and bud.account  = 
            (case 
                when emp.index_name =  '合计' then   'ZGFLFHJ'
                when emp.index_name =  '食堂经费' then 'ZGFLFHJ01'
                when emp.index_name =  '供暖费补贴' then  'ZGFLFHJ02'
                when emp.index_name =  '离退休人员统筹外费用' then  'ZGFLFHJ03'
                when emp.index_name =  '职工医疗卫生费' then   'ZGFLFHJ04'
                when emp.index_name =  '集体福利部门费用' then 'ZGFLFHJ05'
                when emp.index_name =  '防暑降温费' then  'ZGFLFHJ07'
                -- when emp.index_name =  '未实行货币化改革的交通、住房、通讯待遇' then  ''
                when emp.index_name =  '职工困难补助' then  'ZGFLFHJ08'
                when emp.index_name =  '抚恤费' then   'ZGFLFHJ10'
                when emp.index_name =  '探亲假路费' then 'ZGFLFHJ11'
                when emp.index_name =  '独生子女费' then  'ZGFLFHJ12'
                when emp.index_name =  '职工异地安家费' then  'ZGFLFHJ13'
                when emp.index_name =  '丧葬补助费' then  'ZGFLFHJ14'
                when emp.index_name =  '其他支出' then   'ZGFLFHJ15'
                when emp.index_name =  '其中：租房补贴' then 'ZGFLFHJ1501'
                when emp.index_name =  '职工奖励及福利基金' then  'ZGFLFHJ1502'
                when emp.index_name =  '职工福利费比例' then  'ZGFLFBL'
                when emp.index_name =  '全年平均职工人数' then  'QNPJZGRS'
                when emp.index_name =  '人均职工福利费（元/人）' then  'RJZGFLF'
                else  ''  end )
            and SCENARIO = 'Budget';
    update ads_emp_benefit_budget set amount = amount * 100 where index_name = '职工福利费比例';

  /**
  drop table data_center.ads_coal_produce_other_fee;
  CREATE TABLE data_center.ads_coal_produce_other_fee (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    unit_last_year decimal(15, 2) comment '单位成本上年同期',
    unit_budget decimal(15, 2) comment '单位成本本年预算',
    unit_month decimal(15, 2) comment '单位成本本月实际',
    unit_acc decimal(15, 2) comment '单位成本本年实际',
    cost_last_year decimal(15, 2) comment '总成本上年同期',
    cost_budget decimal(15, 2) comment '总成本本年预算',
    cost_month decimal(15, 2) comment '总成本本月实际',
    cost_acc decimal(15, 2) comment '总成本本年实际',
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='煤炭制造费用－ads其他支出明细表';
  **/
  truncate table data_center.ads_coal_produce_other_fee;
  insert into data_center.ads_coal_produce_other_fee
  select
    b.org_code,
    b.org_name,
    b.level_code,
    substr(a.date,1,7),
    a.index_name,
    a.index_code,
    a.unit_last_year,
    a.unit_budget,
    a.unit_month,
    a.unit_acc,
    a.cost_last_year,
    a.cost_budget,
    a.cost_month,
    a.cost_acc,
    now(),
    now()
  from 
  ods_coal_produce_other_fee_bo a
  left join data_center.ads_orgnization b
    on b.org_code = a.org_code;

  /**
    2024-11-24 ：EBITDA 的预算考核
  drop table data_center.ads_ebitda_model;
  CREATE TABLE data_center.ads_ebitda_model (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    year varchar(64) comment '年份',
    month varchar(64) comment '月份 ',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(64) comment '指标编码',
    total_amount decimal(15, 2) comment '本年累计数',
    amount_month decimal(15, 2) comment '本月数',
    amount_pre decimal(15, 2) comment '年度预算数',
    amount_month_pre decimal(15, 2) comment '月度预算',
    version_name varchar(64) comment '版本名称',
    version_code varchar(64) comment '版本编码',
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='EBITDA－ads表';
  **/ 
  truncate table data_center.ads_ebitda_model;
  insert into data_center.ads_ebitda_model
  select 
    a.org_code,
    a.org_name,
    a.level_code,
    a.date,
    substr(a.date,1,4),
    substr(a.date,6,2),
    a.index_name,
    a.index_code,
    a.amount_acc,
    a.amount_month,
    a.amount_pre,
    a.amount_month_pre,
    v.version_name,
    v.version_code,
    now() as created_time,
    now() as updated_time
  from data_center.ads_coal_cockpit_month_1  a
  left join data_center.ads_ys_version_info v
  on v.year = substr(a.date,1,4)
  where index_code in ( '75' , '58');  -- 75 利润总额 58 利息支出 ，即财务费用指标

  insert into data_center.ads_ebitda_model
  select
    b.org_code,
    b.org_name,
    b.level_code,
    a.date,
    substr(a.date,1,4),
    substr(a.date,6,2),
    a.index_name,
    a.index_code,
    a.total_amount / 10000,
    ( a.total_amount - t.last_amount ) /10000 as amount_month, -- 月度数据
    bud.amount / 10000  as amount_pre, -- 预算
    bud.amount / 12 / 10000 as amount_month_pre, -- 月度预算
    v.version_name,
    v.version_code,
    now() as created_time,
    now() as updated_time
  from 
    (
      select * from data_center.ods_dep_and_amo_hq
      union all
      select * from data_center.ods_dep_and_amo_bo
    ) a
    left join (
      select 
        tmp.org_code,tmp.org_name,tmp.index_name,tmp.index_code,tmp.date,tmp.total_amount,
        total_amount as last_amount,
        substr(cast(concat(date,'-01') as date) + interval '1' month,1,7)  as last_date 
      from 
          (
            select * from data_center.ods_dep_and_amo_hq
            union all
            select * from data_center.ods_dep_and_amo_bo
          ) tmp
          where substr(tmp.date,6,2) <> '12' -- 2024-11-24 ,把当前数据向后移动一个月，eg.把 11月数据变成了12月，同时要把12月原始数据去掉
    ) t
      on t.org_code = a.org_code
        and t.last_date = a.date
        and t.index_code = a.index_code
    left join data_center.ads_orgnization b
      on a.org_code = b.org_code
    left join data_center.ads_ys_version_info v
      on v.year = substr(a.date,1,4)
    left join ods_budget_operating_value bud
      on bud.entity = a.org_code
        and bud.years = substr(a.date,1,4)
        and bud.version = v.version_code
        and bud.scenario = 'NCYSS'
        and bud.SYNTHESIS = 'ZE'
        and bud.account = 'DJMCB04'   -- 固定资产折旧
  where a.index_code = '2'
  ;   -- 固定资产折旧

  insert into data_center.ads_ebitda_model
  select
    b.org_code,
    b.org_name,
    b.level_code,
    a.date,
    substr(a.date,1,4),
    substr(a.date,6,2),
    a.index_name,
    a.index_code,
    a.total_amount / 10000,
    ( a.total_amount - t.last_amount ) / 10000 as amount_month, -- 月度数据
    bud.amount / 10000  as amount_pre, -- 预算
    bud.amount / 12 / 10000  as amount_month_pre, -- 月度预算
    v.version_name,
    v.version_code,
    now() as created_time,
    now() as updated_time
  from 
    (
      select * from data_center.ods_dep_and_amo_hq
      union all
      select * from data_center.ods_dep_and_amo_bo
    ) a
    left join (
      select 
        tmp.org_code,tmp.org_name,tmp.index_name,tmp.index_code,tmp.date,tmp.total_amount,
        total_amount as last_amount,
        substr(cast(concat(date,'-01') as date) + interval '1' month,1,7)  as last_date 
      from 
          (
            select * from data_center.ods_dep_and_amo_hq
            union all
            select * from data_center.ods_dep_and_amo_bo
          ) tmp
          where substr(tmp.date,6,2) <> '12' -- 2024-11-24 ,把当前数据向后移动一个月，eg.把 11月数据变成了12月，同时要把12月原始数据去掉
    ) t
      on t.org_code = a.org_code
        and t.last_date = a.date
        and t.index_code = a.index_code
    left join data_center.ads_orgnization b
      on a.org_code = b.org_code
    left join data_center.ads_ys_version_info v
      on v.year = substr(a.date,1,4)
    left join ods_budget_operating_value bud
      on bud.entity = a.org_code
        and bud.years = substr(a.date,1,4)
        and bud.version = v.version_code
        and bud.scenario = 'NCYSS'
        and bud.SYNTHESIS = 'ZE'
        and bud.account = 'DJMCB09'   -- 无形资产摊销
  where a.index_code = '3'
  ;   -- 无形资产摊销

  insert into data_center.ads_ebitda_model
  select 
    org_code,
    org_name,
    level_code,
    date,
    year,
    month,
    'EBITDA_合计',
    'ebitda',
    sum(total_amount),
    sum(amount_month),
    sum(amount_pre),
    sum(amount_month_pre),
    version_name,
    version_code,
    now() ,
    now() 
  from data_center.ads_ebitda_model  a
  group by
  org_code,
  org_name,
  level_code,
  date,
  year,
  month,
  version_name,
  version_code
  ;

  /**      两金压控 2024-12-04   **/

  /**
   -- 两金压控下面的表格数据
  drop table data_center.dws_two_gold_control;
  CREATE TABLE data_center.dws_two_gold_control (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    date varchar(64) comment '日期',
    index_name varchar(64) comment '指标名称', 
    index_code varchar(16) comment '指标编码',
    end_balance decimal(15, 2) comment '期末余额',
    amount_acc_form decimal(15, 2) comment '去年同期',
    begin_balance decimal(15, 2) comment '年初余额',
    version_code varchar(16) comment '版本号',
    account varchar(16) comment '科目',
    scenario varchar(16) comment '业务',
    synthesis varchar(16) comment '综合',
    amount decimal(15, 2) comment '预算数值',
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='dws-两金压控预算表';
  **/
-- 两金 应收账款和存货 , 资产负债表中的 15， 27 指标
truncate table dws_two_gold_control;
insert into dws_two_gold_control
select
    a.*,
    v.version_code,
    b.account,
    b.scenario,
    b.synthesis,
    b.amount,
    now(),
    now()
  from (
      select * from ods_asset_balance_hq where index_code in (15,27,28,31)    -- 应收账款净额、存货、原材料、煤炭 
      union all 
      select * from ods_asset_balance_bo where index_code in (15,27,28,31)  
  ) a
  left join (select * from ads_index_code_account_ref where table_name = 'YZB0102' AND exclude is null)   r 
      on r.origin_index_code = a.index_code
  left join ads_ys_version_info v
      on v.year =  substr(a.date,1,4)
  left join (select * from ods_budget_operating_value where scenario = 'Budget' ) b  -- 两金的 synthesis 是LJINZMYE
      on b.ENTITY = a.org_code
      and b.account = r.account
      and b.synthesis = r.synthesis
      and b.version = v.version_code
      and b.YEARS = v.year
  ;

insert into dws_two_gold_control
  select
    org_code,
    org_name,
    date,
    '两金合计',
    'LJHJ',  -- index_code
    sum(end_balance),
    sum(amount_acc_form),
    sum(begin_balance),
    version_code,
    '',
    '',
    '',
    sum(amount),
    now(),
    now()
  from dws_two_gold_control
  where index_code in (15,27)
  group by
    org_code,
    org_name,
    date,
    version_code
    -- account,
    -- scenario,
    -- synthesis
    ;

  /**
  drop table data_center.ads_two_gold_control_convert;
  CREATE TABLE data_center.ads_two_gold_control_convert (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    level_code varchar(64) comment '权限预留',
    date varchar(64) comment '日期',
    ljhj_total_amount decimal(15, 2) comment '两金合计实际值',
    ljhj_pre decimal(15, 2) comment '两金合计预算值',
    ch_total_amount decimal(15, 2) comment '存货实际值',
    ch_pre decimal(15, 2) comment '存货预算值',
    ycl_total_amount decimal(15, 2) comment '原材料实际值',
    ycl_pre decimal(15, 2) comment '原材料预算值',
    kcm_total_amount decimal(15, 2) comment '库存煤实际值',
    kcm_pre decimal(15, 2) comment '库存煤预算值',
    yszk_total_amount decimal(15, 2) comment '应收账款实际值',
    yszk_pre decimal(15, 2) comment '应收账款预算值',
    version_code varchar(16) comment '版本',
    rank_no varchar(16) comment '单位顺序',
    group_flag varchar(1) comment '分组标志', -- 1 ： 经过group处理后的数据 0 ： 未经group处理的数据
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='ads-两金压控预算表-转置';
  **/
truncate table ads_two_gold_control_convert ;
insert into ads_two_gold_control_convert
  (`org_code`,`org_name`,`level_code`,`date`,`ljhj_total_amount`,`ljhj_pre`,`version_code`,`rank_no`,`group_flag`,`created_time`,`updated_time`)
  select
      b.org_code,
      b.org_name,
      b.level_code,
      a.date,
      a.end_balance,
      a.amount,
      a.version_code,
      b.rank_no,
      '0',
      now(),
      now()
    from dws_two_gold_control a
    left join ads_orgnization b
      on b.org_code  = a.org_code
    where a.index_code  = 'LJHJ'  -- 两金合计总值
  ;
  insert into ads_two_gold_control_convert
  (`org_code`,`org_name`,`level_code`,`date`,`ch_total_amount`,`ch_pre`,`version_code`,`rank_no`,`group_flag`,`created_time`,`updated_time`)
  select
      b.org_code,
      b.org_name,
      b.level_code,
      a.date,
      a.end_balance,
      a.amount,
      a.version_code,
      b.rank_no,
      '0',
      now(),
      now()
    from dws_two_gold_control a
    left join ads_orgnization b
      on b.org_code  = a.org_code
    where a.index_code  = '27'  -- 存货
  ;
  insert into ads_two_gold_control_convert
  (`org_code`,`org_name`,`level_code`,`date`,`ycl_total_amount`,`ycl_pre`,`version_code`,`rank_no`,`group_flag`,`created_time`,`updated_time`)
  select
      b.org_code,
      b.org_name,
      b.level_code,
      a.date,
      a.end_balance,
      a.amount,
      a.version_code,
      b.rank_no,
      '0',
      now(),
      now()
    from dws_two_gold_control a
    left join ads_orgnization b
      on b.org_code  = a.org_code
    where a.index_code  = '28'  -- 原材料
  ;
  insert into ads_two_gold_control_convert
  (`org_code`,`org_name`,`level_code`,`date`,`kcm_total_amount`,`kcm_pre`,`version_code`,`rank_no`,`group_flag`,`created_time`,`updated_time`)
  select
      b.org_code,
      b.org_name,
      b.level_code,
      a.date,
      a.end_balance,
      a.amount,
      a.version_code,
      b.rank_no,
      '0',
      now(),
      now()
    from dws_two_gold_control a
    left join ads_orgnization b
      on b.org_code  = a.org_code
    where a.index_code  = '31'  -- 库存煤
  ;
  insert into ads_two_gold_control_convert
  (`org_code`,`org_name`,`level_code`,`date`,`yszk_total_amount`,`yszk_pre`,`version_code`,`rank_no`,`group_flag`,`created_time`,`updated_time`)
  select
      b.org_code,
      b.org_name,
      b.level_code,
      a.date,
      a.end_balance,
      a.amount,
      a.version_code,
      b.rank_no,
      '0',
      now(),
      now()
    from dws_two_gold_control a
    left join ads_orgnization b
      on b.org_code  = a.org_code
    where a.index_code  = '15'  -- 应收账款
  ;

  insert into ads_two_gold_control_convert
  select
      org_code,
      org_name,
      level_code,
      date,
      sum(ljhj_total_amount) ,
      sum(ljhj_pre) ,
      sum(ch_total_amount) ,
      sum(ch_pre) ,
      sum(ycl_total_amount) ,
      sum(ycl_pre) ,
      sum(kcm_total_amount) ,
      sum(kcm_pre) ,
      sum(yszk_total_amount) ,
      sum(yszk_pre) ,
      version_code,
      rank_no,
      '1',
      now(),
      now()
  from ads_two_gold_control_convert
  group by
      org_code,
      org_name,
      level_code,
      date,
      version_code,
      rank_no
  ;
-- 删除之前的单条数据，时间限定 为 3分钟以前
-- delete from ads_two_gold_control_convert where created_Time  < DATE_SUB(NOW(), INTERVAL 3 MINUTE);
delete from ads_two_gold_control_convert where group_flag  = '0';

  /**
  -- 营收增长率和两金增长率的对比数据
  drop table data_center.ads_two_gold_growth_rate;
  CREATE TABLE data_center.ads_two_gold_growth_rate (
    org_code varchar(64) comment '单位编码',
    org_name varchar(64) comment '单位名称',
    date varchar(64) comment '日期',
    level_code varchar(64) comment '权限预留',
    yysr_growth_rate decimal(15, 2) comment '营业收入增长率',
    two_gold_growth_rate decimal(15, 2) comment '两金增长率',
    version_code varchar(16) comment '版本号',
    rank_no varchar(16) comment '单位顺序',
    group_flag varchar(1) comment '分组标志', -- 1 ： 经过group处理后的数据 0 ： 未经group处理的数据
    created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
    updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
  ) COMMENT='ads-营收两金增长率对比表';
  **/
-- 插入营收增长率数据
truncate table data_center.ads_two_gold_growth_rate;
insert into data_center.ads_two_gold_growth_rate
  with a as (
    select * from ods_coal_produce_hq where index_code  = '1'
      union all 
    select * from ods_coal_produce_bo where index_code  = '1'
  )
  select 
    b.org_code,
    b.org_name,
    a.date, 
    b.level_code,
    case when a.total_amount_acc_lastyear = 0 then 0 else a.total_amount_vs_lastyear / a.total_amount_acc_lastyear end,
    null,
    v.version_code,
    b.rank_no,
    '0',
    now() ,
    now()
  from a 
  left join ads_orgnization b on b.org_code = a.org_code
  left join ads_ys_version_info v on v.year = substr(a.date,1,4)
  ;

-- 插入两金增长率数据
insert into data_center.ads_two_gold_growth_rate
select
    a.org_code,
    a.org_name,
    a.date,
    a.level_code,
    null,
    (a.ljhj_total_amount - a.ljhj_pre ) / a.ljhj_pre,
    a.version_code,
    a.rank_no,
    '0',
    now() ,
    now()
from data_center.ads_two_gold_control_convert a
where  a.org_code in (
    select org_code from ads_asset_core
    where index_code  = '27' and amount_acc != 0  and date  = a.date
    )
group by
    a.org_code,
    a.org_name,
    a.date,
    a.level_code,
    a.version_code
  ;

-- 插入合计值
insert into data_center.ads_two_gold_growth_rate
  select
      org_code,
      org_name,
      date,
      level_code,
      sum(yysr_growth_rate),
      sum(two_gold_growth_rate),
      version_code,
      rank_no,
      '1',
      now(),
      now()
  from ads_two_gold_growth_rate
  group by
      org_code,
      org_name,
      date,
      level_code,
      version_code,
      rank_no
  ;
delete from data_center.ads_two_gold_growth_rate where group_flag  = '0';

/**
2024-12-6 : 新增加的 资产负债分析模型， 替换自助ETL的 资产负债转化表
  drop table data_center.ads_asset_balance_analyse;
  CREATE TABLE data_center.ads_asset_balance_analyse (
                                                         org_code varchar(64) comment '单位编码',
                                                         org_name varchar(64) comment '单位名称',
                                                         level_code varchar(64) comment '权限预留',
                                                         date varchar(64) comment '日期',
                                                         index_name varchar(64) comment '指标名称',
                                                         index_code varchar(64) comment '指标编码',
                                                         total_amount_acc decimal(15, 2) comment '78总资产',
                                                         balance_amount_acc decimal(15, 2) comment '126总负债',
                                                         rank_no varchar(16) comment '单位顺序', -- 2024-12-05 : 增加单位组织顺序
                                                         created_time varchar(64) comment '创建时间',
                                                         updated_time varchar(64) comment '更新时间'
  ) COMMENT='资产负债分析-ads';
**/
  truncate table data_center.ads_asset_balance_analyse;
  insert into data_center.ads_asset_balance_analyse
  with asset_balance as(
      select * from data_center.ods_asset_balance_hq
      union all
      select * from data_center.ods_asset_balance_bo
  )
  select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance as total_amount_acc,
	 0 as balance_amount_acc,
   b.rank_no,
	 now(),
	 now()
  from asset_balance a
      left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in ('78')  -- 78 总资产
  ;
  insert into data_center.ads_asset_balance_analyse
  with asset_balance as(
      select * from data_center.ods_asset_balance_hq
      union all
      select * from data_center.ods_asset_balance_bo
  )
  select
      b.org_code,
      b.org_name,
      b.level_code,
      substr(a.date,1,7) as date,
   a.index_name,
   a.index_code,
   a.end_balance as total_amount_acc,
	 0 as balance_amount_acc,
   b.rank_no,
	 now(),
	 now()
  from asset_balance a
      left join data_center.ads_orgnization b
  on a.org_code = b.org_code
  where a.index_code in ('126')  -- 126 总负债
  ;
/**
资产全寿命成本LCC
drop table data_center.ads_asset_lcc;
CREATE TABLE data_center.ads_asset_lcc (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  investment_cost decimal(15, 2) comment '投入成本',
 operating_cost decimal(15, 2) comment '运行成本',
 maintenance_cost decimal(15, 2) comment '维修成本',
 disposal_cost decimal(15, 2) comment '处置成本',
 purchase_fee decimal(15, 2) comment '购置费',
 debugging_fee decimal(15, 2) comment '安装调试费',
 inspection_fee decimal(15, 2) comment '检验检测费',
 insurance_fee decimal(15, 2) comment '保险费',
 labor_fee decimal(15, 2) comment '维修人工费',
 material_fee decimal(15, 2) comment '维修材料费',
 other_fee decimal(15, 2) comment '维修其他费用',
 outsourced_maintenance_fee decimal(15, 2) comment '委外维修费用',
  disposal_expenditure decimal(15, 2) comment '处置支出'

) COMMENT='资产全寿命成本lcc-ads';

**/
truncate table data_center.ads_asset_lcc;
insert into data_center.ads_asset_lcc
with asset_lcc as (select *
                   from data_center.ods_asset_lcc_hq
                   union all
                   select *
                   from data_center.ods_asset_lcc_bo)
select *
from asset_lcc;

/**
重点设备使用情况
2024-09-10：增加设备类型编号以及设备类型编码。
drop table data_center.ads_key_equipment;
CREATE TABLE data_center.ads_key_equipment (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  device_type_no varchar(64) comment '设备类型编码',
 device_type_name varchar(64) comment '设备类型名称',
 device_name varchar(64) comment '设备名称',
 is_key  varchar(64) comment '是否重点设备',
 serial_no varchar(64) comment '规格型号',
  cnt decimal(15, 2) comment '数量',
 manufacture varchar(64) comment '厂家',
 purchase_time varchar(64) comment '采购时间',
 total_coal_amount decimal(15, 2) comment '总过煤量/循环次数',
 original_value decimal(15, 2) comment '原值（万元）',
 accumulated_depreciation decimal(15, 2) comment '累计折旧（万元）',
 net_value decimal(15, 2) comment '净值（万元）',
 location varchar(64) comment '使用地点',
 statistics_time varchar(64) comment '统计时间',
 `status` varchar(64) comment '状态',
 scrap_time varchar(64) comment '报废时间',
 depreciation_life_years decimal(15, 2) comment '设备折旧年限（年）',
 design_lifetime_years decimal(15, 2) comment '设计寿命（年）',
 actual_usage_years decimal(15, 2) comment '实际使用年限（年）'

) COMMENT='重点设备情况-ads';

**/

truncate table data_center.ads_key_equipment;
INSERT INTO data_center.ads_key_equipment
SELECT a.org_code,
       a.org_name,
       c.level_code,
       case when a.device_type not like '00%' then '0099' else b.device_type_no end,
       case when a.device_type not like '00%' then '其他' else b.device_type_name end,
       a.device_name,
       '' as is_key,
       a.serial_no,
       a.cnt,
       a.manufacture,
       a.purchase_time,
       a.total_coal_amount,
       a.original_value,
       a.accumulated_depreciation,
       a.net_value,
       a.location,
       a.statistics_time,
       a.status,
       a.scrap_time,
       a.depreciation_life_years,
       a.design_lifetime_years,
       a.actual_usage_years
FROM data_center.ods_key_equipment a
         left join data_center.ads_device_type b on a.device_type = b.device_type_no
         left join data_center.ads_orgnization c on a.org_code = c.org_code;

update data_center.ads_key_equipment
set is_key = 'N';
update data_center.ads_key_equipment
set is_key = 'Y'
where original_value >= 1000 * 10000;
UPDATE data_center.ads_key_equipment
set statistics_time = substr(now() + interval '-1' month, 1, 7);

-- update data_center.ads_key_equipment set device_type = concat('00',device_type);
update data_center.ads_key_equipment
set level_code = '1006'
where org_name = '李家壕煤矿';
update data_center.ads_key_equipment
set level_code = '1002'
where org_name = '万利一矿';

-- 重点设备的包头能源汇总合并数据。 20240930
insert into data_center.ads_key_equipment
select 'GY2F00'                      as org_code,
       '包头能源'                    as org_name,
       '100'                         as level_code,
       device_type_no,
       device_type_name,
       device_name,
       ''                            as is_key,
       ''                            as serial_no,
       sum(cnt)                      as cnt,
       ''                            as manufacture,
       ''                            as purchase_time,
       null                          as total_coal_amount,
       sum(original_value)           as original_value,
       sum(accumulated_depreciation) as accumulated_depreciation,
       sum(net_value)                as net_value,
       ''                            as locatino,
       statistics_time,
       status,
       scrap_time,
       null                          as depreciation_life_years,
       null                          as design_lifetime_years,
       null                          as actual_usage_years
from ads_key_equipment
group by device_type_no,
         device_type_name,
         device_name,
         accumulated_depreciation,
         statistics_time,
         status,
         scrap_time;

/**
区队模型--一级页面
drop table data_center.ads_qudui_model ;
CREATE TABLE data_center.ads_qudui_model (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  cwfl_name varchar(64) comment '财务分类名称',
 scale varchar(64) comment '规格',
  unit varchar(64) comment '单位',
 dept_id varchar(64) comment '部门ID',
  dept_name varchar(64) comment '部门名称',
 remain decimal(24,4) comment '剩余数量',
  price decimal(24,4) comment '单价',
 report_date varchar(64) comment '统计时间'
) COMMENT='区队库存模型-ads';

**/

-- truncate table data_center.ads_qudui_model;
delete
from data_center.ads_qudui_model
where report_date = substr(now() + interval '-1' month, 1, 7);
insert into data_center.ads_qudui_model
select a.cl_no,
       a.cl_name,
       b.cwfl_name,
       a.scale,
       a.unit,
       a.dept_id,
       a.dept_name,
       a.remain,
       a.price,
       substr(now() + interval '-1' month, 1, 7) as report_date
from data_center.qd_kc_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

/**
周转库--一级页面
drop table data_center.ads_zhouzhuan_model ;
CREATE TABLE data_center.ads_zhouzhuan_model (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  cwfl_name varchar(64) comment '财务分类名称',
 scale varchar(64) comment '规格',
  unit varchar(64) comment '单位',
 dept_id varchar(64) comment '部门ID',
  dept_name varchar(64) comment '部门名称',
 remain decimal(24,4) comment '剩余数量',
  price decimal(24,4) comment '单价',
 report_date varchar(64) comment '统计时间'
) COMMENT='周转库存模型-ads';


**/


-- truncate table data_center.ads_zhouzhuan_model;
delete
from data_center.ads_zhouzhuan_model
where report_date = substr(now() + interval '-1' month, 1, 7);
insert into data_center.ads_zhouzhuan_model
select a.cl_no,
       a.cl_name,
       b.cwfl_name,
       a.scale,
       a.unit,
       a.dept_id,
       a.dept_name,
       a.remain,
       a.price,
       substr(now() + interval '-1' month, 1, 7) as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;


/**
*  2024-10-22 : 根据 设备表里的数据来生成 设备类型表。
**/

-- truncate table ads_device_type;
-- insert into ads_device_type
-- select distinct device_type_no , SUBSTRING_INDEX(device_type_name,'-',-1) ,'1'
-- from ads_key_equipment;

-- insert into ads_device_type value ('1400000000','全部','1');

/**
区队库库存明细

drop table data_center.ads_qudui_kc_detail;
CREATE TABLE data_center.ads_qudui_kc_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  remain decimal(15, 2) comment '库存量',
  price decimal(15, 2) comment '单价',
  unit varchar(64) comment '计量单位',
  dept_id varchar(64) comment '部门ID',
  dept_name varchar(64) comment '部门名称',
	cwfl_name varchar(64) comment '财务分类'
) COMMENT='区队库库存明细-二级页面';
**/
truncate table data_center.ads_qudui_kc_detail;
insert into data_center.ads_qudui_kc_detail
SELECT a.cl_no,
       a.cl_name,
       a.scale,
       sum(a.remain) as remain,
       a.price,
       a.unit,
       a.dept_id,
       a.dept_name,
       b.cwfl_name
FROM data_center.qd_kc_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no
group by a.cl_no,
         a.cl_name,
         a.scale,
         a.price,
         a.unit,
         a.dept_id,
         a.dept_name,
         b.cwfl_name
;


/**
区队库入库明细

drop table data_center.ads_qudui_in_detail;
CREATE TABLE data_center.ads_qudui_in_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  input decimal(15, 2) comment '入库量',
  price decimal(15, 2) comment '单价',
  amount decimal(15, 2) comment '金额', 
  cwfl_name varchar(64) comment '财务分类',
  sdate varchar(64) comment '日期',
  qd_name varchar(64) comment '区队名称'
) COMMENT='区队库入库明细-二级页面';
**/
truncate table data_center.ads_qudui_in_detail;
insert into data_center.ads_qudui_in_detail
SELECT cl_no,
       cl_name,
       scale,
       sum(input),
       price,
       sum(amount),
       cwfl_name,
       substr(sdate, 1, 10),
       qd_name
FROM `qd_in_cw`
group by substr(sdate, 1, 7),
         scale,
         cwfl_name,
         cl_name,
         price,
         qd_name;


/**
区队库出库明细

drop table data_center.ads_qudui_out_detail;
CREATE TABLE data_center.ads_qudui_out_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  output decimal(15, 2) comment '出库量',
  price decimal(15, 2) comment '单价',
  amount decimal(15, 2) comment '金额', 
  cwfl_name varchar(64) comment '财务分类',
  sdate varchar(64) comment '日期',
  dept_fname varchar(64) comment '父级部门名称',
  dept_name varchar(64) comment '部门名称'
) COMMENT='区队库出库明细-二级页面';
**/
truncate table data_center.ads_qudui_out_detail;
insert into data_center.ads_qudui_out_detail
SELECT a.cl_no,
       a.cl_name,
       a.scale,
       sum(a.output),
       a.price,
       sum(a.amount),
       b.cwfl_name,
       substr(a.sdate, 1, 10),
       a.dept_fname,
       a.dept_name
FROM data_center.`qd_out_cw` a
         left join data_center.xh_cl_cw b on a.scale = b.scale
group by substr(a.sdate, 1, 7),
         a.scale,
         b.cwfl_name,
         a.cl_name,
         a.price,
         a.dept_fname,
         a.dept_name;


/**
* 周转库明细信息-二级

drop table data_center.ads_zhouzhuan_detail ;
CREATE TABLE data_center.ads_zhouzhuan_detail (
  self_no varchar(64) comment '自身编码',
  orig_price decimal(24,4) comment '原始单价',
  dept_id varchar(64) comment '部门编码',
  cl_no varchar(64) comment '材料编码',
  ejplace_idname varchar(64) comment '使用地点',
  cl_name varchar(64) comment '材料名称',
  remain decimal(24,4) comment '剩余数量',
  repair_count decimal(24,4) comment '累计维修次数',
  amount decimal(24,4) comment '原金额',
  scale varchar(64) comment '规格',
  status_idname varchar(64) comment '状态',
  price decimal(24,4) comment '现单价',
  xamount decimal(24,4) comment '现金额',
  unit varchar(64) comment '单位',
  dept_name varchar(64) comment '部门名称',
  total_repair_amount decimal(24,4) comment '现金额',
  cwfl_name varchar(64) comment '财务分类',
  report_date varchar(64) comment '上报日期'
) COMMENT='区队库存模型-ads';
**/

truncate table data_center.ads_zhouzhuan_detail;
insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-08' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-09' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-10' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-11' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

-- 设备资产表 1024 
/**
drop table device_table;
CREATE TABLE device_table (  
    org_code VARCHAR(32) COMMENT '公司代码',  
    fiscal_year VARCHAR(32) COMMENT '会计年度',  
    asset_id VARCHAR(64) COMMENT '资产编号',  
    sub_asset_id VARCHAR(64) COMMENT '资产次级编号',  
    asset_name VARCHAR(255) COMMENT '资产名称',  
    asset_main_text VARCHAR(255) COMMENT '资产主号文本',  
    profit_center VARCHAR(64) COMMENT '利润中心',  
    profit_center_name VARCHAR(64) COMMENT '利润中心名称',  
    cost_center VARCHAR(64) COMMENT '成本中心',  
    cost_center_name VARCHAR(255) COMMENT '成本中心名称',  
    resp_cost_center VARCHAR(64) COMMENT '责任成本中心',  
    resp_cost_center_name VARCHAR(255) COMMENT '责任成本中心名称',  
    asset_category VARCHAR(20) COMMENT '资产类别',  
    asset_category_name VARCHAR(50) COMMENT '资产类别名称',  
    asset_catalog_code VARCHAR(20) COMMENT '资产目录编码',  
    asset_catalog_name VARCHAR(255) COMMENT '资产目录名称',  
    serial_num VARCHAR(50) COMMENT '序列号',  
    orig_asset_card_id VARCHAR(50) COMMENT '原始资产卡片编号',  
    spec_model VARCHAR(100) COMMENT '规格型号',  
    quantity DECIMAL(10, 2) COMMENT '数量',  
    measure_unit VARCHAR(20) COMMENT '计量单位',  
    storage_loc VARCHAR(255) COMMENT '存放地点',  
    asset_status_use VARCHAR(20) COMMENT '资产使用情况',  
    pre_fixed_asset VARCHAR(20) COMMENT '预转固资产',  
    supplier VARCHAR(32) COMMENT '供应商',  
    supplier_name VARCHAR(255) COMMENT '供应商名称',  
    manufacturer VARCHAR(50) COMMENT '制造商',  
    investment_order VARCHAR(50) COMMENT '投资订单',  
    capitalization_date VARCHAR(50) COMMENT '资本化日期',  
    inactive_date VARCHAR(50) COMMENT '不活动日期',  
    internal_order VARCHAR(50) COMMENT '内部订单',  
    internal_order_name VARCHAR(100) COMMENT '内部订单名称',  
    ship_tonnage VARCHAR(50) COMMENT '船舶吨位',  
    license_plate VARCHAR(50) COMMENT '执照牌号',  
    personnel_id VARCHAR(50) COMMENT '人员编号',  
    personnel_desc VARCHAR(100) COMMENT '人员描述',  
    supplement_text VARCHAR(255) COMMENT '补充文本',  
    inventory_note VARCHAR(255) COMMENT '库存注记',  
    eam_code VARCHAR(50) COMMENT 'EAM编码',  
    service_life INT COMMENT '使用寿命',  
    category VARCHAR(20) COMMENT '类别',  
    elec_asset_flag VARCHAR(20) COMMENT '电力资产标识',  
    special_fund VARCHAR(50) COMMENT '专项资金',  
    eam_asset_class VARCHAR(50) COMMENT 'EAM资产分类',  
    orig_cost_type VARCHAR(20) COMMENT '原成本类型',  
    orig_cost_type_name VARCHAR(50) COMMENT '原成本类型名称',  
    lease_type VARCHAR(20) COMMENT '租赁类型',  
    lease_type_desc VARCHAR(100) COMMENT '租赁类型描述',  
    accum_purchase_value DECIMAL(18, 2) COMMENT '累计购置价值',  
    impairment_prep DECIMAL(18, 2) COMMENT '减值准备',  
    prev_year_accum_depr DECIMAL(18, 2) COMMENT '以前年度累计折旧',  
    curr_year_accum_depr DECIMAL(18, 2) COMMENT '本年度累计折旧',  
    total_accum_depr DECIMAL(18, 2) COMMENT '累计折旧',  
    curr_month_depr DECIMAL(18, 2) COMMENT '本月折旧',  
    net_value DECIMAL(18, 2) COMMENT '净值',  
    salvage_value_rate DECIMAL(5, 2) COMMENT '净残值率',  
    salvage_value DECIMAL(18, 2) COMMENT '净残值',  
    depr_code VARCHAR(20) COMMENT '折旧码',  
    depr_code_desc VARCHAR(100) COMMENT '折旧码描述',  
    depr_years INT COMMENT '折旧年限',  
    depr_month INT COMMENT '折旧月份',  
    accum_depr_months INT COMMENT '已计提月份',  
    remaining_years INT COMMENT '剩余使用年限',  
    remaining_months INT COMMENT '剩余使用月份',  
    entry_person VARCHAR(50) COMMENT '录入人',  
    entry_date VARCHAR(50) COMMENT '录入日期',  
    is_frozen TINYINT(1) COMMENT '是否冻结',  
    net_value_calc DECIMAL(18, 2) COMMENT '净值(累计购置价值-累计折旧)',  
    net_amount_calc DECIMAL(18, 2) COMMENT '净额(净值-减值准备)',  
    last_inventory_date VARCHAR(50) COMMENT '最后库存日',  
    asset_condition VARCHAR(20) COMMENT '资产状态',  
    acquisition_method VARCHAR(50) COMMENT '资产取得方式',  
    planned_depr_months_total INT COMMENT '计划折旧月份合计',  
    equipment_num VARCHAR(50) COMMENT '设备编号',  
    accum_depr_begin_new DECIMAL(18, 2) COMMENT '累计折旧期初金额（新）',  
    curr_year_normal_depr_new DECIMAL(18, 2) COMMENT '本年正常折旧金额（新）',  
    curr_year_other_adj_depr_new DECIMAL(18, 2) COMMENT '本年其他折旧调整金额（新）',  
    accum_depr_end_new DECIMAL(18, 2) COMMENT '累计折旧期末金额（新）',  
    impairment_prep_new DECIMAL(18, 2) COMMENT '减值准备（新）',  
    net_value_new DECIMAL(18, 2) COMMENT '净值（新）(累计购置价值-累计期末折旧)',  
    depr_start_date VARCHAR(50) COMMENT '开始折旧日期',  
    wbs_element VARCHAR(50) COMMENT 'WBS元素',  
    wbs_element_desc VARCHAR(100) COMMENT 'WBS元素描述',  
    related_equipment_full VARCHAR(300) COMMENT '关联设备（全）',  
    org_main_data_code VARCHAR(50) COMMENT '组织机构主数据编码'  ,
    date  VARCHAR(32) COMMENT '日期'
) COMMENT='ods设备信息表' ;
**/

-- 导入 3个 EXPORT报表  en结尾，去掉 复选和序号
/** 2024-10-24 ads_device_type
drop table data_center.ads_device_type;
CREATE TABLE data_center.ads_device_type (
  device_type_no varchar(64) comment '设备类型编码',
  device_type_name varchar(64) comment '设备类型名称',
  parent_type_no varchar(64) comment '父级设备类型编码',
  parent_type_name varchar(64) comment '父设备类型名称',
  is_key varchar(64) comment '是否重点设备',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备类型ads';
***/
truncate table ads_device_type;

insert into ads_device_type
select distinct asset_catalog_code, substring_index(asset_catalog_name, '-', -1), '', '', '', now(), null
from device_table
where asset_catalog_code like '14%'
order by asset_catalog_code;
insert into ads_device_type
values ('1400000000', '合计', '100', '合计', '1', now(), null);

-- 更新父级设备 类型 2024-11-19 
update ads_device_type
set parent_type_name = '掘进机',
    parent_type_no   = '1001',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('掘进机', '掘锚机', '连续采煤机', '掘进设备');
update ads_device_type
set parent_type_name = '采煤机',
    parent_type_no   = '1002',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('采煤机', '滚筒采煤机');
update ads_device_type
set parent_type_name = '刮板输送机',
    parent_type_no   = '1003',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('刮板输送机');
update ads_device_type
set parent_type_name = '胶带输送机',
    parent_type_no   = '1004',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('胶带输送机');
update ads_device_type
set parent_type_name = '转载机',
    parent_type_no   = '1005',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('转载机');
update ads_device_type
set parent_type_name = '破碎机',
    parent_type_no   = '1006',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('破碎机');
update ads_device_type
set parent_type_name = '液压支架',
    parent_type_no   = '1007',
    is_key           = '1',
    updated_time     = now()
where device_type_name in
      ('液压支架', '端头液压支架', '中间液压支架', '过渡液压支架', '超前液压支架', '三角区掩护液压支架',
       '其他液压支架');
update ads_device_type
set parent_type_name = '胶轮车',
    parent_type_no   = '1008',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('支架搬运车', '胶轮车');


/**
drop table ads_device_info;
CREATE TABLE ads_device_info (  
    org_code VARCHAR(32) COMMENT '组织代码',  
    org_name  VARCHAR(32) COMMENT '组织名称', 
    level_code  VARCHAR(32) COMMENT '权限预留', 
    date  VARCHAR(32) COMMENT '日期', 
    is_key  VARCHAR(32) COMMENT '是否重点设备', 
    fiscal_year VARCHAR(32) COMMENT '会计年度',  
    asset_id VARCHAR(64) COMMENT '资产编号',  
    sub_asset_id VARCHAR(64) COMMENT '资产次级编号',  
    asset_name VARCHAR(255) COMMENT '资产名称',  
    asset_main_text VARCHAR(255) COMMENT '资产主号文本',  
    profit_center VARCHAR(64) COMMENT '利润中心',  
    profit_center_name VARCHAR(64) COMMENT '利润中心名称',  
    cost_center VARCHAR(64) COMMENT '成本中心',  
    cost_center_name VARCHAR(255) COMMENT '成本中心名称',  
    resp_cost_center VARCHAR(64) COMMENT '责任成本中心',  
    resp_cost_center_name VARCHAR(255) COMMENT '责任成本中心名称',  
    asset_category VARCHAR(20) COMMENT '资产类别',  
    asset_category_name VARCHAR(50) COMMENT '资产类别名称',  
    asset_catalog_code VARCHAR(20) COMMENT '资产目录编码',  
    asset_catalog_name VARCHAR(255) COMMENT '资产目录名称',  
    device_type_no  VARCHAR(255) COMMENT '设备类型编码', 
    device_type_name  VARCHAR(255) COMMENT '设备类型名称', 
    parent_type_no  VARCHAR(255) COMMENT '父级设备类型编码',  
    parent_type_name  VARCHAR(255) COMMENT '父级设备类型名称',  
    serial_num VARCHAR(50) COMMENT '序列号',  
    orig_asset_card_id VARCHAR(50) COMMENT '原始资产卡片编号',  
    spec_model VARCHAR(100) COMMENT '规格型号',  
    quantity DECIMAL(10, 2) COMMENT '数量',  
    measure_unit VARCHAR(20) COMMENT '计量单位',  
    storage_loc VARCHAR(255) COMMENT '存放地点',  
    asset_status_use VARCHAR(20) COMMENT '资产使用情况',  
    pre_fixed_asset VARCHAR(20) COMMENT '预转固资产',  
    supplier VARCHAR(32) COMMENT '供应商',  
    supplier_name VARCHAR(255) COMMENT '供应商名称',  
    manufacturer VARCHAR(50) COMMENT '制造商',  
    investment_order VARCHAR(50) COMMENT '投资订单',  
    capitalization_date VARCHAR(50) COMMENT '资本化日期',  
    purchase_date VARCHAR(50) COMMENT '采购日期',  
    inactive_date VARCHAR(50) COMMENT '不活动日期',  
    internal_order VARCHAR(50) COMMENT '内部订单',  
    internal_order_name VARCHAR(100) COMMENT '内部订单名称',  
    ship_tonnage VARCHAR(50) COMMENT '船舶吨位',  
    license_plate VARCHAR(50) COMMENT '执照牌号',  
    personnel_id VARCHAR(50) COMMENT '人员编号',  
    personnel_desc VARCHAR(100) COMMENT '人员描述',  
    supplement_text VARCHAR(255) COMMENT '补充文本',  
    inventory_note VARCHAR(255) COMMENT '库存注记',  
    eam_code VARCHAR(50) COMMENT 'EAM编码',  
    service_life INT COMMENT '使用寿命',  
    category VARCHAR(20) COMMENT '类别',  
    elec_asset_flag VARCHAR(20) COMMENT '电力资产标识',  
    special_fund VARCHAR(50) COMMENT '专项资金',  
    eam_asset_class VARCHAR(50) COMMENT 'EAM资产分类',  
    orig_cost_type VARCHAR(20) COMMENT '原成本类型',  
    orig_cost_type_name VARCHAR(50) COMMENT '原成本类型名称',  
    lease_type VARCHAR(20) COMMENT '租赁类型',  
    lease_type_desc VARCHAR(100) COMMENT '租赁类型描述',  
    accum_purchase_value DECIMAL(18, 2) COMMENT '累计购置价值',  
    impairment_prep DECIMAL(18, 2) COMMENT '减值准备',  
    prev_year_accum_depr DECIMAL(18, 2) COMMENT '以前年度累计折旧',  
    curr_year_accum_depr DECIMAL(18, 2) COMMENT '本年度累计折旧',  
    total_accum_depr DECIMAL(18, 2) COMMENT '累计折旧',  
    curr_month_depr DECIMAL(18, 2) COMMENT '本月折旧',  
    net_value DECIMAL(18, 2) COMMENT '净值',  
    salvage_value_rate DECIMAL(5, 2) COMMENT '净残值率',  
    salvage_value DECIMAL(18, 2) COMMENT '净残值',  
    depr_code VARCHAR(20) COMMENT '折旧码',  
    depr_code_desc VARCHAR(100) COMMENT '折旧码描述',  
    depr_years INT COMMENT '折旧年限',  
    depr_month INT COMMENT '折旧月份',  
    accum_depr_months INT COMMENT '已计提月份',  
    remaining_years INT COMMENT '剩余使用年限',  
    remaining_months INT COMMENT '剩余使用月份',  
    entry_person VARCHAR(50) COMMENT '录入人',  
    entry_date VARCHAR(50) COMMENT '录入日期',  
    is_frozen TINYINT(1) COMMENT '是否冻结',  
    net_value_calc DECIMAL(18, 2) COMMENT '净值(累计购置价值-累计折旧)',  
    net_amount_calc DECIMAL(18, 2) COMMENT '净额(净值-减值准备)',  
    last_inventory_date VARCHAR(50) COMMENT '最后库存日',  
    asset_condition VARCHAR(20) COMMENT '资产状态',  
    acquisition_method VARCHAR(50) COMMENT '资产取得方式',  
    planned_depr_months_total INT COMMENT '计划折旧月份合计',  
    equipment_num VARCHAR(50) COMMENT '设备编号',  
    accum_depr_begin_new DECIMAL(18, 2) COMMENT '累计折旧期初金额（新）',  
    curr_year_normal_depr_new DECIMAL(18, 2) COMMENT '本年正常折旧金额（新）',  
    curr_year_other_adj_depr_new DECIMAL(18, 2) COMMENT '本年其他折旧调整金额（新）',  
    accum_depr_end_new DECIMAL(18, 2) COMMENT '累计折旧期末金额（新）',  
    impairment_prep_new DECIMAL(18, 2) COMMENT '减值准备（新）',  
    net_value_new DECIMAL(18, 2) COMMENT '净值（新）(累计购置价值-累计期末折旧)',  
    depr_start_date VARCHAR(50) COMMENT '开始折旧日期',  
    wbs_element VARCHAR(50) COMMENT 'WBS元素',  
    wbs_element_desc VARCHAR(100) COMMENT 'WBS元素描述',  
    related_equipment_full VARCHAR(300) COMMENT '关联设备（全）',  
    org_main_data_code VARCHAR(50) COMMENT '组织机构主数据编码'  
) COMMENT='ads设备信息表' ;
**/
delete
from ads_device_info
where date = substr(now() + interval '-1' month,1,7);
insert into ads_device_info
select c.org_code,
       c.org_name,
       c.level_code,
       date,
       t.is_key,
       fiscal_year,
       asset_id,
       sub_asset_id,
       asset_name,
       asset_main_text,
       profit_center,
       profit_center_name,
       cost_center,
       cost_center_name,
       resp_cost_center,
       resp_cost_center_name,
       asset_category,
       asset_category_name,
       asset_catalog_code,
       asset_catalog_name,
       t.device_type_no,
       t.device_type_name,
       t.parent_type_no,
       t.parent_type_name,
       serial_num,
       orig_asset_card_id,
       spec_model,
       quantity,
       measure_unit,
       storage_loc,
       asset_status_use,
       pre_fixed_asset,
       supplier,
       supplier_name,
       manufacturer,
       investment_order,
       capitalization_date,
       substr(capitalization_date, 1, 4),
       inactive_date,
       internal_order,
       internal_order_name,
       ship_tonnage,
       license_plate,
       personnel_id,
       personnel_desc,
       supplement_text,
       inventory_note,
       eam_code,
       service_life,
       category,
       elec_asset_flag,
       special_fund,
       eam_asset_class,
       orig_cost_type,
       orig_cost_type_name,
       lease_type,
       lease_type_desc,
       accum_purchase_value,
       impairment_prep,
       prev_year_accum_depr,
       curr_year_accum_depr,
       total_accum_depr,
       curr_month_depr,
       net_value,
       salvage_value_rate,
       salvage_value,
       depr_code,
       depr_code_desc,
       depr_years,
       depr_month,
       accum_depr_months,
       remaining_years,
       remaining_months,
       entry_person,
       entry_date,
       is_frozen,
       net_value_calc,
       net_amount_calc,
       last_inventory_date,
       asset_condition,
       acquisition_method,
       planned_depr_months_total,
       equipment_num,
       accum_depr_begin_new,
       curr_year_normal_depr_new,
       curr_year_other_adj_depr_new,
       accum_depr_end_new,
       impairment_prep_new,
       net_value_new,
       depr_start_date,
       wbs_element,
       wbs_element_desc,
       related_equipment_full,
       org_main_data_code
from device_table d
         left join data_center.ads_orgnization c on d.org_code = c.org_code
         left join ads_device_type t on d.asset_catalog_code = t.device_type_no
         left join ads_device_param_value v on 1 = 1
where d.accum_purchase_value >= v.param_device_value
;


/**
资产管理 - 业财存货管理
语义模型 23.业财存货管理    ads_ycch
业财存货管理 语义模型使用的 sql脚本的方式，脚本如下：
select 
report_date, 
'1' as index_code, -- 区队库金额
'区队库库存' as index_name,
sum(remain * price)
from ads_qudui_model
group by report_date
union all 
select
report_date, 
'2' as index_code, -- 周转库金额
'周转库库存' as index_name,
sum(remain * price)
from ads_zhouzhuan_model
group by report_date
union all 
select
date, 
'3' as index_code,  -- 存货
'账面存货' as index_name,
sum(amount_acc)
from ads_asset_core
where index_name like '%存货%' and org_code = 'GY2F00'
group by date;
**/

/**
投资 - 2024-12-05 : 线下填报 HZJ
drop table data_center.ods_invest_plan;
CREATE TABLE data_center.ods_invest_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_acc decimal(15, 2) comment '本年实际',
  created_time varchar(64) comment '创建时间',
  updated_time varchar(64) comment '更新时间',
  id varchar(64) comment 'ID标识'
) COMMENT='资产-投资计划odds';
INSERT INTO `data_center`.`ods_invest_plan`(`org_code`, `org_name`, `date`, `index_name`, `index_code`, `amount_pre`, `amount_acc`, `created_time`, `updated_time`, `id`) VALUES ('GY2F00', '包头能源', '2024-11', '投资', '1', 104280.94, 93901.45, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_invest_plan`(`org_code`, `org_name`, `date`, `index_name`, `index_code`, `amount_pre`, `amount_acc`, `created_time`, `updated_time`, `id`) VALUES ('GY2F00', '包头能源', '2024-10', '投资', '1', 100215.00, 55222.00, NULL, NULL, NULL);

**/

/**
投资
drop table data_center.ads_invest_plan;
CREATE TABLE data_center.ads_invest_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_acc decimal(15, 2) comment '本年实际',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='投资计划ads';
**/
truncate table data_center.ads_invest_plan;
insert into data_center.ads_invest_plan
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       a.index_name,
       a.index_code,
       a.amount_pre,
       a.amount_acc,
       now(),
       now()
from ods_invest_plan a
         left join data_center.ads_orgnization b on a.org_code = b.org_code
;
/**
-- 投资计划是填报数据，不能truncate 
truncate table ads_invest_plan;
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-09','合计','1',100214.61,55221.52,now(),now());
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-10','合计','1',100214.61,55221.52,now(),now());
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-11','合计','1',100214.61,55221.52,now(),now());
**/

/**
drop table data_center.ods_device_purchase_plan;
CREATE TABLE data_center.ods_device_purchase_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
	year varchar(64) comment '年份',
	month varchar(64) comment '月份	',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
	device_type_no varchar(64) comment '设备类型编号',
	device_type_name varchar(64) comment '设备类型名称',
  spec_model varchar(64) comment '规格型号',
  count decimal(15, 2) comment '台数',
  budget_year decimal(15, 2) comment '年度预算数',
  budget_q1 decimal(15, 2) comment '季度预算',
  budget_m1 decimal(15, 2) comment '1月度预算',
	budget_m2 decimal(15, 2) comment '2月度预算',
  budget_m3 decimal(15, 2) comment '3月度预算',
	budget_q2 decimal(15, 2) comment '季度预算',
  budget_m4 decimal(15, 2) comment '4月度预算', 
	budget_m5 decimal(15, 2) comment '5月度预算',
  budget_m6 decimal(15, 2) comment '6月度预算',
	budget_q3 decimal(15, 2) comment '季度预算',
  budget_m7 decimal(15, 2) comment '7月度预算',
	budget_m8 decimal(15, 2) comment '8月度预算',
  budget_m9 decimal(15, 2) comment '9月度预算',
	budget_q4 decimal(15, 2) comment '季度预算',
  budget_m10 decimal(15, 2) comment '10月度预算',
	budget_m11 decimal(15, 2) comment '11月度预算',
	budget_m12 decimal(15, 2) comment '12月度预算',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备采购计划－ods表';
**/
/**
-- 设备采购计划是填报表，不能truncate 
truncate table `data_center`.`ods_device_purchase_plan`;
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('GY2F00', '包头能源', '2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 2, 13500.00, 10000.00, 6000.00, 3000.00, 1000.00, 24600.00, 20000.00, 4000.00, 600.00, NULL, NULL, NULL, NULL, NULL, 1000, 2000, 1400, NOW(), NOW());
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿','2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 1, 10000.00, 8000.00, 4000.00, 500.00, 500.00, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 1000, 700, NOW(),NOW());
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕','2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 1, 10000.00, 8000.00, 4000.00, 500.00, 500.00, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 1000, 700, NOW(),NOW());
**/
/**
drop table data_center.ads_device_purchase_plan_convert;
CREATE TABLE data_center.ads_device_purchase_plan_convert (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
	year varchar(64) comment '年份',
	month varchar(64) comment '月份	',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
	device_type_no varchar(64) comment '设备类型编号',
	device_type_name varchar(64) comment '设备类型名称',
  spec_model varchar(64) comment '规格型号',
  count decimal(15, 2) comment '台数',
  date_type varchar(8) comment '时间类型',  -- Y :年  Q :季度 M ：月
  date_value varchar(8) comment '时间值',
  budget decimal(15, 2) comment '预算数',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备采购计划时间转置－ads表';
**/

truncate table ads_device_purchase_plan_convert;
-- 插入年度数据
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       a.count,
       'Y',
       substr(a.date, 1, 4),
       a.budget_year,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '1',
       a.budget_q1,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '2',
       a.budget_q2,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '3',
       a.budget_q3,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '4',
       a.budget_q4,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-01'),
       a.budget_m1,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;


insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-02'),
       a.budget_m2,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-03'),
       a.budget_m3,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-04'),
       a.budget_m4,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-05'),
       a.budget_m5,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-06'),
       a.budget_m6,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-07'),
       a.budget_m7,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-08'),
       a.budget_m8,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-09'),
       a.budget_m9,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-10'),
       a.budget_m10,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-11'),
       a.budget_m11,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4),
       substr(a.date, 6, 2),
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-12'),
       a.budget_m12,
       NOW(),
       NOW()
from ods_device_purchase_plan a
         left join ads_orgnization b
                   on b.org_code = a.org_code
;

/**
drop table data_center.ods_device_oee;
CREATE TABLE data_center.ods_device_oee (
  org_code varchar(32) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(32) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(32) comment '指标编码',
  asset_id VARCHAR(20) COMMENT '资产编码',  
  asset_catalog_code VARCHAR(20) COMMENT '资产目录编码',  
  asset_catalog_name VARCHAR(255) COMMENT '资产目录名称',  
  actual_time decimal(15, 2) comment '实际运行时间',
  plan_time decimal(15, 2) comment '计划运行时间',  
  actual_amount decimal(15, 2) comment '实际产出',
  plan_amount decimal(15, 2) comment '理论产出',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='oee－ods表';
truncate table data_center.ods_device_oee;
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿','2024-10-28',  '140000003886', '1401010001', '采煤机', 10.00, 12.00, 300.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿', '2024-10-29',  '140000003886', '1401010001', '采煤机', 11.00, 12.00, 301.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿', '2024-10-30',  '140000003886', '1401010001', '采煤机', 12.00, 12.00, 310.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-28',  '140000000728', '1401010001', '采煤机', 13.00, 19.00, 280.00, 330.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-29',  '140000000728', '1401010001', '采煤机', 15.00, 18.00, 287.00, 330.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-30',  '140000000728', '1401010001', '采煤机', 17.00, 19.00, 299.00, 340.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-28',  '140000001666', '1401010001', '采煤机', 16.00, 22.00, 333.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-29',  '140000001666', '1401010001', '采煤机', 18.00, 22.00, 365.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-30',  '140000001666', '1401010001', '采煤机', 20.00, 22.00, 367.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');

**/

/**
drop table data_center.ads_device_oee;
CREATE TABLE data_center.ads_device_oee (
  org_code varchar(32) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(32) comment '日期',
  year varchar(32) comment '年',
  month varchar(32) comment '月',
  day varchar(32) comment '日',
  asset_id VARCHAR(20) COMMENT '资产编码',  
  asset_name VARCHAR(64) COMMENT '资产名称',  
  device_type_no VARCHAR(20) COMMENT '资产目录编码',  
  device_type_name VARCHAR(255) COMMENT '资产目录名称',  
  actual_time decimal(15, 2) comment '实际运行时间',
  plan_time decimal(15, 2) comment '计划运行时间',  
  actual_amount decimal(15, 2) comment '实际产出',
  plan_amount decimal(15, 2) comment '理论产出',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='oee－ads表';

**/
truncate table data_center.ads_device_oee;
insert into data_center.ads_device_oee
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4) as year,
  substr(a.date,6,2) as month,
  substr(a.date,9,2) as day,
  a.asset_id,
  d.asset_name,
  t.device_type_no,
  t.device_type_name,
  a.actual_time,
  a.plan_time,
  a.actual_amount,
  a.plan_amount,
  now(),
  now()
from ods_device_oee a
    left join ads_orgnization b
on b.org_code = a.org_code
    left join ads_device_info d
    on d.asset_id = a.asset_id
    and d.device_type_no = a.asset_catalog_code
    left join ads_device_type t
    on t.device_type_no = a.asset_catalog_code
;
truncate table data_center.ads_device_oee;
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F06', '李家壕煤矿', '10006', '2024-09-30', '2024', '09', '30', '140000003886', '采煤机', '1401010001',
        '滚筒采煤机', 400.00, 420.00, 560000.00, 570000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-09-30', '2024', '09', '30', '140000000728', '采煤机', '1401010001',
        '滚筒采煤机', 352.00, 480.00, 596000.00, 704000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-09-30', '2024', '09', '30', '140000001666', '6650采煤机', '1401010001',
        '滚筒采煤机', 600.00, 690.00, 601579.00, 600000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F06', '李家壕煤矿', '10006', '2024-10-30', '2024', '10', '30', '140000003886', '采煤机', '1401010001',
        '滚筒采煤机', 400.00, 420.00, 560000.00, 570000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-10-30', '2024', '10', '30', '140000000728', '采煤机', '1401010001',
        '滚筒采煤机', 352.00, 480.00, 596000.00, 704000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-10-30', '2024', '10', '30', '140000001666', '6650采煤机', '1401010001',
        '滚筒采煤机', 600.00, 690.00, 601579.00, 600000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
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
on b.entity = a.org_code
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
on b.entity = a.org_code
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
on b.entity = a.org_code
      and b.years = substr(a.date,1,4) 
      and b.version = a.bbh
      and b.scenario = r.scenario
      and b.SYNTHESIS = r.synthesis
      and b.account = r.account
set a.amount_month_pre = b.amount , a.amount_pre = b.amount ,
a.updated_time  = now()
where r.synthesis = '[None]';

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


-- 特殊处理 ： 2024-11-12 ， 针对 所有者权益 资产负债表 0102 ， 需要取年初数。405-期初所有者权益
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
  t1.amount_acc_begin , -- 年初实际值
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
      inner join (select * from data_center.ods_tcys where hc = '405') t 
          on t.org_code = m.org_code and t.date = m.date
      left join  (select * from ads_index_code_account_ref where account  = 'WLVYS05' and table_name  = 'YZB0102' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
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

-- 特殊处理 ： 2024-11-12 ， 针对 所有者权益 资产负债表 0102 ， 需要取年初数。406-期末所有者权益
delete from ads_index_exclude where index_code  = '406';
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
  t1.amount_acc , -- 年末实际值
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
      inner join (select * from data_center.ods_tcys where hc = '406') t 
          on t.org_code = m.org_code and t.date = m.date
      left join  (select * from ads_index_code_account_ref where account  = 'WLVYS06' and table_name  = 'YZB0102' and scenario = 'NCYSS' and synthesis = 'ZE' and exclude = '1') r  
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
  (a.amount_acc + a.exclude_amount ) / (b.amount_acc + b.exclude_amount),
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
  ( case when ( b.amount_acc + b.exclude_amount) = 0 then 0 else  (a.amount_acc + a.exclude_amount )  / ((b.amount_acc + b.exclude_amount) * 10000) end  )  , 
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
       ( (case when b.amount_acc is null then 0 else b.amount_acc end ) + (case when b.exclude_amount is null then 0 else b.exclude_amount end )) 
        + 
      ((case when c.amount_acc is null then 0 else c.amount_acc end ) + (case when c.exclude_amount is null then 0 else c.exclude_amount end )) = 0 then 0 
      else 
          (a.amount_acc + a.exclude_amount ) * 10000 / (( (case when b.amount_acc is null then 0 else b.amount_acc end ) + (case when b.exclude_amount is null then 0 else b.exclude_amount end )) 
          + 
          ((case when c.amount_acc is null then 0 else c.amount_acc end ) + (case when c.exclude_amount is null then 0 else c.exclude_amount * 10000 end )) )
     end )
      ,
  '剔除后',
  a.account,
  a.years,
  a.version_code,
  a.scenario,
  a.synthesis,
  v.amount,
    (case when b.amount_acc is null  then 0 else a.amount_acc * 10000 / (b.amount_acc + c.amount_acc) end ),
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
    case when  ((case when b.amount_acc is null then 0 else b.amount_acc end ) + (case when b.exclude_amount is null then 0 else b.exclude_amount end )) = 0 then 0 
    else (a.amount_acc / 10000 + a.exclude_amount ) / (b.amount_acc + b.exclude_amount) end
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
      case when ( (case when b.amount_acc is null then 0 else b.amount_acc end ) + (case when b.exclude_amount is null then 0 else b.exclude_amount end )) = 0 then 0 
      else 
        (a.amount_acc + (case when a.exclude_amount is null then 0 else  a.exclude_amount end ) ) / (b.amount_acc + b.exclude_amount)
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
    --  where a.org_code  = 'GY2F00' and a.date  = '2024-09'
  ;
