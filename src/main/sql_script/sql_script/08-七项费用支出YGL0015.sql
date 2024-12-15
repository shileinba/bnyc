
/* -- 存货分类统计
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








