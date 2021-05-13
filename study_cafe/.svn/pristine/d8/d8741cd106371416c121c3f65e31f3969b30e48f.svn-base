
SELECT *
  FROM (
SELECT ROWNUM RNUM, ALL_LIST.*
  FROM (
SELECT voc_title
	 , voc_content
	 , voc_no
	 , voc_reg_date
	 , mem_id
	 , store_code
	 , voc_kind
	 , visit_date
	 , use_service
	 , voc_status
  FROM TB_VOC
 WHERE 1 = 1
 ORDER BY voc_no desc
 
<![CDATA[
 	   ) ALL_LIST
	   )
 WHERE RNUM  > #{firstIndex}
   AND RNUM <= #{firstIndex} + #{recordCountPerPage}
   ]]>