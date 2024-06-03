


$(function(){
	var userNumber = 4;
	var contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content'); //${pageContext.request.contextPath}
	var path = contextPath + "/order/order.do";	//url使用
	var pathOrderDetail = contextPath + "/orderDetails/orderDetails.do";	//url使用
	
	$("#goEvaluate").on("click", function(event){	//按下評價按鈕
		event.preventDefault();
		event.stopPropagation();
		$("#evaluateArea").modal("show");
	});	 
	
	$("#evaluateArea").on("shown.bs.modal", function () {
		//Modal完全顯示後執行這裡的東西
		showEvaluateArea();			
	}); 
	
	$("#evaluateArea").on("hide.bs.modal", function () {	//當Modal隱藏取消綁定，不然會造成資料抓取不正確
		$("#evaluateArea").off("shown.bs.modal");
	});
	
	function showEvaluateArea(){	//顯示評價頁面
	let orderNumber = $("#orderNumber").text();
	var bookNameArray = [];
		
	$("#orderDetalisList tbody tr").each(function(){	//先取得頁面的書籍編號、書籍名稱
		var bookNumber = $(this).attr("data-bookNumber");
		var bookTitle = $(this).attr("data-bookTitle");
			
		bookNameArray.push({	//存到array
			bookNumber : bookNumber,
			bookTitle : bookTitle
		});
	});
		
		
	$.ajax({
		url: path,
		type: "GET",
		data:{
			"action" : "getUserOneOrderDetailsJson",
			"orderNumber" : orderNumber 
		},
		dataType: "json",
		success: function(orders){
			let listHtml = '';
			var bookName = '';
				$.each(orders.orderDetails, function(detailIndex, orderDetail){		
					$.each(bookNameArray, function(bookIndex, bookNames){													
						if(bookNames.bookNumber == orderDetail.bookNumber){	//當array的書籍編號 = 訂單明細的書籍編號，取得書籍名稱
							bookName = bookNames.bookTitle;
						}
					})
					
					listHtml += `
						<div class="book" data-detail-id="${orderDetail.orderDetailsNumber}" data-book-number="${orderDetail.bookNumber}">
							<div class="product-info mb-3">
					            <div><img src="${contextPath}/bap/Img?bookNumber=${orderDetail.bookNumber}" width="100px" alt=""></div>
					            <div>${bookName}</div>
					        </div>
					            <div class="rating mb-3">
					            <div>評分</div>
					            <div class="stars" id="${orderDetail.orderDetailsNumber}">
					            <span class="star" data-star="1"><i class="far fa-star"></i></span>
					            <span class="star" data-star="2"><i class="far fa-star"></i></span>
					            <span class="star" data-star="3"><i class="far fa-star"></i></span>
					            <span class="star" data-star="4"><i class="far fa-star"></i></span>
					            <span class="star" data-star="5"><i class="far fa-star"></i></span>
					         </div>
					         <textarea class="form-control my-4" placeholder="請提供相關的評論。" data-textarea-id="${orderDetail.orderDetailsNumber}"></textarea>
					        </div>
						</div>	
					`;
				});			
				$("#books .alert").after(listHtml);
		}
	});
}
	
	
	//星號更新
	$(document).on("click", "span.star", function(){
		let starNum = parseInt($(this).attr("data-star"));
		
		$(this).closest("div.stars").find("span.star").each(function(i, item){
			if(parseInt($(this).attr("data-star")) <= starNum){				
				$(this).addClass("-on");
				$(this).find("i").replaceWith('<i class="fas fa-star"></i>');
			}else{
				$(this).removeClass("-on");
				$(this).find("i").replaceWith('<i class="far fa-star"></i>');
			}
		});	
	});
	
	$(document).on("click", "#confirmButton", function(){
		let orderNumber = $("#orderNumber").text();
		if(confirm("確認送出評價？")){
			var allEvaluate = [];
			
			$("#books .book").each(function(){	//從id為books底下的class為book群裡抓需要的資料
				var orderDetailsNumber = $(this).attr("data-detail-id");
				var bookNumber = $(this).attr("data-book-number");
				var ratingScore = $(this).find(".stars span.star.-on").length;
				var evaluateContent = $(this).find("textarea").val();
				
				allEvaluate.push({
					orderDetailsNumber : orderDetailsNumber,
					bookNumber : bookNumber,
					ratingScore : ratingScore,
					evaluateContent : evaluateContent
				})
			});
			console.log(allEvaluate);
			
			
			$.ajax({
				url: pathOrderDetail,
				type: "POST",
				data: {
					"action" : "evaluate",
					"orderNumber" : orderNumber,
					"orderDetails" : JSON.stringify(allEvaluate)	//將array轉為json的格式
				},
				dataType: "json",
				success:function(data){
					console.log(data);
					if(data.message == "evaluate success"){
						$("#evaluateArea").modal("hide");				
						$(".cart_submit button#goEvaluate").replaceWith('<div><h4>已完成</h4></div>');
					}
				}
			});
		}		
	});
});






