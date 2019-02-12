package com.action;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		//String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		
		if(method.equals("addbm")){  //������Ϣ   ***********����ע��  
			String departmentName = request.getParameter("departmentName"); 
			String remark = request.getParameter("remark");  
			String str=cBean.getString("select id from department where departmentName='"+departmentName+"'");
			if(str==null){
				int flag = cBean.comUp("insert into department(departmentName,remark)  values('"+departmentName+"','"+remark+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upbm")){ //�޸Ĳ�����Ϣ 
			String id=request.getParameter("id");
			String departmentName = request.getParameter("departmentName"); 
			String remark = request.getParameter("remark");  
			String str=cBean.getString("select remark from department where departmentName='"+departmentName+"' and id!='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("update department set departmentName='"+departmentName+"',remark='"+remark+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
				}  
			}
			else{
				request.setAttribute("message", "��Ϣ�ظ���");
				request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delbm")){//ɾ��������Ϣ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from department where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "ϵͳά���У����Ժ����ԣ�");
				request.getRequestDispatcher("admin/department/index.jsp").forward(request, response);
			}
		}  
		
		else if(method.equals("addemployee")){  //����Ա����Ϣ  
			String number = request.getParameter("number");     
			String name = request.getParameter("name");     
			String department = request.getParameter("department");     
			String age = request.getParameter("age");     
			String sex = request.getParameter("sex");     
			String education = request.getParameter("education");     
			String profession = request.getParameter("profession");     
			String job = request.getParameter("job");     
			String phone = request.getParameter("phone");     
			String introduction = request.getParameter("introduction");     
			String password = request.getParameter("password");   
			String str=cBean.getString("select name from employee where number='"+number+"'");
			if(str==null){
				int flag = cBean.comUp("insert into employee(number,name,department,age,sex,education,profession,job,phone,introduction,time,password) " +
						"values('"+number+"','"+name+"','"+department+"','"+age+"','"+sex+"','"+education+"','"+profession+"','"+job+"','"+phone+"','"+introduction+"','"+date+"','"+password+"' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
				}  
			}
			else{
				request.setAttribute("message", "����ظ���");
				request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
			} 
		} 
		else if(method.equals("upemployee")){ // Ա����Ϣ 
			String id=request.getParameter("id");
			String number = request.getParameter("number");     
			String name = request.getParameter("name");     
			String department = request.getParameter("department");     
			String age = request.getParameter("age");     
			String sex = request.getParameter("sex");     
			String education = request.getParameter("education");     
			String profession = request.getParameter("profession");     
			String job = request.getParameter("job");     
			String phone = request.getParameter("phone");     
			String introduction = request.getParameter("introduction");     
			String password = request.getParameter("password");  
			String str=cBean.getString("select name from employee where number='"+number+"' and id!='"+id+"'");
			if(str==null){
				int flag = cBean.comUp("update employee set number='"+number+"',name='"+name+"',department='"+department+"',age='"+age+"',sex='"+sex+"'," +
						"education='"+education+"',profession='"+profession+"',job='"+job+"',phone='"+phone+"',introduction='"+introduction+"',password='"+password+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
				} 
			}
			else{
				request.setAttribute("message", "����ظ���");
				request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delemployee")){//ɾ��Ա����Ϣ
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from employee where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/employee/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("upemployee2")){ // Ա����Ϣ 
			String username=(String)session.getAttribute("user"); 
			String number = request.getParameter("number");     
			String name = request.getParameter("name");     
			String department = request.getParameter("department");     
			String age = request.getParameter("age");     
			String sex = request.getParameter("sex");     
			String education = request.getParameter("education");     
			String profession = request.getParameter("profession");     
			String job = request.getParameter("job");     
			String phone = request.getParameter("phone");     
			String introduction = request.getParameter("introduction");     
			String password = request.getParameter("password");   
				int flag = cBean.comUp("update employee set name='"+name+"',department='"+department+"',age='"+age+"',sex='"+sex+"'," +
						"education='"+education+"',profession='"+profession+"',job='"+job+"',phone='"+phone+"',introduction='"+introduction+"' where number='"+username+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "�����ɹ���");
					request.getRequestDispatcher("admin/employee/index2.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "����ʧ�ܣ�");
					request.getRequestDispatcher("admin/employee/index2.jsp").forward(request, response);
				}  
		}  
		
		 
		else if(method.equals("addjh")){  //���ӹ����ƻ�   String number="";String workContent="";String term="";  
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");     
			String term = request.getParameter("term");     
			String name = cBean.getString("select name from employee where number='"+number+"'");   
			String username=(String)session.getAttribute("user");
			int flag = cBean.comUp("insert into plane(number,workContent,term,time,name ,vip) values('"+number+"','"+workContent+"','"+term+"','"+date+"','"+name+"','"+username+"' )");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("upjh")){ // �����ƻ� 
			String id=request.getParameter("id");
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");     
			String term = request.getParameter("term");     
			String name = cBean.getString("select name from employee where number='"+number+"'"); 
			int flag = cBean.comUp("update plane set number='"+number+"',workContent='"+workContent+"',term='"+term+"',name='"+name+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("deljh")){//ɾ�������ƻ�
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from plane where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/plane/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("shjh")){ // �����ƻ� 
			String id=request.getParameter("id");
			String status = request.getParameter("status");   
			int flag = cBean.comUp("update plane set status='"+status+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/plane/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/plane/index2.jsp").forward(request, response);
			}  
		} 
		
		
		else if(method.equals("addgz")){  //���Ӹ���   
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");      
			String name = cBean.getString("select name from employee where number='"+number+"'");   
			String username=(String)session.getAttribute("user");
			int flag = cBean.comUp("insert into track(number,workContent ,time,name ,vip) values('"+number+"','"+workContent+"' ,'"+date+"','"+name+"','"+username+"' )");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("upgz")){ // ���� 
			String id=request.getParameter("id");
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");     
			String name = cBean.getString("select name from employee where number='"+number+"'"); 
			int flag = cBean.comUp("update track set number='"+number+"',workContent='"+workContent+"' ,name='"+name+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delgz")){//ɾ������
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from track where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/track/index.jsp").forward(request, response);
			}
		}  
		
		
		else if(method.equals("addkh")){  //���ӿ���    
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");     
			String term = request.getParameter("term");     
			String name = cBean.getString("select name from employee where number='"+number+"'");   
			String username=(String)session.getAttribute("user");
			int flag = cBean.comUp("insert into assessment(number,workContent,term,time,name ,vip) values('"+number+"','"+workContent+"','"+term+"','"+date+"','"+name+"','"+username+"' )");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("upkh")){ // ���� 
			String id=request.getParameter("id");
			String number = request.getParameter("number");     
			String workContent = request.getParameter("workContent");     
			String term = request.getParameter("term");     
			String name = cBean.getString("select name from employee where number='"+number+"'"); 
			int flag = cBean.comUp("update assessment set number='"+number+"',workContent='"+workContent+"',term='"+term+"',name='"+name+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delkh")){//ɾ������
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from assessment where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/assessment/index.jsp").forward(request, response);
			}
		}  
		
		
		
		
		else if(method.equals("addrz")){  //������־ 
			String username=(String)session.getAttribute("user");
			String title = request.getParameter("title");     
			String workContent = request.getParameter("workContent");     
			String name = cBean.getString("select name from employee where number='"+username+"'");    
			int flag = cBean.comUp("insert into log(number,title,workContent,time,name ) values('"+username+"','"+title+"','"+workContent+"','"+date+"','"+name+"' )");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("uprz")){ // ��־ 
			String id=request.getParameter("id");
			String username=(String)session.getAttribute("user");
			String title = request.getParameter("title");     
			String workContent = request.getParameter("workContent");     
			String name = cBean.getString("select name from employee where number='"+username+"'");   
			int flag = cBean.comUp("update log set number='"+username+"',title='"+title+"',workContent='"+workContent+"',name='"+name+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delrz")){//ɾ����־
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from log where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/log/index.jsp").forward(request, response);
			}
		}  
		else if(method.equals("shrz")){ // ��־ 
			String id=request.getParameter("id");
			String review = request.getParameter("review");  
			String opinion = request.getParameter("opinion");   
			int flag = cBean.comUp("update log set review='"+review+"',opinion='"+opinion+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/log/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/log/index2.jsp").forward(request, response);
			}  
		} 
		else if(method.equals("delrz2")){//ɾ����־
			String id = request.getParameter("id"); 
			int flag = cBean.comUp("delete from log where id='"+id+"'");
			if(flag == Constant.SUCCESS){ 
				request.setAttribute("message", "�����ɹ���");
				request.getRequestDispatcher("admin/log/index2.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "����ʧ�ܣ�");
				request.getRequestDispatcher("admin/log/index2.jsp").forward(request, response);
			}
		}  
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throcw ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
