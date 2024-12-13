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
with asset_lcc as (select *
                   from data_center.ods_asset_lcc_hq
                   union all
                   select *
                   from data_center.ods_asset_lcc_bo)
select *
from asset_lcc;

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

truncate table data_center.ads_key_equipment;
INSERT INTO data_center.ads_key_equipment
SELECT a.org_code,
       a.org_name,
       c.level_code,
       case when a.device_type not like '00%' then '0099' else b.device_type_no end,
       case when a.device_type not like '00%' then '其他' else b.device_type_name end,
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
FROM data_center.ods_key_equipment a
         left join data_center.ads_device_type b on a.device_type = b.device_type_no
         left join data_center.ads_orgnization c on a.org_code = c.org_code;

update data_center.ads_key_equipment
set is_key = 'N';
update data_center.ads_key_equipment
set is_key = 'Y'
where original_value >= 1000 * 10000;
UPDATE data_center.ads_key_equipment
set statistics_time = substr(now() + interval '-1' month, 1, 7);

-- update data_center.ads_key_equipment set device_type = concat('00',device_type);
update data_center.ads_key_equipment
set level_code = '1006'
where org_name = '李家壕煤矿';
update data_center.ads_key_equipment
set level_code = '1002'
where org_name = '万利一矿';

-- 重点设备的包头能源汇总合并数据。 20240930
insert into data_center.ads_key_equipment
select 'GY2F00'                      as org_code,
       '包头能源'                    as org_name,
       '100'                         as level_code,
       device_type_no,
       device_type_name,
       device_name,
       ''                            as is_key,
       ''                            as serial_no,
       sum(cnt)                      as cnt,
       ''                            as manufacture,
       ''                            as purchase_time,
       null                          as total_coal_amount,
       sum(original_value)           as original_value,
       sum(accumulated_depreciation) as accumulated_depreciation,
       sum(net_value)                as net_value,
       ''                            as locatino,
       statistics_time,
       status,
       scrap_time,
       null                          as depreciation_life_years,
       null                          as design_lifetime_years,
       null                          as actual_usage_years
from ads_key_equipment
group by device_type_no,
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
delete
from data_center.ads_qudui_model
where report_date = substr(now() + interval '-1' month, 1, 7);
insert into data_center.ads_qudui_model
select a.cl_no,
       a.cl_name,
       b.cwfl_name,
       a.scale,
       a.unit,
       a.dept_id,
       a.dept_name,
       a.remain,
       a.price,
       substr(now() + interval '-1' month, 1, 7) as report_date
from data_center.qd_kc_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

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
delete
from data_center.ads_zhouzhuan_model
where report_date = substr(now() + interval '-1' month, 1, 7);
insert into data_center.ads_zhouzhuan_model
select a.cl_no,
       a.cl_name,
       b.cwfl_name,
       a.scale,
       a.unit,
       a.dept_id,
       a.dept_name,
       a.remain,
       a.price,
       substr(now() + interval '-1' month, 1, 7) as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;


/**
*  2024-10-22 : 根据 设备表里的数据来生成 设备类型表。
**/

-- truncate table ads_device_type;
-- insert into ads_device_type
-- select distinct device_type_no , SUBSTRING_INDEX(device_type_name,'-',-1) ,'1'
-- from ads_key_equipment;

-- insert into ads_device_type value ('1400000000','全部','1');

/**
区队库库存明细

drop table data_center.ads_qudui_kc_detail;
CREATE TABLE data_center.ads_qudui_kc_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  remain decimal(15, 2) comment '库存量',
  price decimal(15, 2) comment '单价',
  unit varchar(64) comment '计量单位',
  dept_id varchar(64) comment '部门ID',
  dept_name varchar(64) comment '部门名称',
	cwfl_name varchar(64) comment '财务分类'
) COMMENT='区队库库存明细-二级页面';
**/
truncate table data_center.ads_qudui_kc_detail;
insert into data_center.ads_qudui_kc_detail
SELECT a.cl_no,
       a.cl_name,
       a.scale,
       sum(a.remain) as remain,
       a.price,
       a.unit,
       a.dept_id,
       a.dept_name,
       b.cwfl_name
