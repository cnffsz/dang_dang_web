<%@page pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.tarena.entity.Cart"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>生成订单 - 当当网</title>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="css/login.css" rel="stylesheet" type="text/css" />
		<link href="css/page_bottom.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.5.min.js"></script>
		<script type="text/javascript" >
		</script>
	</head>
	<body>
		<%@include file="common/head1.jsp"%>
		<div class="login_step">
			生成订单骤:
			<span class="red_bold">1.确认订单</span> > 2.填写送货地址 > 3.订单成功
		</div>
		<div class="fill_message">

			<table class="tab_login">
				<tr>
					<td valign="top" class="w1" style="text-align: left">
						<b>序号</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品名称</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品单价</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>商品数量</b>
					</td>
					<td valign="top" class="w1" style="text-align: left">
						<b>小计</b>
					</td>
				</tr>

				<!-- 订单开始 -->
				
              <c:forEach var="item" items="${list}" varStatus="status">
              <tr>
						<td valign="top">
						 ${item.book.id }
						</td>
						<td valign="top">
							${item.book.productName }
						</td>
						<td valign="top">
							${item.book.dangPrice }
						</td>
						<td valign="top">
							${item.count }
						</td>
						<td valign="top">
							<%=((Cart)session.getAttribute("cart")).getSave() %>
						</td>
					
					
					</tr>
              
              </c:forEach>
				
						
					
				<!-- 订单结束 -->
				<tr>
					<td valign="top" class="w1" style="text-align: left" colspan="5">
						<b>总价￥
						<%=((Cart)session.getAttribute("cart")).getTotleA()%>
						</b>
					</td>
				</tr>
				
			</table>
			<br />
			<br />
			<br />
			<div class="login_in">
				<input id="cancel" class="button_1" type="button" onclick="location='cart'" value="取消" />
				<input id="next" class="button_1" type="button" onclick="location='address'" value="下一步" />
			</div>

		</div>
		<%@include file="common/foot1.jsp"%>
	</body>
</html>

