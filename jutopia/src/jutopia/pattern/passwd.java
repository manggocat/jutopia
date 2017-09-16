package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class passwd {
	
	public static final String pattern = "^((?=.*[0-9]).{1,}(?=.*[~'!@#$%^&*()-_]).{1,}(?=.*[a-zA-Z]).{1,}).{8,20}$";
	
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		
		System.out.print("��й�ȣ�� �Է��� �ּ��� : ");
		String input = sc.next();
		Pattern p = Pattern.compile(pattern);
		Matcher i = p.matcher(input);
		
		if(i.find())
		{
			System.out.println(input + " �� ��й�ȣ�� ��ġ�մϴ�.");
		}
		
		else
		{
			System.out.println(input + " �� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
			
		
	}

}
