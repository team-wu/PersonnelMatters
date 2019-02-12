<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>

 
</head>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method="upemployee2";  
		String id="";String number="";String name="";String department="";String age="";String sex="";String education="";String profession=""; String job="";String phone="";String introduction="";String password="";
		 
			List jlist = cb.get1Com("select * from employee where number='"+username+"'",13);
			number=jlist.get(1).toString();
			name=jlist.get(2).toString();  
			department=jlist.get(3).toString();  
			age=jlist.get(4).toString();  
			sex=jlist.get(5).toString();  
			education=jlist.get(6).toString();  
			profession=jlist.get(7).toString(); 
			job=jlist.get(8).toString(); 
			phone=jlist.get(9).toString(); 
			introduction=jlist.get(10).toString();   
			password=jlist.get(12).toString();   
		   
%>
<body>
<div class="right_cont">
<div class="title_right"><strong>�û���Ϣ����</strong></div>  
<div style="width:900px;margin:auto;">
<form action="<%=basePath %>ComServlet" method="post" name="form1"> 
<table class="table table-bordered"> 
     <tr><input type="hidden" name="method" value="<%=method%>" /><input type="hidden" name="id" value="<%=id%>" />
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">Ա�����ţ�</td>
     <td><input type="text" name="number" class="span4" value="<%=number %>" readonly/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">Ա��������</td>
     <td><input type="text" name="name" class="span4" value="<%=name %>" required/></td> 
     </tr> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�������ţ�</td>
     <td><select name="department" required>
    <%if(method.equals("upemployee")){ %><option value="<%=department%>"><%=department%></option> <%} %> 
    <%List flist=cb.getCom("select * from department order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr> 
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">Ա�����䣺</td>
     <td><input type="text" name="age" class="span4" value="<%=age %>" required/></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">Ա���Ա�</td>
     <td><input type="radio" name="sex" value="��" checked="checked"/> �� <input type="radio" name="sex" value="Ů"/> Ů</td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ѧ����Ϣ��</td>
     <td><input type="text" name="education" class="span4" value="<%=education %>" required /></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">רҵ��Ϣ��</td>
     <td><input type="text" name="profession" class="span4" value="<%=profession %>" required /></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">ְ����Ϣ��</td>
     <td><input type="text" name="job" class="span4" value="<%=job %>" required /></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">�ƶ��绰��</td>
     <td><input type="text" name="phone" class="span4" value="<%=phone %>" pattern="[0-9]{11}" title="11λ�ֻ�����" required /></td> 
     </tr>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">��ϸ���ܣ�</td>
     <td><textarea name="introduction" class="span4" rows="5" required><%=introduction %></textarea></td> 
     </tr> 
     
     <tr>
     	<td class="text-center" colspan="2"><input type="submit" value="ȷ��" class="btn btn-info  " style="width:80px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %> 