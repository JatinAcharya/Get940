package day1;

import java.util.Scanner;

public abstract class Account{
	private int accountNo;
	private float accountBalance;
	private String accountPassword;
	
	private static String bankName;
	
	abstract void withdraw(float amount);

	public Account(){
		
	}
		
	public Account(int accountNo, float accountBalance, String accountPassword) {
		super();
		this.accountNo = accountNo;
		this.accountBalance = accountBalance;
		this.accountPassword = accountPassword;
	}

	public int getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}

	public float getAccountBalance() {
		return accountBalance;
	}

	public void setAccountBalance(float accountBalance) {
		this.accountBalance = accountBalance;
	}

	public String getAccountPassword() {
		return accountPassword;
	}

	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}

	public static String getBankName() {
		return bankName;
	}

	public static void setBankName(String bankName) {
		Account.bankName = bankName;
	}
	
	void displayAccount() {
		System.out.println("---------------------");
		System.out.println("Bank Name: "+ bankName);
		System.out.println("Account Number: "+ accountNo );
		System.out.println("Account Balance: "+ accountBalance );
		System.out.println("Account Password: "+ accountPassword );
	}
	
}