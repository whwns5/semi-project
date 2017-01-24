<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
 <title> Slide Menu </title>
 <style>
  #tab { position:absolute; left:0; top:30; }
  #menu { position:absolute; left:-263; top:30; }
 </style>
 <script>
  n=(document.layers)? 1:0
  e=(document.all)? 1:0
  sw=0
  
  
  function init() {
  var menu = document.getElementById("menu");
  var tab = document.getElementById("tab");
  
   if (e) {menu.style.left=-263;    tab.style.left=0; }
  } 
  function slideIn() {
  var menu = document.getElementById("menu");
  var tab = document.getElementById("tab");
      if (n) {
          menu.left+=5;
          tab.left+=5;
          if (tab.left<263)    setTimeoutut("slideIn()","15")
      }
      else if (e){
          menu.style.left=parseInt(menu.style.left)+5;
          tab.style.left=parseInt(tab.style.left)+5;
          if (parseInt(tab.style.left)<263)
              setTimeout("slideIn()","15")
      }
  }
  function slideOut() {
  var menu = document.getElementById("menu");
  var tab = document.getElementById("tab");
      if(n) {
          menu.left-=5;
          tab.left-=5;
          if (tab.left>0)  setTimeout("slideOut()","15")
      }
      else if (e) {
          menu.style.left=parseInt(menu.style.left)-5;
          tab.style.left=parseInt(tab.style.left)-5;
          if (parseInt(tab.style.left)>0)
              setTimeout("slideOut()","15")
      }
  }
  function changeMenu() {
      if (sw) { slideOut(); sw=0;}
      else    { slideIn(); sw=1}
  }
 </script>
 </head>
 <body onload="init()">
 <div id="tab">
     <p> <a href="javascript:changeMenu();"><img src="Penguins.jpg" width="14" height="328" border="0" ></a>
     </p>
 </div>
 <div id="menu">
     <p> <img src="Tulips.jpg" width="263" height="328"> </p>
 </div>    
</body>
</html>