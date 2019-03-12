package com.test058;

public class Main {

	public static void main(String[] args) {
		
		//Sample3를 통한 Sample1의 메소드 호출
		
		//Sample1 객체 준비
		Sample1 s1 = new Sample1();
		
		//Sample3 객체에 Sample1 객체 공급
		//Sample1 객체만 공급 가능
		//->강한 결합
		Sample3 s = new Sample3(s1);
		
		s.method();
		
	}

}
