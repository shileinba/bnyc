
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
truncate table data_center.ods_summary_index_hq;
insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 1) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

	  
insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 2) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 3) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 4) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 5) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 6) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 7) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 8) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 9) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 10) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 11) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 12) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 13) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 14) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 15) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 16) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 17) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 18) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 19) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 20) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 21) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 22) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 23) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 24) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 25) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 26) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 27) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 28) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 29) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 30) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 31) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 32) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 33) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 34) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 35) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 36) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 37) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 38) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 39) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 40) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 41) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 42) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_hq
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 43) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;



-- 厂矿数据治理平台数据灌入
-- 数据治理平台数据灌入
truncate table data_center.ods_summary_index_bo;
insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 1) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

	  
insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 2) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 3) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 4) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 5) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 6) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 7) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 8) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 9) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 10) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 11) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 12) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 13) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 14) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 15) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 16) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 17) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 18) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 19) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 20) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 21) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 22) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 23) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 24) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 25) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 26) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 27) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 28) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 29) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 30) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 31) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 32) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 33) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 34) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 35) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 36) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 37) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 38) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 39) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 40) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 41) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 42) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;

insert into data_center.ods_summary_index_bo
select
      b.org_code,
      b.org_name,
      concat(per,'-',substr(a.month,5,3)),
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
      on a.org = b.org_code
      left join (select * from data_center.ods_summary_index_ref where index_code = 43) c
      on 1 = 1
      where org in ('GY2F00')  and ucode like ('%_r')
      group by b.org_code, b.org_name, c.index_name, c.index_code, a.month;






