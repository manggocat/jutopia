package controller;

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

import jutopia.action.*;

public class JutopiaController extends HttpServlet {
	private Map commandMap = new HashMap();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strview = null;
		CommandAction action = null;
		
		try{
			String strcommand = req.getRequestURI();
			
			
			if(strcommand.indexOf(req.getContextPath()) == 0){ 
				strcommand = strcommand.substring(req.getContextPath().length()+1);
			
			}
			
			action = (CommandAction)commandMap.get(strcommand);
			
			strview = action.process(req, resp);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		req.setAttribute("CONTENT", strview);
	
		
		RequestDispatcher dp = req.getRequestDispatcher(strview);
		dp.forward(req, resp);
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		String strprops = config.getInitParameter("jutopiaConfig");
		Properties properties = new Properties();
		FileInputStream fileinputsteam = null;

		try {
			fileinputsteam = new FileInputStream(strprops);
			properties.load(fileinputsteam);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fileinputsteam != null)
				try {
					fileinputsteam.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}

		Iterator key = properties.keySet().iterator();

		while (key.hasNext()) {

			String strcommand = (String)key.next();
			String strvalue = properties.getProperty(strcommand);

			try {
				Class className = Class.forName(strvalue);// 臾몄옄�뿴�쓣 �겢�옒�뒪濡� 蹂��솚
				Object instance = className.newInstance();
				
				
				
				commandMap.put(strcommand, instance);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
