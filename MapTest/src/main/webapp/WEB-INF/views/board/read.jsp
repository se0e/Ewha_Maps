<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<title>Insert title here</title>
</head>
<body>

   <div class="container">
      <div class="row">

         <div class="form-group">
            <label for="writer"> 작성자 </label>
            <input id="writer" name="writer"  class="form-control" value="${vo.writer}" readonly="readonly">
         </div>

         <div class="form-group">
            <label for="title"> 제목 </label>
            <input id="title" name="title"  class="form-control" value="${vo.title}" readonly="readonly">
         </div>

         <div class="form-group">
            <label for="updateDate"> 작성일자 </label>
            <input id="updateDate" name="updateDate" class="form-control" value="${vo.updateDate}" readonly="readonly">
         </div>

         <div class="form-group">
            <label for="content"> 내용 </label>
            <textarea class="form-control" id="content" name="content" rows="10" cols="30" readonly="readonly">${vo.content}</textarea>
         </div>

         <div class="form-group" align="center">
            <button class="btn btn-warning" id="update">수정</button>
            <button class="btn btn-info" id="list">목록</button>
            <button class="btn btn-danger" id="delete">삭제</button>
            <button class="btn btn-primary" id="reply">댓글</button>
         </div>
         
         <div class="row">
         	<input type="number" id="inputID"><button id="inputCheckBtn">RNO CHECK1</button>
         	<p id="msgforuse"></p>
         </div>
         
         <div class="row">
         	<input type="number" id="inputID2"><button id="inputCheckBtn2">RNO CHECK2</button>
         	<p id="msgforuse2"></p>
         </div>


         <!-- 댓글 쓰는 영역 -->
         <div class="row">
            <div class="collapse" id="myCollapsible">
               <div class="form-group" >
                  <label for="replyer">작성자</label>
                  <input id="replyer"  class="form-control" />
               </div>

               <div class="form-group">
                  <label for="replyText">내용</label>
                  <input id="replyText" class="form-control" />
               </div>

               <div class="form-group" align="center">
                  <button class="btn btn-success" id="replyInsertBtn">등록</button>
                  <button class="btn btn-default" id="replyResetBtn">초기화</button>

               </div>
            </div>
         </div>

      </div>
      
   <!-- 댓글영역 -->
      <div class="row" id="replies">
  	     <!-- 댓글이 자동으로 들어감. -->
	  </div>
      <!-- 댓글페이징 -->
	   <div class="row text-center">
		<!-- 반드시 pagination으로 해야함. -->
		<ul class="pagination"> 		
		</ul>
	  </div>
      
      <div class="row">
    	<div class="modal fade" id="myModal">
    		<div class="modal-dialog">
    			<div class="modal-header">
    				<button data-dismiss="modal" class="close">&times;</button> <!-- 모달 닫는 태그 -->
    				<p id="modal_rno"></p>
    			</div>
    			<div class="modal-body">    				
    				<input class="form-control" id="modal_replyText" >
    			</div>
    			<div class="modal-footer">
    						<!-- dismiss: 모달창 닫히기 -->
    				<button data-dismiss="modal" class="btn btn-xs" id="modal_update">수정</button>
    				<button data-dismiss="modal" class="btn btn-xs" id="modal_delete">삭제</button>
    				<button data-dismiss="modal" class="btn btn-xs" id="modal_close">닫기</button>
    			</div>
    		</div>
    	</div>  
      </div>
 
   </div> <!-- dic container end Tag -->

   <form>
      <!-- 나중에 정보 여러개 넘길때는 form이 편해서 form사용 -->
      <input name="bno" value="${vo.bno}" id="bno" type="hidden">
      <!-- 아래 두줄은 글자세히읽기에서 목록으로갈때 해당 페이지로 이동시켜주는 내용 -->
      <input name="page" value="${cri.page}" id="page" type="hidden">
      <input name="perPage" value="${cri.perPage}" id="perPage"
         type="hidden">
   </form>



	<!-- 핸들바스의 반복문 {{#each.}} ... {{/each}}-->
	<!-- 핸들바스의 기본표기는 {{}}, 주석은 {{!-- 내용 --}} -->
	<!-- 핸들바스는 스크립트 타입이 다르니까 주의 -->
	<script type="text/x-handlebars-template" id="source">
			{{#each.}}
			 <div class="panel panel-info">
				<div class="panel-heading">
		 			<span>rno: {{rno}} , 작성자: {{replyer}}</span>
		 			<span class="pull-right">{{updateDate}}</span>
		 		</div>
		 		<div class="panel-body">
		 			<p>{{replyText}}</p>
		 			<button data-rno="{{rno}}" data-replyText="{{replyText}}" class="callModal btn btn-sm btn-success">수정/삭제</button>
		 		</div>
		 	</div>
			{{/each}}
		</script>

	<script type="text/javascript">
		$(document).ready(function() {
	
					var page= 1;
					var bno = ${vo.bno} // 어느 게시글의 댓글인지 파악하기 위해 게시글번호 받음.
					
					$(".pagination").on("click", "li a", function(event) { // a태그를 ajax통신하기 위해서 event 선언.
						event.preventDefault(); // a태그가 href로 넘어가는 것을 막는다.
						page= $(this).attr("href"); // 1,2,3..처럼 href에 페이지값을 넣어줌.
						getList(bno, page);
					});
					
					 
/* 			         $(".pagination").on("click", "li a", function(evnet){
			             event.preventDefault();
			             page=$(this).attr("href");
			             getList(bno, page);
			          }); */
					
					$("#reply").click(function() {
						$("#myCollapsible").collapse("toggle");
					});

					$("#replyInsertBtn").click(function() {
						var replyer = $("#replyer").val(); // val() 의 ()안에 값이 없으면 input값 받아옴. ''면 리셋
						var replyText = $("#replyText").val();

							//ajax사용
						$.ajax({
							type : 'post',
							url : '/replies',
							headers : {
								// 헤더네임      :  헤더값
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							data : JSON.stringify({ // json을 문자열 형태로 변환
								//	변수명(replyVO) : 실제내용(input값)
								replyer : replyer,
								replyText : replyText,
								bno : bno
								// 값은 위에 선언한 var bno의 값.
							}),

							// 데이터타입: ajax통신을 성공했을 때 어떤 데이터타입으로 받나.
		
							dataType : 'text',
							success : function(result) { // 통신성공시. (result)는 값을 받아낸단 표시.
								alert(result);
								$("#replyer").val('');
								$("#replyText").val('');
								$("#myCollapsible").collapse("toggle");
								getList(bno, page);
							},
							error : function(request, status, error) { // 통신실패시
								alert("code" + request.status + "\n"
										+ "msg: "
										+ request.responseText + "\n"
										+ "error: " + error);
							},
							complete : function() { // 실패or성공 상관없이 무조건 실행
							}
						});
					});

					$("#replyResetBtn").click(function() {
						$("#replyer").val('');
						$("#replyText").val('');
					});

					$("#update").click(function() {
						$("form").attr("action", "updateui"); // attr : 어트리뷰트
						$("form").attr("method", "get");
						$("form").submit();
					});

					$("#list").click(function() {
						$("form").attr("action", "list");
						$("form").attr("method", "get");
						$("form").submit();
					});

					$(".btn-danger").click(function() {
						var result = confirm("삭제하려면 확인을 눌러주세요~~!!");
						if (result) {
							$("form").attr("action", "delete").attr("method", "post").submit();
						}
					});
					
					// 댓글목록 갖고오기
					getList(bno, page);
					
					// 동적으로 만들어진 태그는 click함수 사용 불가
					// 그래서 정적으로 만들어진 부모태그에서 권한을 위임함(on)
					// 정적으로 만들어진부모태그 replies가 click권한을 동적으로 만들어진 callModal한테 위임한다.
					$("#replies").on("click",".callModal", function() {
						var rno= $(this).attr("data-rno");
						var replyText= $(this).attr("data-replyText");
						$("#modal_rno").text(rno); // 해당 댓글의 번호와
						$("#modal_replyText").val(replyText); // 내용 갖고오기
						$("#myModal").modal("show");							
					});
					
					$("#modal_update").click(function() {
						var rno= $("#modal_rno").text(); // p태그니까 text
						var replyText= $("#modal_replyText").val(); // input태그니까 val
						
						$.ajax({
							type : 'put',
							url : '/replies/'+rno, // 컨트롤러랑 똑같이 넣어주기
							headers : {
								// 헤더네임      :  헤더값
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"
							},
							data : JSON.stringify({ // json을 문자열 형태로 변환
								//	변수명(replyVO) : 실제내용(input값)
								replyText : replyText,
								// 값은 위에 선언한 var bno의 값.
							}),
							// 데이터타입: ajax통신을 성공했을 때 어떤 데이터타입으로 받나.
							dataType : 'text',
							success : function(result) { // 통신성공시. (result)는 값을 받아낸단 표시.
								alert(result);
								$("#replyText").val('');
								getList(bno, page);
							},
							error : function(request, status, error) { // 통신실패시
								alert("code" + request.status + "\n"
										+ "msg: "
										+ request.responseText + "\n"
										+ "error: " + error);
							},
							complete : function() { // 실패or성공 상관없이 무조건 실행
							}
						});
					});
					
					$("#modal_delete").click(function() {
						var rno= $("#modal_rno").text(); // p태그니까 text
						
						$.ajax({
							type : 'delete',
							url : '/replies/'+rno, // 컨트롤러랑 똑같이 넣어주기
							headers : {
								// 헤더네임      :  헤더값
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "DELETE"
							},
							// 데이터타입: ajax통신을 성공했을 때 어떤 데이터타입으로 받나.
							dataType : 'text',
							success : function(result) { // 통신성공시. (result)는 값을 받아낸단 표시.
								alert(result);
								getList(bno, page);
							},
							error : function(request, status, error) { // 통신실패시
								alert("code" + request.status + "\n"
										+ "msg: "
										+ request.responseText + "\n"
										+ "error: " + error);
							},
							complete : function() { // 실패or성공 상관없이 무조건 실행
							}
						});
					});
					
					$("#inputCheckBtn").click(function() {
						var inputID= $("#inputID").val();
						
						$.getJSON("/replies/checkid/"+inputID, function(data) {
							if(data){
								$("#msgforuse").text("사용가능");
							} else {
								$("#msgforuse").text("사용불가");
							}
						});
					});
					
					$("#inputCheckBtn2").click(function() {
						var inputID2= $("#inputID2").val();

						$.getJSON("/replies/checkid2/"+inputID2, function(data) {
							$("#msgforuse2").text(data.msg);
						});
					}); 
					
				}); // $(document).ready(function() {} end tag
 
				function printPaging(pm) {
					var str= "";
					
					if(pm.cri.page>1){ // 갖고온 페이지가 1보다 커야지 나옴
						str+="<li><a href='"+(pm.cri.page-1)+"'>&laquo;</a></li>";					
					}
				
					for(var i=pm.beginPageNum; i<=pm.stopPageNum; i++){
						var strClass= pm.cri.page==i? 'active' : ' ';
						str+="<li class='"+strClass+"'><a href='"+i+"'>"+i+"</a><li>";							
					}
					
					if(pm.cri.page<pm.totalPage){ // 갖고온 페이지가 총페이지보다 작아야 나옴
						str+="<li><a href='"+(pm.cri.page+1)+"'>&raquo;</a></li>";					
					}
					
					$(".pagination").html(str); // 클래스가 pagination인 곳에 위의 str문 추가
				}
	
						
				// 댓글목록들 갖고오는 핸들바스 함수
				function getList(bno, page){
					$.getJSON("/replies/"+bno+"/"+page, function(data) {
						var source= $("#source").html();
						var template= Handlebars.compile(source);
						var gab= data.list; // list는 ReplyCotnroller에서 map에 넣은 list 키값.
						$("#replies").html(template(gab));
						
						printPaging(data.pm); // 페이징처리 완료. printPaging은 우리가 만들어아햘 함수다.
					});
		
					
				}
	</script>
</body>
</html>