/* 
 * 프로그램명: 배열(저장소)을 이용한 숫자, 문자열 정렬
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program070 {

	public static void main(String[] args) {
		
		//정렬(Sort)
		//오름차순, 내림차순
		//-> java.util.Arrays.sort() 메소드 
		//-> (거품)정렬 알고리즘 구현
		//-> 석차 알고리즘 구현

		//배열 준비
		int arr[] ={60, 3, 35, 2, 45, 320, 5};  
		
		//원본 상태 출력
		System.out.println(java.util.Arrays.toString(arr));
		
		//거품 정렬(Bubble Sort) 
		//->인접한 두 요소 비교 후, 큰 숫자를 오른쪽으로 이동.
		//->1회전시 가장 큰 숫자가 가장 오른쪽에 저장.
		//->n회전시 모든 숫자가 정렬된다. n은 요소 전체 갯수 - 1

		/*
		if (arr[0] > arr[1]) {
			int temp = arr[1];
			arr[1] = arr[0];
			arr[0] = temp;
		}
		*/
		
		for (int b = 0; b < arr.length - 1; ++b) {
			if (arr[b] > arr[b + 1]) {
				int temp = arr[b + 1];
				arr[b + 1] = arr[b];
				arr[b] = temp;
			}
		}
		
		//1회전 상태 출력
		System.out.println(java.util.Arrays.toString(arr));
		
	}

}
