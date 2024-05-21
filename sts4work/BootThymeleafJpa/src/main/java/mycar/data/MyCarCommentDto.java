package mycar.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor //디폴트생성자, autowired 대체
@AllArgsConstructor //모든것에 대한 생성자, autowired 대체
@Builder //autowired 대체
@Entity
@Table(name = "mycar_comment")
public class MyCarCommentDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idx;
	
	@ManyToOne
	@JoinColumn(name = "num") //외래키 설정
	@OnDelete(action = OnDeleteAction.CASCADE) //부모데이터 지우면 같이 삭제
	private MyCarDto mycar;
	
	@Column
	private String comment;
	
	@Column(updatable = false)
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Timestamp writeday;
}
