
var userNumber = 4;
var contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content'); //${pageContext.request.contextPath}
var path = contextPath + "/cart/cart.do";	//url使用


$(function(){
	initMiniCart();	//呼叫頁面載入時取得資料
//	console.log(contextPath);
//	console.log(path);

	//刪除單筆商品
	$(document).on("click", "td.remove_one", function(event){
		event.preventDefault();
		event.stopPropagation();
	
		let bookNumber = $(this).closest("tr").attr("data-id");
		//console.log(bookNumber);
		let that = this;	
		
		//console.log(that);
		let formData = {
			"action" : "remove",
			"userNumber" : userNumber,
			"bookNumber" : bookNumber
		};
		
		$.ajax({
			url : path,
			type : "POST",
			data : formData,
			dataType : "json",
			success:function(status){
			//console.log(status.msg);
				if(status.msg == "remove success"){
					$(that).closest("tr").fadeOut(1000, function(){
						$(this).remove();
					});
					reloadMiniCart();
				}
			}
		});
	});


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
					//console.log(status.msg);
	                if(status.msg == "clean success"){
	                    $("tbody.cart_tbody").children("tr").fadeOut(1000, function(){
	                    $("tbody.cart_tbody").empty();	//購物車大頁面清空
	                    });
	                  	reloadMiniCart();
	                }
	            }            
	        });
	    }
	});
	
	
	//新增商品按鈕綁定(Modal視窗用)
	$("li.quick_button a").on("click", function(event)	{
		event.preventDefault();
		event.stopPropagation();
		let bookNumber = $(this).children("input").val();		
		//當使用Bootstrap moal時，可以監聽shown.bs.modal事件，在modal完全顯示後觸發(用意是先抓取未顯示Modal之前的資料，之後要結合Modal的資料)  
		$("#modal_box").on("shown.bs.modal", function () {
			//Modal完全顯示後執行這裡的東西
			$("button.shop_add_cart").on("click", function(event){
				event.preventDefault();
				event.stopPropagation();
				if(!$(this).hasClass("-disabled")){
					let quantity = $(this).closest("form").children("input").val();
					let bookStock = $(this).closest("form").children("input").attr("max");
					addMiniCart(bookNumber, quantity, bookStock);	//呼叫新增商品的function
				}		
			});
			
			$("#modal_box").on("hide.bs.modal", function () {	//當Modal隱藏取消綁定，不然會造成資料抓取不正確
				$("#modal_box").off("shown.bs.modal");
	   		});
		});
	});
	
	
	//新增商品按鈕綁定(單頁商品視窗用)
	$("#detail_add_cart").on("click", function(event){
		event.preventDefault();
		if(!$(this).hasClass("-disabled")){
			addMiniCartOne();	//呼叫新增商品的function
		}
	});
	
	//更新購買數量綁定
	$(document).on("change", "td.product_quantity", function(event){
		event.preventDefault();
		if(!$(this).hasClass("-disabled")){
			let bookNumber = $(this).closest("tr").attr("data-id");
			let bookPrice = $(this).prev().text().slice(1);
			let quantity = $(this).children("input").val();
	
			let formData = {
					"action" : "update",
					"userNumber" : userNumber,
					"bookNumber" : bookNumber,
					"bookPrice" : bookPrice,
					"quantity" : quantity
			};
			
			let that = this;
	
			$.ajax({
				url: path,
				type: "POST",
				data: formData,
				dataType: "json",
				success:function(item){	
					console.log(item);	
					let listHtml = `
						<td>$${item.subtotal}</td>
					`;
					let row = $(that).closest("tr");
					let cells = row.find("td");
					cells.eq(6).replaceWith(listHtml);
					reloadMiniCart();
				},
				complete:function(xhr){
					$("td.product_quantity").removeClass("-disabled");
				}
			});
		}
	});

});


//初始化小購物車資料
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
			//console.log(items);
			let listHtml = '';
			$.each(items, function(index, item){
				if(index <= 2){
					listHtml += `
						<div class="cart_item" data-id="${item.bookNumber}">
							<div class="cart_img" style="text-align: center;">
								<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
								<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="70px" alt=""></a>
							</div>
							<div class="cart_info">
								<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a>
								<p>
									<strong>${item.quantity}  x  <span> $${item.bookPrice} </span></strong>
								</p>
							</div>
						</div>
					`;			
				}else{
					let noShow = parseInt(items.length) - 3;	//小購物車只顯示3筆
					listHtml +=`<div class="noShow"><p>${noShow} 件商品尚未展示</p></div>`
					return false;
				}
				
			});
			$(".mini_cart #offcanvas_mini_cart").html(listHtml);
			$(".mini_cart #menu_mini_cart").html(listHtml);
			$("#offcanvas_item_count").text(items.length);
			$("#menu_item_count").text(items.length);
			showFullCart(items);
		}
	});
}