FROM data_center.qd_kc_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no
group by a.cl_no,
         a.cl_name,
         a.scale,
         a.price,
         a.unit,
         a.dept_id,
         a.dept_name,
         b.cwfl_name
;


/**
区队库入库明细

drop table data_center.ads_qudui_in_detail;
CREATE TABLE data_center.ads_qudui_in_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  input decimal(15, 2) comment '入库量',
  price decimal(15, 2) comment '单价',
  amount decimal(15, 2) comment '金额', 
  cwfl_name varchar(64) comment '财务分类',
  sdate varchar(64) comment '日期',
  qd_name varchar(64) comment '区队名称'
) COMMENT='区队库入库明细-二级页面';
**/
truncate table data_center.ads_qudui_in_detail;
insert into data_center.ads_qudui_in_detail
SELECT cl_no,
       cl_name,
       scale,
       sum(input),
       price,
       sum(amount),
       cwfl_name,
       substr(sdate, 1, 10),
       qd_name
FROM `qd_in_cw`
group by substr(sdate, 1, 7),
         scale,
         cwfl_name,
         cl_name,
         price,
         qd_name;


/**
区队库出库明细

drop table data_center.ads_qudui_out_detail;
CREATE TABLE data_center.ads_qudui_out_detail (
  cl_no varchar(64) comment '材料编码',
  cl_name varchar(64) comment '材料名称',
  scale varchar(64) comment '规格型号',
  output decimal(15, 2) comment '出库量',
  price decimal(15, 2) comment '单价',
  amount decimal(15, 2) comment '金额', 
  cwfl_name varchar(64) comment '财务分类',
  sdate varchar(64) comment '日期',
  dept_fname varchar(64) comment '父级部门名称',
  dept_name varchar(64) comment '部门名称'
) COMMENT='区队库出库明细-二级页面';
**/
truncate table data_center.ads_qudui_out_detail;
insert into data_center.ads_qudui_out_detail
SELECT a.cl_no,
       a.cl_name,
       a.scale,
       sum(a.output),
       a.price,
       sum(a.amount),
       b.cwfl_name,
       substr(a.sdate, 1, 10),
       a.dept_fname,
       a.dept_name
FROM data_center.`qd_out_cw` a
         left join data_center.xh_cl_cw b on a.scale = b.scale
group by substr(a.sdate, 1, 7),
         a.scale,
         b.cwfl_name,
         a.cl_name,
         a.price,
         a.dept_fname,
         a.dept_name;


/**
* 周转库明细信息-二级

drop table data_center.ads_zhouzhuan_detail ;
CREATE TABLE data_center.ads_zhouzhuan_detail (
  self_no varchar(64) comment '自身编码',
  orig_price decimal(24,4) comment '原始单价',
  dept_id varchar(64) comment '部门编码',
  cl_no varchar(64) comment '材料编码',
  ejplace_idname varchar(64) comment '使用地点',
  cl_name varchar(64) comment '材料名称',
  remain decimal(24,4) comment '剩余数量',
  repair_count decimal(24,4) comment '累计维修次数',
  amount decimal(24,4) comment '原金额',
  scale varchar(64) comment '规格',
  status_idname varchar(64) comment '状态',
  price decimal(24,4) comment '现单价',
  xamount decimal(24,4) comment '现金额',
  unit varchar(64) comment '单位',
  dept_name varchar(64) comment '部门名称',
  total_repair_amount decimal(24,4) comment '现金额',
  cwfl_name varchar(64) comment '财务分类',
  report_date varchar(64) comment '上报日期'
) COMMENT='区队库存模型-ads';
**/

truncate table data_center.ads_zhouzhuan_detail;
insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-08' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-09' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-10' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

insert into data_center.ads_zhouzhuan_detail
select a.self_no,
       a.orig_price,
       a.dept_id,
       a.cl_no,
       a.ejplace_idname,
       a.cl_name,
       a.remain,
       a.repair_count,
       a.amount,
       a.scale,
       a.status_idname,
       a.price,
       a.xamount,
       a.unit,
       a.dept_name,
       a.total_repair_amount,
       b.cwfl_name,
       '2024-11' as report_date
