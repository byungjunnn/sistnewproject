package test;

public class student {
	private String name;
	private String address;
	private int score;
	
	public student() {
		// TODO Auto-generated constructor stub
	}
	
	public student(String name, String addr, int score) {
		this.name=name;
		this.address=addr;
		this.score=score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
