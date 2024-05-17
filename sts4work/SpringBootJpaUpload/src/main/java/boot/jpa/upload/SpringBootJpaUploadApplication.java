package boot.jpa.upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"board.data"})
@EntityScan("board.data") //dto 인식
@EnableJpaRepositories("board.data") //dao 인식
public class SpringBootJpaUploadApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpaUploadApplication.class, args);
	}

}
