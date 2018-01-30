<%--
  Created by IntelliJ IDEA.
  User: Wenqiang Luo
  Date: 2018/1/29
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path=request.getContextPath();%>
<html>
  <head>
    <title>SSM_CRUD</title>
    <script type="text/javascript">
      function createXmlHttpRequest(){
          try{
              return new XMLHttpRequest();
          }catch(e){
              try{
                  return ActiveXObject("Msxml2.XMLHTTP");
              }catch(e){
                  try{
                      return ActiveXObject("Microsoft.XMLHTTP");
                  }catch(e){
                      alert("XMLHttpRequest Error!");
                      throw e;
                  }
              }
          }
      }
      window.onload=function(){
          var name=document.getElementById("n1");
          name.onblur=function(){
              var x=createXmlHttpRequest();
              x.open("POST","<%=path%>/Validate",true);
              x.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
              x.send("name="+name.value);
              x.onreadystatechange=function(){
                  if(x.readyState==4&&x.status==200){
                      var text=x.responseText;
                      var warn=document.getElementById("warn");
                      if(text=="1"){
                          warn.innerHTML="该用户无效";
                      }else warn.innerHTML="有效";
                  }
              }
          }
      }
    </script>
  </head>
  <body style="text-align: center;margin-top: 180">
    <form action="add" method="post">
      <input type="text" name="name" id="n1"/><input type="text" name="age"/><input type="submit" value="add" />
      <h2 id="warn"></h2>
    </form>
    <form action="delete" method="post"><input type="text" name="name"/><input type="submit" value="delete" />
    </form>
    <form action="update" method="post"><input type="text" name="name"/><input type="text" name="age"/><input type="submit" value="update" />
    </form>
    <form action="search"><input type="submit" value="search" /></form>

  </body>
</html>
