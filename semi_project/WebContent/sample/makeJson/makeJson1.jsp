<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>자바스트립트 오브젝트 예제</title>
        <style></style>
    </head>
    <body>
        <input onclick="objMake()" type="button" value="obj만들기"/>
        <input onclick="objView()" type="button" value="obj보기"/>
    </body>
    <script>
        var sample={};
        var employees=[];
        
        function objMake(){
            var obj1={"firstName":"kim","lastName":"jihoon"};
            var obj2={"firstName":"hong","lastName":"gildong"};
            var obj3={"firstName":"doo","lastName":"ri"};
            
            employees[0] = obj1;
            employees[1] = obj2;
            employees[2] = obj3;
            
            //console.log(employees);
            sample={"item":employees};
            console.log(sample);            
        }
        
        function objView(){
            console.log(sample.item[1].lastName);
        }       
    </script>
</html>
