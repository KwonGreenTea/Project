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
	private int COURSE_ID; // ���ǹ�ȣ
	private String MAJOR; // ����
	private String COURSE_CLASS; // ���Ǻз�
	private String COURSE_NAME; // ���Ǹ�
	private String PROFESSOR; // ����
	private int GRADE; // ����
	private String START_TIME; // ���۽ð�
	private String COURSE_ROOM; // ���ǽ�
	private String COURSE_REVIEW; // ������
	private String NOTICE; // ��������
	private String FINISH_TIME; // ����ð�
}
