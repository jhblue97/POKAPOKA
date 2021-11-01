package com.poka.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class GameVO {

	private String gno;
	private String gameId;
	private String game_img;
	private String gameNm;
	private String game_price;
	private float avg_score;
	private String game_des;
	private String game_vid;
	private String game_company;
	private String game_age;
	private String game_url;
	private Date regDate;
	private Date updateDate;
	private List<TagVO> tagVoList;

}