from data_center.zz_tz_cw a
         left join (select distinct cl_no, cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;

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
    org_main_data_code VARCHAR(50) COMMENT '组织机构主数据编码'  ,
    date  VARCHAR(32) COMMENT '日期'
) COMMENT='ods设备信息表' ;
**/

-- 导入 3个 EXPORT报表  en结尾，去掉 复选和序号
/** 2024-10-24 ads_device_type
drop table data_center.ads_device_type;
CREATE TABLE data_center.ads_device_type (
  device_type_no varchar(64) comment '设备类型编码',
  device_type_name varchar(64) comment '设备类型名称',
  parent_type_no varchar(64) comment '父级设备类型编码',
  parent_type_name varchar(64) comment '父设备类型名称',
  is_key varchar(64) comment '是否重点设备',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备类型ads';
***/
truncate table ads_device_type;

insert into ads_device_type
select distinct asset_catalog_code, substring_index(asset_catalog_name, '-', -1), '', '', '', now(), null
from device_table
where asset_catalog_code like '14%'
order by asset_catalog_code;
insert into ads_device_type
values ('1400000000', '合计', '100', '合计', '1', now(), null);

-- 更新父级设备 类型 2024-11-19 
update ads_device_type
set parent_type_name = '掘进机',
    parent_type_no   = '1001',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('掘进机', '掘锚机', '连续采煤机', '掘进设备');
update ads_device_type
set parent_type_name = '采煤机',
    parent_type_no   = '1002',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('采煤机', '滚筒采煤机');
update ads_device_type
set parent_type_name = '刮板输送机',
    parent_type_no   = '1003',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('刮板输送机');
update ads_device_type
set parent_type_name = '胶带输送机',
    parent_type_no   = '1004',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('胶带输送机');
update ads_device_type
set parent_type_name = '转载机',
    parent_type_no   = '1005',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('转载机');
update ads_device_type
set parent_type_name = '破碎机',
    parent_type_no   = '1006',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('破碎机');
update ads_device_type
set parent_type_name = '液压支架',
    parent_type_no   = '1007',
    is_key           = '1',
    updated_time     = now()
where device_type_name in
      ('液压支架', '端头液压支架', '中间液压支架', '过渡液压支架', '超前液压支架', '三角区掩护液压支架',
       '其他液压支架');
update ads_device_type
set parent_type_name = '胶轮车',
    parent_type_no   = '1008',
    is_key           = '1',
    updated_time     = now()
where device_type_name in ('支架搬运车', '胶轮车');


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
    device_type_no  VARCHAR(255) COMMENT '设备类型编码', 
    device_type_name  VARCHAR(255) COMMENT '设备类型名称', 
    parent_type_no  VARCHAR(255) COMMENT '父级设备类型编码',  
    parent_type_name  VARCHAR(255) COMMENT '父级设备类型名称',  
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
    purchase_date VARCHAR(50) COMMENT '采购日期',  
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
-- delete
-- from ads_device_info
-- where date = substr(now() + interval '-1' month,1,7)
truncate table ads_device_info;
;
insert into ads_device_info
select c.org_code,
       c.org_name,
       c.level_code,
       date,
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
       t.device_type_no,
       t.device_type_name,
       t.parent_type_no,
       t.parent_type_name,
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
       substr(capitalization_date, 1, 4),
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
         left join data_center.ads_orgnization c on d.org_code = c.org_code
         left join ads_device_type t on d.asset_catalog_code = t.device_type_no
         left join ads_device_param_value v on 1 = 1
where d.accum_purchase_value >= v.param_device_value
;


/**
资产管理 - 业财存货管理
语义模型 23.业财存货管理    ads_ycch
业财存货管理 语义模型使用的 sql脚本的方式，脚本如下：
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
投资 - 2024-12-05 : 线下填报 HZJ
drop table data_center.ods_invest_plan;
CREATE TABLE data_center.ods_invest_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_acc decimal(15, 2) comment '本年实际',
  created_time varchar(64) comment '创建时间',
  updated_time varchar(64) comment '更新时间',
  id varchar(64) comment 'ID标识'
) COMMENT='资产-投资计划odds';
INSERT INTO `data_center`.`ods_invest_plan`(`org_code`, `org_name`, `date`, `index_name`, `index_code`, `amount_pre`, `amount_acc`, `created_time`, `updated_time`, `id`) VALUES ('GY2F00', '包头能源', '2024-11', '投资', '1', 104280.94, 93901.45, NULL, NULL, NULL);
INSERT INTO `data_center`.`ods_invest_plan`(`org_code`, `org_name`, `date`, `index_name`, `index_code`, `amount_pre`, `amount_acc`, `created_time`, `updated_time`, `id`) VALUES ('GY2F00', '包头能源', '2024-10', '投资', '1', 100215.00, 55222.00, NULL, NULL, NULL);

**/

