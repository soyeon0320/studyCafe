var move = 2;
var dataCnt = 1;
var listCnt = 1;
var rollingData = [];

function my_rolling(){
	
	var first = $("#first_rolling");
	var second = $("#second_rolling");
	var third = $("#third_rolling");
	
    if(move == 2){
        first.removeClass('card_sliding');
        first.addClass('card_sliding_after');

        second.removeClass('card_sliding_after');
        second.addClass('card_sliding');

        third.removeClass('card_sliding_after');
        third.removeClass('card_sliding');
        move = 0
        
    } else if (move == 1){
        first.removeClass('card_sliding_after')
        first.addClass('card_sliding')

        second.removeClass('card_sliding_after')
        second.removeClass('card_sliding')

        third.removeClass('card_sliding')
        third.addClass('card_sliding_after')

        move = 2
    } else if (move == 0) {
        first.removeClass('card_sliding_after')
        first.removeClass('card_sliding')

        second.removeClass('card_sliding')
        second.addClass('card_sliding_after')

        third.removeClass('card_sliding_after')
        third.addClass('card_sliding')

        move = 1
    }
    
    var turnItem = $('#rolling_box').children().eq(listCnt).children().eq(0).css("cursor","pointer");
    if(dataCnt < (rollingData.length - 1)) {
    	turnItem.text(rollingData[dataCnt]);
    	turnItem.attr("onclick","location_go('/notice/detail?noticeVO.noticeNo="+renderData[dataCnt].noticeNo+"')");
        dataCnt++;
        
    } else if(dataCnt == rollingData.length - 1) {
    	turnItem.text(rollingData[dataCnt]);
    	turnItem.attr("onclick","location_go('/notice/detail?noticeVO.noticeNo="+renderData[dataCnt].noticeNo+"')");
        dataCnt = 0;
    }

    if(listCnt < 2) {
        listCnt++
    } else if (listCnt == 2) {
        listCnt = 0
    }
}


function use_store_time(){
	var useTime = new Date() - seat_in;
	$("#useTime").text(get_use_time(useTime));			
}

function get_use_time(useTime){
	var useTime = useTime;
	
	var use_day = parseInt(useTime/86400000);
	useTime = useTime%86400000;
	var use_hour = parseInt(useTime/3600000);
	useTime = useTime%3600000;
	var use_minutes = parseInt(useTime/60000);
	useTime = useTime%60000;
	var use_second = parseInt(useTime/1000);
	
	var use_str = "";
	if(use_day > 0)  use_str += use_day+"일 ";
	if(use_hour > 0) use_str += use_hour+"시간 ";
	use_str += use_minutes+"분 ";
	use_str += use_second;
	return "[이용시간 - "+use_str +"초]";
}
