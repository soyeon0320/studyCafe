
select e.*,f.owner_tel
from
    (select c.*,d.owner_id 
      from 
        (select a.*,
                b.store_status,
                b.store_addr
          from tb_order_product a
          inner join tb_store b
           on a.store_code = b.store_code
          where order_product_no = 16 ) c
     inner join tb_contract_agreement d
       on c.store_code = d.store_code) e
    inner join tb_owner f
       on e.owner_id = f.owner_id
       
