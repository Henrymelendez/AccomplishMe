package com.skilldistillery.accomplish.entities;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "challenge_log")
public class ChallengeLog {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "entry_date")
	private LocalDate entryDate;

	private Boolean active;

	@ManyToOne
	@JoinColumn(name = "user_challenge_id")
	private UserChallenge userChallenge;

	@OneToMany(mappedBy = "challengeLog")
	private List<ChallengeLogDetail> challengeLogDetails = new ArrayList<>();

	@Transient
	private transient List<ChallengeLogDetail> workouts;

	@Transient
	private transient List<ChallengeLogDetail> meals;

	@Transient
	private transient List<ChallengeLogDetail> books;

	public ChallengeLog() {
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
		ChallengeLog other = (ChallengeLog) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(LocalDate entryDate) {
		this.entryDate = entryDate;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public UserChallenge getUserChallenge() {
		return userChallenge;
	}

	public void setUserChallenge(UserChallenge userChallenge) {
		this.userChallenge = userChallenge;
	}

	public List<ChallengeLogDetail> getChallengeLogDetails() {
		return new ArrayList<>(challengeLogDetails);
	}

	public void setChallengeLogDetails(List<ChallengeLogDetail> challengeLogDetails) {
		this.challengeLogDetails = challengeLogDetails;
	}

	public List<ChallengeLogDetail> getWorkouts() {
		if (workouts == null && !challengeLogDetails.isEmpty()) {
			workouts = new ArrayList<>();
			for (ChallengeLogDetail detail : challengeLogDetails) {
				if (detail.getChallengeDetail().getCategory().getName().equals("workout")) {
					workouts.add(detail);
				}
			}
		}
		return workouts;
	}

	public void setWorkouts(List<ChallengeLogDetail> workouts) {
		this.workouts = workouts;
	}

	public List<ChallengeLogDetail> getMeals() {
		if (meals == null && !challengeLogDetails.isEmpty()) {
			meals = new ArrayList<>();
			for (ChallengeLogDetail detail : challengeLogDetails) {
				if (detail.getChallengeDetail().getCategory().getName().equals("food")) {
					meals.add(detail);
				}
			}
		}
		return meals;
	}

	public void setMeals(List<ChallengeLogDetail> meals) {
		this.meals = meals;
	}

	public List<ChallengeLogDetail> getBooks() {
		if (books == null && !challengeLogDetails.isEmpty()) {
			books = new ArrayList<>();
			for (ChallengeLogDetail detail : challengeLogDetails) {
				if (detail.getChallengeDetail().getCategory().getName().equals("book")) {
					books.add(detail);
				}
			}
		}
		return books;
	}

	public void setBooks(List<ChallengeLogDetail> books) {
		this.books = books;
	}

	public void addChallengeLogDetail(ChallengeLogDetail detail) {
		if (challengeLogDetails == null) {
			challengeLogDetails = new ArrayList<>();
		}
		if (!challengeLogDetails.contains(detail)) {
			challengeLogDetails.add(detail);
			detail.setChallengeLog(this);
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("workout")) {
			if(workouts == null) {
				workouts = new ArrayList<>();
			}
			workouts.add(detail);
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("food")) {
			if(meals == null) {
				meals = new ArrayList<>();
			}
			meals.add(detail);
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("book")) {
			if(books == null) {
				books = new ArrayList<>();
			}
			books.add(detail);
		}
	}

	public void removeChallengeLogDetail(ChallengeLogDetail detail) {
		if (challengeLogDetails != null && challengeLogDetails.contains(detail)) {
			challengeLogDetails.remove(detail);
		}
		if (detail.getChallengeLog() != null && detail.getChallengeLog().equals(this)) {
			detail.setChallengeLog(null);
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("workout")) {
			if(workouts != null && workouts.contains(detail)) {
				workouts.remove(detail);
			}
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("food")) {
			if(meals != null && meals.contains(detail)) {
				meals.remove(detail);
			}
		}
		if (detail.getChallengeDetail().getCategory().getName().equals("book")) {
			if(books != null && books.contains(detail)) {
				books.remove(detail);
			}
		}
	}

	@Override
	public String toString() {
		return "ChallengeLog [id=" + id + ", entryDate=" + entryDate + ", active=" + active + ", userChallenge="
				+ userChallenge + "]";
	}

}
