<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link rel="stylesheet" href="<%=basePath%>images/css/bootstrap.css" />
<link rel="stylesheet" href="<%=basePath%>images/css/css.css" />
<script type="text/javascript"
	src="<%=basePath%>images/js/jquery1.9.0.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>images/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath%>images/js/sdmenu.js"></script>
<script type="text/javascript"
	src="<%=basePath%>images/js/laydate/laydate.js"></script>

<div class="header">
	<div class="logo">
		<h1 style="margin-left: 20px; color: white; font-size: 28px;">��������Ƽ����¹���ϵͳ</h1>
	</div>
	<div class="header-right">
		<a href="<%=basePath%>index.jsp" target="_top"> </a> <i
			class="icon-off icon-white"></i> <a
			onclick="if (confirm('ȷ��Ҫ�˳���')) return true; else return false;"
			href="<%=basePath%>AdminServlet?method=adminexit" target="_top">ע���˳�</a>
		<div id="modal-container-973558" class="modal hide fade" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="width: 300px; margin-left: -150px; top: 30%"></div>
	</div>
</div>