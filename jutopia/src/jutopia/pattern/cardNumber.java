package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class cardNumber {

public static final String pattern = "^[0-9]{16}$";
	
	public static void main(String[] args)
	{
		while(true)
		{
			Scanner sc = new Scanner(System.in);
			
			System.out.print("ī���ȣ�� �Է��� �ּ��� : ");
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
