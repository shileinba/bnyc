
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