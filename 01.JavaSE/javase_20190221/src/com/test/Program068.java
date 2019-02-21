/* 
 * 프로그램명: 배열(저장소)을 이용한 성적처리
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */
package com.test;

public class Program068 {

	public static void main(String[] args) {
		
		//과목1, 과목2, 과목3의 점수를 저장하는 배열 저장소 준비
		//각 과목당 인원수는 5명
		//각 과목당 총점, 평균 계산
		
		//과목1에 대한 점수
		int[] java = {100, 80, 90, 50, 60, 0, 0};
		
		int count = java.length - 2;
		
		//총점 계산
		int total = 0;
		for (int a = 0; a < count; ++a) {
			//누적 연산
			total += java[a];
		}
		java[5] = total;
		
		//평균 계산
		//정수 나눗셈의 단점 
		//- 소수 이하를 버린다(절삭)
		//-> 반올림 액션 추가
		int ave = Math.round(total / (float)count);
		java[6] = ave;
		
		//점수, 총점, 평균 일괄 출력
		

	}

}
