package day1;

public class SavingsAccount extends Account {
	private float minimumBalance;

	public float getMinimumBalance() {
		return minimumBalance;
	}

	public void setMinimumBalace(float minimumBalance) {
		this.minimumBalance = minimumBalance;
	}
	
	void displayAccount() {
		super.displayAccount();
		System.out.println("Minimum Balance: "+getMinimumBalance());
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
