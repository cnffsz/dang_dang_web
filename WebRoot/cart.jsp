<%@page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@page import="com.tarena.entity.Cart"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>当当图书 – 全球最大的中文网上书店</title>
		 <meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link href="css/book.css" rel="stylesheet" type="text/css" />
		<link href="css/second.css" rel="stylesheet" type="text/css" />
		<link href="css/secBook_Show.css" rel="stylesheet" type="text/css" />
		<link href="css/shopping_vehicle.css" rel="stylesheet"
			type="text/css" />
		<link href="css/public_footer.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery-1.4.3.js"></script>
		<script type="text/javascript">
		$(function(){
		   $(".update").click(function(){
					var id=$(this).attr("id");
					var num=$("#num"+id).val();
					var req=/^[1-9][0-9]*/;
					if(!req.test(num)){
						alert("你必须输入一个数字！");
						$("#num"+id).val("");
					}else{
						location="update?id="+id+"&num="+num;
					}
				});
		});
		</script>
	</head>
	<body>
		<br />
		<br />
		<div class="my_shopping">
			<img class="pic_shop" src="images/pic_myshopping.gif" />
		</div>
		<c:choose>
		<c:when test="${empty list}">
		<div id="div_no_choice">
			<div class="choice_title"></div>
			<div class="no_select">
				您还没有选购任何商品[
				<a href='booklist'> 继续挑选商品&gt;&gt;</a>]
			</div>
		</div>
		</c:when>
		<c:otherwise>
		<div id="div_choice" class="choice_merch">
			<h2 id="cart_tips">
				您已选购以下商品
			</h2>
			<div class="choice_bord">
				<table class="tabl_buy" id="tbCartItemsNormal">
					<tr class="tabl_buy_title">
						<td class="buy_td_6">
							<span>&nbsp;</span>
						</td>
						<td>
							<span class="span_w1">商品名</span>
						</td>
						<td class="buy_td_5">
							<span class="span_w2">市场价</span>
						</td>
						<td class="buy_td_4">
							<span class="span_w3">当当价</span>
						</td>
						<td class="buy_td_1">
							<span class="span_w2">数量</span>
						</td>
						<td class="buy_td_2">
							<span>变更数量</span>
						</td>
						<td class="buy_td_1">
							<span>删除</span>
						</td>
					</tr>
					<tr class='objhide'>
						<td colspan="8">
							&nbsp;
						</td>
					</tr>
                   <c:forEach var="lis" items="${list}" varStatus="status">
					<tr class='td_no_bord'>
						<td style='display: none'>
							商品ID
						</td>
						<td class="buy_td_6">
							<span class="objhide"><img /> </span>
						</td>
						<td>
							<a href="#">  ${lis.book.productName }</a>
						</td>
						<td class="buy_td_5">
							<span class="c_gray">${lis.book.fixedPrice }</span>
						</td>
						<td class="buy_td_4">
							&nbsp;&nbsp;
							<span>￥${lis.book.dangPrice } </span>
						</td>
						<td class="buy_td_1">
							&nbsp;&nbsp;${lis.count }
						</td>

						<td>
							<input class="del_num" type="text" size="3"	id="num${lis.book.id}"  />
							<a href="javascript:;" id="${lis.book.id}" class="update">变更</a>
						</td>
						<td>
							<a href="#" onclick="location='delete?id=${lis.book.id}'">删除</a>
						</td>
					</tr>
					</c:forEach>
					</table>
				
				<div class="choice_balance">
					<div class="select_merch">
						<a href='booklist'> 继续挑选商品&gt;&gt;</a>
					</div>
					<div class="total_balance">
						<div class="save_total">
							您共节省：
							<span class="c_red"> ￥<span id="total_economy"><%=((Cart)session.getAttribute("cart")).getSave() %></span> </span>
							<span id='total_vip_economy' class='objhide'> ( 其中享有优惠： <span
								class="c_red"> ￥<span id='span_vip_economy'>0.00</span> </span>
								) </span>
							<span style="font-size: 14px">|</span>
							<span class="t_add">商品金额总计：</span>
							<span class="c_red_b"> ￥<span id='total_account'><%=((Cart)session.getAttribute("cart")).getTotleA()%></span>
							</span>
						</div>
						<div id="balance" class="balance">
							<a name='checkout' href='order'> <img
									src="images/butt_balance.gif" alt="结算" border="0" title="结算" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
					<!-- 购物列表结束 -->
				
		<!-- 用户删除恢复区 -->

		<div id="divCartItemsRemoved" class="del_merch">
          
		</div>
		<br />
		<br />
		<br />
		
		 
		
		<!--页尾开始 -->

		<div class="public_footer">
			<div class="public_footer_bottom">
				<div class="public_footer_icp" style="line-height: 48px;">
					Copyright (C) 当当网 2004-2008, All Rights Reserved
					<a href="#" target="_blank"><img
							src="images/bottom/validate.gif" border="0" align="middle" />
					</a>
					<a href="#" target="_blank" style="color: #666;">京ICP证041189号</a>
				</div>
			</div>
		</div>
		<!--页尾结束 -->
	</body>
</html>
