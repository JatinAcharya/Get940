package day1;

public class Day2Assignment2 {

	public static void main(String[] args) {
		SavingsAccount sa = new SavingsAccount();
		sa.setBankName("ICICI");
		
		sa.setAccountNo(101);
		sa.setAccountBalance(5000);
		sa.setAccountPassword("abc123");
		sa.setMinimumBalace(1000.0f);
		sa.displayAccount();
		sa.withdraw(500);
		
		CurrentAccount ca = new CurrentAccount();
		
		ca.setAccountNo(201);
		ca.setAccountBalance(10000);
		ca.setAccountPassword("test123");
		ca.setOverdraftLimitAmount(500.0f);
		ca.displayAccount();
		ca.withdraw(1000);
		
	}

}
