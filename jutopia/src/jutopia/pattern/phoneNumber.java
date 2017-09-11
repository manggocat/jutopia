package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class phoneNumber {

public static final String pattern = "^01([0-9]{1})-([0-9]{3,4})-([0-9]{4})$";
	
	public static void main(String[] args)
	{
		while(true)
		{
			Scanner sc = new Scanner(System.in);
			
			System.out.print("��ȭ��ȣ�� �Է��� �ּ��� : ");
			String input = sc.next();
			Pattern p = Pattern.compile(pattern);
			Matcher i = p.matcher(input);
			
			if(i.find())
			{
				System.out.println(input + " �� ������ ��ġ�մϴ�.");
			}
			
			else
			{
				System.out.println(input + " �� ������ ��ġ���� �ʽ��ϴ�.");
			}
		}
		
	}
}
