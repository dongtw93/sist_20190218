/* 
 * 프로그램명: 난수 발생
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program048 {

	public static void main(String[] args) {
		
		//난수 발생
		//Math 클래스의 random() 메소드를 이용하면 난수 발생 가능
		//난수 기본 범위 0 이상,  1 미만의 실수. 0.0부터 0.999999 까지만 발생한다.
		
		//주사위 2개를 던져서 나온 눈의 수를 출력
		//->무한 반복
		
		while(true) {
			//특정 범위의 난수 (1~6)
			int b1 = (int)(Math.random() * 6) + 1;
			int b2 = (int)(Math.random() * 6) + 1;
			System.out.printf("(%d, %d)%n", b1, b2);
		}
		
	}
}
