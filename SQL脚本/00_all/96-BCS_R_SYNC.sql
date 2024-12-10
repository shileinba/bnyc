-- 复制BCS数据 2024-12-10 ： 陈风
-- 1.
truncate ybcb022__zybcb022_j;
insert into ybcb022__zybcb022_j
select * from ybcb022__zybcb022
where ucode like '%_r';
update data_center.ybcb022__zybcb022_j set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb022__zybcb022_j set month =  substr(ucode,-4,2);

-- 2.
truncate ybcb010__zybcb010_r;
insert into ybcb010__zybcb010_r
select * from ybcb010__zybcb010
where ucode like '%_r';
update data_center.ybcb010__zybcb010_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb010__zybcb010_r set month =  substr(ucode,-4,2);

--3.
truncate ybcb019__zybcb019_01_r;
insert into ybcb019__zybcb019_01_r
select * from ybcb019__zybcb019_01
where ucode like '%_r';
update data_center.ybcb019__zybcb019_01_r set org_code =
                                                  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                       else substr(ucode ,1,6) end ;
update data_center.ybcb019__zybcb019_01_r set month =  substr(ucode,-4,2);

--4.
truncate ybsr009__zybsr009_01_r;
insert into ybsr009__zybsr009_01_r
select * from ybsr009__zybsr009_01
where ucode like '%_r';
update data_center.ybsr009__zybsr009_01_r set org_code =
                                                  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                       else substr(ucode ,1,6) end ;
update data_center.ybsr009__zybsr009_01_r set month =  substr(ucode,-4,2);

-- 5.
truncate ybcb020__zybcb020_01_r;
insert into ybcb020__zybcb020_01_r
select * from ybcb020__zybcb020_01
where ucode like '%_r';
update data_center.ybcb020__zybcb020_01_r set org_code =
                                                  case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                       else substr(ucode ,1,6) end ;
update data_center.ybcb020__zybcb020_01_r set month =  substr(ucode,-4,2);

-- 6. ybcb021__zybcb021_01 未查到_j数据，无创建新表，原表更新org_code、month
update data_center.ybcb021__zybcb021_01 set org_code =
                                                case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                     else substr(ucode ,1,6) end ;
update data_center.ybcb021__zybcb021_01 set month =  substr(ucode,-4,2);


-- 7.
truncate ybcb023__zybcb023_r;
insert into ybcb023__zybcb023_r
select * from ybcb023__zybcb023
where ucode like '%_r';
update data_center.ybcb023__zybcb023_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb023__zybcb023_r set month =  substr(ucode,-4,2);

-- 8.
truncate ybcb040__zybcb040_r;
insert into ybcb040__zybcb040_r
select * from ybcb040__zybcb040
where ucode like '%_r';
update data_center.ybcb040__zybcb040_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb040__zybcb040_r set month =  substr(ucode,-4,2);

-- 9.
truncate ybfz007__zybfz007_r;
insert into ybfz007__zybfz007_r
select * from ybfz007__zybfz007
where ucode like '%_r';
update data_center.ybfz007__zybfz007_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybfz007__zybfz007_r set month =  substr(ucode,-4,2);

-- 10.
truncate ybcb013__zybcb013_r;
insert into ybcb013__zybcb013_r
select * from ybcb013__zybcb013
where ucode like '%_r';
update data_center.ybcb013__zybcb013_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb013__zybcb013_r set month =  substr(ucode,-4,2);

-- 11.
truncate ybcb026__zybcb026_r;
insert into ybcb026__zybcb026_r
select * from ybcb026__zybcb026
where ucode like '%_r';
update data_center.ybcb026__zybcb026_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb026__zybcb026_r set month =  substr(ucode,-4,2);

-- 12. ygl0071__zygl0071 金额需转换为元 * 10000
truncate ygl0071__zygl0071_r;
insert into ygl0071__zygl0071_r
select * from ygl0071__zygl0071
where ucode like '%_r';
update data_center.ygl0071__zygl0071_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ygl0071__zygl0071_r set month =  substr(ucode,-4,2);

update ygl0071__zygl0071_r
set z06 = z06 * 10000
  ,z10 = z10 * 10000
  ,z30 = z30 * 10000
  ,z31 = z31 * 10000
  ,z32 = z32 * 10000
  , z32 = z32 * 10000
  , z33 = z33 * 10000
  , z34 = z34 * 10000
  , z36 = z36 * 10000
;

-- 13.
truncate yzb0102__zyzb0102_r;
insert into yzb0102__zyzb0102_r
select * from yzb0102__zyzb0102
where ucode like '%_r';
update data_center.yzb0102__zyzb0102_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.yzb0102__zyzb0102_r set month =  substr(ucode,-4,2);

-- 14.
truncate yzb0002__zyzb0002_r;
insert into yzb0002__zyzb0002_r
select * from yzb0002__zyzb0002
where ucode like '%_r';
update data_center.yzb0002__zyzb0002_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.yzb0002__zyzb0002_r set month =  substr(ucode,-4,2);

-- 15.
truncate yzb0003__zyzb0003_r;
insert into yzb0003__zyzb0003_r
select * from yzb0003__zyzb0003
where ucode like '%_r';
update data_center.yzb0003__zyzb0003_r set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.yzb0003__zyzb0003_r set month =  substr(ucode,-4,2);


