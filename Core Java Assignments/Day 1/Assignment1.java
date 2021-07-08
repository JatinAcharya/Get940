package day1;

import java.util.Scanner;

public class Assignment1 {
	//Function to calculate the bill amount
	public float calculateBill(int units) {
		
		float result = 0; 
		
		if(units>0) {
			result = 0;
			if(units<100) {
				result = units*1.20f; //for units <100			
			}
			else if(units<=300) {
				result = (100*1.2f)+((units-100)*2); //for units <300				
			}
			else if(units > 300) {
				result = (100*1.2f)+(200*2)+((units-300)*3); //for units >300
			}
		}
		return result;
	}
	
	public static void main(String[] args) {
		
		int units;
		float bill;
		Scanner sc = new Scanner(System.in);
		Assignment1 a1 = new Assignment1();
		
		//user input for number of units
		System.out.println("Enter the units of electricity consumed: ");
		units = sc.nextInt();

		
		bill = a1.calculateBill(units);
		System.out.println("Your Electricity Bill for consuming "+units+" units is Rs."+bill);
		
	}

}
