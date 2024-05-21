package com.everytime.web.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TimetableVO {
	private int COURSE_ID; // 강의번호
	private String MAJOR; // 전공
	private String COURSE_CLASS; // 강의분류
	private String COURSE_NAME; // 강의명
	private String PROFESSOR; // 교수
	private int GRADE; // 학점
	private String START_TIME; // 시작시간
	private String COURSE_ROOM; // 강의실
	private String COURSE_REVIEW; // 강의평가
	private String NOTICE; // 공지사항
	private String FINISH_TIME; // 종료시간
}
