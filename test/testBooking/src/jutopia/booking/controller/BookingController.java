package jutopia.booking.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jutopia.bookingAction.CommandAction;

public class BookingController extends HttpServlet {

	private Map commandMap = new HashMap();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandAction action = null;
		
		try 
		{
			String command = request.getRequestURI();
			System.out.println("command : " + command);  // command : /web06_boardMVC/writeForm.do
			System.out.println("request.getContextPath() : " + request.getContextPath()); // web06_boardMVC
			
			if(command.indexOf(request.getContextPath()) == 0) // 경로가 없다는 이야기
			{
				command = command.substring(request.getContextPath().length() + 1);
				//command = "BookingPro.do";
				System.out.println("if command : " + command);
			} //if end
			action = (CommandAction)commandMap.get(command);
			System.out.println("action = " + action); //action : edu.kosta.boardAction.WriteFormAction
			view = action.process(request, response); 
			System.out.println("view : " + view);  //board/wrigetForm.jsp
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}//try end
		
		
		RequestDispatcher dp = request.getRequestDispatcher("/jsp/BookingDeleteForm.jsp");
		dp.forward(request, response);
	}
	//초기화 - 1회 호출됨
	//명령어와 명령어 처리 클래스가 매핑되어 있는 properties 파일을 읽어 들이는 역할
	@Override
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("bookingConfig");
		Properties pr = new Properties();
		FileInputStream f = null;
		
		try 
		{
			//commandBoard.properties 파일의 내용을 읽어옴
			f = new FileInputStream(props); // 파일로 읽어드려라
			//commandBoard.properties 파일의 정보를 Properties 객체에 저장
			pr.load(f); //inputstream 인 f를 저장한다 키값이 들어가 있다..
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			if( f != null)
			{
				try
				{f.close();}
				catch(Exception e)
				{e.printStackTrace();}
			}
		}//end try
		
		Iterator key = pr.keySet().iterator(); // key값 출력
		while(key.hasNext())
		{
			String command = (String)key.next();
			String value = pr.getProperty(command); //writeForm.do의 value값을 뽑아 value에 넣으 놓은것이다.
			
			try 
			{
				Class className = Class.forName(value); // forName() - 문자열을 클래스로 변환 시킨다.
				Object instance = className.newInstance(); // 개체 생성 부분
				
				commandMap.put(command, instance); //put(key, value)
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
		}//end while
	}//end init



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {

	}
	

}