/**
投资
drop table data_center.ads_invest_plan;
CREATE TABLE data_center.ads_invest_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
  amount_pre decimal(15, 2) comment '本年预算',
  amount_acc decimal(15, 2) comment '本年实际',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='投资计划ads';
**/
truncate table data_center.ads_invest_plan;
insert into data_center.ads_invest_plan
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       a.index_name,
       a.index_code,
       a.amount_pre,
       a.amount_acc,
       now(),
       now()
from ods_invest_plan a
         left join data_center.ads_orgnization b on a.org_code = b.org_code
;
/**
-- 投资计划是填报数据，不能truncate 
truncate table ads_invest_plan;
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-09','合计','1',100214.61,55221.52,now(),now());
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-10','合计','1',100214.61,55221.52,now(),now());
insert into ads_invest_plan
values('GY2F00','包头能源','100','2024-11','合计','1',100214.61,55221.52,now(),now());
**/

/**
drop table data_center.ods_device_purchase_plan;
CREATE TABLE data_center.ods_device_purchase_plan (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(64) comment '日期',
	year varchar(64) comment '年份',
	month varchar(64) comment '月份	',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
	device_type_no varchar(64) comment '设备类型编号',
	device_type_name varchar(64) comment '设备类型名称',
  spec_model varchar(64) comment '规格型号',
  count decimal(15, 2) comment '台数',
  budget_year decimal(15, 2) comment '年度预算数',
  budget_q1 decimal(15, 2) comment '季度预算',
  budget_m1 decimal(15, 2) comment '1月度预算',
	budget_m2 decimal(15, 2) comment '2月度预算',
  budget_m3 decimal(15, 2) comment '3月度预算',
	budget_q2 decimal(15, 2) comment '季度预算',
  budget_m4 decimal(15, 2) comment '4月度预算', 
	budget_m5 decimal(15, 2) comment '5月度预算',
  budget_m6 decimal(15, 2) comment '6月度预算',
	budget_q3 decimal(15, 2) comment '季度预算',
  budget_m7 decimal(15, 2) comment '7月度预算',
	budget_m8 decimal(15, 2) comment '8月度预算',
  budget_m9 decimal(15, 2) comment '9月度预算',
	budget_q4 decimal(15, 2) comment '季度预算',
  budget_m10 decimal(15, 2) comment '10月度预算',
	budget_m11 decimal(15, 2) comment '11月度预算',
	budget_m12 decimal(15, 2) comment '12月度预算',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备采购计划－ods表';
**/
/**
-- 设备采购计划是填报表，不能truncate 
truncate table `data_center`.`ods_device_purchase_plan`;
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('GY2F00', '包头能源', '2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 2, 13500.00, 10000.00, 6000.00, 3000.00, 1000.00, 24600.00, 20000.00, 4000.00, 600.00, NULL, NULL, NULL, NULL, NULL, 1000, 2000, 1400, NOW(), NOW());
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿','2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 1, 10000.00, 8000.00, 4000.00, 500.00, 500.00, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 1000, 700, NOW(),NOW());
INSERT INTO `data_center`.`ods_device_purchase_plan`(`org_code`, `org_name`, `date`, `year`, `month`, `index_name`, `index_code`, `device_type_no`,`device_type_name`, `spec_model`, `count`, `budget_year`, `budget_q1`, `budget_m1`, `budget_m2`, `budget_m3`, `budget_q2`, `budget_m4`, `budget_m5`, `budget_m6`, `budget_q3`, `budget_m7`, `budget_m8`, `budget_m9`, `budget_q4`, `budget_m10`, `budget_m11`, `budget_m12`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕','2024-10', '2024', '10', NULL, '100', '1401010000','采煤机', NULL, 1, 10000.00, 8000.00, 4000.00, 500.00, 500.00, 5000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 500, 1000, 700, NOW(),NOW());
**/
/**
drop table data_center.ads_device_purchase_plan_convert;
CREATE TABLE data_center.ads_device_purchase_plan_convert (
  org_code varchar(64) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(64) comment '日期',
	year varchar(64) comment '年份',
	month varchar(64) comment '月份	',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(64) comment '指标编码',
	device_type_no varchar(64) comment '设备类型编号',
	device_type_name varchar(64) comment '设备类型名称',
  spec_model varchar(64) comment '规格型号',
  count decimal(15, 2) comment '台数',
  date_type varchar(8) comment '时间类型',  -- Y :年  Q :季度 M ：月
  date_value varchar(8) comment '时间值',
  budget decimal(15, 2) comment '预算数',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='设备采购计划时间转置－ads表';
**/

