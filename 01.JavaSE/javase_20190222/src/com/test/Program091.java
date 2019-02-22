/* 
 * 프로그램명: 배열 복사(얕은 복사, 깊은 복사)
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program091 {

	public static void main(String[] args) {
		
		//배열 요소 복사
		//1차원 배열 -> 깊은 복사
		//2차원 배열 -> 얕은 복사
		
		int[] arr = {1, 2, 3, 4, 5};
		System.out.println(java.util.Arrays.toString(arr));
		
		int[] arr2 = java.util.Arrays.copyOf(arr, arr.length);
		System.out.println(java.util.Arrays.toString(arr2));
		
		arr[0] = 10;
		System.out.println(java.util.Arrays.toString(arr));
		System.out.println(java.util.Arrays.toString(arr2));
	
		
	}

}
