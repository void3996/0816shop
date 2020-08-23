<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Valpago Admin</title>
	
<script src="/resources/jquery/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style> 
<style>
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='gdsDes'] { display:block; }
	input { width:150px; }
	textarea#gdsDes { width:400px; height:180px; }
	/* .oriImg { width:500px; height:auto; }
	.thumbImg {}
	.gdsDes img { max-width:600px; height:auto; } */
</style>
</head>
<body>
<div id="root">
	<header id="header">
		<div id="header_box">
			<%@ include file="../include/header.jsp" %>
		</div>
	</header>

	<nav id="nav">
		<div id="nav_box">
			<%@ include file="../include/nav.jsp" %>
		</div>
	</nav>
	
	<section id="container">
		<aside>
			<%@ include file="../include/aside.jsp" %>
		</aside>
		<div id="container_box">
			<!-- <h2>상품 목록</h2> -->
			<form role="form" method="post" autocomplete="off">
			<!-- 숨겨둔 input에 상품번호 값을 넣어뒀다 -->
			<input type="hidden" name="n" value="${goods.gdsNum }">
				<div class="inputArea"> 
				 	<label>1차 분류</label>
				 	<span class="category1"></span>        
					<label>2차 분류</label>
				 	<span class="category2">${goods.cateCode}</span>
				</div>
				
				<div class="inputArea">
					 <label for="gdsName">상품명</label>
					 <span>${goods.gdsName}</span>
				</div>
				
				<div class="inputArea">
					 <label for="gdsPrice">상품가격</label>
					 <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###"/></span>
				</div>
				
				<div class="inputArea">
					 <label for="gdsStock">상품수량</label>
					 <span>${goods.gdsStock}</span>
				</div>
				
				<div class="inputArea">
					 <label for="gdsDes">상품소개</label>
					 <span>${goods.gdsDes}</span>
				</div>
				
				<div class="inputArea">
					 <button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
					 <button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
				<script>
					var formObj = $("form[role='form']");
					
					$("#modify_Btn").click(function() {
						formObj.attr("action", "/admin/goods/modify");
						formObj.attr("method", "get")
						formObj.submit();
					});
					
					$("#delete_Btn").click(function() {
						/*사용자에게 메시지를 보내서 확인, 취소 값을 받을수 있는 다이얼로그  */
						var con = confirm("정말로 삭제하시겠습니까?");
						
						if(con){
							formObj.attr("action", "/admin/goods/delete");
							formObj.submit();
						}
					});
				</script>
				
				</div>
				
				</form>
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>


</body>
</html>