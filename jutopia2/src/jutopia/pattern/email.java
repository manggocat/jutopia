package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class email {

	public static final String pattern = "^([_A-Za-z0-9-]+)*@+[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("email�� �Է��� �ּ��� : ");
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
