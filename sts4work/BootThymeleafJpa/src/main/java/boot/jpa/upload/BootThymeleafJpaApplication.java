package boot.jpa.upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"mycar.*"})
@EntityScan("mycar.data") //dto 인식
@EnableJpaRepositories("mycar.repository") //dao 인식
public class BootThymeleafJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootThymeleafJpaApplication.class, args);
	}

}
