
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



-- 数据治理平台数据灌入
truncate table data_center.ods_cash_flow_hq;
insert into data_center.ods_cash_flow_hq 
select
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2)
      from data_center.yzb0003__zyzb0003 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_cash_flow_ref c
      on a.rid = c.index_code
      where org in ('GY2F00') 
	  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_cash_flow_bo;
insert into data_center.ods_cash_flow_bo
select
      b.org_code,
      b.org_name,
      concat(substr(a.month,1,4),'-',substr(a.month,5,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2)
      from data_center.yzb0003__zyzb0003 a
      left join data_center.ads_orgnization b
      on a.org = b.org_code
      left join data_center.ods_cash_flow_ref c
      on a.rid = c.index_code
      where org not in ('GY2F00')
	  and ucode like ('%_r');
























