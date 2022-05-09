package com.goodee.ex01.xml05;

import java.util.List;

public class Exam {

	private List<Integer> scores;
	private double average;
	private char grade;

	public List<Integer> getScores() {
		return scores;
	}

	public void setScores(List<Integer> scores) {
		this.scores = scores;

		int total = 0;
		int size = scores.size();
		for (int i = 0; i < size; i++) {
			total += scores.get(i);
		}
		average = (double) total / size;

		if (average >= 90) {
			grade = 'A';
		} else if (average >= 80) {
			grade = 'B';
		} else if (average >= 70) {
			grade = 'C';
		} else if (average >= 60) {
			grade = 'D';
		} else {
			grade = 'F';
		}

	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}

	public char getGrade() {
		return grade;
	}

	public void setGrade(char grade) {
		this.grade = grade;
	}

}