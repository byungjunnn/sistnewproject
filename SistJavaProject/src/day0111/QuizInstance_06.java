package day0111;

class Artist{
	
	//변수명
	private String ArtGroup;
	private String ArtSong;
	
	static String ArtName;
	static int cnt;
	
	//명시적 생성자
	public Artist(String ArtGroup, String ArtSong) {
		this.ArtGroup=ArtGroup;
		this.ArtSong=ArtSong;
	}
	
	//출력 메서드 한번에 만들기
	public void ArtistInfo() {
		cnt++;
		System.out.println("**아티스트 정보_"+cnt+"***");
		System.out.println("소속기획사: "+ArtName);
		System.out.println("그룹명: "+ArtGroup);
		System.out.println("대표곡: "+ArtSong);
		System.out.println("-------------------------");
	}
}
public class QuizInstance_06 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Artist art1=new Artist("bts", "버터");
		Artist art2=new Artist("뉴진스", "어텐션");
		
		Artist.ArtName="하이브";
		
		art1.ArtistInfo();
		art2.ArtistInfo();
	}

}
