<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="/vs/resources/css/visit.css">
	
	<!-- Ajax(Asynchronous Javascript and xml) : 비동기 통신 방식
	Ajax사용을 위한 js파일을 참조 -->
	<script src="/vs/resources/js/httpRequest.js"></script>

	<script>
	
		function modify( f ){
			let pwd = f.pwd.value;//원본 비번
			let c_pwd = f.c_pwd.value;//입력 비번
			
			if( pwd != c_pwd ){
				alert("비밀번호 불일치");
				return;
			}
			
			f.action = 'modify_form.do';
			f.submit();//컨트롤러로 pwd, idx, name,content정보를 넘긴다
		}
		
		function del( f ){
			let pwd = f.pwd.value;//원본 비번
			let c_pwd = f.c_pwd.value;//입력 비번
			
			if( pwd != c_pwd ){
				alert("비밀번호 불일치");
				return;
			}
			
			//비밀번호가 일치할 경우 정말 삭제할 것인지 확인
			if( !confirm('정말 삭제하실라요?') ){
				return;
			}
			
			//삭제하고싶은 게시글의 idx번호를 컨트롤러로 전송
			//Ajax기능을 사용
			let url = "delete.do";
			let param = "idx=" + f.idx.value + "&photo=" + f.photo.value;
			sendRequest(url, param, resultFn, "get");
			
		}
		
		//Ajax를 통해 요청된 url이 마무리되면
		//현재 페이지로 돌아와 자동으로 호출되는 메서드(콜백 메서드)
		function resultFn(){
			
			//readyState
			//0 ~ 3 : loading
			//4 : 현재 페이지 로드완료
			
			//status
			//200 : 정상
			//404, 500등 : 페이지, DB오류
			if( xhr.readyState==4 && xhr.status==200 ){
				
				//컨트롤러로부터 return받은 데이터를 읽어오자
				//data = "[{'result':'삭제 성공'}]";
				let data = xhr.responseText;
				
				//data는 JSON처럼 생긴 단순 문자열 일 뿐이므로
				//이를 실제 JSON구조로 변경해줘야 한다
				let json = eval( data );
				
				alert( json[0].result );
				
				location.href="list.do";//전체 페이지 갱신
			}
			
		}
		
	</script>

</head>
<body>
	<div id="main_box">
		<h1>:::방명록 리스트:::</h1>
		
		<div align="center">
			<input type="button" value="글쓰기" 
			onclick="location.href='insert_form.do'">
		</div>
		
		<c:forEach var="vo" items="${ list }">
		
			<div class="visit_box">
				<div class="type_content"><pre>${ vo.content }</pre><br>
					<!-- 첨부된 이미지가 있다면 img태그를 사용 -->
					<c:if test="${ vo.filename ne 'no_file' }">
						<img src="resources/upload/${vo.filename}" width="200"/>
					</c:if>
					
				</div>
				
				<div class="type_name">작성자 : ${ vo.name }( ${ vo.ip } )</div>
				<div class="type_regdate">${ vo.regdate }</div>
			
				<form>
					<input type="hidden" name="pwd" value="${ vo.pwd }">
					<input type="hidden" name="idx" value="${ vo.idx }">
					<input type="hidden" name="name" value="${ vo.name }">
					<input type="hidden" name="content" value="${ vo.content }">
					<input type="hidden" name="photo" value="${vo.filename }">
					
					비밀번호<input type="password" name="c_pwd">
					<input type="button" value="수정" onclick="modify(this.form);">
					<input type="button" value="삭제" onclick="del(this.form);">
				</form>
			
			</div>

		</c:forEach>
		
	</div>
	
</body>
</html>

















