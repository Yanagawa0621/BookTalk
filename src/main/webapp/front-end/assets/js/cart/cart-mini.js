
var userNumber = 4;
var contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content');
var path = contextPath + "/cart/cart.do";	//url使用


$(function(){
	initMiniCart();	//呼叫頁面載入時取得資料
//	console.log(contextPath);
//	console.log(path);
});

function initMiniCart(){
	$.ajax({
		url: path,
		type: "GET",
		data: {
			"action" : "getAll",
			"userNumber" : userNumber
		},
		dataType: "json",
		success:function(items){
//			console.log(items);
			let listHtml = '';
			$.each(items, function(index, item){
				listHtml += `
					<div class="cart_item" data-id="${item.bookNumber}">
						<div class="cart_img" style="text-align: center;">
							<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
							<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="70px" alt=""></a>
						</div>
						<div class="cart_info">
							<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a>
							<p>
								${item.quantity} x <span> ${item.bookPrice} </span>
							</p>
						</div>
					</div>
					`;
			});
			$(".mini_cart #offcanvas_mini_cart").html(listHtml);
			$(".mini_cart #menu_mini_cart").html(listHtml);
			$("span.item_count").text(items.length);
			showFullCart(items);
		}
	});
}

function showFullCart(cart){
//	console.log(cart);
	var subtotalSum = 0, deliveryFee = 0, total = 0;
	let listHtml = '';
	$.each(cart, function(index, item){
				listHtml += `
					<tr data-id="${item.bookNumber}">
						<td class="remove_one"><a href="#"><i class="far fa-trash-alt fa-lg"></i></a></td>
			            <td>
			            	<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
			            	<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="100px" alt=""></a>
			            </td>
			            <td><a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a></td>
			            <td>$${item.bookPrice}</td>
			            <td class="product_quantity"><label>數量</label><input min="1" max="${item.bookStock}" value="${item.quantity}" type="number"></td>
			            <td>${item.bookStock}</td>
			            <td>$${item.subtotal}</td>
		            </tr>
					`;
					subtotalSum += (parseInt(item.bookPrice) * parseInt(item.quantity));
	});
	if(subtotalSum >= 1000){
		deliveryFee = 50;
	}else if (subtotalSum > 0){
		deliveryFee = 100;
	}
		
	total = subtotalSum + deliveryFee;
	
	listHtml += `<input type="hidden" name="userNumber" value="${userNumber}">`;
	$("#full_cart .cart_tbody").html(listHtml);
	$("p#data-subtotal").text("$"+subtotalSum);
	$("p#data-deliveryfee").text("$"+deliveryFee);
	$("p#data-total").text("$"+total);
	
}

//刪除單筆商品
//$(document).on("click", "td.remove_one", function(event){
//	event.preventDefault();
//	event.stopPropagation();
//
//	let bookNumber = $(this).closest("tr").attr("data-id");
////	console.log(bookNumber);
//	let that = this;
//
//	
//	console.log(that);
//	let formData = {
//		"action" : "remove",
//		"userNumber" : userNumber,
//		"bookNumber" : bookNumber
//	};
//	
//	$.ajax({
//		url : path,
//		type : "POST",
//		data : formData,
//		dataType : "json",
//		success:function(status){
//		console.log(status.msg);
//			if(status.msg == "remove success"){
//				$(that).closest("tr").fadeOut(1000, function(){
//					$(this).remove();
//				});
//			}
//		}
//	});
//});


//全部清空
$("button.btn_empty").on("click" , function(event){
	event.preventDefault();
	if(confirm("確認清空？")){
		$.ajax({
			url: path,
        	type: "POST",
            data: {
			"action" : "clear",
				"userNumber" : userNumber
			  },
            dataType: "json",
            success:function(status){
//				console.log(status.msg);
                if(status.msg == "clean success"){
                    $("tbody.cart_tbody").children("tr").fadeOut(1000, function(){
                    $("tbody.cart_tbody").empty();	//購物車大頁面清空
                    });
                  	$(".mini_cart #offcanvas_mini_cart").empty();	//隱藏menu的小購物車清空
					$(".mini_cart #menu_mini_cart").empty();	//menu的小購物車清空
					$("span.item_count").text(0);	//數量清0
                }
            }            
        });
    }
});
