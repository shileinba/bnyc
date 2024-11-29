

/**
区队库库存明细
**/
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

truncate table data_center.ads_qudui_kc_detail;
insert into data_center.ads_qudui_kc_detail
SELECT 
	a.cl_no,
	a.cl_name,
	a.scale,
	sum(a.remain) as remain,
	a.price,
	a.unit,
	a.dept_id,
	a.dept_name,
	b.cwfl_name
FROM data_center.qd_kc_cw a
left join ( select distinct cl_no,cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no
group by 
	a.cl_no,
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
**/
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

truncate table data_center.ads_qudui_in_detail;
insert into data_center.ads_qudui_in_detail
SELECT 
	cl_no,
	cl_name,
	scale,
	sum(input),
	price,
	sum(amount),
	cwfl_name,
	substr(sdate,1,10),
	qd_name
FROM `qd_in_cw`
group by 
	substr(sdate,1,7),
	scale,
	cwfl_name,
	cl_name,
	price,
	qd_name;


/**
区队库出库明细
**/
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

truncate table data_center.ads_qudui_out_detail;
insert into data_center.ads_qudui_out_detail
SELECT 
	a.cl_no,
	a.cl_name,
	a.scale,
	sum(a.output),
	a.price,
	sum(a.amount),
	b.cwfl_name,
	substr(a.sdate,1,10),
	a.dept_fname,
	a.dept_name
FROM data_center.`qd_out_cw` a 
left join data_center.xh_cl_cw b on a.scale = b.scale
group by 
	substr(a.sdate,1,7),
	a.scale,
	b.cwfl_name,
	a.cl_name,
	a.price,
	a.dept_fname,
	a.dept_name;
	

/**
* 周转库明细信息-二级
**/
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


truncate table data_center.ads_zhouzhuan_detail;
insert into data_center.ads_zhouzhuan_detail
select 
	a.self_no,
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
left join ( select distinct cl_no,cwfl_name from data_center.xh_cl_cw) b on a.cl_no = b.cl_no;


	