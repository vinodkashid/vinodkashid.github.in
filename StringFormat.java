package com.hackerrank;

import java.util.Scanner;

public class StringFormat {

	public static void main(String[] args) {
		
		Scanner sc=new Scanner(System.in);
		System.out.println("Enter String:");
		
		String str=sc.nextLine();	
		
		formatString(str);
		
	}

	private static void formatString(String str) {
		char[] chars=chars=new char[str.length()+str.length()/3];
		int index=0;

		
		for (int i = 0; i < str.length(); i++,index++) {
			if((i%3)==0 && i!=0){
				chars[index++]='-';
			}
			chars[index]=str.charAt(i);
		}
	
		String str2 = new String(chars);

		System.out.println(str2);
		
	}

}