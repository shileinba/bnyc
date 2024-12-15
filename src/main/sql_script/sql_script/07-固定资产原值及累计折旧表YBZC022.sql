
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









