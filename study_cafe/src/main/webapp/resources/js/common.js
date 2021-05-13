function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wvarop = (screen.heigth - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes, width=" + WinWidth 
																	 + ",height=" + WinHeight + ", top=" + wvarop + ", left=" + winleft +
																	 + ", resizable=yes, status=yes"
					);
	win.focus();
}


// 폼 액션 변경하고 서브밋하는 함수
function go_action(action,formId){
	if(!formId) formId = "#listForm";
	$(formId).attr("action",action).submit();
}

function go_detail(detailNo,formId){
	if(!formId) formId = "#listForm";
	$("#detailNo").val(detailNo);
	go_action("detail",formId);
}

function go_page(pageNo, formId){
	if(!pageNo) pageNo = 1;
	$("#pageIndex").val(pageNo);
	go_action("list",formId);
}

function go_search(url,formId){
	$("#pageIndex").val(1);
	go_action(url,formId);
}

function set_paging(paginationInfo, jsFunction ,targetId){
	var firstPageNo = paginationInfo.firstPageNo;
	var firstPageNoOnPageList = paginationInfo.firstPageNoOnPageList;
	var totalPageCount = paginationInfo.totalPageCount;
	var pageSize = paginationInfo.pageSize;
	var lastPageNoOnPageList = paginationInfo.lastPageNoOnPageList ;
	
	var currentPageNo = paginationInfo.currentPageNo;
	
	var lastPageNo = paginationInfo.lastPageNo;
	
	var strBuff = "";

	var firstPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" href='#' onclick=\"{0}({1});return false;\" aria-label='Previous'> << </li>";
	var previousPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" href='#' onclick=\"{0}({1});return false;\" aria-label='Previous'> < </li>";
	var currentPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning active\" href=\"#\">{0}</a></li>";
	var otherPageLabel = "<li class=\"\"><a href='#' class=\"btn-icon-o btn-shadow btn-outline-warning\"   onclick=\"{0}({1}); return false;\">{2}</a></li>";
	var nextPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" onclick=\"{0}({1});return false;\" href='#' aria-label='Next'> > </a></li>";
	var lastPageLabel = "<li class=\"\"><a class=\"btn-icon-o btn-shadow btn-outline-warning\" onclick=\"{0}({1});return false;\" href='#' aria-label='Next'> >> </a></li>";

	
	if (totalPageCount > pageSize) {
		if (firstPageNoOnPageList > pageSize) {
			strBuff += firstPageLabel.replace("{0}",jsFunction).replace("{1}",firstPageNo);
			strBuff += previousPageLabel.replace("{0}",jsFunction).replace("{1}",firstPageNoOnPageList - 1);
		} else {
			strBuff += firstPageLabel.replace("{0}",jsFunction).replace("{1}",firstPageNo);
			strBuff += previousPageLabel.replace("{0}",jsFunction).replace("{1}",firstPageNo);
		}
	}

	for (var i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
		if (i == currentPageNo) {
			strBuff += currentPageLabel.replace("{0}",i);
		} else {
			strBuff += otherPageLabel.replace("{0}",jsFunction).replace("{1}",i).replace("{2}",i);
		}
	}

	if (totalPageCount > pageSize) {
		
		if (lastPageNoOnPageList < totalPageCount) {
			
			strBuff += nextPageLabel.replace("{0}",jsFunction).replace("{1}",firstPageNoOnPageList + pageSize);
			strBuff += lastPageLabel.replace("{0}",jsFunction).replace("{1}",lastPageNo);
			
		} else {
			strBuff += nextPageLabel.replace("{0}",jsFunction).replace("{1}",lastPageNo);
			strBuff += lastPageLabel.replace("{0}",jsFunction).replace("{1}",lastPageNo);
		}
	}
	
	$(targetId).html(strBuff);
}


function getTimeStamp(mili) {
	var d = new Date(mili);
	var s =
	  leadingZeros(d.getFullYear(), 4) + '-' +
	  leadingZeros(d.getMonth() + 1, 2) + '-' +
	  leadingZeros(d.getDate(), 2) + ' ' +
	
	  leadingZeros(d.getHours(), 2) + ':' +
	  leadingZeros(d.getMinutes(), 2) + '';

	return s;
}

function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();
	
	if (n.length < digits) {
	  for (i = 0; i < digits - n.length; i++)
	    zero += '0';
	}
	
	return zero + n;
}

function get_hours(minutes){
	
	var hours = parseInt(minutes/60);
	minutes =  parseInt(minutes%60);
	
	return hours+"시 " +minutes +"분";
}


function swal_alert(msg){
	swal({
		  toast: true,
		  position: 'top-end',
		  showConfirmButton: false,
		  timer: 1200,
		  type: 'error',
		  timerProgressBar: true,
		  icon: 'error',
		  title: msg,
		});
}

function Stack(max,data) {
	this.max = max || 0;
	this.data = data || [];
}
Stack.prototype.push = function(v) {
	if(this.max != 0 && this.size() == this.max) this.data.shift();
	this.data.push(v);
}
Stack.prototype.pop = function() {
	return this.data.pop() || null;
}
Stack.prototype.size = function() {
	return this.data.length;
}
