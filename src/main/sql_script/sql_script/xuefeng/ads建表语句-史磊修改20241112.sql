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

