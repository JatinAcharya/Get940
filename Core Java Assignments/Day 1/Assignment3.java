package day1;

public class Assignment3 {
	//Function to print all the required statistics
	public void statistics() {
		
		int runs[][] = new int[5][30];
		int	totalRuns = 0; //total runs scored 
		float average = 0; //average of 5 matches
		int count[] = new int[7]; //counting 0's, 1's, 2's.... 

		//loop to generate random values and storing total and count 
		for (int i = 0; i < runs.length; i++) {
			for (int j = 0; j < runs[0].length; j++) {
				runs[i][j] = (int)(1 + (Math.random() * (7 - 1))); 
				totalRuns+=runs[i][j];
				count[runs[i][j]] += 1;
			}
		}
		average = totalRuns/5.0f;
		System.out.println("------------------------");
		System.out.println("Average Score of last 5 matches : "+ average);
		System.out.println("------------------------");
		System.out.println("Total Runs Scored: "+ totalRuns);
		System.out.println("------------------------");
		for (int i = 0; i < 7; i++) {
			if(i == 5) {
				continue;
			}
			System.out.println("Number of "+ i +"'s: "+ count[i]);	
		}
		System.out.println("------------------------");
		System.out.println("Strike Rate: "+ totalRuns/(float)(runs.length*runs[0].length)); //to calculate the strike rate
		System.out.println("------------------------");
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Assignment3 a3 = new Assignment3();
		a3.statistics();
	}

}
