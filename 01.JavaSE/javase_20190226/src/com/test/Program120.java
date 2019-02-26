/* 
 * 프로그램명: 외부입력-성적 처리
 * 작성자 : 이민종
 * 작성일 : 20190226
 *  
 */

package com.test;

public class Program120 {

	public static void main(String[] args) {
		
		//성적 처리
		//성적 처리 구성 - 학번, 과목1, 과목2, 과목3, 총점, 등수
		//2차원 배열 저장소 운영
		//1차원 배열 - 개개인의 성적 정보 저장하는 저장소
		//2차원 배열 - 성적 정보 여러개를 저장하는 저장소
		//{{1, 100, 100, 100, 300, 1}, {2, 90, 100, 80, 270, 3}, ...}
		//주의) 배열은 동일 자료형만 허용
		//주의) 휘발성 자료
		//출력예)
		/*
		--- 성적 처리 ---
		1.성적정보출력  2.성적정보입력
		선택>2
		2.성적정보입력
		학번>1
		과목1>100
		과목2>100
		과목3>100
		성적정보를 입력할까요(0/1)?1
		성적정보가 입력되었습니다.		
		
		--- 성적 관리 ---
		1.성적정보출력  2.성적정보입력
		선택>1
		1.성적정보출력
		------------------------
		학번 / 과목1 / 과목2 / 과목3 / 총점 / 등수
		1 / 100 / 100 / 100 / 300 / 1
		2 / 90 / 100 / 80 / 270 / 3
		...
		
		--- 성적 관리 ---
		1.성적정보출력  2.성적정보입력
		선택>0
		프로그램 종료 
		
		*/

		
		java.util.Scanner sc = new java.util.Scanner(System.in);

		while (true) {
			System.out.println();
			System.out.println("--- 성적 처리 ---");
			System.out.println("1.성적정보출력  2.성적정보입력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			if (m == 1) {
				System.out.println("1.성적정보출력");
				
			} else if (m == 2){
				System.out.println("2.성적정보입력");
			
			} 
		}
		
		sc.close();
		System.out.println("프로그램 종료");
		
	}

}
