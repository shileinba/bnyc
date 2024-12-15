
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
truncate table data_center.ods_inventory_class_stat_hq;
insert into data_center.ods_inventory_class_stat_hq 
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.ucode,9,2)),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
	    round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2)
      from data_center.ygl0100__zygl0100 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,6) = b.org_code
      left join data_center.ods_inventory_class_stat_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('GY2F00') 
	  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_inventory_class_stat_bo;
insert into data_center.ods_inventory_class_stat_bo
select
      b.org_code,
      b.org_name,
      (case when 
		substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) 
		else concat(per,'-',substr(a.ucode,9,2))  end) ,
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2),
	  round(if(a.Z03 is null,0,a.Z03),2),
      round(if(a.Z04 is null,0,a.Z04),2)
      from data_center.ygl0100__zygl0100 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_inventory_class_stat_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00')
	  and ucode like ('%_r');








