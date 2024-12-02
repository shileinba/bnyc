
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
update data_center.yzb0003__zyzb0003 set org = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
  --  ----------  更新 month字段-------------------------------------------
update data_center.yzb0003__zyzb0003 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.yzb0003__zyzb0003 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.yzb0003__zyzb0003 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';


update data_center.ygl0100__zygl0100 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ygl0100__zygl0100 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ygl0100__zygl0100 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ygl0100__zygl0100 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ygl0078__zygl0078 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ygl0078__zygl0078 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ygl0078__zygl0078 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ygl0078__zygl0078 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ygl0072__zygl0072 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ygl0072__zygl0072 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ygl0072__zygl0072 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ygl0072__zygl0072 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybcb013__zybcb013 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybcb013__zybcb013 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybcb013__zybcb013 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybcb013__zybcb013 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.yzb0102__zyzb0102 set org = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.yzb0102__zyzb0102 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.yzb0102__zyzb0102 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.yzb0102__zyzb0102 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybzc022__zybzc022 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybzc022__zybzc022 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybzc022__zybzc022 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybzc022__zybzc022 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybgl017__zybgl017 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybgl017__zybgl017 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybgl017__zybgl017 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybgl017__zybgl017 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybcb016__zybcb016 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybcb016__zybcb016 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybcb016__zybcb016 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybcb016__zybcb016 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybcb039__zybcb039 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybcb039__zybcb039 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybcb039__zybcb039 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybcb039__zybcb039 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ybcb019__zybcb019_01 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ybcb019__zybcb019_01 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ybcb019__zybcb019_01 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ybcb019__zybcb019_01 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

update data_center.ygl0083__zygl0083 set org_code = 
  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4) 
  else substr(ucode ,1,6) end ;
update data_center.ygl0083__zygl0083 set month = substr(ucode ,-4,2) where  ucode like '%_r';
update data_center.ygl0083__zygl0083 set month = substr(ucode ,-4,2) where  ucode like '%_j';
update data_center.ygl0083__zygl0083 set month = substr(ucode ,-2,2) where  ucode not like '%_r' and  ucode not like '%_j';

-- 数据治理平台数据灌入
-- 现金流
truncate table data_center.ods_cash_flow_hq;
insert into data_center.ods_cash_flow_hq 
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2)
      from data_center.yzb0003__zyzb0003 a
      left join data_center.ads_orgnization b
      on substr(a.ucode,1,6) = b.org_code
      left join data_center.ods_cash_flow_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) in ('GY2F00') 
	  and ucode like ('%_r');

-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_cash_flow_bo;
insert into data_center.ods_cash_flow_bo
select
      b.org_code,
      b.org_name,
       (case when 
    substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) 
    else concat(per,'-',substr(a.ucode,9,2))  end) ,
      c.index_name,
      c.index_code,
      round(if(a.Z01 is null,0,a.Z01),2),
      round(if(a.Z02 is null,0,a.Z02),2)
      from data_center.yzb0003__zyzb0003 a
      left join data_center.ads_orgnization b
      on (case when substr(a.ucode,5,1) = '_' then substr(a.ucode,1,4) else substr(a.ucode,1,6) end)  = b.org_code
      left join data_center.ods_cash_flow_ref c
      on a.rid = c.index_code
      where substr(a.ucode,1,6) not in ('GY2F00')
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
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      on substr(a.ucode,1,6) = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 1) c
      on 1 = 1
      where substr(a.ucode,1,6) in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

	  
insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      on substr(a.ucode,1,6) = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 2) c
      on 1 = 1
      where substr(a.ucode,1,6) in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
       concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;



