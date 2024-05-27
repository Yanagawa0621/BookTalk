
var userNumber = 4;
var contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content');
var path = contextPath + "/cart/cart.do";	//url使用
//var cartPath = contextPath + "/front-end/cart.jsp";


$(function(){
	initMiniCart();	//呼叫頁面載入時取得資料
	console.log(contextPath);
	console.log(path);
	
//	$(document).on("click", "#offcanvas-view-cart-items", function(event){
//			event.preventDefault(); //阻止預設行為
//		initFullCart();
//	});
//	$(document).on("click", "#menu-view-cart-items", function(event){
//		console.log("我有被按到");
//	});
});

function initMiniCart(){
	console.log("到" + path);
	$.ajax({
		url: path,
		type: "GET",
		data: {
			"action" : "miniCartGetAll",
			"userNumber" : userNumber
		},
		dataType: "json",
		success:function(items){
			console.log(items);
//			sessionStorage.setItem("ajaxData", JSON.stringify(items));
			let listHtml = '';
			$.each(items, function(index, item){
				listHtml += `
					<div class="cart_item">
						<div class="cart_img">
							<a href="#"><img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="60px" alt=""></a>
						</div>
						<div class="cart_info">
							<a href="#">${item.bookTitle}</a>
							<p>
								${item.quantity} x <span> ${item.bookPrice} </span>
							</p>
						</div>
							<div class="cart_remove">
								<a href="#"><i class="ion-ios-close-outline"></i></a>
							</div>
					</div>
					`;
			});
			$(".mini_cart #offcanvas_mini_cart").html(listHtml);
			$(".mini_cart #menu_mini_cart").html(listHtml);
			$("span.item_count").text(items.length);
		}
	});
}

//function initFullCart(){
//	let nextPageUrl = contextPath + "/front-end/cart.jsp"
//	console.log("有傳到");
//	console.log(nextPageUrl);
//	
//	$.ajax({
//		url: path,
//		type: "GET",
//		data: {
//			"action" : "fullCartGetAll",
//			"userNumber" : userNumber
//		},
//		dataType: "json",
//		success:function(items){
//			console.log(items);
//			let listHtml = '';
//			$.each(items, function(index, item){
//				listHtml += `
//					<tr>
//						<td><a href="#"><i class="far fa-trash-alt fa-lg"></i></a></td>
//			            <td><a href="#"><img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="100px" alt=""></a></td>
//			            <td><a href="#">${item.bookTitle}</a></td>
//			            <td>${item.bookPrice}</td>
//			            <td class="product_quantity"><label>數量</label><input min="1" max="${item.bookStock}" value="${item.quantity}" type="number"></td>
//			            <td>${item.bookStock}</td>
//			            <td>${item.subtotal}</td>
//		            </tr>
//		                <input type="hidden" name="userNumber" value="${item.userNumber}">
//					`;
//			});			
//			$("#full_cart .cart_tbody").html(listHtml);
//		}
//	});	
//}

//function showFullCart(cart){
//	console.log(cart);
//	let listHtml = '';
//	$.each(cart, function(index, item){
//				listHtml += `
//					<tr>
//						<td><a href="#"><i class="far fa-trash-alt fa-lg"></i></a></td>
//			            <td><a href="#"><img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="100px" alt=""></a></td>
//			            <td><a href="#">${item.bookTitle}</a></td>
//			            <td>${item.bookPrice}</td>
//			            <td class="product_quantity"><label>數量</label><input min="1" max="${item.bookStock}" value="${item.quantity}" type="number"></td>
//			            <td>${item.bookStock}</td>
//			            <td>${item.subtotal}</td>
//		            </tr>
//		                <input type="hidden" name="userNumber" value="${item.userNumber}">
//					`;
//	});			
//	$("#full_cart .cart_tbody").html(listHtml);			
//}
