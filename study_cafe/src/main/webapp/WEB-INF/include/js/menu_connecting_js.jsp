<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
function setMenu(menuTag){
	sessionStorage.setItem("menuId","#"+$(menuTag).attr("id"));
}
window.addEventListener('load', function() {
	$(sessionStorage.getItem("menuId")).trigger("click");
});
</script>