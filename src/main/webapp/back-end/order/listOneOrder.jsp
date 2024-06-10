<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>


<%
  OrderVO orderVO = (OrderVO) request.getAttribute("orderVO"); //OrderServlet.java(Concroller), 存入req的orderVO物件

%>

<!DOCTYPE html>
<html>
<!-- head -->
<%@include file="/back-end/component/header.jsp" %>

<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row justify-content-between">
						<div class="col-sm-6">
							<h1 class="m-0">單一查詢</h1>
						</div>	<!-- /.col -->						
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
				<div class="card">
	              <div class="card-header">
	              	<div class="row">
		                <div class="col-md">
		                	<c:if test="${not empty orderVO}">
		                	<h3 class="card-title">${orderVO.orderNumber}號訂單</h3>	
		                	</c:if>
		                	<c:if test="${not empty listUserNumberVO}">
		                	<h3 class="card-title">會員編號 ${listUserNumberVO[0].userNumber} 的訂單</h3>	
		                	</c:if>         
		                </div>
		                <div class="col-md-1">
		                	 <a href="${pageContext.request.contextPath}/order/order.do?action=getAll">
								<button type="button" class="btn btn-block bg-gradient-primary">回訂單列表</button>
							</a>
		                </div>
		            </div>
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover dt-responsive nowrap">
	                  <thead>
		                  <tr>
		                    <th>訂單編號</th>
		                    <th>會員編號</th>
		                    <th>訂單狀態</th>
		                    <th>成立時間</th>		                    
		                    <th>出貨時間</th>
		                    <th>收件人</th>
		                    <th>收件地址</th>
		                    <th>手機</th>
		                    <th>運費</th>
		                    <th>總金額</th>
		                    <th>付款編號</th>
		                    <th>備註</th>
		                    <th>Action</th>
		                  </tr>
	                  </thead>
	                  <tbody>
	                  	<c:if test="${not empty orderVO}">
		                  <tr>
		                    <td>${orderVO.orderNumber}</td>
		                    <td>${orderVO.userNumber}</td>
		                    <td>
		                    	<c:if test = "${orderVO.orderStatus == 0}">
		                    		取消
		                    	</c:if>
		                    	<c:if test = "${orderVO.orderStatus == 1}">
		                    		待處理
		                    	</c:if>
		                    	<c:if test = "${orderVO.orderStatus == 2}">
		                    		待出貨
		                    	</c:if>
		                    	<c:if test = "${orderVO.orderStatus == 3}">
		                    		已出貨
		                    	</c:if>
		                    	<c:if test = "${orderVO.orderStatus == 4}">
			                    	已完成 (尚未評價)
			                    </c:if>
			                    <c:if test = "${orderVO.orderStatus == 5}">
			                    	已完成
			                    </c:if>
		                    </td>
		                    <td>${orderVO.establishmentTime}</td>		                    
		                    <td>${orderVO.shippingTime}</td>
		                    <td>${orderVO.receiver}</td>
		                    <td>${orderVO.shippingAddress}</td>
		                    <td>${orderVO.telephoneNumber}</td>
		                    <td>${orderVO.deliveryFee}</td>
		                    <td>${orderVO.total}</td>
		                    <td>${orderVO.paymentNumber}</td>
		                    <td>${orderVO.note}</td>
		                    <td>
			                    <form method="post" action="${pageContext.request.contextPath}/order/order.do">
			                    	<c:choose>
		                            	<c:when test="${orderVO.orderStatus == 1}">
		                            		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">查看</button>
										</c:when>
										<c:when test="${orderVO.orderStatus == 2}">
										     <button type="submit" class="btn btn-block btn-warning btn-sm">出貨</button>
										</c:when>
										<c:when test="${orderVO.orderStatus == 3}">
										      <button type="submit" class="btn btn-block btn-success btn-sm">查看</button>
										</c:when>
										<c:otherwise>
										     <button type="submit" class="btn btn-block btn-info btn-sm">查看</button>										    
										</c:otherwise>
									</c:choose>
				                    	<input type="hidden" name="orderNumber"  value="${orderVO.orderNumber}"> 
				                    	<input type="hidden" name="action"	value="getOne_For_Update">
			                   </form>
			               </td>
		                  </tr>
		                </c:if> 
		                
		                <c:if test="${not empty listUserNumberVO}">
		                	<c:forEach var="userOrder" items="${listUserNumberVO}">
		                		<tr>
				                    <td>${userOrder.orderNumber}</td>
				                    <td>${userOrder.userNumber}</td>
				                    <td>
				                    	<c:if test = "${userOrder.orderStatus == 0}">
				                    		取消
				                    	</c:if>
				                    	<c:if test = "${userOrder.orderStatus == 1}">
				                    		待處理
				                    	</c:if>
				                    	<c:if test = "${userOrder.orderStatus == 2}">
				                    		待出貨
				                    	</c:if>
				                    	<c:if test = "${userOrder.orderStatus == 3}">
				                    		已出貨
				                    	</c:if>
				                    	<c:if test = "${userOrder.orderStatus == 4}">
			                    			已完成 (尚未評價)
			                    		</c:if>
			                    		<c:if test = "${userOrder.orderStatus == 5}">
			                    			已完成
			                    		</c:if>
		                    		</td>
				                    <td>${userOrder.establishmentTime}</td>		                    
				                    <td>${userOrder.shippingTime}</td>
				                    <td>${userOrder.receiver}</td>
				                    <td>${userOrder.shippingAddress}</td>
				                    <td>${userOrder.telephoneNumber}</td>
				                    <td>${userOrder.deliveryFee}</td>
				                    <td>${userOrder.total}</td>
				                    <td>${userOrder.paymentNumber}</td>
				                    <td>${userOrder.note}</td>
				                    <td>
					                    <form method="post" action="${pageContext.request.contextPath}/order/order.do">
					                    	<c:choose>
				                            	<c:when test="${userOrder.orderStatus == 1}">
				                            		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">查看</button>
												</c:when>
												<c:when test="${userOrder.orderStatus == 2}">
												     <button type="submit" class="btn btn-block btn-warning btn-sm">出貨</button>
												</c:when>
												<c:when test="${userOrder.orderStatus == 3}">
												      <button type="submit" class="btn btn-block btn-success btn-sm">查看</button>
												</c:when>
												<c:otherwise>
												     <button type="submit" class="btn btn-block btn-info btn-sm">查看</button>										    
												</c:otherwise>
											</c:choose>
						                    	<input type="hidden" name="orderNumber"  value="${userOrder.orderNumber}"> 
						                    	<input type="hidden" name="action"	value="getOne_For_Update">
					                   </form>
			               			</td>
		                 	 </tr>
							</c:forEach>
		                </c:if>
		                
		                <c:if test="${not empty listOrderStatueVO}">
		                	<c:forEach var="orderStatus" items="${listOrderStatueVO}">
		                		<tr>
				                    <td>${orderStatus.orderNumber}</td>
				                    <td>${orderStatus.userNumber}</td>
				                    <td>
				                    	<c:if test = "${orderStatus.orderStatus == 0}">
				                    		取消
				                    	</c:if>
				                    	<c:if test = "${orderStatus.orderStatus == 1}">
				                    		待處理
				                    	</c:if>
				                    	<c:if test = "${orderStatus.orderStatus == 2}">
				                    		待出貨
				                    	</c:if>
				                    	<c:if test = "${orderStatus.orderStatus == 3}">
				                    		已出貨
				                    	</c:if>
				                    	<c:if test = "${orderStatus.orderStatus == 4}">
			                    			已完成 (尚未評價)
			                    		</c:if>
			                    		<c:if test = "${orderStatus.orderStatus == 5}">
			                    			已完成
			                   			</c:if>
		                    		</td>
				                    <td>${orderStatus.establishmentTime}</td>		                    
				                    <td>${orderStatus.shippingTime}</td>
				                    <td>${orderStatus.receiver}</td>
				                    <td>${orderStatus.shippingAddress}</td>
				                    <td>${orderStatus.telephoneNumber}</td>
				                    <td>${orderStatus.deliveryFee}</td>
				                    <td>${orderStatus.total}</td>
				                    <td>${orderStatus.paymentNumber}</td>
				                    <td>${orderStatus.note}</td>
				                    <td>
					                   <form method="post" action="${pageContext.request.contextPath}/order/order.do">
					                    	<c:choose>
				                            	<c:when test="${orderStatus.orderStatus == 1}">
				                            		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">查看</button>
												</c:when>
												<c:when test="${orderStatus.orderStatus == 2}">
												     <button type="submit" class="btn btn-block btn-warning btn-sm">出貨</button>
												</c:when>
												<c:when test="${orderStatus.orderStatus == 3}">
												      <button type="submit" class="btn btn-block btn-success btn-sm">查看</button>
												</c:when>
												<c:otherwise>
												     <button type="submit" class="btn btn-block btn-info btn-sm">查看</button>										    
												</c:otherwise>
											</c:choose>
						                    	<input type="hidden" name="orderNumber"  value="${orderStatus.orderNumber}"> 
						                    	<input type="hidden" name="action"	value="getOne_For_Update">
					                  </form>
			               		</td>
		                 	 </tr>
							</c:forEach>
		                </c:if>
		                	
		                
		              </tbody>                  
	                </table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	          </div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<!-- footer -->
		<%@include file="/back-end/component/footer.jsp" %>

	</div>
	<!-- ./wrapper -->
	
	<!-- js -->
	<%@include file="/back-end/component/script.jsp" %>	
	<!-- Page specific script -->
	<script>
		$(function() {
			$('.select2').select2()
			$('#orderlist').DataTable({
		      "paging": true,
		      "lengthChange": true,
		      "searching": false,
		      "ordering": true,
		      "stateSave": false, // 預設為false 在頁面刷新時，是否要保存當前表格資料與狀態
		      "destroy": false, // 預設為false 是否銷毀當前暫存資料
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		      "columnDefs":[
		          {
		            targets: [12],
		            responsivePriority: 1, 
		          },
		          {
				    targets: [5],
				    responsivePriority: 2, 
				  },
				  {
				    targets: [6,3,2],
				    responsivePriority: 4, 
				  },
				  {
					targets: [7],
					responsivePriority: 3, 
				  }
		      	],
		      language: {	//設定語言為繁中
		          url: "${pageContext.request.contextPath}/back-end/plugins/i18n/zh-HANT.json"
		      },
		      lengthMenu: [
		    	    [5, 10, 15, 20, 25, 50, -1],
		    	    [5, 10, 15, 20, 25, 50, "全部"],
		    	],
		    });			
		});
	</script>
</body>
</html>