

$(function(){
	var userNumber = 4;
	var contextPath = document.querySelector('meta[name="contextPath"]').getAttribute('content'); //${pageContext.request.contextPath}
	var path = contextPath + "/order/order.do";	//url使用
	
	 $('a[href="#orders"]').on("click", function(){
		 showOrders();
	 });

	function showOrders(){
	$.ajax({
		url: path,
		type: "GET",
		data:{
			"action" : "getUserAllOrder",
			"userNumber" : userNumber 
		},
		dataType: "json",
		success: function(orders){
			console.log(orders);
			let listHtml = '';
			$.each(orders, function(index, order){
				listHtml += `
					<tr>
                       <td>${order.orderNumber}</td>
                       <td>${order.establishmentTime}</td>
               `;      
	                if(order.orderStatus == 0){
					   	listHtml += `<td>取消</td>`;
				   	}
				   	if(order.orderStatus == 1){
					   	listHtml += `<td>已確認</td>`;
				   	}
				   	if(order.orderStatus == 2){
					   	listHtml += `<td>待出貨</td>`;
				   	}
				   	if(order.orderStatus == 3){
					   	listHtml += `<td>待收貨</td>`;
				   	}
				   	if(order.orderStatus == 4){
					   	listHtml += `<td>已完成 (尚未評價)</td>`;
				   	}
				   	if(order.orderStatus == 5){
					   	listHtml += `<td>已完成</td>`;
				   	}
				listHtml += ` 
                       <td>$ ${order.total}</td>
                       <td>
                       		<form method="post" action="${path}">
                       			<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">查看</button>
                       			<input type="hidden" name="orderNumber" value="${order.orderNumber}">
                       			<input type="hidden" name="action" value="getUserOneOrderDetails">
                       		</form>
					   </td>
                     </tr>
				`;
			});
			$("#orders tbody").html(listHtml);
		}
	});
}

});

