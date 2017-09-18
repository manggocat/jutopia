package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Pattern_Email {

	public static final String pattern = "^([_A-Za-z0-9-]+)*@+[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("email을 입력해 주세요 : ");
		String input = sc.next();
		Pattern p = Pattern.compile(pattern);
		Matcher i = p.matcher(input);
		
		if(i.find())
		{
			System.out.println(input + " 은 패턴이 일치합니다.");
		}
		
		else
		{
			System.out.println(input + " 은 패턴이 일치하지 않습니다.");
		}
			
		
	}
}
