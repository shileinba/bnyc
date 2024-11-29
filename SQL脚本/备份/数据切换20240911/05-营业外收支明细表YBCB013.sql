
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
select
      b.org_code,
      b.org_name,
      (case when 
		substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) 
		else concat(per,'-',substr(a.ucode,9,2))  end) ,
      c.index_name,
      c.index_code,
      round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2),
	    round(if(a.Z02 is null,0,a.Z02),2),
      round(if(a.Z01 is null,0,a.Z01),2)
      from data_center.ybcb013__zybcb013 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_no_operating_income_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00')
	  and ucode like ('%_r');










