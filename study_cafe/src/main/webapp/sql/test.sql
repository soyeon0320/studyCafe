		
		
	select bb.*,aa.product_name
		from tb_order_product bb
		inner join  (SELECT
		               case when count(d.product_name) > 1 then min(d.PRODUCT_NAME) || ' 외 ' || (COUNT(1) - 1)|| '건'
		                    when count(d.product_name) = 1 then min(d.product_name)
		               end as product_name,
		               e.order_product_no
		            FROM
		                tb_cart e,
		                tb_product d
		            WHERE
		                d.product_code = e.product_code
		                
		            group by e.order_product_no) aa
		   on bb.order_product_no = aa.order_product_no
		    where bb.store_code = #{storeCode} 
		  order by bb.order_product_no desc