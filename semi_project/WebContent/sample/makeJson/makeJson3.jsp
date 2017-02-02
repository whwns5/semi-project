<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>JSON 오브젝트 만들기2</title>
    </head>
    <body>
        <h1>employee JSON 오브젝트 만들기</h1>
        firstName : <input id="fn" type="text"/>
        <br/>
        lastName : <input id="ln" type="text"/>
        <button id="add">리스트 추가</button>
        <p id="result"></p>
    </body>
    <script>
        /*요소 가져오기*/
        var fn = document.getElementById("fn");
        var ln = document.getElementById("ln");
        var add = document.getElementById("add");
        var result = document.getElementById("result");
        
        var obj={}; //최상위 오브젝트
        var person = [];//employee 속성의 배열
 
        add.addEventListener("click",function(){
            var firstName = fn.value;
            var lastName = ln.value;
            console.log(firstName+" "+lastName);
            var info = {};
            //info ={"firstName":firstName, "lastName":lastName}
            //info.firstName = firstName;
            //info["firstName"] = firstName;
 
            info.firstName = firstName;
            info.lastName = lastName;            
            person.push(info);            
            obj.employee = person;
            console.log(obj);
            var msg = JSON.stringify(obj);
            result.innerHTML = msg;
        });
        
    </script>
</html>