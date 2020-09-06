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
<!-- <script src="/resources/ckeditor/ckeditor.js"></script> -->
	
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
	/* .select_img img { width:500px; margin:20px 0; } */
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
			<h2>상품 수정</h2>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
			
			<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />
			
			<div class="inputArea">	
				<label>1차 분류</label>
				<select class="category1">
					<option value="">전체</option>
				</select>			
				<label>2차 분류</label>
				<select class="category2" name="cateCode">
					<option value="">전체</option>
				</select>
			</div>
			<div class="inputArea">
				<label for="gdsName">상품명</label>
				<input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}"/>
			</div>
			<div class="inputArea">
				<label for="gdsPrice">상품가격</label>
				<input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}"/>
			</div>
			<div class="inputArea">
				<label for="gdsStock">상품수량</label>
				<input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}"/>
			</div>
			<div class="inputArea">
				<label for="gdsDes">상품소개</label>
				<textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
			</div>
			
				<div class="inputArea">
					 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
					 <button type="button" id="back_Btn" class="btn btn-warning">취소</button>	
					<script>
						$("#back_Btn").click(function() {
							//history.back(); 뒤로가기와 동일
							location.href = "/admin/goods/view?n="+${goods.gdsNum};
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
<script>
	var jsonData = JSON.parse('${category}');
	console.log(jsonData);
	
	var cate1Arr = new Array();
	var cate1Obj = new Object();
	
	/* 1차 분류 셀렉트 박스에 삽입할 데이터준비 */
	/*jsondata에서 level값이 1인 경우에만 cate1Obj에 추가  */
	/* cate1Obj에 저장된 값을 cate1Arr 배열에 저장 */
	/* cate1Obj에 cateCode와 cateName를 저장 */
	
	for(var i = 0; i < jsonData.length; i++) {
		
		if (jsonData[i].level == "1") {
			cate1Obj = new Object();	
			
			cate1Obj.cateCode = jsonData[i].cateCode;
			cate1Obj.cateName = jsonData[i].cateName;
			
			cate1Arr.push(cate1Obj);
		}
	}
	/* 1차 분류 셀렉트 박스에 데이터 삽입  */
	var cate1Select = $("select.category1")
	/* cate1Arr에 저장된 값을 cate1Select에 추가 */
	for (var i = 0; i < cate1Arr.length; i++) {
		
		cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
											+ cate1Arr[i].cateName + "</option>");	
		
	}
					$(document).on("change", "select.category1", function(){
						var cate2Arr = new Array();
						var cate2Obj = new Object();
						
						for(var i = 0; i < jsonData.length; i++) {
							
							if(jsonData[i].level == "2") {
								cate2Obj = new Object();
								cate2Obj.cateCode = jsonData[i].cateCode;
								cate2Obj.cateName = jsonData[i].cateName;
								cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
								
								cate2Arr.push(cate2Obj);
							} 
						}
						
						var cate2Select = $("select.category2");
						
						/*
						for(var i = 0; i < cate2Arr.length; i++) {
								cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
													+ cate2Arr[i].cateName + "</option>");
						}
						*/
						
						cate2Select.children().remove();
					 
						$("option:selected", this).each(function(){
							
							var selectVal = $(this).val();		
									
							cate2Select.append("<option value='" + selectVal + "'>전체</option>");
							
							for(var i = 0; i < cate2Arr.length; i++) {
								if(selectVal == cate2Arr[i].cateCodeRef) {
									cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
														+ cate2Arr[i].cateName + "</option>");
								}
							}		
						});
					});
						
						var select_cateCode = '${goods.cateCode}';
						var select_cateCodeRef = '${goods.cateCodeRef}';
						var select_cateName = '${goods.cateName}';
					
						//카테고리 코드, 카테고리 참조 코드, 카테고리 이름을 가져와서
						//셀렉트 박스에 추가하는 함수
						if(select_cateCodeRef != null && select_cateCodeRef != ""){
							console.log("값이 없으면");
							
							$(".category1").val(select_cateCodeRef);
							$(".category2").val(select_cateCode);
							$(".category2").children().remove();
							$(".category2").append("<option value='"
									+ select_cateCode + "'>" + select_cateName + "</option");
						}else {
							console.log("값이 있으면");
							$(".category1").val(select_cateCode);
							$(".category2").append("<option value='"+select_cateCode+"'selected='selected'>전체</option>");
						}
					</script>

</body>
</html>