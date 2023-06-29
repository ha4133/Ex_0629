<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 	<script>
 		function send(f){
 			let name = f.name.value;
 			let content = f.content.value;
 			let pwd = f.pwd.value;
 			
 			//유효성 체크
 			if( name == '' ){
 				alert('이름을 입력하세요');
 				return;
 			}
 			
 			if( content == '' ){
 				alert('내용을 입력하세요');
 				return;
 			}
 			
 			if( pwd == '' ){
 				alert('비밀번호를 입력하세요');
 				return;
 			}
 			
 			f.action = "modify.do";//?idx=4&name=홍길&content=내용&pwd=1111
 			f.method = "post";
 			f.submit();//전송
 		}
 	</script>

</head>
<body>
	<form>
		<table border="1" align="center">
			<input type="hidden" name="idx" value="${vo.idx}">
			
			<caption>::: 글 수정 :::</caption>
			
			<tr>
				<th>작성자</th>
				<td><input name="name" value="${ vo.name }"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><pre><textarea name="content"
				     rows="5" cols="50" style="resize:none;">${ vo.content }</textarea></pre></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정하기" onclick="send(this.form);">
					<input type="button" value="목록으로" 
					       onclick="location.href='list.do'">
				</td>
			</tr>
			
		</table>
	</form>
</body>
</html>














