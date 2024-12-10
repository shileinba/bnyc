-- 复制BCS数据 2024-12-10 ： 陈风

truncate ybcb022__zybcb022_j;
insert into ybcb022__zybcb022_j
select * from ybcb022__zybcb022
where ucode like '%_r';
update data_center.ybcb022__zybcb022_j set org_code =
                                               case when substr(ucode ,1,1) = '2'  then  substr(ucode ,1,4)
                                                    else substr(ucode ,1,6) end ;
update data_center.ybcb022__zybcb022_j set month =  substr(ucode,-4,2);