//更新小購物車資料
function reloadMiniCart(){
	$.ajax({
		url: path,
		type: "GET",
		data: {
			"action" : "getAll",
			"userNumber" : userNumber
		},
		dataType: "json",
		success:function(items){
			//console.log(items);
			let listHtml = '';
			$.each(items, function(index, item){
				if(index <= 2){
					listHtml += `
						<div class="cart_item" data-id="${item.bookNumber}">
							<div class="cart_img" style="text-align: center;">
								<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
								<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="70px" alt=""></a>
							</div>
							<div class="cart_info">
								<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a>
								<p>
									<strong>${item.quantity}  x  <span> $${item.bookPrice} </span></strong>
								</p>
							</div>
						</div>
					`;			
				}else{
					let noShow = parseInt(items.length) - 3;	//小購物車只顯示3筆
					listHtml +=`<div class="noShow"><p>${noShow} 件商品尚未展示</p></div>`
					return false;
				}
				
			});
			$(".mini_cart #offcanvas_mini_cart").html(listHtml);
			$(".mini_cart #menu_mini_cart").html(listHtml);
			$("#offcanvas_item_count").text(items.length);
			$("#menu_item_count").text(items.length);
			reloadFullCartPrice(items);
		}
	});
}


//購物車頁面載入
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
	
	//隱藏欄位，給之後checkout.jsp頁面用
	let hiddenHtml = `
			<input type="hidden" name="subtotalSum" value=${subtotalSum}>
			<input type="hidden" name="deliveryFee" value=${deliveryFee}>
			<input type="hidden" name="total" value=${total}>
	`;
	$("div.checkout_btn").append(hiddenHtml);
	
}


//更新購物車價錢
function reloadFullCartPrice(cart){
//	console.log(cart);
	var subtotalSum = 0, deliveryFee = 0, total = 0;
	$.each(cart, function(index, item){
		subtotalSum += (parseInt(item.bookPrice) * parseInt(item.quantity));
	});
	if(subtotalSum >= 1000){
		deliveryFee = 50;
	}else if (subtotalSum > 0){
		deliveryFee = 100;
	}
		
	total = subtotalSum + deliveryFee;
	
	$("p#data-subtotal").text("$"+subtotalSum);
	$("p#data-deliveryfee").text("$"+deliveryFee);
	$("p#data-total").text("$"+total);
}


//新增商品(Modal視窗用)
function addMiniCart(bookNumber, quantity, bookStock){
	let bookTitle = $("div.modal_title").children("h2").text();
	let bookPrice = $("span.new_price").text().slice(4);
	
	let formData = {
			"action" : "add",
			"userNumber" : userNumber,
			"bookNumber" : bookNumber,
			"bookTitle" : bookTitle,
			"bookPrice" : bookPrice,
			"quantity" : quantity,
			"bookStock" : bookStock
	};
			
	$.ajax({
		url: path,
		type: "POST",
		data: formData,
		dataType: "json",
		success:function(item){
			let listHtml = `
				<div class="cart_item" data-id="${item.bookNumber}">
					<div class="cart_img" style="text-align: center;">
						<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
						<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="70px" alt=""></a>
					</div>
					<div class="cart_info">
						<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a>
						<p>
							<strong>${item.quantity}  x  <span> $${item.bookPrice} </span></strong>
						</p>
					</div>
				</div>
			`;
			$(".mini_cart #offcanvas_mini_cart").prepend(listHtml);
			$(".mini_cart #menu_mini_cart").prepend(listHtml);
			reloadMiniCart();
		},
		complete:function(xhr){
			$("button.shop_add_cart").removeClass("-disabled");
			$("#modal_box").modal("hide");
		}
		
	});
}

//新增商品(單頁商品視窗用)
function addMiniCartOne(){
	let bookNumber = $("#zoom1").attr("data-zoom-image");
	let bookTitle = $("form").children("h1").text();
	
	let pointIndex = $("span.current_price").text().indexOf(".");
	let bookPrice = $("span.current_price").text().slice(4, pointIndex);	
	
	let quantity = $("div.product_variant").children("input").val();
	let bookStock = $("div.product_variant").children("input").attr("max");

	
	let formData = {
			"action" : "add",
			"userNumber" : userNumber,
			"bookNumber" : bookNumber,
			"bookTitle" : bookTitle,
			"bookPrice" : bookPrice,
			"quantity" : quantity,
			"bookStock" : bookStock
	};
	
	$.ajax({
		url: path,
		type: "POST",
		data: formData,
		dataType: "json",
		success:function(item){
			let listHtml = `
				<div class="cart_item" data-id="${item.bookNumber}">
					<div class="cart_img" style="text-align: center;">
						<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">
						<img src="${contextPath}/bap/Img?bookNumber=${item.bookNumber}" width="70px" alt=""></a>
					</div>
					<div class="cart_info">
						<a href="${contextPath}/bookproducts.do?bookNumber=${item.bookNumber}&action=single_product_page">${item.bookTitle}</a>
						<p>
							<strong>${item.quantity}  x  <span> $${item.bookPrice} </span></strong>
						</p>
					</div>
				</div>
			`;
			$(".mini_cart #offcanvas_mini_cart").prepend(listHtml);
			$(".mini_cart #menu_mini_cart").prepend(listHtml);
			reloadMiniCart();
		},
		complete:function(xhr){
			$("#detail_add_cart").removeClass("-disabled");
		}
	});

}
