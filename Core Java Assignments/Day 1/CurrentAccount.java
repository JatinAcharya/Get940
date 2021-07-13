package day1;

public class CurrentAccount extends Account {
	private float overdraftLimitAmount;

	public float getOverdraftLimitAmount() {
		return overdraftLimitAmount;
	}

	public void setOverdraftLimitAmount(float overdraftLimitAmount) {
		this.overdraftLimitAmount = overdraftLimitAmount;
	}
	
	void displayAccount() {
		super.displayAccount();
		System.out.println("OverdraftLimitAmount: "+overdraftLimitAmount);
	}
	
	void withdraw(float amount) {
		if(amount < getAccountBalance()) {
			System.out.println("Withdrawing "+amount+" from the account");
			setAccountBalance(getAccountBalance()-amount);
			displayAccount();
		}
		else {
			System.out.println("Insufficient Balance");
		}
	}
}
