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
		<span>密码信息管理</span>
		<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a> 
	</div>
	<%if(sf.equals("管理员")) {%>
	<div class="collapsed">
		<span>高级用户管理</span>
		<a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">高级用户管理</a> 
		<a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加高级用户</a> 
		 <a href="<%=basePath %>admin/system/s.jsp" target="MainFrame">高级用户查询</a>  
	</div>
	<div class="collapsed">
		<span>部门信息管理</span>
		<a href="<%=basePath %>admin/department/index.jsp" target="MainFrame">部门信息管理</a> 
		<a href="<%=basePath %>admin/department/add.jsp?method=addbm" target="MainFrame">增加部门信息</a> 
		 <a href="<%=basePath %>admin/department/s.jsp" target="MainFrame">部门信息查询</a>  
	</div>
	<div class="collapsed">
		<span>用户信息管理</span>
		<a href="<%=basePath %>admin/employee/index.jsp" target="MainFrame">用户信息管理</a> 
		<a href="<%=basePath %>admin/employee/add.jsp?method=addemployee" target="MainFrame">增加用户信息</a> 
		 <a href="<%=basePath %>admin/employee/s.jsp" target="MainFrame">用户信息查询</a>  
	</div>
	<%}else if(sf.equals("高级用户")) {%>
	<div class="collapsed">
		<span>用户信息管理</span>
		<a href="<%=basePath %>admin/system/index2.jsp" target="MainFrame">用户信息管理</a> 
	</div>
	<div class="collapsed">
		<span>工作计划管理</span>
		<a href="<%=basePath %>admin/plane/index.jsp" target="MainFrame">工作计划管理</a> 
		<a href="<%=basePath %>admin/plane/add.jsp?method=addjh" target="MainFrame">增加工作计划</a>  
		 <a href="<%=basePath %>admin/plane/s.jsp" target="MainFrame">工作计划查询</a>  
	</div> 
	<div class="collapsed">
		<span>跟踪记录管理</span>
		<a href="<%=basePath %>admin/track/index.jsp" target="MainFrame">跟踪记录管理</a> 
		<a href="<%=basePath %>admin/track/add.jsp?method=addgz" target="MainFrame">增加跟踪记录</a> 
		 <a href="<%=basePath %>admin/track/s.jsp" target="MainFrame">跟踪记录查询</a>  
	</div>
	<div class="collapsed">
		<span>考核信息管理</span>
		<a href="<%=basePath %>admin/assessment/index.jsp" target="MainFrame">考核信息管理</a> 
		<a href="<%=basePath %>admin/assessment/add.jsp?method=addkh" target="MainFrame">增加考核信息</a> 
		 <a href="<%=basePath %>admin/assessment/s.jsp" target="MainFrame">考核信息查询</a>  
	</div>
	<div class="collapsed">
		<span>工作日志管理</span>
		<a href="<%=basePath %>admin/log/index2.jsp" target="MainFrame">工作日志管理</a>  
		 <a href="<%=basePath %>admin/log/s2.jsp" target="MainFrame">工作日志查询</a>  
	</div>
	<%}else{ %>
	<div class="collapsed">
		<span>用户信息管理</span>
		<a href="<%=basePath %>admin/employee/index2.jsp" target="MainFrame">用户信息管理</a> 
	</div> 
	<div class="collapsed">
		<span>工作计划管理</span>
		<a href="<%=basePath %>admin/plane/index2.jsp" target="MainFrame">工作计划管理</a>  
		 <a href="<%=basePath %>admin/plane/s2.jsp" target="MainFrame">工作计划查询</a>  
	</div> 
	<div class="collapsed">
		<span>跟踪记录管理</span>
		<a href="<%=basePath %>admin/track/index2.jsp" target="MainFrame">跟踪记录管理</a>  
		 <a href="<%=basePath %>admin/track/s2.jsp" target="MainFrame">跟踪记录查询</a>  
	</div>
	<div class="collapsed">
		<span>考核信息管理</span>
		<a href="<%=basePath %>admin/assessment/index2.jsp" target="MainFrame">考核信息管理</a>   
		 <a href="<%=basePath %>admin/assessment/s2.jsp" target="MainFrame">考核信息查询</a>  
	</div>
	<div class="collapsed">
		<span>工作日志管理</span>
		<a href="<%=basePath %>admin/log/index.jsp" target="MainFrame">工作日志管理</a> 
		<a href="<%=basePath %>admin/log/add.jsp?method=addrz" target="MainFrame">增加工作日志</a> 
		 <a href="<%=basePath %>admin/log/s.jsp" target="MainFrame">工作日志查询</a>  
	</div>
	
	<%} %>
    
 	<div class="collapsed">
		<span>注销退出系统</span>
		<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >注销退出系统</a>
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
