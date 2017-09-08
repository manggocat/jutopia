package jutopia.BoardController;

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

import jutopia.BoardAction.CommandAction;

public class BoardController extends HttpServlet {
   
	private Map commandMap = new HashMap();//명령어와 명령어 처리 클래스를 쌍으로 저장
	
	    //명령어와 처리클래스가 매핑되어 있는 properties 파일을 읽어서 Map객체인 commandMap에 저장
	       //명령어와 처리클래스가 매핑되어 있는 properties 파일은 Command.properties파일
	  public void init(ServletConfig config) throws ServletException {
	           String configFile = config.getInitParameter("configFile");
	           Properties prop = new Properties();
	        FileInputStream fis = null;
	           try {
	            String configFilePath = config.getServletContext().getRealPath(
	                         configFile);
	            fis = new FileInputStream(configFilePath);
	               prop.load(fis);
	        } catch (Exception e) {
	               throw new ServletException(e);
	        } finally {
	               if (fis != null)
	                   try {
	                    } catch (Exception e) {
	                   }
	           }
	           Iterator keyIter = prop.keySet().iterator();
	           while (keyIter.hasNext()) {
	               String command = (String) keyIter.next();
	               String handlerClassName = prop.getProperty(command);
	               try {
	                   Class handlerClass = Class.forName(handlerClassName);
	                   Object handlerInstance = handlerClass.newInstance();
	                   commandMap.put(command, handlerInstance);
	               } catch (ClassNotFoundException e) {
	                   throw new ServletException(e);
	               } catch (InstantiationException e) {
	                   throw new ServletException(e);
	               } catch (IllegalAccessException e) {
	                   throw new ServletException(e);
	               }
	           }
	      }
	    
	       public void doGet(//get방식의 서비스 메소드
	         HttpServletRequest request, HttpServletResponse response)
	     throws ServletException, IOException {
	         requestPro(request, response);
	     }
	
	       
	       protected void doPost(//post방식의 서비스 메소드
	        HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        requestPro(request, response);
	    }
	 
	    //시용자의 요청을 분석해서 해당 작업을 처리
	    private void requestPro(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        String view = null;
	        CommandAction command_action=null;
	         
	        try {
	            String command = request.getRequestURI();
	            if (command.indexOf(request.getContextPath()) == 0) {
	               command = command.substring(request.getContextPath().length());
	            }
	            command_action = (CommandAction)commandMap.get(command);
	            view = command_action.process(request, response);
	        } catch(Throwable e) {
	            throw new ServletException(e);
	        }  
	        RequestDispatcher dispatcher =request.getRequestDispatcher(view);
	        dispatcher.forward(request, response);
	    }
	}
