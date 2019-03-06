package com.test025;

public class Main {

	public static void main(String[] args) {

		//초기화 테스트
		//객체(instance) 생성시 생성자 호출 가능
		Sample s = new Sample();
		
		//정수형 멤버
		System.out.println(s.getA()); //0
		
		//실수형 멤버
		System.out.println(s.getB()); //0.0
		
		//참조형 멤버
		System.out.println(s.getC()); //null

	}

}
