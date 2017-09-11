package jutopia.pattern;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class AccountNumber {

public static final String pattern11 = "^([0-9]){11}$";
public static final String pattern12 = "^([0-9]){12}$";
public static final String pattern13 = "^([0-9]){13}$";
public static final String pattern14 = "^([0-9]){14}$";
	
	public static void main(String[] args)
	{
		while(true)
		{
			Scanner sc = new Scanner(System.in);
			System.out.println("-----------�޴�-----------");
			System.out.println("1. ��������");
			System.out.println("2. ��������(��)");
			System.out.println("3. �츮����,���� ");
			System.out.println("4. ��������, �������, �ϳ�����");
			System.out.print("�޴����� = ");
			int menu = sc.nextInt();
			
			if(menu == 1)
			{
				System.out.println("���������Դϴ�.");
				System.out.print("���¹�ȣ�� �Է��� �ּ��� : ");
				String input = sc.next();
				Pattern p = Pattern.compile(pattern11);
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
			else if(menu == 2)
			{
				System.out.println("��������(��)�Դϴ�.");
				System.out.print("���¹�ȣ�� �Է��� �ּ��� : ");
				String input = sc.next();
				Pattern p = Pattern.compile(pattern12);
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
			else if(menu == 3)
			{
				System.out.println("�츮����, �� �Դϴ�.");
				System.out.print("���¹�ȣ�� �Է��� �ּ��� : ");
				String input = sc.next();
				Pattern p = Pattern.compile(pattern13);
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
			else if(menu == 4)
			{
				System.out.println("��������, �������, �������� �Դϴ�.");
				System.out.print("���¹�ȣ�� �Է��� �ּ��� : ");
				String input = sc.next();
				Pattern p = Pattern.compile(pattern14);
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
			else
			{
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
			}
			
		}
		
	}
}
