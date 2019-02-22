/* 
 * 프로그램명: 2차원 배열
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program090 {

	public static void main(String[] args) {
		
		//1차원 배열 -> 2차원 배열 변환
		//랜덤한 크기(~30)의 1차원 배열 요소(1부터 순차적으로)를 
		//2차원 배열로 변환
		   
		
		//1차원 배열로 변환
		//->배열은 선언시 크기 지정
		int[] arr = new int[25];
		int len = arr.length;
		
		for (int a = 0; a < len; ++a) {
			arr[a] = (int)(Math.random() * 25) + 1;
		}
		
		//1차원 배열 요소 출력
		System.out.println(java.util.Arrays.toString(arr));
		
		
		//2차원 배열로 변환
		//->5개씩 끊어서 읽는다고 가정
		
		//2차원 빈 배열 준비
		int count = 5;
		int row = arr.length / count;
		int[][] arr2 = new int[row][];
		
		//각 행별로 1차원 빈 배열 준비
		int c = 0;
		for (int a = 0; a < row; ++a) {
			arr2[a] = new int[count];
			
			//1차원 배열의 요소를 2차원 배열로 복사
			for (int b = 0; b < count; ++b) {
				arr2[a][b] = arr[c];
				++c;
			}
			
		}
		
		//2차원 배열 요소 전체 출력
		//행 접근용 반복문
		for (int a = 0; a < arr2.length; ++a) {
			//열 접근용 반복문
			for (int b = 0; b < arr2[a].length; ++b) {
				System.out.printf("%2d ", arr2[a][b]);
			}
			System.out.println();
		}
		
	}

}
