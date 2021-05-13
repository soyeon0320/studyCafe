	$('.summernote-init').summernote({
        height: 400,
        minHeight: null,
        maxHeight: null,
        focus: true,
        dialogsFade: true,
        dialogsInBody: true,
        placeholder:'내용을 적어주세요',
		callbacks:{
			onImageUpload : function(files, editor, welEditable) {
				//alert("image insert!!");
				//file size check!
				for (var i = files.length - 1; i >= 0; i--) {
					if(files[i].size > 1024*1024*5){
	            		alert("이미지는 5MB 미만입니다.");
	            		return;
					}
				}
				
				//file sending
				for (var i = files.length - 1; i >= 0; i--) {
	            	sendImg(files[i], this,'/scm/common/uploadImg');
				}	
			},
			onMediaDelete : function(target) {
				//alert(target[0].src);
				var answer=confirm("정말 이미지를 삭제하시겠습니다.");
				if(answer){
					deleteImg(target[0].src,contextPath+'scm/common/summernote/deleteImg');
				}
			}
		}
    });
	
	

	//summernote img upload
	function sendImg(file, el,uploadURL) {
		
		var form_data = new FormData();
		form_data.append("file", file); 
			
		$.ajax({
	  	data: form_data,
	  	type: "POST",
	  	url: uploadURL,
	  	contentType: false,	    	
	  	processData: false,
	  	success: function(img_url) {
	    		$(el).summernote('editor.insertImage', img_url);
	  	}
		});
	}

	//summernote img delete
	function deleteImg(src,deleteURL) {
		
		var splitSrc= src.split("=");
		var fileName = splitSrc[splitSrc.length-1];
	  
		//alert(fileName);
		var fileData = {
				fileName:fileName
		}
		
		$.ajax({
			url:deleteURL,
			data : JSON.stringify(fileData),
			contentType:"application/json",
			type:"post",
			success:function(res){
				console.log(res);
			}
		});
	}