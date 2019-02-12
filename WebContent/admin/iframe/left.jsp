<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=basePath %>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath %>images/css/css.css" />
<script type="text/javascript" src="<%=basePath %>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
<script type="text/javascript" src="<%=basePath %>images/js/laydate/laydate.js"></script>
</HEAD>
<%
	String username=(String)session.getAttribute("user");  String sf=(String)session.getAttribute("sf"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<div class="left">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>

<div id="my_menu" class="sdmenu">

	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">������Ϣ����</a> 
	</div>
	<%if(sf.equals("����Ա")) {%>
	<div class="collapsed">
		<span>�߼��û�����</span>
		<a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">�߼��û�����</a> 
		<a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">���Ӹ߼��û�</a> 
		 <a href="<%=basePath %>admin/system/s.jsp" target="MainFrame">�߼��û���ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/department/index.jsp" target="MainFrame">������Ϣ����</a> 
		<a href="<%=basePath %>admin/department/add.jsp?method=addbm" target="MainFrame">���Ӳ�����Ϣ</a> 
		 <a href="<%=basePath %>admin/department/s.jsp" target="MainFrame">������Ϣ��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>�û���Ϣ����</span>
		<a href="<%=basePath %>admin/employee/index.jsp" target="MainFrame">�û���Ϣ����</a> 
		<a href="<%=basePath %>admin/employee/add.jsp?method=addemployee" target="MainFrame">�����û���Ϣ</a> 
		 <a href="<%=basePath %>admin/employee/s.jsp" target="MainFrame">�û���Ϣ��ѯ</a>  
	</div>
	<%}else if(sf.equals("�߼��û�")) {%>
	<div class="collapsed">
		<span>�û���Ϣ����</span>
		<a href="<%=basePath %>admin/system/index2.jsp" target="MainFrame">�û���Ϣ����</a> 
	</div>
	<div class="collapsed">
		<span>�����ƻ�����</span>
		<a href="<%=basePath %>admin/plane/index.jsp" target="MainFrame">�����ƻ�����</a> 
		<a href="<%=basePath %>admin/plane/add.jsp?method=addjh" target="MainFrame">���ӹ����ƻ�</a>  
		 <a href="<%=basePath %>admin/plane/s.jsp" target="MainFrame">�����ƻ���ѯ</a>  
	</div> 
	<div class="collapsed">
		<span>���ټ�¼����</span>
		<a href="<%=basePath %>admin/track/index.jsp" target="MainFrame">���ټ�¼����</a> 
		<a href="<%=basePath %>admin/track/add.jsp?method=addgz" target="MainFrame">���Ӹ��ټ�¼</a> 
		 <a href="<%=basePath %>admin/track/s.jsp" target="MainFrame">���ټ�¼��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/assessment/index.jsp" target="MainFrame">������Ϣ����</a> 
		<a href="<%=basePath %>admin/assessment/add.jsp?method=addkh" target="MainFrame">���ӿ�����Ϣ</a> 
		 <a href="<%=basePath %>admin/assessment/s.jsp" target="MainFrame">������Ϣ��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������־����</span>
		<a href="<%=basePath %>admin/log/index2.jsp" target="MainFrame">������־����</a>  
		 <a href="<%=basePath %>admin/log/s2.jsp" target="MainFrame">������־��ѯ</a>  
	</div>
	<%}else{ %>
	<div class="collapsed">
		<span>�û���Ϣ����</span>
		<a href="<%=basePath %>admin/employee/index2.jsp" target="MainFrame">�û���Ϣ����</a> 
	</div> 
	<div class="collapsed">
		<span>�����ƻ�����</span>
		<a href="<%=basePath %>admin/plane/index2.jsp" target="MainFrame">�����ƻ�����</a>  
		 <a href="<%=basePath %>admin/plane/s2.jsp" target="MainFrame">�����ƻ���ѯ</a>  
	</div> 
	<div class="collapsed">
		<span>���ټ�¼����</span>
		<a href="<%=basePath %>admin/track/index2.jsp" target="MainFrame">���ټ�¼����</a>  
		 <a href="<%=basePath %>admin/track/s2.jsp" target="MainFrame">���ټ�¼��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������Ϣ����</span>
		<a href="<%=basePath %>admin/assessment/index2.jsp" target="MainFrame">������Ϣ����</a>   
		 <a href="<%=basePath %>admin/assessment/s2.jsp" target="MainFrame">������Ϣ��ѯ</a>  
	</div>
	<div class="collapsed">
		<span>������־����</span>
		<a href="<%=basePath %>admin/log/index.jsp" target="MainFrame">������־����</a> 
		<a href="<%=basePath %>admin/log/add.jsp?method=addrz" target="MainFrame">���ӹ�����־</a> 
		 <a href="<%=basePath %>admin/log/s.jsp" target="MainFrame">������־��ѯ</a>  
	</div>
	
	<%} %>
    
 	<div class="collapsed">
		<span>ע���˳�ϵͳ</span>
		<a onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >ע���˳�ϵͳ</a>
	</div> 
</div>
     </div>
     <div class="Switch"></div>
     <script type="text/javascript">
	$(document).ready(function(e) {
    $(".Switch").click(function(){
	$(".left").toggle();
	 
		});
});
</script> 
</body>
<%} %>

</html>
