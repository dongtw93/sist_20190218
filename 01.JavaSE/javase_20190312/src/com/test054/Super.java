package com.test054;

//인터페이스
//클래스의 추상적 표현
//상속 계층 구조에서 추상적 부모 역할
public interface Super {

	//추상화
	//추상 : 여러 가지 사물이나 개념에서 공통되는 특성이나 속성 따위를 추출하여 파악하는 작용. 
	//추상화는 구체적인 표현보다는 개념적인 표현을 이용해서 사물을 표현하는 행위
	//일반 클래스 -> 추상적 표현 -> 추상 클래스(부분적인 추상화), 인터페이스(전체 추상화)
	//abstract 키워드
	//구체적인 액션은 없고, 개념적 표현만 존재 -> 액션 설계
	
	//모든 메소드 -> 추상 메소드로만 구성 -> abstract 키워드
	//추상 메소드는 구현부({})가 없다
	//메소드 시그니처만 존재한다
	public abstract void method();	
	
}
