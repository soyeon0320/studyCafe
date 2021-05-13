<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	alert("발주 처리 되었습니다.");
	location.href="<%=request.getContextPath()%>/orderProduct/list";
</script>