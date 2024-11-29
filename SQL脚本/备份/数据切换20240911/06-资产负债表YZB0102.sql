
/* -- 存货分类统计
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
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z02 else 0 end),
sum(case when rid = 2 then a.Z02 else 0 end),
sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '2') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z03 else 0 end),
sum(case when rid = 2 then a.Z03 else 0 end),
sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '3') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z04 else 0 end),
sum(case when rid = 2 then a.Z04 else 0 end),
sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '4') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z05 else 0 end),
sum(case when rid = 2 then a.Z05 else 0 end),
sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '5') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z06 else 0 end),
sum(case when rid = 2 then a.Z06 else 0 end),
sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '6') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z07 else 0 end),
sum(case when rid = 2 then a.Z07 else 0 end),
sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '7') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z08 else 0 end),
sum(case when rid = 2 then a.Z08 else 0 end),
sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '8') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z09 else 0 end),
sum(case when rid = 2 then a.Z09 else 0 end),
sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '9') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z10 else 0 end),
sum(case when rid = 2 then a.Z10 else 0 end),
sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '10') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z11 else 0 end),
sum(case when rid = 2 then a.Z11 else 0 end),
sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '11') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z12 else 0 end),
sum(case when rid = 2 then a.Z12 else 0 end),
sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '12') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z13 else 0 end),
sum(case when rid = 2 then a.Z13 else 0 end),
sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '13') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z14 else 0 end),
sum(case when rid = 2 then a.Z14 else 0 end),
sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '14') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z15 else 0 end),
sum(case when rid = 2 then a.Z15 else 0 end),
sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '15') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z16 else 0 end),
sum(case when rid = 2 then a.Z16 else 0 end),
sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '16') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z17 else 0 end),
sum(case when rid = 2 then a.Z17 else 0 end),
sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '17') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z18 else 0 end),
sum(case when rid = 2 then a.Z18 else 0 end),
sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '18') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z19 else 0 end),
sum(case when rid = 2 then a.Z19 else 0 end),
sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '19') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z20 else 0 end),
sum(case when rid = 2 then a.Z20 else 0 end),
sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '20') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z21 else 0 end),
sum(case when rid = 2 then a.Z21 else 0 end),
sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '21') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z22 else 0 end),
sum(case when rid = 2 then a.Z22 else 0 end),
sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '22') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z23 else 0 end),
sum(case when rid = 2 then a.Z23 else 0 end),
sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '23') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z24 else 0 end),
sum(case when rid = 2 then a.Z24 else 0 end),
sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '24') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z25 else 0 end),
sum(case when rid = 2 then a.Z25 else 0 end),
sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '25') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z26 else 0 end),
sum(case when rid = 2 then a.Z26 else 0 end),
sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '26') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z27 else 0 end),
sum(case when rid = 2 then a.Z27 else 0 end),
sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '27') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z28 else 0 end),
sum(case when rid = 2 then a.Z28 else 0 end),
sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '28') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z29 else 0 end),
sum(case when rid = 2 then a.Z29 else 0 end),
sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '29') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z30 else 0 end),
sum(case when rid = 2 then a.Z30 else 0 end),
sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '30') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z31 else 0 end),
sum(case when rid = 2 then a.Z31 else 0 end),
sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '31') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z32 else 0 end),
sum(case when rid = 2 then a.Z32 else 0 end),
sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '32') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z33 else 0 end),
sum(case when rid = 2 then a.Z33 else 0 end),
sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '33') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z34 else 0 end),
sum(case when rid = 2 then a.Z34 else 0 end),
sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '34') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z35 else 0 end),
sum(case when rid = 2 then a.Z35 else 0 end),
sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '35') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z36 else 0 end),
sum(case when rid = 2 then a.Z36 else 0 end),
sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '36') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z37 else 0 end),
sum(case when rid = 2 then a.Z37 else 0 end),
sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '37') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z38 else 0 end),
sum(case when rid = 2 then a.Z38 else 0 end),
sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '38') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z39 else 0 end),
sum(case when rid = 2 then a.Z39 else 0 end),
sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '39') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z40 else 0 end),
sum(case when rid = 2 then a.Z40 else 0 end),
sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '40') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z41 else 0 end),
sum(case when rid = 2 then a.Z41 else 0 end),
sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '41') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z42 else 0 end),
sum(case when rid = 2 then a.Z42 else 0 end),
sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '42') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z43 else 0 end),
sum(case when rid = 2 then a.Z43 else 0 end),
sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '43') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z44 else 0 end),
sum(case when rid = 2 then a.Z44 else 0 end),
sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '44') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z45 else 0 end),
sum(case when rid = 2 then a.Z45 else 0 end),
sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '45') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z46 else 0 end),
sum(case when rid = 2 then a.Z46 else 0 end),
sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '46') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z47 else 0 end),
sum(case when rid = 2 then a.Z47 else 0 end),
sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '47') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z48 else 0 end),
sum(case when rid = 2 then a.Z48 else 0 end),
sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '48') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z49 else 0 end),
sum(case when rid = 2 then a.Z49 else 0 end),
sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '49') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z50 else 0 end),
sum(case when rid = 2 then a.Z50 else 0 end),
sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '50') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z51 else 0 end),
sum(case when rid = 2 then a.Z51 else 0 end),
sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '51') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z52 else 0 end),
sum(case when rid = 2 then a.Z52 else 0 end),
sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '52') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z53 else 0 end),
sum(case when rid = 2 then a.Z53 else 0 end),
sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '53') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z54 else 0 end),
sum(case when rid = 2 then a.Z54 else 0 end),
sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '54') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z55 else 0 end),
sum(case when rid = 2 then a.Z55 else 0 end),
sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '55') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z56 else 0 end),
sum(case when rid = 2 then a.Z56 else 0 end),
sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '56') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z57 else 0 end),
sum(case when rid = 2 then a.Z57 else 0 end),
sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '57') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z58 else 0 end),
sum(case when rid = 2 then a.Z58 else 0 end),
sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '58') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z59 else 0 end),
sum(case when rid = 2 then a.Z59 else 0 end),
sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '59') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z60 else 0 end),
sum(case when rid = 2 then a.Z60 else 0 end),
sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '60') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z61 else 0 end),
sum(case when rid = 2 then a.Z61 else 0 end),
sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '61') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z62 else 0 end),
sum(case when rid = 2 then a.Z62 else 0 end),
sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '62') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z63 else 0 end),
sum(case when rid = 2 then a.Z63 else 0 end),
sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '63') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z64 else 0 end),
sum(case when rid = 2 then a.Z64 else 0 end),
sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '64') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z65 else 0 end),
sum(case when rid = 2 then a.Z65 else 0 end),
sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '65') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z66 else 0 end),
sum(case when rid = 2 then a.Z66 else 0 end),
sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '66') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z67 else 0 end),
sum(case when rid = 2 then a.Z67 else 0 end),
sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '67') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z68 else 0 end),
sum(case when rid = 2 then a.Z68 else 0 end),
sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '68') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z69 else 0 end),
sum(case when rid = 2 then a.Z69 else 0 end),
sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '69') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z70 else 0 end),
sum(case when rid = 2 then a.Z70 else 0 end),
sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '78') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z71 else 0 end),
sum(case when rid = 2 then a.Z71 else 0 end),
sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '79') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z72 else 0 end),
sum(case when rid = 2 then a.Z72 else 0 end),
sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '80') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z73 else 0 end),
sum(case when rid = 2 then a.Z73 else 0 end),
sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '81') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z74 else 0 end),
sum(case when rid = 2 then a.Z74 else 0 end),
sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '82') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z75 else 0 end),
sum(case when rid = 2 then a.Z75 else 0 end),
sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '83') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z76 else 0 end),
sum(case when rid = 2 then a.Z76 else 0 end),
sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '84') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z77 else 0 end),
sum(case when rid = 2 then a.Z77 else 0 end),
sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '85') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z78 else 0 end),
sum(case when rid = 2 then a.Z78 else 0 end),
sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '86') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z79 else 0 end),
sum(case when rid = 2 then a.Z79 else 0 end),
sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '87') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z80 else 0 end),
sum(case when rid = 2 then a.Z80 else 0 end),
sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '88') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z81 else 0 end),
sum(case when rid = 2 then a.Z81 else 0 end),
sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '89') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z82 else 0 end),
sum(case when rid = 2 then a.Z82 else 0 end),
sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '90') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z83 else 0 end),
sum(case when rid = 2 then a.Z83 else 0 end),
sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '91') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z84 else 0 end),
sum(case when rid = 2 then a.Z84 else 0 end),
sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '92') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z85 else 0 end),
sum(case when rid = 2 then a.Z85 else 0 end),
sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '93') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z86 else 0 end),
sum(case when rid = 2 then a.Z86 else 0 end),
sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '94') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z87 else 0 end),
sum(case when rid = 2 then a.Z87 else 0 end),
sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '95') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z88 else 0 end),
sum(case when rid = 2 then a.Z88 else 0 end),
sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '96') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z89 else 0 end),
sum(case when rid = 2 then a.Z89 else 0 end),
sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '97') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z90 else 0 end),
sum(case when rid = 2 then a.Z90 else 0 end),
sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '98') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z91 else 0 end),
sum(case when rid = 2 then a.Z91 else 0 end),
sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '99') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z92 else 0 end),
sum(case when rid = 2 then a.Z92 else 0 end),
sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '100') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z93 else 0 end),
sum(case when rid = 2 then a.Z93 else 0 end),
sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '101') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z94 else 0 end),
sum(case when rid = 2 then a.Z94 else 0 end),
sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '102') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z95 else 0 end),
sum(case when rid = 2 then a.Z95 else 0 end),
sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '103') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z96 else 0 end),
sum(case when rid = 2 then a.Z96 else 0 end),
sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '104') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z97 else 0 end),
sum(case when rid = 2 then a.Z97 else 0 end),
sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '105') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z98 else 0 end),
sum(case when rid = 2 then a.Z98 else 0 end),
sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '106') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z99 else 0 end),
sum(case when rid = 2 then a.Z99 else 0 end),
sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '107') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z100 else 0 end),
sum(case when rid = 2 then a.Z100 else 0 end),
sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '108') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z101 else 0 end),
sum(case when rid = 2 then a.Z101 else 0 end),
sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '109') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z102 else 0 end),
sum(case when rid = 2 then a.Z102 else 0 end),
sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '110') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z103 else 0 end),
sum(case when rid = 2 then a.Z103 else 0 end),
sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '111') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z104 else 0 end),
sum(case when rid = 2 then a.Z104 else 0 end),
sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '112') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z105 else 0 end),
sum(case when rid = 2 then a.Z105 else 0 end),
sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '113') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z106 else 0 end),
sum(case when rid = 2 then a.Z106 else 0 end),
sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '114') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z107 else 0 end),
sum(case when rid = 2 then a.Z107 else 0 end),
sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '115') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z108 else 0 end),
sum(case when rid = 2 then a.Z108 else 0 end),
sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '116') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z109 else 0 end),
sum(case when rid = 2 then a.Z109 else 0 end),
sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '117') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z110 else 0 end),
sum(case when rid = 2 then a.Z110 else 0 end),
sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '118') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z111 else 0 end),
sum(case when rid = 2 then a.Z111 else 0 end),
sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '119') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z112 else 0 end),
sum(case when rid = 2 then a.Z112 else 0 end),
sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '120') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z113 else 0 end),
sum(case when rid = 2 then a.Z113 else 0 end),
sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '121') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z114 else 0 end),
sum(case when rid = 2 then a.Z114 else 0 end),
sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '122') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z115 else 0 end),
sum(case when rid = 2 then a.Z115 else 0 end),
sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '123') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z116 else 0 end),
sum(case when rid = 2 then a.Z116 else 0 end),
sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '124') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z117 else 0 end),
sum(case when rid = 2 then a.Z117 else 0 end),
sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '125') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z118 else 0 end),
sum(case when rid = 2 then a.Z118 else 0 end),
sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '126') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z119 else 0 end),
sum(case when rid = 2 then a.Z119 else 0 end),
sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '127') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z120 else 0 end),
sum(case when rid = 2 then a.Z120 else 0 end),
sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '128') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z121 else 0 end),
sum(case when rid = 2 then a.Z121 else 0 end),
sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '129') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z122 else 0 end),
sum(case when rid = 2 then a.Z122 else 0 end),
sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '130') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z123 else 0 end),
sum(case when rid = 2 then a.Z123 else 0 end),
sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '131') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z124 else 0 end),
sum(case when rid = 2 then a.Z124 else 0 end),
sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '132') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z125 else 0 end),
sum(case when rid = 2 then a.Z125 else 0 end),
sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '133') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z126 else 0 end),
sum(case when rid = 2 then a.Z126 else 0 end),
sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '134') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z127 else 0 end),
sum(case when rid = 2 then a.Z127 else 0 end),
sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '135') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z128 else 0 end),
sum(case when rid = 2 then a.Z128 else 0 end),
sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '136') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z129 else 0 end),
sum(case when rid = 2 then a.Z129 else 0 end),
sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '137') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z130 else 0 end),
sum(case when rid = 2 then a.Z130 else 0 end),
sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '138') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z131 else 0 end),
sum(case when rid = 2 then a.Z131 else 0 end),
sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '139') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z132 else 0 end),
sum(case when rid = 2 then a.Z132 else 0 end),
sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '140') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z133 else 0 end),
sum(case when rid = 2 then a.Z133 else 0 end),
sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '141') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z134 else 0 end),
sum(case when rid = 2 then a.Z134 else 0 end),
sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '142') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z135 else 0 end),
sum(case when rid = 2 then a.Z135 else 0 end),
sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '143') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z136 else 0 end),
sum(case when rid = 2 then a.Z136 else 0 end),
sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '144') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z137 else 0 end),
sum(case when rid = 2 then a.Z137 else 0 end),
sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '145') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z138 else 0 end),
sum(case when rid = 2 then a.Z138 else 0 end),
sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '146') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z139 else 0 end),
sum(case when rid = 2 then a.Z139 else 0 end),
sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '147') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z140 else 0 end),
sum(case when rid = 2 then a.Z140 else 0 end),
sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '148') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z141 else 0 end),
sum(case when rid = 2 then a.Z141 else 0 end),
sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '149') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z142 else 0 end),
sum(case when rid = 2 then a.Z142 else 0 end),
sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '150') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z143 else 0 end),
sum(case when rid = 2 then a.Z143 else 0 end),
sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '151') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z144 else 0 end),
sum(case when rid = 2 then a.Z144 else 0 end),
sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '152') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z145 else 0 end),
sum(case when rid = 2 then a.Z145 else 0 end),
sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '153') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z146 else 0 end),
sum(case when rid = 2 then a.Z146 else 0 end),
sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '154') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z147 else 0 end),
sum(case when rid = 2 then a.Z147 else 0 end),
sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '155') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_hq 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z148 else 0 end),
sum(case when rid = 2 then a.Z148 else 0 end),
sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '156') c on 1 = 1 
  where a.org in ('GY2F00')   and ucode like ('%_r')group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;

-- 厂矿数据治理平台数据灌入

truncate table data_center.ods_asset_balance_bo ;

-- 第 1 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z01 else 0 end),
sum(case when rid = 2 then a.Z01 else 0 end),
sum(case when rid = 3 then a.Z01 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '1') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 2 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z02 else 0 end),
sum(case when rid = 2 then a.Z02 else 0 end),
sum(case when rid = 3 then a.Z02 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '2') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 3 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z03 else 0 end),
sum(case when rid = 2 then a.Z03 else 0 end),
sum(case when rid = 3 then a.Z03 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '3') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 4 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z04 else 0 end),
sum(case when rid = 2 then a.Z04 else 0 end),
sum(case when rid = 3 then a.Z04 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '4') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 5 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z05 else 0 end),
sum(case when rid = 2 then a.Z05 else 0 end),
sum(case when rid = 3 then a.Z05 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '5') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 6 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z06 else 0 end),
sum(case when rid = 2 then a.Z06 else 0 end),
sum(case when rid = 3 then a.Z06 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '6') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 7 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z07 else 0 end),
sum(case when rid = 2 then a.Z07 else 0 end),
sum(case when rid = 3 then a.Z07 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '7') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 8 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z08 else 0 end),
sum(case when rid = 2 then a.Z08 else 0 end),
sum(case when rid = 3 then a.Z08 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '8') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 9 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z09 else 0 end),
sum(case when rid = 2 then a.Z09 else 0 end),
sum(case when rid = 3 then a.Z09 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '9') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 10 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z10 else 0 end),
sum(case when rid = 2 then a.Z10 else 0 end),
sum(case when rid = 3 then a.Z10 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '10') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 11 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z11 else 0 end),
sum(case when rid = 2 then a.Z11 else 0 end),
sum(case when rid = 3 then a.Z11 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '11') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 12 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z12 else 0 end),
sum(case when rid = 2 then a.Z12 else 0 end),
sum(case when rid = 3 then a.Z12 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '12') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 13 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z13 else 0 end),
sum(case when rid = 2 then a.Z13 else 0 end),
sum(case when rid = 3 then a.Z13 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '13') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 14 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z14 else 0 end),
sum(case when rid = 2 then a.Z14 else 0 end),
sum(case when rid = 3 then a.Z14 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '14') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 15 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z15 else 0 end),
sum(case when rid = 2 then a.Z15 else 0 end),
sum(case when rid = 3 then a.Z15 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '15') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 16 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z16 else 0 end),
sum(case when rid = 2 then a.Z16 else 0 end),
sum(case when rid = 3 then a.Z16 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '16') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 17 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z17 else 0 end),
sum(case when rid = 2 then a.Z17 else 0 end),
sum(case when rid = 3 then a.Z17 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '17') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 18 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z18 else 0 end),
sum(case when rid = 2 then a.Z18 else 0 end),
sum(case when rid = 3 then a.Z18 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '18') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 19 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z19 else 0 end),
sum(case when rid = 2 then a.Z19 else 0 end),
sum(case when rid = 3 then a.Z19 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '19') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 20 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z20 else 0 end),
sum(case when rid = 2 then a.Z20 else 0 end),
sum(case when rid = 3 then a.Z20 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '20') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 21 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z21 else 0 end),
sum(case when rid = 2 then a.Z21 else 0 end),
sum(case when rid = 3 then a.Z21 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '21') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 22 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z22 else 0 end),
sum(case when rid = 2 then a.Z22 else 0 end),
sum(case when rid = 3 then a.Z22 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '22') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 23 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z23 else 0 end),
sum(case when rid = 2 then a.Z23 else 0 end),
sum(case when rid = 3 then a.Z23 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '23') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 24 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z24 else 0 end),
sum(case when rid = 2 then a.Z24 else 0 end),
sum(case when rid = 3 then a.Z24 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '24') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 25 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z25 else 0 end),
sum(case when rid = 2 then a.Z25 else 0 end),
sum(case when rid = 3 then a.Z25 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '25') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 26 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z26 else 0 end),
sum(case when rid = 2 then a.Z26 else 0 end),
sum(case when rid = 3 then a.Z26 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '26') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 27 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z27 else 0 end),
sum(case when rid = 2 then a.Z27 else 0 end),
sum(case when rid = 3 then a.Z27 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '27') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 28 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z28 else 0 end),
sum(case when rid = 2 then a.Z28 else 0 end),
sum(case when rid = 3 then a.Z28 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '28') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 29 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z29 else 0 end),
sum(case when rid = 2 then a.Z29 else 0 end),
sum(case when rid = 3 then a.Z29 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '29') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 30 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z30 else 0 end),
sum(case when rid = 2 then a.Z30 else 0 end),
sum(case when rid = 3 then a.Z30 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '30') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 31 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z31 else 0 end),
sum(case when rid = 2 then a.Z31 else 0 end),
sum(case when rid = 3 then a.Z31 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '31') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 32 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z32 else 0 end),
sum(case when rid = 2 then a.Z32 else 0 end),
sum(case when rid = 3 then a.Z32 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '32') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 33 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z33 else 0 end),
sum(case when rid = 2 then a.Z33 else 0 end),
sum(case when rid = 3 then a.Z33 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '33') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 34 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z34 else 0 end),
sum(case when rid = 2 then a.Z34 else 0 end),
sum(case when rid = 3 then a.Z34 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '34') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 35 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z35 else 0 end),
sum(case when rid = 2 then a.Z35 else 0 end),
sum(case when rid = 3 then a.Z35 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '35') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 36 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z36 else 0 end),
sum(case when rid = 2 then a.Z36 else 0 end),
sum(case when rid = 3 then a.Z36 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '36') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 37 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z37 else 0 end),
sum(case when rid = 2 then a.Z37 else 0 end),
sum(case when rid = 3 then a.Z37 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '37') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 38 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z38 else 0 end),
sum(case when rid = 2 then a.Z38 else 0 end),
sum(case when rid = 3 then a.Z38 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '38') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 39 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z39 else 0 end),
sum(case when rid = 2 then a.Z39 else 0 end),
sum(case when rid = 3 then a.Z39 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '39') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 40 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z40 else 0 end),
sum(case when rid = 2 then a.Z40 else 0 end),
sum(case when rid = 3 then a.Z40 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '40') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 41 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z41 else 0 end),
sum(case when rid = 2 then a.Z41 else 0 end),
sum(case when rid = 3 then a.Z41 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '41') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 42 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z42 else 0 end),
sum(case when rid = 2 then a.Z42 else 0 end),
sum(case when rid = 3 then a.Z42 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '42') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 43 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z43 else 0 end),
sum(case when rid = 2 then a.Z43 else 0 end),
sum(case when rid = 3 then a.Z43 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '43') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 44 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z44 else 0 end),
sum(case when rid = 2 then a.Z44 else 0 end),
sum(case when rid = 3 then a.Z44 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '44') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 45 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z45 else 0 end),
sum(case when rid = 2 then a.Z45 else 0 end),
sum(case when rid = 3 then a.Z45 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '45') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 46 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z46 else 0 end),
sum(case when rid = 2 then a.Z46 else 0 end),
sum(case when rid = 3 then a.Z46 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '46') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 47 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z47 else 0 end),
sum(case when rid = 2 then a.Z47 else 0 end),
sum(case when rid = 3 then a.Z47 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '47') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 48 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z48 else 0 end),
sum(case when rid = 2 then a.Z48 else 0 end),
sum(case when rid = 3 then a.Z48 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '48') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 49 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z49 else 0 end),
sum(case when rid = 2 then a.Z49 else 0 end),
sum(case when rid = 3 then a.Z49 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '49') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 50 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z50 else 0 end),
sum(case when rid = 2 then a.Z50 else 0 end),
sum(case when rid = 3 then a.Z50 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '50') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 51 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z51 else 0 end),
sum(case when rid = 2 then a.Z51 else 0 end),
sum(case when rid = 3 then a.Z51 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '51') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 52 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z52 else 0 end),
sum(case when rid = 2 then a.Z52 else 0 end),
sum(case when rid = 3 then a.Z52 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '52') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 53 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z53 else 0 end),
sum(case when rid = 2 then a.Z53 else 0 end),
sum(case when rid = 3 then a.Z53 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '53') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 54 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z54 else 0 end),
sum(case when rid = 2 then a.Z54 else 0 end),
sum(case when rid = 3 then a.Z54 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '54') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 55 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z55 else 0 end),
sum(case when rid = 2 then a.Z55 else 0 end),
sum(case when rid = 3 then a.Z55 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '55') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 56 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z56 else 0 end),
sum(case when rid = 2 then a.Z56 else 0 end),
sum(case when rid = 3 then a.Z56 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '56') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 57 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z57 else 0 end),
sum(case when rid = 2 then a.Z57 else 0 end),
sum(case when rid = 3 then a.Z57 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '57') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 58 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z58 else 0 end),
sum(case when rid = 2 then a.Z58 else 0 end),
sum(case when rid = 3 then a.Z58 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '58') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 59 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z59 else 0 end),
sum(case when rid = 2 then a.Z59 else 0 end),
sum(case when rid = 3 then a.Z59 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '59') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 60 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z60 else 0 end),
sum(case when rid = 2 then a.Z60 else 0 end),
sum(case when rid = 3 then a.Z60 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '60') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 61 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z61 else 0 end),
sum(case when rid = 2 then a.Z61 else 0 end),
sum(case when rid = 3 then a.Z61 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '61') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 62 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z62 else 0 end),
sum(case when rid = 2 then a.Z62 else 0 end),
sum(case when rid = 3 then a.Z62 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '62') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 63 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z63 else 0 end),
sum(case when rid = 2 then a.Z63 else 0 end),
sum(case when rid = 3 then a.Z63 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '63') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 64 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z64 else 0 end),
sum(case when rid = 2 then a.Z64 else 0 end),
sum(case when rid = 3 then a.Z64 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '64') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 65 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z65 else 0 end),
sum(case when rid = 2 then a.Z65 else 0 end),
sum(case when rid = 3 then a.Z65 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '65') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 66 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z66 else 0 end),
sum(case when rid = 2 then a.Z66 else 0 end),
sum(case when rid = 3 then a.Z66 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '66') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 67 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z67 else 0 end),
sum(case when rid = 2 then a.Z67 else 0 end),
sum(case when rid = 3 then a.Z67 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '67') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 68 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z68 else 0 end),
sum(case when rid = 2 then a.Z68 else 0 end),
sum(case when rid = 3 then a.Z68 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '68') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 69 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z69 else 0 end),
sum(case when rid = 2 then a.Z69 else 0 end),
sum(case when rid = 3 then a.Z69 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '69') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 70 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z70 else 0 end),
sum(case when rid = 2 then a.Z70 else 0 end),
sum(case when rid = 3 then a.Z70 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '78') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 71 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z71 else 0 end),
sum(case when rid = 2 then a.Z71 else 0 end),
sum(case when rid = 3 then a.Z71 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '79') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 72 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z72 else 0 end),
sum(case when rid = 2 then a.Z72 else 0 end),
sum(case when rid = 3 then a.Z72 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '80') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 73 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z73 else 0 end),
sum(case when rid = 2 then a.Z73 else 0 end),
sum(case when rid = 3 then a.Z73 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '81') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 74 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z74 else 0 end),
sum(case when rid = 2 then a.Z74 else 0 end),
sum(case when rid = 3 then a.Z74 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '82') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 75 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z75 else 0 end),
sum(case when rid = 2 then a.Z75 else 0 end),
sum(case when rid = 3 then a.Z75 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '83') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 76 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z76 else 0 end),
sum(case when rid = 2 then a.Z76 else 0 end),
sum(case when rid = 3 then a.Z76 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '84') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 77 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z77 else 0 end),
sum(case when rid = 2 then a.Z77 else 0 end),
sum(case when rid = 3 then a.Z77 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '85') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 78 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z78 else 0 end),
sum(case when rid = 2 then a.Z78 else 0 end),
sum(case when rid = 3 then a.Z78 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '86') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 79 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z79 else 0 end),
sum(case when rid = 2 then a.Z79 else 0 end),
sum(case when rid = 3 then a.Z79 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '87') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 80 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z80 else 0 end),
sum(case when rid = 2 then a.Z80 else 0 end),
sum(case when rid = 3 then a.Z80 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '88') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 81 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z81 else 0 end),
sum(case when rid = 2 then a.Z81 else 0 end),
sum(case when rid = 3 then a.Z81 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '89') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 82 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z82 else 0 end),
sum(case when rid = 2 then a.Z82 else 0 end),
sum(case when rid = 3 then a.Z82 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '90') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 83 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z83 else 0 end),
sum(case when rid = 2 then a.Z83 else 0 end),
sum(case when rid = 3 then a.Z83 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '91') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 84 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z84 else 0 end),
sum(case when rid = 2 then a.Z84 else 0 end),
sum(case when rid = 3 then a.Z84 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '92') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 85 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z85 else 0 end),
sum(case when rid = 2 then a.Z85 else 0 end),
sum(case when rid = 3 then a.Z85 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '93') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 86 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z86 else 0 end),
sum(case when rid = 2 then a.Z86 else 0 end),
sum(case when rid = 3 then a.Z86 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '94') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 87 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z87 else 0 end),
sum(case when rid = 2 then a.Z87 else 0 end),
sum(case when rid = 3 then a.Z87 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '95') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 88 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z88 else 0 end),
sum(case when rid = 2 then a.Z88 else 0 end),
sum(case when rid = 3 then a.Z88 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '96') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 89 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z89 else 0 end),
sum(case when rid = 2 then a.Z89 else 0 end),
sum(case when rid = 3 then a.Z89 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '97') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 90 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z90 else 0 end),
sum(case when rid = 2 then a.Z90 else 0 end),
sum(case when rid = 3 then a.Z90 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '98') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 91 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z91 else 0 end),
sum(case when rid = 2 then a.Z91 else 0 end),
sum(case when rid = 3 then a.Z91 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '99') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 92 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z92 else 0 end),
sum(case when rid = 2 then a.Z92 else 0 end),
sum(case when rid = 3 then a.Z92 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '100') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 93 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z93 else 0 end),
sum(case when rid = 2 then a.Z93 else 0 end),
sum(case when rid = 3 then a.Z93 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '101') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 94 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z94 else 0 end),
sum(case when rid = 2 then a.Z94 else 0 end),
sum(case when rid = 3 then a.Z94 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '102') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 95 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z95 else 0 end),
sum(case when rid = 2 then a.Z95 else 0 end),
sum(case when rid = 3 then a.Z95 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '103') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 96 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z96 else 0 end),
sum(case when rid = 2 then a.Z96 else 0 end),
sum(case when rid = 3 then a.Z96 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '104') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 97 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z97 else 0 end),
sum(case when rid = 2 then a.Z97 else 0 end),
sum(case when rid = 3 then a.Z97 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '105') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 98 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z98 else 0 end),
sum(case when rid = 2 then a.Z98 else 0 end),
sum(case when rid = 3 then a.Z98 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '106') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 99 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z99 else 0 end),
sum(case when rid = 2 then a.Z99 else 0 end),
sum(case when rid = 3 then a.Z99 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '107') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 100 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z100 else 0 end),
sum(case when rid = 2 then a.Z100 else 0 end),
sum(case when rid = 3 then a.Z100 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '108') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 101 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z101 else 0 end),
sum(case when rid = 2 then a.Z101 else 0 end),
sum(case when rid = 3 then a.Z101 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '109') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 102 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z102 else 0 end),
sum(case when rid = 2 then a.Z102 else 0 end),
sum(case when rid = 3 then a.Z102 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '110') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 103 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z103 else 0 end),
sum(case when rid = 2 then a.Z103 else 0 end),
sum(case when rid = 3 then a.Z103 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '111') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 104 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z104 else 0 end),
sum(case when rid = 2 then a.Z104 else 0 end),
sum(case when rid = 3 then a.Z104 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '112') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 105 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z105 else 0 end),
sum(case when rid = 2 then a.Z105 else 0 end),
sum(case when rid = 3 then a.Z105 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '113') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 106 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z106 else 0 end),
sum(case when rid = 2 then a.Z106 else 0 end),
sum(case when rid = 3 then a.Z106 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '114') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 107 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z107 else 0 end),
sum(case when rid = 2 then a.Z107 else 0 end),
sum(case when rid = 3 then a.Z107 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '115') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 108 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z108 else 0 end),
sum(case when rid = 2 then a.Z108 else 0 end),
sum(case when rid = 3 then a.Z108 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '116') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 109 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z109 else 0 end),
sum(case when rid = 2 then a.Z109 else 0 end),
sum(case when rid = 3 then a.Z109 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '117') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 110 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z110 else 0 end),
sum(case when rid = 2 then a.Z110 else 0 end),
sum(case when rid = 3 then a.Z110 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '118') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 111 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z111 else 0 end),
sum(case when rid = 2 then a.Z111 else 0 end),
sum(case when rid = 3 then a.Z111 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '119') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 112 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z112 else 0 end),
sum(case when rid = 2 then a.Z112 else 0 end),
sum(case when rid = 3 then a.Z112 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '120') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 113 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z113 else 0 end),
sum(case when rid = 2 then a.Z113 else 0 end),
sum(case when rid = 3 then a.Z113 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '121') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 114 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z114 else 0 end),
sum(case when rid = 2 then a.Z114 else 0 end),
sum(case when rid = 3 then a.Z114 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '122') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 115 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z115 else 0 end),
sum(case when rid = 2 then a.Z115 else 0 end),
sum(case when rid = 3 then a.Z115 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '123') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 116 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z116 else 0 end),
sum(case when rid = 2 then a.Z116 else 0 end),
sum(case when rid = 3 then a.Z116 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '124') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 117 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z117 else 0 end),
sum(case when rid = 2 then a.Z117 else 0 end),
sum(case when rid = 3 then a.Z117 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '125') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 118 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z118 else 0 end),
sum(case when rid = 2 then a.Z118 else 0 end),
sum(case when rid = 3 then a.Z118 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '126') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 119 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z119 else 0 end),
sum(case when rid = 2 then a.Z119 else 0 end),
sum(case when rid = 3 then a.Z119 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '127') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 120 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z120 else 0 end),
sum(case when rid = 2 then a.Z120 else 0 end),
sum(case when rid = 3 then a.Z120 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '128') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 121 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z121 else 0 end),
sum(case when rid = 2 then a.Z121 else 0 end),
sum(case when rid = 3 then a.Z121 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '129') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 122 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z122 else 0 end),
sum(case when rid = 2 then a.Z122 else 0 end),
sum(case when rid = 3 then a.Z122 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '130') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 123 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z123 else 0 end),
sum(case when rid = 2 then a.Z123 else 0 end),
sum(case when rid = 3 then a.Z123 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '131') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 124 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z124 else 0 end),
sum(case when rid = 2 then a.Z124 else 0 end),
sum(case when rid = 3 then a.Z124 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '132') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 125 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z125 else 0 end),
sum(case when rid = 2 then a.Z125 else 0 end),
sum(case when rid = 3 then a.Z125 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '133') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 126 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z126 else 0 end),
sum(case when rid = 2 then a.Z126 else 0 end),
sum(case when rid = 3 then a.Z126 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '134') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 127 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z127 else 0 end),
sum(case when rid = 2 then a.Z127 else 0 end),
sum(case when rid = 3 then a.Z127 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '135') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 128 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z128 else 0 end),
sum(case when rid = 2 then a.Z128 else 0 end),
sum(case when rid = 3 then a.Z128 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '136') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 129 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z129 else 0 end),
sum(case when rid = 2 then a.Z129 else 0 end),
sum(case when rid = 3 then a.Z129 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '137') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 130 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z130 else 0 end),
sum(case when rid = 2 then a.Z130 else 0 end),
sum(case when rid = 3 then a.Z130 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '138') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 131 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z131 else 0 end),
sum(case when rid = 2 then a.Z131 else 0 end),
sum(case when rid = 3 then a.Z131 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '139') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 132 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z132 else 0 end),
sum(case when rid = 2 then a.Z132 else 0 end),
sum(case when rid = 3 then a.Z132 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '140') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 133 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z133 else 0 end),
sum(case when rid = 2 then a.Z133 else 0 end),
sum(case when rid = 3 then a.Z133 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '141') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 134 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z134 else 0 end),
sum(case when rid = 2 then a.Z134 else 0 end),
sum(case when rid = 3 then a.Z134 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '142') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 135 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z135 else 0 end),
sum(case when rid = 2 then a.Z135 else 0 end),
sum(case when rid = 3 then a.Z135 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '143') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 136 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z136 else 0 end),
sum(case when rid = 2 then a.Z136 else 0 end),
sum(case when rid = 3 then a.Z136 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '144') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 137 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z137 else 0 end),
sum(case when rid = 2 then a.Z137 else 0 end),
sum(case when rid = 3 then a.Z137 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '145') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 138 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z138 else 0 end),
sum(case when rid = 2 then a.Z138 else 0 end),
sum(case when rid = 3 then a.Z138 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '146') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 139 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z139 else 0 end),
sum(case when rid = 2 then a.Z139 else 0 end),
sum(case when rid = 3 then a.Z139 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '147') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 140 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z140 else 0 end),
sum(case when rid = 2 then a.Z140 else 0 end),
sum(case when rid = 3 then a.Z140 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '148') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 141 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z141 else 0 end),
sum(case when rid = 2 then a.Z141 else 0 end),
sum(case when rid = 3 then a.Z141 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '149') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 142 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z142 else 0 end),
sum(case when rid = 2 then a.Z142 else 0 end),
sum(case when rid = 3 then a.Z142 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '150') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 143 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z143 else 0 end),
sum(case when rid = 2 then a.Z143 else 0 end),
sum(case when rid = 3 then a.Z143 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '151') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 144 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z144 else 0 end),
sum(case when rid = 2 then a.Z144 else 0 end),
sum(case when rid = 3 then a.Z144 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '152') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 145 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z145 else 0 end),
sum(case when rid = 2 then a.Z145 else 0 end),
sum(case when rid = 3 then a.Z145 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '153') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 146 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z146 else 0 end),
sum(case when rid = 2 then a.Z146 else 0 end),
sum(case when rid = 3 then a.Z146 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '154') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 147 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z147 else 0 end),
sum(case when rid = 2 then a.Z147 else 0 end),
sum(case when rid = 3 then a.Z147 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '155') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;
-- 第 148 条SQL语句
insert into data_center.ods_asset_balance_bo 
select 
b.org_code,
b.org_name,
(case when substr(a.ucode,5,1) = '_' then concat(per,'-',substr(a.ucode,7,2)) else concat(per,'-',substr(a.ucode,9,2))  end),c.index_name,
c.index_code,
sum(case when rid = 1 then a.Z148 else 0 end),
sum(case when rid = 2 then a.Z148 else 0 end),
sum(case when rid = 3 then a.Z148 else 0 end)
from data_center.yzb0102__zyzb0102 a 
 left join data_center.ads_orgnization b
 on a.org = b.org_code
 left join  ( select * from data_center.ods_asset_balance_ref 
 where index_code = '156') c on 1 = 1 
  where a.org not in ('GY2F00')  and ucode like ('%_r') group by b.org_code,b.org_name,c.index_name,c.index_code,a.month;