truncate table ads_device_purchase_plan_convert;
-- 插入年度数据
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       a.count,
       'Y',
       a.year,
       a.budget_year,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       concat(a.year,'-01',a.year,'-02',a.year,'-03') as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '1',
       a.budget_q1,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       concat(a.year,'-04',a.year,'-05',a.year,'-06') as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '2',
       a.budget_q2,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       concat(a.year,'-07',a.year,'-08',a.year,'-09') as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '3',
       a.budget_q3,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;
insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       concat(a.year,'-10',a.year,'-11',a.year,'-12') as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'Q',
       '4',
       a.budget_q4,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-01'),
       a.budget_m1,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;


insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-02'),
       a.budget_m2,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-03'),
       a.budget_m3,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-04'),
       a.budget_m4,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-05'),
       a.budget_m5,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-06'),
       a.budget_m6,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-07'),
       a.budget_m7,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-08'),
       a.budget_m8,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-09'),
       a.budget_m9,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-10'),
       a.budget_m10,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-11'),
       a.budget_m11,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

insert into ads_device_purchase_plan_convert
select b.org_code,
       b.org_name,
       b.level_code,
       '' as date,-- a.date, -- 年月
       a.year,  -- 年
       '' as month,-- substr(a.date, 6, 2),  -- 月
       a.index_name,
       a.index_code,
       a.device_type_no,
       a.device_type_name,
       a.spec_model,
       0,
       'M',
       concat(substr(a.date, 1, 4), '-12'),
       a.budget_m12,
       NOW(),
       NOW()
from ods_device_purchase_plan a
    left join ads_orgnization b
on b.org_code = a.org_code
;

/**
drop table data_center.ods_device_oee;
CREATE TABLE data_center.ods_device_oee (
  org_code varchar(32) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  date varchar(32) comment '日期',
  index_name varchar(64) comment '指标名称', 
  index_code varchar(32) comment '指标编码',
  asset_id VARCHAR(20) COMMENT '资产编码',  
  asset_catalog_code VARCHAR(20) COMMENT '资产目录编码',  
  asset_catalog_name VARCHAR(255) COMMENT '资产目录名称',  
  actual_time decimal(15, 2) comment '实际运行时间',
  plan_time decimal(15, 2) comment '计划运行时间',  
  actual_amount decimal(15, 2) comment '实际产出',
  plan_amount decimal(15, 2) comment '理论产出',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='oee－ods表';
truncate table data_center.ods_device_oee;
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿','2024-10-28',  '140000003886', '1401010001', '采煤机', 10.00, 12.00, 300.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿', '2024-10-29',  '140000003886', '1401010001', '采煤机', 11.00, 12.00, 301.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F06', '李家壕煤矿', '2024-10-30',  '140000003886', '1401010001', '采煤机', 12.00, 12.00, 310.00, 320.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-28',  '140000000728', '1401010001', '采煤机', 13.00, 19.00, 280.00, 330.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-29',  '140000000728', '1401010001', '采煤机', 15.00, 18.00, 287.00, 330.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-30',  '140000000728', '1401010001', '采煤机', 17.00, 19.00, 299.00, 340.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-28',  '140000001666', '1401010001', '采煤机', 16.00, 22.00, 333.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-29',  '140000001666', '1401010001', '采煤机', 18.00, 22.00, 365.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');
INSERT INTO `data_center`.`ods_device_oee`(`org_code`, `org_name`, `date`, `asset_id`, `asset_catalog_code`, `asset_catalog_name`, `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`, `updated_time`) VALUES ('2F02', '万利一矿',  '2024-10-30',  '140000001666', '1401010001', '采煤机', 20.00, 22.00, 367.00, 380.00, '2024-11-26 11:50:23', '2024-11-26 11:50:23');

**/

