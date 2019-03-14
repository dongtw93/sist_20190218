package com.test065;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;

//서비스 운영 클래스
public class LottoService {
	
	//판매소 고유번호는 멤버변수 또는 상수
	
	
	//자동 번호 서비스
	//->매수 입력
	public void menu1(Scanner sc) {
		System.out.print("매수>");
		int count = sc.nextInt();
		sc.nextLine();
		
		for (int a = 0; a < count; ++a) {
			//로또 번호 자동 생성 -> auto() 메소드
			//저장소에 저장
			//발행된 로또 번호 출력
		}
		
	}
	
	private List<Integer> auto() {
		Random random = new Random();
		Set<Integer> set = new HashSet<Integer>();
		while(true) {
			int temp = random.nextInt(45) + 1;
			set.add(temp);
			if (set.size() >= 6) break;
		}
		List<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		return list;
	}
	
	//수동 번호 서비스
	//1~45 범위 내의 6개의 숫자 입력
	
	//당첨자 검색
	//->당첨번호(5,13,17,29,34,39) 필요
	//->당첨번호 3개 숫자일치 = 5등
	
}
