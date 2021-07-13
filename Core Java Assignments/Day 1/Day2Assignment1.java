package day1;

public class Day2Assignment1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SavingsAccount sa = new SavingsAccount();
		sa.setBankName("ICICI");
		
		sa.setAccountNo(101);
		sa.setAccountBalance(5000);
		sa.setAccountPassword("abc123");
		sa.setMinimumBalace(1000.0f);
		sa.displayAccount();
		
		CurrentAccount ca = new CurrentAccount();
		ca.setOverdraftLimitAmount(500.0f);
		ca.displayAccount();
	}

}
