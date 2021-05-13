<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('수정성공');
window.opener.location.reload();
location.href="<%=request.getContextPath()%>/supply/detail?productCode=${product.productCode}";
</script>