
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
where a.index_code in ('30','86')
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
-- 6 （一）经营活动资金流入
-- 74（一）投资活动资金流入

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
where a.index_code in ('30','86')
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
  amount_acc_begin decimal(15, 2) comment '期初值'
 
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
 a.begin_balance
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
sum(amount_acc_begin)
from data_center.ads_asset_core
where index_code in ('9','27')
group by 
  org_code,
  org_name,
  level_code,
  date
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
 '合计' as asset_type,
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
 '合计' as asset_type,
  case when a.index_code = 3 then a.total else 0 end as amount_add,
  case when a.index_code = 17 then a.total else 0 end as amount_sub
from   data_center.ods_original_asset_value_bo a
left join data_center.ads_orgnization b
  on a.org_code = b.org_code
where 
 a.index_code in (3,17);
 
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
with asset_lcc as(
 select * from data_center.ods_asset_lcc_hq
 union all 
 select * from data_center.ods_asset_lcc_bo
)
select * from asset_lcc;

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

truncate table  data_center.ads_key_equipment;
INSERT INTO  data_center.ads_key_equipment
SELECT
a.org_code,
a.org_name,
c.level_code,
case when a.device_type not like '00%' then '0099' else b.device_type_no end ,
case when a.device_type not like '00%' then '其他' else b.device_type_name end ,
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
FROM 
data_center.ods_key_equipment a
left join data_center.ads_device_type b on a.device_type = b.device_type_no
left join data_center.ads_orgnization c on a.org_code = c.org_code ;

update data_center.ads_key_equipment  set is_key = 'N';
update data_center.ads_key_equipment  set is_key = 'Y' where original_value >= 1000 * 10000;
UPDATE data_center.ads_key_equipment  set  statistics_time = substr(now() + interval '-1' month,1,7);

-- update data_center.ads_key_equipment set device_type = concat('00',device_type);
update data_center.ads_key_equipment set  level_code = '1006' where org_name = '李家壕煤矿';
update data_center.ads_key_equipment set  level_code = '1002' where org_name = '万利一矿';

-- 重点设备的包头能源汇总合并数据。 20240930
insert  into data_center.ads_key_equipment
select 
	'GY2F00' as org_code,
	'包头能源' as org_name,
	'100' as level_code,
	device_type_no,
	device_type_name,
	device_name,
	'' as is_key,
	'' as serial_no,
	sum(cnt) as cnt,
	'' as manufacture,
	'' as purchase_time,
	null as total_coal_amount,
	sum(original_value) as original_value,
	sum(accumulated_depreciation) as accumulated_depreciation,
	sum(net_value) as net_value,
	'' as locatino,
	statistics_time,
	status,
	scrap_time,
	null as depreciation_life_years,
	null as design_lifetime_years,
	null as actual_usage_years
from ads_key_equipment
group by 
device_type_no,
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
delete from data_center.ads_qudui_model where report_date = substr(now() + interval '-1' month,1,7);
insert into data_center.ads_qudui_model
select 
a.cl_no,
a.cl_name,
b.cwfl_name,
a.scale,
a.unit,
a.dept_id,
a.dept_name,
a.remain,
a.price,
substr(now() + interval '-1' month,1,7) as report_date
from data_center.qd_kc_cw a 
left join ( select distinct cl_no,cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

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
delete from data_center.ads_zhouzhuan_model where report_date = substr(now() + interval '-1' month,1,7);
insert into data_center.ads_zhouzhuan_model
select 
a.cl_no,
a.cl_name,
b.cwfl_name,
a.scale,
a.unit,
a.dept_id,
a.dept_name,
a.remain,
a.price,
substr(now() + interval '-1' month,1,7) as report_date
from data_center.zz_tz_cw a 
left join ( select distinct cl_no,cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;


/**
*  2024-10-22 : 根据 设备表里的数据来生成 设备类型表。
**/

truncate table ads_device_type;
insert into ads_device_type
select distinct device_type_no , SUBSTRING_INDEX(device_type_name,'-',-1) ,'1'
from ads_key_equipment;

insert into ads_device_type value ('1400000000','全部','1');


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


/** 2024-10-24 
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
  cip_project decimal(15, 2) comment '本年在建工程'

) COMMENT='折旧与摊销ads';
***/
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
  date,
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
  a.cip_project
from ods_dep_and_amo a
left join data_center.ads_orgnization c
on a.org_code = c.org_code;

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
with ods_dep_and_amo as (
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
from ods_dep_and_amo a
left join data_center.ads_orgnization c
on a.org_code = c.org_code;

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
    org_main_data_code VARCHAR(50) COMMENT '组织机构主数据编码'  
) COMMENT='ods设备信息表' ;
**/

-- 导入 3个 EXPORT报表  en结尾，去掉 复选和序号


/** 2024-10-24 ads_device_type
drop table data_center.ads_device_type;
CREATE TABLE data_center.ads_device_type (
  device_type_no varchar(64) comment '设备类型编码',
  device_type_name varchar(64) comment '设备类型名称',
  is_key varchar(64) comment '是否重点设备'
) COMMENT='设备类型ads';
***/
truncate table ads_device_type;

insert into ads_device_type
select distinct asset_catalog_code,substring_index(asset_catalog_name,'-',-1),'' 
  from device_table
where asset_catalog_code like '14%'
order by asset_catalog_code;
insert into ads_device_type values('1400000000','合计','');


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
    device_type_name  VARCHAR(255) COMMENT '设备类型名称',  
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
    org_main_data_code VARCHAR(50) COMMENT '组织机构主数据编码'  
) COMMENT='ads设备信息表' ;
**/
truncate table ads_device_info;
insert into ads_device_info
select
c.org_code,
c.org_name,
c.level_code,
substr(now() + interval '-1' month,1,7),
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
    t.device_type_name,
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
left join  data_center.ads_orgnization c on d.org_code = c.org_code
left join ads_device_type t on d.asset_catalog_code = t.device_type_no;


/**
资产管理 - 业财存货管理
语义模型 23.业财存货管理    ads_ycch
业财存货管理


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
  ac_rate decimal(15, 2) comment '预算完成率'
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
        (case when bud.AMOUNT = 0 then null else asset.amount_acc / bud.AMOUNT end ) ac_rate 
  from ads_asset_core asset
  left join ods_budget_operating_value  bud 
      on asset.org_code = (case when bud.ENTITY like '23%' then concat('00', bud.ENTITY) else bud.ENTITY end ) 
      and bud.years = substr(asset.date,1,4) 
      and bud.VERSION = 'JYYS1'  -- 版本
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
  ac_rate decimal(15, 2) comment '预算完成率'
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
        and b.account = 'QNPJZGRS'
        and b.scenario = 'Budget' 
      ),
    RAND() * 10000000
  from ods_empwelf_detail_value a
  where a.account = 'ZGFLFHJ';

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
        (case when bud.AMOUNT = 0 then null else emp.amount_acc / bud.AMOUNT end ) ac_rate 
  from ads_employee_benefits emp
  left join ods_empwelf_detail_value bud 
      on emp.org_code  = (case when bud.ENTITY like '23%' then concat('00', bud.ENTITY) else bud.ENTITY end ) 
      and bud.years = substr(emp.date,1,4) 
      and bud.VERSION = 'JYYS1'  -- 版本
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
