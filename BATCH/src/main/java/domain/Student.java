package domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Student {
	private Long stuNo;
	private String name;
	private int kor, eng, mat;
	private double avg;
	private String grade;
}