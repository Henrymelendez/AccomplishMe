package com.skilldistillery.accomplish.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user_challenge")
public class UserChallenge {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String details;

	@Column(name = "start_date")
	private LocalDate startDate;

	@Column(name = "end_date")
	private LocalDate endDate;

	private Boolean complete;
	@Column(name = "in_progress")
	private Boolean inProgress;

	private Boolean active;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JoinColumn(name = "challenge_id")
	private Challenge challenge;

	@OneToMany(mappedBy = "userChallenge", fetch = FetchType.EAGER)
	private List<ChallengeLog> challengeLogs = new ArrayList<>();

	@Transient
	private transient ChallengeLog mostRecent;

	public UserChallenge() {
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
		UserChallenge other = (UserChallenge) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public Boolean getComplete() {
		return complete;
	}

	public void setComplete(Boolean complete) {
		this.complete = complete;
	}

	public Boolean getInProgress() {
		return inProgress;
	}

	public void setInProgress(Boolean inProgress) {
		this.inProgress = inProgress;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Challenge getChallenge() {

		return challenge;
	}

	public void setChallenge(Challenge challenge) {
		this.challenge = challenge;
	}

	public List<ChallengeLog> getChallengeLogs() {
		List<ChallengeLog> activeLogs = new ArrayList<>();
		if (!challengeLogs.isEmpty()) {
			for (ChallengeLog log : challengeLogs) {
				if(log.getActive()) {
					activeLogs.add(log);
				}
			}

		}
		return activeLogs;
	}

	public void setChallengeLogs(List<ChallengeLog> challengeLogs) {
		this.challengeLogs = challengeLogs;
	}

	public void addChallengeLog(ChallengeLog challengeLog) {
		if (challengeLogs == null) {
			challengeLogs = new ArrayList<>();
		}
		if (!challengeLogs.contains(challengeLog)) {
			challengeLogs.add(challengeLog);
			challengeLog.setUserChallenge(this);
		}
	}

	public void removeChallengeLog(ChallengeLog challengeLog) {
		if (challengeLogs != null && challengeLogs.contains(challengeLog)) {
			challengeLogs.remove(challengeLog);
		}
		if (challengeLog.getUserChallenge() != null && challengeLog.getUserChallenge().equals(this)) {
			challengeLog.setUserChallenge(null);
		}
	}

	@Override
	public String toString() {
		return "UserChallenge [id=" + id + ", details=" + details + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", complete=" + complete + ", inProgress=" + inProgress + ", active=" + active + ", user=" + user
				+ "]";
	}

	public ChallengeLog getMostRecent() {
		if ((mostRecent == null || !mostRecent.getActive()) && !challengeLogs.isEmpty()) {
			challengeLogs.sort((c1, c2) -> c2.getEntryDate().compareTo(c1.getEntryDate()));
			for (int i = 0; i < challengeLogs.size(); i++) {
				if(challengeLogs.get(i).getActive()) {
					mostRecent = challengeLogs.get(i);
					break;
				}
			}
		}
		return mostRecent;
	}

	public void setMostRecent(ChallengeLog mostRecent) {
		this.mostRecent = mostRecent;
	}

}
