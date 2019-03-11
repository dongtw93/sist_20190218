package com.schedule;

//(배열)저장소 운영 클래스
public class ScheduleDAO {

	//배열 저장소 준비
	//->자동 확장 액션 추가
	private Schedule[] schedules = new Schedule[50];
	//인덱스 전용 변수
	private int idx;
	
	//생성자
	public ScheduleDAO() {
		//샘플 일정 객체 등록
		Schedule s = new Schedule("S001", "2019-03-08", "일정관리 구현중...");
		this.schedules[this.idx] = s;
		++this.idx;
	}
	
	//번호 자동 증가 메소드
	public String generateSid() {
		//this.idx + 1; //1, 2, 3, ..., 999
		String result = null;
		int temp = this.idx + 1;
		if (temp <= 999) {
			result = String.format("S%03d", temp);
		}
		return result; //S001, S002, S003, ..., S999 or null
	}
	
	//일정 추가
	public void add(Schedule s) {
		//외부에서 전달된 일정 객체 등록
		this.schedules[this.idx] = s;
		++this.idx;
	}
	
	//일정 검색 및 출력
	public Schedule[] list(String key, String value) {
		//사본 배열 준비
		Schedule[] temp = new Schedule[this.idx];
		
		//원본 배열 탐색
		int b = 0;
		for (int a = 0; a < this.idx; ++a, ++b) {
			Schedule s = this.schedules[a];
			
			//전체일정 출력인 경우
			if (key.equals("all")) temp[b] = s;
			
			//오늘일정 or 특정일 출력인 경우 -> equals()
			if (key.equals("yyyy-mm-dd") && s.getWdate().equals(value)) temp[b] = s;
			
			//특정월 출력인 경우 -> contains()
			if (key.equals("yyyy-mm") && s.getWdate().contains(value)) temp[b] = s;
			
			//특정단어포함 출력인 경우 -> contains()
			if (key.equals("word") && s.getContent().contains(value)) temp[b] = s;
			
		}
		
		//사본 배열 반환
		return temp;
	}
	
}
