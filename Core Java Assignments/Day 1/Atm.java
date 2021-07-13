package day1;

public interface Atm {
	void withdraw(int accountNumber, double amount);
	void changePassword(int accountNumber, String oldPassword, String newPassword);
	void checkBalance();
}
