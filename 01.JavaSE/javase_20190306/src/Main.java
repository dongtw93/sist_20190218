import java.util.Locale;

public class Main {

	public static void main(String[] args) {

		String s = "TITLE";
		System.out.println(s.toLowerCase(Locale.ENGLISH));
		System.out.println(s.toLowerCase(new Locale("tr", "TR")));

	}

}
