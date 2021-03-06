package com.goodee.ex12.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	private long rn;
	private Long boardNo;
	private String writer;
	private String title;
	private String content;
	private long hit;
	private String ip;
	private Date created;
	private Date modified;
}