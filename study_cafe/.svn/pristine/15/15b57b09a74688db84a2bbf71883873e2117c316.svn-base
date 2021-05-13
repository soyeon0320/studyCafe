function title_notify(title,message,cssClass){
    $.notify({
        title: title , message: message
    }, {
        type: cssClass, allow_dismiss: false, newest_on_top: true
    });
}

function position_nofity(message,cssClass,from,align){
	
	if(!from) from = 'top';
	if(!align) from = 'left';
	
	
	 $.notify({
		 message: message
		 }, 
		 {
			 type: cssClass
			 , allow_dismiss: false
			 , placement: {from: from, align: align}
		 });
}

function animation_notify(message,cssClass){
	 $.notify({message: message},{type:cssClass, allow_dismiss: false, animate: {enter: "animated fadeInRight", exit: "animated fadeOutRight"}});
}