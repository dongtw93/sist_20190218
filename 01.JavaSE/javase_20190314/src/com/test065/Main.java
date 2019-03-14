package com.test065;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		//메인 메뉴
		//1.자동번호 2.수동번호 3.당첨자검색
		
		Scanner sc = new Scanner(System.in);
		
		LottoService service = new LottoService();
		
		service.menu1(sc);

	}

}
