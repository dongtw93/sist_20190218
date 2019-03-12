package com.test058;

public class Sample3 {
	
	//HAS-A 관계
	//강한 결합 vs 약한 결합
	//인터페이스를 이용한 약한 결합 상태를 권장한다
	
	//강한 결합
	private Sample1 sample;
	public Sample3() {
		this.sample = new Sample1();
	}
	
	//Sample3의 메소드 호출
	public void method() {
		//내부적으로 Sample1의 메소드 호출
		this.sample.method();
	}

}
