package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Pattern_Phone {

public static final String pattern = "^01([0-9]{1})-([0-9]{3,4})-([0-9]{4})$";
	
	public static void main(String[] args)
	{
		while(true)
		{
			Scanner sc = new Scanner(System.in);
			
			System.out.print("전화번호를 입력해 주세요 : ");
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
}
