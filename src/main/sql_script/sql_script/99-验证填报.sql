select hc from ods_tcys
group by
    org_code,
    org_name,
    tcxm,
    hc,
    date
having count(*) > 1;

