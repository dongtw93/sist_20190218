package com.test022;

//(배열)저장소 운영 클래스
public class MemberDAO {
	
	//Member (객체)자료형을 가진 배열 저장소 선언
	//힙(heap) 공간에 Member 객체 10개까지 저장 가능한 공간 확보
	//스택(stack) 공간에 배열의 참조주소를 저장한 members 변수 확보
	//프로퍼티 선언
	private Member[] members = new Member[10];
	
	//자료 저장소에 자료 추가
	public void add(Member m) {
		
	}
	
	//자료 저장소의 전체 자료 반환
	//->사본 배열(얕은 복사 or 깊은 복사)
	public Member[] list() {
		return null;
	}
	
	//자료 저장소의 부분 자료 반환
	//->사본 배열(얕은 복사 or 깊은 복사)
	public Member[] list(String key, String value) {
		return null;
	}
	

}
