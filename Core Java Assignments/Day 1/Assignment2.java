package day1;

import java.util.Random;

public class Assignment2 {

	//Function to calculate total runs
	public static int totalRuns(int runs[]) {
		int a[] = {1};
		int total = 0;
		for (int i : runs) {
			total += i;
		}
		return total;
	}
	
	//Function to calculate the number of 0's,1's,2's...
	public static int[] statsCalc(int runs[]) {
		int count[] = new int[7];
		
		for (int i : runs) {
//			System.out.println(i);
			count[i]+=1;
		}
		return count;
	}
	
	//Function to generate the runs and combine and use the above methods and print the data
	public void statistics(){

		int runs[] = new int[30];
		int stats[] = new int[7];
		int total;
		float strikeRate; 
		
		Random random = new Random();
		for (int i = 0; i < runs.length; i++) {
			 runs[i] = (int)(1 + (Math.random() * (7 - 1)));	 
		}
		total = totalRuns(runs);
		System.out.println("------------------------");
		System.out.println("Total Runs Scored: "+ total);
		System.out.println("------------------------");
		stats = statsCalc(runs);
		for (int i = 0; i < 7; i++) {
			if(i == 5) {
				continue;
			}
			System.out.println("Number of "+ i +"'s: "+ stats[i]);	
		}
		System.out.println("------------------------");
		System.out.println("Strike Rate: "+ total/30.0); //to calculate the strike rate
		System.out.println("------------------------");
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Assignment2 a2 = new Assignment2();
		
		a2.statistics();
	}
}

