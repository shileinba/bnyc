
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
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.ucode,9,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z05 is null,0,a.Z05),2),
	  round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
	  round(if(a.Z04 is null,0,a.Z04),2)
      from data_center.ygl0072__zygl0072 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,6) = b.org_code
      left join data_center.ods_technology_expense_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('GY2F00')
	   and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_technology_expense_bo;
insert into data_center.ods_technology_expense_bo
select
      b.org_code,
      b.org_name,
      (case when 
		substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) 
		else concat(per,'-',substr(a.ucode,9,2))  end) ,
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z05 is null,0,a.Z05),2),
	  round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z03 is null,0,a.Z03),2),
	  round(if(a.Z04 is null,0,a.Z04),2)
      from data_center.ygl0072__zygl0072 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_technology_expense_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00')
	  and ucode like ('%_r');








