<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- JSON(Javascript Object Notation)표기법 : 
	  서로다른 os나 프로그램에서 데이터를 교환하기 위해 약속된 공통된 표기법 -->
	<script>
		//기본 JSON구조
		let p = {'name':'일길동', 'age':30, 'addr':'관악구'};
		document.write("이름 : " + p.name + "/" + "나이 : " + p.age + "<br>");
		
		//배열 JSON구조
		let array = [{'name':'hong', 'age':'30'}, 
			         {'name':'kim', 'age':'20'}, 
			         {'name':'park', 'age':'25'}];
		
		document.write(array[1].name + " / " + array[1].age + "<br>");
		document.write(array[2].name + " / " + array[2].age + "<br>");
		
		document.write("<hr>");
		
		//일반, 배열 JSON 혼합
		let course = { 'name':'웹개발4', 
				       'start':'2023-06-12', 
				       'end':'2023-07-20', 
				       'sub':['java', 'DB', 'Web'], 
				       'student':[{'name':'hong', 'addr':'마포구'}, 
				    	   		  {'name':'jeong', 'addr':'송내동'}, 
				    	   		  {'name':'park', 'addr':'중동'}]
					 };
		
		document.write( "과목명 : " + course.name + "<br>");
		document.write( "시작일 : " + course.start + "<br>");
		document.write( "종료일 : " + course.end + "<hr>");
		
		for(var i = 0; i < course.sub.length; i++){
			document.write( course.sub[i] + " / " );
		}
		
		document.write("<hr>");
		
		for( var i = 0; i < course.student.length; i++ ){
			document.write( course.student[i].name + " / " + course.student[i].addr + "<br>" );
		}
		
	</script>

</head>
<body>
	
	  
</body>
</html>

















