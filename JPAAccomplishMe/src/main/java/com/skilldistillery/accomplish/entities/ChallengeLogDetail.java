package com.skilldistillery.accomplish.entities;

import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="challenge_log_detail")
public class ChallengeLogDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="duration_in_minutes")
	private Integer duration;
	@Column(name="servings_eaten")
	private Integer servings;
	@Column(name = "pages_read")
	private Integer pagesRead;
	private Boolean active;
	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="challenge_log_id")
	private ChallengeLog challengeLog;
	
	@ManyToOne
	@JoinColumn(name="challenge_detail_id")
	private ChallengeDetail challengeDetail;
	
	public ChallengeLogDetail() {
		super();
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChallengeLogDetail other = (ChallengeLogDetail) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getServings() {
		return servings;
	}

	public void setServings(Integer servings) {
		this.servings = servings;
	}

	public Integer getPagesRead() {
		return pagesRead;
	}

	public void setPagesRead(Integer pagesRead) {
		this.pagesRead = pagesRead;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public ChallengeLog getChallengeLog() {
		return challengeLog;
	}

	public void setChallengeLog(ChallengeLog challengeLog) {
		this.challengeLog = challengeLog;
	}



	public ChallengeDetail getChallengeDetail() {
		return challengeDetail;
	}

	public void setChallengeDetail(ChallengeDetail challengeDetail) {
		this.challengeDetail = challengeDetail;
	}

	@Override
	public String toString() {
		return "ChallengeLogDetail [id=" + id + ", duration=" + duration + ", servings=" + servings + ", pagesRead="
				+ pagesRead + ", active=" + active + ", challengeLog=" + challengeLog + "]";
	}
	
	
	
	
}
