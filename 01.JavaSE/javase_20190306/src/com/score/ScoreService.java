package com.score;

public class ScoreService {

	//HAS-A 관계 (강한 결합)
	private ScoreDAO dao;
	public ScoreService() {
		this.dao = new ScoreDAO();
	}
	
	//주메뉴당 메뉴별 액션
	
	//1.성적입력 메소드
	public void menu1() {
		
	}
	
	//2.성적출력 메소드
	public void menu2() {
		
	}
	
	//3.성적검색 메소드
	//->서브메뉴
	public void menu3() {
		
	}	
	
	//3.성적검색/1.번호기준 메소드
	public void menu3_1() {
		
	}
	
	//3.성적검색/2.이름기준 메소드
	public void menu3_2() {
		
	}
	
	//출력 포맷 private 메소드
	private void print(Score[] list) {
		
	}
	
}