-- 厂矿数据治理平台数据灌入
-- 数据治理平台数据灌入
truncate table data_center.ods_summary_index_bo;
insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

	  
insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',a.month),
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
      where a.org_code not  in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.per,a.month;



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
      concat(per,'-',a.month),
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
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z01 else 0 end),
sum(case when rid = 2 then a.Z01 else 0 end),
sum(case when rid = 3 then a.Z01 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '1') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z02 else 0 end),
sum(case when rid = 2 then a.Z02 else 0 end),
sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '2') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z03 else 0 end),
sum(case when rid = 2 then a.Z03 else 0 end),
sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '3') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z04 else 0 end),
sum(case when rid = 2 then a.Z04 else 0 end),
sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '4') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z05 else 0 end),
sum(case when rid = 2 then a.Z05 else 0 end),
sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '5') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z06 else 0 end),
sum(case when rid = 2 then a.Z06 else 0 end),
sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '6') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z07 else 0 end),
sum(case when rid = 2 then a.Z07 else 0 end),
sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '7') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z08 else 0 end),
sum(case when rid = 2 then a.Z08 else 0 end),
sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '8') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z09 else 0 end),
sum(case when rid = 2 then a.Z09 else 0 end),
sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '9') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z10 else 0 end),
sum(case when rid = 2 then a.Z10 else 0 end),
sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '10') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z11 else 0 end),
sum(case when rid = 2 then a.Z11 else 0 end),
sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '11') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z12 else 0 end),
sum(case when rid = 2 then a.Z12 else 0 end),
sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '12') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z13 else 0 end),
sum(case when rid = 2 then a.Z13 else 0 end),
sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '13') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z14 else 0 end),
sum(case when rid = 2 then a.Z14 else 0 end),
sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '14') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z15 else 0 end),
sum(case when rid = 2 then a.Z15 else 0 end),
sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '15') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z16 else 0 end),
sum(case when rid = 2 then a.Z16 else 0 end),
sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '16') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z17 else 0 end),
sum(case when rid = 2 then a.Z17 else 0 end),
sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '17') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z18 else 0 end),
sum(case when rid = 2 then a.Z18 else 0 end),
sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '18') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z19 else 0 end),
sum(case when rid = 2 then a.Z19 else 0 end),
sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '19') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z20 else 0 end),
sum(case when rid = 2 then a.Z20 else 0 end),
sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '20') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z21 else 0 end),
sum(case when rid = 2 then a.Z21 else 0 end),
sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '21') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z22 else 0 end),
sum(case when rid = 2 then a.Z22 else 0 end),
sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '22') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z23 else 0 end),
sum(case when rid = 2 then a.Z23 else 0 end),
sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '23') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z24 else 0 end),
sum(case when rid = 2 then a.Z24 else 0 end),
sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '24') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z25 else 0 end),
sum(case when rid = 2 then a.Z25 else 0 end),
sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '25') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z26 else 0 end),
sum(case when rid = 2 then a.Z26 else 0 end),
sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '26') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z27 else 0 end),
sum(case when rid = 2 then a.Z27 else 0 end),
sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '27') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z28 else 0 end),
sum(case when rid = 2 then a.Z28 else 0 end),
sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '28') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z29 else 0 end),
sum(case when rid = 2 then a.Z29 else 0 end),
sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '29') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z30 else 0 end),
sum(case when rid = 2 then a.Z30 else 0 end),
sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '30') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z31 else 0 end),
sum(case when rid = 2 then a.Z31 else 0 end),
sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '31') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z32 else 0 end),
sum(case when rid = 2 then a.Z32 else 0 end),
sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '32') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z33 else 0 end),
sum(case when rid = 2 then a.Z33 else 0 end),
sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '33') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z34 else 0 end),
sum(case when rid = 2 then a.Z34 else 0 end),
sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '34') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z35 else 0 end),
sum(case when rid = 2 then a.Z35 else 0 end),
sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '35') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z36 else 0 end),
sum(case when rid = 2 then a.Z36 else 0 end),
sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '36') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z37 else 0 end),
sum(case when rid = 2 then a.Z37 else 0 end),
sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '37') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z38 else 0 end),
sum(case when rid = 2 then a.Z38 else 0 end),
sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '38') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z39 else 0 end),
sum(case when rid = 2 then a.Z39 else 0 end),
sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '39') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z40 else 0 end),
sum(case when rid = 2 then a.Z40 else 0 end),
sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '40') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z41 else 0 end),
sum(case when rid = 2 then a.Z41 else 0 end),
sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '41') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z42 else 0 end),
sum(case when rid = 2 then a.Z42 else 0 end),
sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '42') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z43 else 0 end),
sum(case when rid = 2 then a.Z43 else 0 end),
sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '43') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z44 else 0 end),
sum(case when rid = 2 then a.Z44 else 0 end),
sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '44') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z45 else 0 end),
sum(case when rid = 2 then a.Z45 else 0 end),
sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '45') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z46 else 0 end),
sum(case when rid = 2 then a.Z46 else 0 end),
sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '46') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z47 else 0 end),
sum(case when rid = 2 then a.Z47 else 0 end),
sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '47') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z48 else 0 end),
sum(case when rid = 2 then a.Z48 else 0 end),
sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '48') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z49 else 0 end),
sum(case when rid = 2 then a.Z49 else 0 end),
sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '49') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z50 else 0 end),
sum(case when rid = 2 then a.Z50 else 0 end),
sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '50') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z51 else 0 end),
sum(case when rid = 2 then a.Z51 else 0 end),
sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '51') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z52 else 0 end),
sum(case when rid = 2 then a.Z52 else 0 end),
sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '52') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z53 else 0 end),
sum(case when rid = 2 then a.Z53 else 0 end),
sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '53') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z54 else 0 end),
sum(case when rid = 2 then a.Z54 else 0 end),
sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '54') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z55 else 0 end),
sum(case when rid = 2 then a.Z55 else 0 end),
sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '55') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z56 else 0 end),
sum(case when rid = 2 then a.Z56 else 0 end),
sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '56') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z57 else 0 end),
sum(case when rid = 2 then a.Z57 else 0 end),
sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '57') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z58 else 0 end),
sum(case when rid = 2 then a.Z58 else 0 end),
sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '58') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z59 else 0 end),
sum(case when rid = 2 then a.Z59 else 0 end),
sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '59') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z60 else 0 end),
sum(case when rid = 2 then a.Z60 else 0 end),
sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '60') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z61 else 0 end),
sum(case when rid = 2 then a.Z61 else 0 end),
sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '61') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z62 else 0 end),
sum(case when rid = 2 then a.Z62 else 0 end),
sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '62') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z63 else 0 end),
sum(case when rid = 2 then a.Z63 else 0 end),
sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '63') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z64 else 0 end),
sum(case when rid = 2 then a.Z64 else 0 end),
sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '64') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z65 else 0 end),
sum(case when rid = 2 then a.Z65 else 0 end),
sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '65') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z66 else 0 end),
sum(case when rid = 2 then a.Z66 else 0 end),
sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '66') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z67 else 0 end),
sum(case when rid = 2 then a.Z67 else 0 end),
sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '67') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z68 else 0 end),
sum(case when rid = 2 then a.Z68 else 0 end),
sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '68') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z69 else 0 end),
sum(case when rid = 2 then a.Z69 else 0 end),
sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '69') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z70 else 0 end),
sum(case when rid = 2 then a.Z70 else 0 end),
sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '78') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z71 else 0 end),
sum(case when rid = 2 then a.Z71 else 0 end),
sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '79') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z72 else 0 end),
sum(case when rid = 2 then a.Z72 else 0 end),
sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '80') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z73 else 0 end),
sum(case when rid = 2 then a.Z73 else 0 end),
sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '81') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z74 else 0 end),
sum(case when rid = 2 then a.Z74 else 0 end),
sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '82') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z75 else 0 end),
sum(case when rid = 2 then a.Z75 else 0 end),
sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '83') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z76 else 0 end),
sum(case when rid = 2 then a.Z76 else 0 end),
sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '84') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z77 else 0 end),
sum(case when rid = 2 then a.Z77 else 0 end),
sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '85') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z78 else 0 end),
sum(case when rid = 2 then a.Z78 else 0 end),
sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '86') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z79 else 0 end),
sum(case when rid = 2 then a.Z79 else 0 end),
sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '87') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z80 else 0 end),
sum(case when rid = 2 then a.Z80 else 0 end),
sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '88') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z81 else 0 end),
sum(case when rid = 2 then a.Z81 else 0 end),
sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '89') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z82 else 0 end),
sum(case when rid = 2 then a.Z82 else 0 end),
sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '90') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z83 else 0 end),
sum(case when rid = 2 then a.Z83 else 0 end),
sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '91') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z84 else 0 end),
sum(case when rid = 2 then a.Z84 else 0 end),
sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '92') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z85 else 0 end),
sum(case when rid = 2 then a.Z85 else 0 end),
sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '93') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z86 else 0 end),
sum(case when rid = 2 then a.Z86 else 0 end),
sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '94') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z87 else 0 end),
sum(case when rid = 2 then a.Z87 else 0 end),
sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '95') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z88 else 0 end),
sum(case when rid = 2 then a.Z88 else 0 end),
sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '96') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z89 else 0 end),
sum(case when rid = 2 then a.Z89 else 0 end),
sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '97') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z90 else 0 end),
sum(case when rid = 2 then a.Z90 else 0 end),
sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '98') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z91 else 0 end),
sum(case when rid = 2 then a.Z91 else 0 end),
sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '99') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z92 else 0 end),
sum(case when rid = 2 then a.Z92 else 0 end),
sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '100') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z93 else 0 end),
sum(case when rid = 2 then a.Z93 else 0 end),
sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '101') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z94 else 0 end),
sum(case when rid = 2 then a.Z94 else 0 end),
sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '102') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z95 else 0 end),
sum(case when rid = 2 then a.Z95 else 0 end),
sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '103') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z96 else 0 end),
sum(case when rid = 2 then a.Z96 else 0 end),
sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '104') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z97 else 0 end),
sum(case when rid = 2 then a.Z97 else 0 end),
sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '105') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z98 else 0 end),
sum(case when rid = 2 then a.Z98 else 0 end),
sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '106') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z99 else 0 end),
sum(case when rid = 2 then a.Z99 else 0 end),
sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '107') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z100 else 0 end),
sum(case when rid = 2 then a.Z100 else 0 end),
sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '108') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z101 else 0 end),
sum(case when rid = 2 then a.Z101 else 0 end),
sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '109') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z102 else 0 end),
sum(case when rid = 2 then a.Z102 else 0 end),
sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '110') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z103 else 0 end),
sum(case when rid = 2 then a.Z103 else 0 end),
sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '111') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z104 else 0 end),
sum(case when rid = 2 then a.Z104 else 0 end),
sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '112') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z105 else 0 end),
sum(case when rid = 2 then a.Z105 else 0 end),
sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '113') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z106 else 0 end),
sum(case when rid = 2 then a.Z106 else 0 end),
sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '114') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z107 else 0 end),
sum(case when rid = 2 then a.Z107 else 0 end),
sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '115') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z108 else 0 end),
sum(case when rid = 2 then a.Z108 else 0 end),
sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '116') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z109 else 0 end),
sum(case when rid = 2 then a.Z109 else 0 end),
sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '117') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z110 else 0 end),
sum(case when rid = 2 then a.Z110 else 0 end),
sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '118') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z111 else 0 end),
sum(case when rid = 2 then a.Z111 else 0 end),
sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '119') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z112 else 0 end),
sum(case when rid = 2 then a.Z112 else 0 end),
sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '120') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z113 else 0 end),
sum(case when rid = 2 then a.Z113 else 0 end),
sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '121') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z114 else 0 end),
sum(case when rid = 2 then a.Z114 else 0 end),
sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '122') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z115 else 0 end),
sum(case when rid = 2 then a.Z115 else 0 end),
sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '123') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z116 else 0 end),
sum(case when rid = 2 then a.Z116 else 0 end),
sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '124') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z117 else 0 end),
sum(case when rid = 2 then a.Z117 else 0 end),
sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '125') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z118 else 0 end),
sum(case when rid = 2 then a.Z118 else 0 end),
sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '126') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z119 else 0 end),
sum(case when rid = 2 then a.Z119 else 0 end),
sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '127') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z120 else 0 end),
sum(case when rid = 2 then a.Z120 else 0 end),
sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '128') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z121 else 0 end),
sum(case when rid = 2 then a.Z121 else 0 end),
sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '129') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z122 else 0 end),
sum(case when rid = 2 then a.Z122 else 0 end),
sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '130') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z123 else 0 end),
sum(case when rid = 2 then a.Z123 else 0 end),
sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '131') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z124 else 0 end),
sum(case when rid = 2 then a.Z124 else 0 end),
sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '132') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z125 else 0 end),
sum(case when rid = 2 then a.Z125 else 0 end),
sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '133') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z126 else 0 end),
sum(case when rid = 2 then a.Z126 else 0 end),
sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '134') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z127 else 0 end),
sum(case when rid = 2 then a.Z127 else 0 end),
sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '135') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z128 else 0 end),
sum(case when rid = 2 then a.Z128 else 0 end),
sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '136') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z129 else 0 end),
sum(case when rid = 2 then a.Z129 else 0 end),
sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '137') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z130 else 0 end),
sum(case when rid = 2 then a.Z130 else 0 end),
sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '138') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z131 else 0 end),
sum(case when rid = 2 then a.Z131 else 0 end),
sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '139') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z132 else 0 end),
sum(case when rid = 2 then a.Z132 else 0 end),
sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '140') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z133 else 0 end),
sum(case when rid = 2 then a.Z133 else 0 end),
sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '141') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z134 else 0 end),
sum(case when rid = 2 then a.Z134 else 0 end),
sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '142') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z135 else 0 end),
sum(case when rid = 2 then a.Z135 else 0 end),
sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '143') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z136 else 0 end),
sum(case when rid = 2 then a.Z136 else 0 end),
sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '144') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z137 else 0 end),
sum(case when rid = 2 then a.Z137 else 0 end),
sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '145') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z138 else 0 end),
sum(case when rid = 2 then a.Z138 else 0 end),
sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '146') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z139 else 0 end),
sum(case when rid = 2 then a.Z139 else 0 end),
sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '147') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z140 else 0 end),
sum(case when rid = 2 then a.Z140 else 0 end),
sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '148') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z141 else 0 end),
sum(case when rid = 2 then a.Z141 else 0 end),
sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '149') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z142 else 0 end),
sum(case when rid = 2 then a.Z142 else 0 end),
sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '150') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z143 else 0 end),
sum(case when rid = 2 then a.Z143 else 0 end),
sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '151') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z144 else 0 end),
sum(case when rid = 2 then a.Z144 else 0 end),
sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '152') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z145 else 0 end),
sum(case when rid = 2 then a.Z145 else 0 end),
sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '153') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z146 else 0 end),
sum(case when rid = 2 then a.Z146 else 0 end),
sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '154') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z147 else 0 end),
sum(case when rid = 2 then a.Z147 else 0 end),
sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '155') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z148 else 0 end),
sum(case when rid = 2 then a.Z148 else 0 end),
sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '156') c on 1 = 1 
  where a.org in ('GY2F00') 
 and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;


