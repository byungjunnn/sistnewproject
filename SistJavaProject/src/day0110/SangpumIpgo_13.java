package day0110;

class Ipgo{
	private String sangName;
	private int price;
	
	public void setName(String sangName) {
		this.sangName=sangName;
	}
	public void setPrice(int price) {
		this.price=price;
	}
	public String getName() {
		return sangName;
	}
	public int getPrice() {
		return price;
	}
}
public class SangpumIpgo_13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Ipgo in1=new Ipgo();
		
		in1.setName("애플워치");
		in1.setPrice(580000);
		
//		in1.getName();
//		in1.getPrice();
//		System.out.println(in1.getName()+", "+in1.getPrice());
		String name=in1.getName();
		int price=in1.getPrice();
		System.out.println(name+", "+price+"원");
	}

}
