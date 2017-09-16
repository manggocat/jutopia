package testlog;

public class Testlog {
	
	boolean flag = false;
	
	public void log(String title, String subtitle, String msg,boolean flag) {
		if(flag == true){
			System.out.println(title+"/ "+subtitle+": "+msg);	
		}
		
	}

	public void log(String title,String msg,boolean flag) {
		if(flag == true){
		System.out.println(title+" : "+msg);
		}
	}
}