-- 厂矿数据治理平台数据灌入
truncate table data_center.ods_asset_balance_bo ;
-- 第 1 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z01 else 0 end),
sum(case when rid = 2 then a.Z01 else 0 end),
sum(case when rid = 3 then a.Z01 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '1') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z02 else 0 end),
sum(case when rid = 2 then a.Z02 else 0 end),
sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '2') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z03 else 0 end),
sum(case when rid = 2 then a.Z03 else 0 end),
sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '3') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z04 else 0 end),
sum(case when rid = 2 then a.Z04 else 0 end),
sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '4') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z05 else 0 end),
sum(case when rid = 2 then a.Z05 else 0 end),
sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '5') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z06 else 0 end),
sum(case when rid = 2 then a.Z06 else 0 end),
sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '6') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z07 else 0 end),
sum(case when rid = 2 then a.Z07 else 0 end),
sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '7') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z08 else 0 end),
sum(case when rid = 2 then a.Z08 else 0 end),
sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '8') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z09 else 0 end),
sum(case when rid = 2 then a.Z09 else 0 end),
sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '9') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z10 else 0 end),
sum(case when rid = 2 then a.Z10 else 0 end),
sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '10') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z11 else 0 end),
sum(case when rid = 2 then a.Z11 else 0 end),
sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '11') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z12 else 0 end),
sum(case when rid = 2 then a.Z12 else 0 end),
sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '12') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z13 else 0 end),
sum(case when rid = 2 then a.Z13 else 0 end),
sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '13') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z14 else 0 end),
sum(case when rid = 2 then a.Z14 else 0 end),
sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '14') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z15 else 0 end),
sum(case when rid = 2 then a.Z15 else 0 end),
sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '15') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z16 else 0 end),
sum(case when rid = 2 then a.Z16 else 0 end),
sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '16') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z17 else 0 end),
sum(case when rid = 2 then a.Z17 else 0 end),
sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '17') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z18 else 0 end),
sum(case when rid = 2 then a.Z18 else 0 end),
sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '18') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z19 else 0 end),
sum(case when rid = 2 then a.Z19 else 0 end),
sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '19') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z20 else 0 end),
sum(case when rid = 2 then a.Z20 else 0 end),
sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '20') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z21 else 0 end),
sum(case when rid = 2 then a.Z21 else 0 end),
sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '21') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z22 else 0 end),
sum(case when rid = 2 then a.Z22 else 0 end),
sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '22') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z23 else 0 end),
sum(case when rid = 2 then a.Z23 else 0 end),
sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '23') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z24 else 0 end),
sum(case when rid = 2 then a.Z24 else 0 end),
sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '24') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z25 else 0 end),
sum(case when rid = 2 then a.Z25 else 0 end),
sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '25') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z26 else 0 end),
sum(case when rid = 2 then a.Z26 else 0 end),
sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '26') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z27 else 0 end),
sum(case when rid = 2 then a.Z27 else 0 end),
sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '27') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z28 else 0 end),
sum(case when rid = 2 then a.Z28 else 0 end),
sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '28') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z29 else 0 end),
sum(case when rid = 2 then a.Z29 else 0 end),
sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '29') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z30 else 0 end),
sum(case when rid = 2 then a.Z30 else 0 end),
sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '30') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z31 else 0 end),
sum(case when rid = 2 then a.Z31 else 0 end),
sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '31') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z32 else 0 end),
sum(case when rid = 2 then a.Z32 else 0 end),
sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '32') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z33 else 0 end),
sum(case when rid = 2 then a.Z33 else 0 end),
sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '33') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z34 else 0 end),
sum(case when rid = 2 then a.Z34 else 0 end),
sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '34') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z35 else 0 end),
sum(case when rid = 2 then a.Z35 else 0 end),
sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '35') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z36 else 0 end),
sum(case when rid = 2 then a.Z36 else 0 end),
sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '36') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z37 else 0 end),
sum(case when rid = 2 then a.Z37 else 0 end),
sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '37') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z38 else 0 end),
sum(case when rid = 2 then a.Z38 else 0 end),
sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '38') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z39 else 0 end),
sum(case when rid = 2 then a.Z39 else 0 end),
sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '39') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z40 else 0 end),
sum(case when rid = 2 then a.Z40 else 0 end),
sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '40') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z41 else 0 end),
sum(case when rid = 2 then a.Z41 else 0 end),
sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '41') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z42 else 0 end),
sum(case when rid = 2 then a.Z42 else 0 end),
sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '42') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z43 else 0 end),
sum(case when rid = 2 then a.Z43 else 0 end),
sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '43') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z44 else 0 end),
sum(case when rid = 2 then a.Z44 else 0 end),
sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '44') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z45 else 0 end),
sum(case when rid = 2 then a.Z45 else 0 end),
sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '45') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z46 else 0 end),
sum(case when rid = 2 then a.Z46 else 0 end),
sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '46') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z47 else 0 end),
sum(case when rid = 2 then a.Z47 else 0 end),
sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '47') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z48 else 0 end),
sum(case when rid = 2 then a.Z48 else 0 end),
sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '48') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z49 else 0 end),
sum(case when rid = 2 then a.Z49 else 0 end),
sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '49') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z50 else 0 end),
sum(case when rid = 2 then a.Z50 else 0 end),
sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '50') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z51 else 0 end),
sum(case when rid = 2 then a.Z51 else 0 end),
sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '51') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z52 else 0 end),
sum(case when rid = 2 then a.Z52 else 0 end),
sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '52') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z53 else 0 end),
sum(case when rid = 2 then a.Z53 else 0 end),
sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '53') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z54 else 0 end),
sum(case when rid = 2 then a.Z54 else 0 end),
sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '54') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z55 else 0 end),
sum(case when rid = 2 then a.Z55 else 0 end),
sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '55') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z56 else 0 end),
sum(case when rid = 2 then a.Z56 else 0 end),
sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '56') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z57 else 0 end),
sum(case when rid = 2 then a.Z57 else 0 end),
sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '57') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z58 else 0 end),
sum(case when rid = 2 then a.Z58 else 0 end),
sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '58') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z59 else 0 end),
sum(case when rid = 2 then a.Z59 else 0 end),
sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '59') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z60 else 0 end),
sum(case when rid = 2 then a.Z60 else 0 end),
sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '60') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z61 else 0 end),
sum(case when rid = 2 then a.Z61 else 0 end),
sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '61') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z62 else 0 end),
sum(case when rid = 2 then a.Z62 else 0 end),
sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '62') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z63 else 0 end),
sum(case when rid = 2 then a.Z63 else 0 end),
sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '63') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z64 else 0 end),
sum(case when rid = 2 then a.Z64 else 0 end),
sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '64') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z65 else 0 end),
sum(case when rid = 2 then a.Z65 else 0 end),
sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '65') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z66 else 0 end),
sum(case when rid = 2 then a.Z66 else 0 end),
sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '66') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z67 else 0 end),
sum(case when rid = 2 then a.Z67 else 0 end),
sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '67') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z68 else 0 end),
sum(case when rid = 2 then a.Z68 else 0 end),
sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '68') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z69 else 0 end),
sum(case when rid = 2 then a.Z69 else 0 end),
sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '69') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z70 else 0 end),
sum(case when rid = 2 then a.Z70 else 0 end),
sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '78') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z71 else 0 end),
sum(case when rid = 2 then a.Z71 else 0 end),
sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '79') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z72 else 0 end),
sum(case when rid = 2 then a.Z72 else 0 end),
sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '80') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z73 else 0 end),
sum(case when rid = 2 then a.Z73 else 0 end),
sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '81') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z74 else 0 end),
sum(case when rid = 2 then a.Z74 else 0 end),
sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '82') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z75 else 0 end),
sum(case when rid = 2 then a.Z75 else 0 end),
sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '83') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z76 else 0 end),
sum(case when rid = 2 then a.Z76 else 0 end),
sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '84') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z77 else 0 end),
sum(case when rid = 2 then a.Z77 else 0 end),
sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '85') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z78 else 0 end),
sum(case when rid = 2 then a.Z78 else 0 end),
sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '86') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z79 else 0 end),
sum(case when rid = 2 then a.Z79 else 0 end),
sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '87') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z80 else 0 end),
sum(case when rid = 2 then a.Z80 else 0 end),
sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '88') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z81 else 0 end),
sum(case when rid = 2 then a.Z81 else 0 end),
sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '89') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z82 else 0 end),
sum(case when rid = 2 then a.Z82 else 0 end),
sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '90') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z83 else 0 end),
sum(case when rid = 2 then a.Z83 else 0 end),
sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '91') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z84 else 0 end),
sum(case when rid = 2 then a.Z84 else 0 end),
sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '92') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z85 else 0 end),
sum(case when rid = 2 then a.Z85 else 0 end),
sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '93') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z86 else 0 end),
sum(case when rid = 2 then a.Z86 else 0 end),
sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '94') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z87 else 0 end),
sum(case when rid = 2 then a.Z87 else 0 end),
sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '95') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z88 else 0 end),
sum(case when rid = 2 then a.Z88 else 0 end),
sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '96') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z89 else 0 end),
sum(case when rid = 2 then a.Z89 else 0 end),
sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '97') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z90 else 0 end),
sum(case when rid = 2 then a.Z90 else 0 end),
sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '98') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z91 else 0 end),
sum(case when rid = 2 then a.Z91 else 0 end),
sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '99') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z92 else 0 end),
sum(case when rid = 2 then a.Z92 else 0 end),
sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '100') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z93 else 0 end),
sum(case when rid = 2 then a.Z93 else 0 end),
sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '101') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z94 else 0 end),
sum(case when rid = 2 then a.Z94 else 0 end),
sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '102') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z95 else 0 end),
sum(case when rid = 2 then a.Z95 else 0 end),
sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '103') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z96 else 0 end),
sum(case when rid = 2 then a.Z96 else 0 end),
sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '104') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z97 else 0 end),
sum(case when rid = 2 then a.Z97 else 0 end),
sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '105') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z98 else 0 end),
sum(case when rid = 2 then a.Z98 else 0 end),
sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '106') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z99 else 0 end),
sum(case when rid = 2 then a.Z99 else 0 end),
sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '107') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z100 else 0 end),
sum(case when rid = 2 then a.Z100 else 0 end),
sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '108') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z101 else 0 end),
sum(case when rid = 2 then a.Z101 else 0 end),
sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '109') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z102 else 0 end),
sum(case when rid = 2 then a.Z102 else 0 end),
sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '110') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z103 else 0 end),
sum(case when rid = 2 then a.Z103 else 0 end),
sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '111') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z104 else 0 end),
sum(case when rid = 2 then a.Z104 else 0 end),
sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '112') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z105 else 0 end),
sum(case when rid = 2 then a.Z105 else 0 end),
sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '113') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z106 else 0 end),
sum(case when rid = 2 then a.Z106 else 0 end),
sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '114') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z107 else 0 end),
sum(case when rid = 2 then a.Z107 else 0 end),
sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '115') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z108 else 0 end),
sum(case when rid = 2 then a.Z108 else 0 end),
sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '116') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z109 else 0 end),
sum(case when rid = 2 then a.Z109 else 0 end),
sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '117') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z110 else 0 end),
sum(case when rid = 2 then a.Z110 else 0 end),
sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '118') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z111 else 0 end),
sum(case when rid = 2 then a.Z111 else 0 end),
sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '119') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z112 else 0 end),
sum(case when rid = 2 then a.Z112 else 0 end),
sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '120') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z113 else 0 end),
sum(case when rid = 2 then a.Z113 else 0 end),
sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '121') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z114 else 0 end),
sum(case when rid = 2 then a.Z114 else 0 end),
sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '122') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z115 else 0 end),
sum(case when rid = 2 then a.Z115 else 0 end),
sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '123') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z116 else 0 end),
sum(case when rid = 2 then a.Z116 else 0 end),
sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '124') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z117 else 0 end),
sum(case when rid = 2 then a.Z117 else 0 end),
sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '125') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z118 else 0 end),
sum(case when rid = 2 then a.Z118 else 0 end),
sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '126') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z119 else 0 end),
sum(case when rid = 2 then a.Z119 else 0 end),
sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '127') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z120 else 0 end),
sum(case when rid = 2 then a.Z120 else 0 end),
sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '128') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z121 else 0 end),
sum(case when rid = 2 then a.Z121 else 0 end),
sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '129') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z122 else 0 end),
sum(case when rid = 2 then a.Z122 else 0 end),
sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '130') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z123 else 0 end),
sum(case when rid = 2 then a.Z123 else 0 end),
sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '131') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z124 else 0 end),
sum(case when rid = 2 then a.Z124 else 0 end),
sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '132') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z125 else 0 end),
sum(case when rid = 2 then a.Z125 else 0 end),
sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '133') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z126 else 0 end),
sum(case when rid = 2 then a.Z126 else 0 end),
sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '134') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z127 else 0 end),
sum(case when rid = 2 then a.Z127 else 0 end),
sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '135') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z128 else 0 end),
sum(case when rid = 2 then a.Z128 else 0 end),
sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '136') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z129 else 0 end),
sum(case when rid = 2 then a.Z129 else 0 end),
sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '137') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z130 else 0 end),
sum(case when rid = 2 then a.Z130 else 0 end),
sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '138') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z131 else 0 end),
sum(case when rid = 2 then a.Z131 else 0 end),
sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '139') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z132 else 0 end),
sum(case when rid = 2 then a.Z132 else 0 end),
sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '140') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z133 else 0 end),
sum(case when rid = 2 then a.Z133 else 0 end),
sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '141') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z134 else 0 end),
sum(case when rid = 2 then a.Z134 else 0 end),
sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '142') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z135 else 0 end),
sum(case when rid = 2 then a.Z135 else 0 end),
sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '143') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z136 else 0 end),
sum(case when rid = 2 then a.Z136 else 0 end),
sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '144') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z137 else 0 end),
sum(case when rid = 2 then a.Z137 else 0 end),
sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '145') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z138 else 0 end),
sum(case when rid = 2 then a.Z138 else 0 end),
sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '146') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z139 else 0 end),
sum(case when rid = 2 then a.Z139 else 0 end),
sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '147') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z140 else 0 end),
sum(case when rid = 2 then a.Z140 else 0 end),
sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '148') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z141 else 0 end),
sum(case when rid = 2 then a.Z141 else 0 end),
sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '149') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z142 else 0 end),
sum(case when rid = 2 then a.Z142 else 0 end),
sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '150') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z143 else 0 end),
sum(case when rid = 2 then a.Z143 else 0 end),
sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '151') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z144 else 0 end),
sum(case when rid = 2 then a.Z144 else 0 end),
sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '152') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z145 else 0 end),
sum(case when rid = 2 then a.Z145 else 0 end),
sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '153') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z146 else 0 end),
sum(case when rid = 2 then a.Z146 else 0 end),
sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '154') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z147 else 0 end),
sum(case when rid = 2 then a.Z147 else 0 end),
sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '155') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),
c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z148 else 0 end),
sum(case when rid = 2 then a.Z148 else 0 end),
sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '156') c on 1 = 1 
  where a.org not in ('GY2F00') and ucode like ('%_r') 
 group by b.org_code,b.org_name,c.index_name,c.index_code,a.per,a.month;

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