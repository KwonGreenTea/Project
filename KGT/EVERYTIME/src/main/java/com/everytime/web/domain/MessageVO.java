package com.everytime.web.domain;

import java.util.Date;

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
public class MessageVO {

	private int message_id;
	private String member_id;
	private String recv_member_id;
	private String send_member_nickname;
	private String message_content;
	private Date message_date;
}