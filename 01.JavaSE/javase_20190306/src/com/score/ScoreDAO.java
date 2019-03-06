package com.score;

//(배열)저장소 운영 클래스
public class ScoreDAO {
	
	//(배열)저장소 준비
	private Score[] scores = new Score[10];
	//인덱스 운영 전용 변수
	private int idx;
	
	//(배열)저장소 자료 저장 액션 메소드
	public void add(Score s) {
		
	}
	
	//(배열)저장소 자료 (전체)출력 액션 메소드
	//메소드 오버로딩
	public Score[] list() {
		return null;
	}

	//(배열)저장소 자료 (검색)출력 액션 메소드
	//메소드 오버로딩
	public Score[] list(String key, String value) {
		return null;
	}
	
	//석차 계산용 메소드
	//private 메소드 - 객체 내부에서만 호출되는 메소드
	private void rank_() {
		
	}

}
