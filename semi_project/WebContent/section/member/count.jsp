<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>

<%
String ip = request.getRemoteAddr();
//sc.setSession(session,ip);
%>
///////////////////////////////////////////////////////
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.sql.Date" %>
<% 
String strPicode = (String)session.getValue("ssnPiCode");
if(strPicode.equals("administrator")){%>
<% String num = null; %>
<% String today_count=null; %>
<% String today = null; %>
<% String today_num = null; %>
<% Vector v = new Vector();%>
<%
        String member_num=null;
        long t = System.currentTimeMillis();
        Date date = new Date(t);
        String chdate = date.toString();
        chdate = chdate.replace('-','/');

        try{
                String dir = System.getProperty("user.dir")+"/ApacheGroup/ePims/admin/";
                String filename = dir+"count.txt";
                String filename2 = dir+"today_count.txt";
                String filename3 = dir+"ip_count.txt";
                FileReader fr = new FileReader(filename);
                FileReader fr2 = new FileReader(filename2);
                FileReader fr3 = new FileReader(filename3);
                BufferedReader br = new BufferedReader(fr);
                BufferedReader br2 = new BufferedReader(fr2);
                BufferedReader br3 = new BufferedReader(fr3);

                num = br.readLine();
                today_count = br2.readLine();
                String[] today_Cnvt = new String[3];
                int idx = 0;
                String str_spr = ",";
                StringTokenizer strToken = new StringTokenizer(today_count, str_spr, true);
                while(strToken.hasMoreTokens()) {
                                today = strToken.nextToken();
                                today_Cnvt[idx] = today;
                                idx++;
                        }
                today_num = today_Cnvt[2];

                String read_ip=null;
                while((read_ip= br3.readLine())!=null){
                                read_ip = read_ip.trim();
                                v.addElement(read_ip);
                        }
                br.close();
                br2.close();
        }catch(Exception e){System.out.println(e.getMessage());}
   
        
%>
<table width="200" cellpadding=0 cellspacing=0 border=0>
<tr>
        <td>오늘 방문자 수</td>
        <td><%=today_num%></td>
</tr>
<tr>
        <Td>총 방문자 수</td>
        <td><%= num%></td>
</tr>
<tr>
        <td>현재 접속자 수</td>
        <td><%=v.size()%></td>
</tr>
<tr>
        <td colspan=2>현재 접속자 아이피</td>
</tr>
<%for(int i=0; i<v.size(); i++){%>
<tr>
        <td colspan=2><%=(String)v.elementAt(i)%></td>
</tr>
<%}%>
</table>
<%}else{
        response.sendRedirect("******");
}
%> 

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>