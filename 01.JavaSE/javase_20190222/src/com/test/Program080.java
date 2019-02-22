/* 
 * 프로그램명: 석차 알고리즘
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program080 {

	public static void main(String[] args) {
		
		//석차 계산
		//1. 모든 성적의 석차를 1로 설정
		//2. 특정 성적을 가지고, 나머지 성적들과 비교
		//3. 상대방 성적이 높으면, 나의 석차를 +1 연산
		
		
		//입력 과정 ----------
		//과목1에 대한 점수
		int[] java = {100, 80, 90, 50, 60, 85, 80, 90, 100, 75};
		int[] rank = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
		
		//처리 과정 ----------
		
		
		
		
		
		//출력 과정 -----------
		int len = java.length;
		for (int a = 0; a < len; ++a) {
			System.out.printf("%2d) %5d %5d%n", (a+1), java[a], rank[a]);
		}

	}

}