/**
drop table data_center.ads_device_oee;
CREATE TABLE data_center.ads_device_oee (
  org_code varchar(32) comment '单位编码',
  org_name varchar(64) comment '单位名称',
  level_code varchar(64) comment '权限预留',
  date varchar(32) comment '日期',
  year varchar(32) comment '年',
  month varchar(32) comment '月',
  day varchar(32) comment '日',
  asset_id VARCHAR(20) COMMENT '资产编码',  
  asset_name VARCHAR(64) COMMENT '资产名称',  
  device_type_no VARCHAR(20) COMMENT '资产目录编码',  
  device_type_name VARCHAR(255) COMMENT '资产目录名称',  
  actual_time decimal(15, 2) comment '实际运行时间',
  plan_time decimal(15, 2) comment '计划运行时间',  
  actual_amount decimal(15, 2) comment '实际产出',
  plan_amount decimal(15, 2) comment '理论产出',
  created_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '创建时间',
  updated_time datetime(0) DEFAULT CURRENT_TIMESTAMP comment '更新时间'
) COMMENT='oee－ads表';

**/
truncate table data_center.ads_device_oee;
insert into data_center.ads_device_oee
select b.org_code,
       b.org_name,
       b.level_code,
       a.date,
       substr(a.date, 1, 4) as year,
  substr(a.date,6,2) as month,
  substr(a.date,9,2) as day,
  a.asset_id,
  d.asset_name,
  t.device_type_no,
  t.device_type_name,
  a.actual_time,
  a.plan_time,
  a.actual_amount,
  a.plan_amount,
  now(),
  now()
from ods_device_oee a
    left join ads_orgnization b
on b.org_code = a.org_code
    left join ads_device_info d
    on d.asset_id = a.asset_id
    and d.device_type_no = a.asset_catalog_code
    left join ads_device_type t
    on t.device_type_no = a.asset_catalog_code
;
truncate table data_center.ads_device_oee;
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F06', '李家壕煤矿', '10006', '2024-09-30', '2024', '09', '30', '140000003886', '采煤机', '1401010001',
        '滚筒采煤机', 400.00, 420.00, 560000.00, 570000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-09-30', '2024', '09', '30', '140000000728', '采煤机', '1401010001',
        '滚筒采煤机', 352.00, 480.00, 596000.00, 704000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-09-30', '2024', '09', '30', '140000001666', '6650采煤机', '1401010001',
        '滚筒采煤机', 600.00, 690.00, 601579.00, 600000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F06', '李家壕煤矿', '10006', '2024-10-30', '2024', '10', '30', '140000003886', '采煤机', '1401010001',
        '滚筒采煤机', 400.00, 420.00, 560000.00, 570000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-10-30', '2024', '10', '30', '140000000728', '采煤机', '1401010001',
        '滚筒采煤机', 352.00, 480.00, 596000.00, 704000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
INSERT INTO `data_center`.`ads_device_oee`(`org_code`, `org_name`, `level_code`, `date`, `year`, `month`, `day`,
                                           `asset_id`, `asset_name`, `device_type_no`, `device_type_name`,
                                           `actual_time`, `plan_time`, `actual_amount`, `plan_amount`, `created_time`,
                                           `updated_time`)
VALUES ('2F02', '万利一矿', '10002', '2024-10-30', '2024', '10', '30', '140000001666', '6650采煤机', '1401010001',
        '滚筒采煤机', 600.00, 690.00, 601579.00, 600000.00, '2024-12-02 14:28:44', '2024-12-02 14:28:44');
