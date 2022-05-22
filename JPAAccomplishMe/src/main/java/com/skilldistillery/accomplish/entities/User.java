package com.skilldistillery.accomplish.entities;

import java.beans.Transient;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Double height;

	private Double weight;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "birthday")
	private LocalDate birthday;

	@Column(name = "user_photo_url")
	private String userPhoto;

	private Boolean active;

	@OneToMany(mappedBy = "user")
	private List<UserChallenge> userChallenges;

	@OneToMany(mappedBy = "creator")
	private List<Challenge> createdChallenges;

	@OneToMany(mappedBy = "creator")
	private List<ChallengeDetail> createdChallengeDetails;

	
	

	public User() {
		super();
	}

	public User(String username, String password, Double height, Double weight, String firstName, String lastName,
			Boolean active) {
		super();
		this.username = username;
		this.password = password;
		this.height = height;
		this.weight = weight;
		this.firstName = firstName;
		this.lastName = lastName;
		this.active = active;
	
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Challenge> getCreatedChallenges() {
		return new ArrayList<>(createdChallenges);
	}

	public void addCreatedChallenge(Challenge challenge) {
		if (createdChallenges == null) {
			createdChallenges = new ArrayList<>();
		}
		if (!createdChallenges.contains(challenge)) {
			createdChallenges.add(challenge);
			challenge.setCreator(this);
		}
	}

	public void removeCreatedChallenge(Challenge challenge) {
		if (createdChallenges != null && createdChallenges.contains(challenge)) {
			createdChallenges.remove(challenge);
		}
		if (challenge.getCreator() != null && challenge.getCreator().equals(this)) {
			challenge.setCreator(null);
		}
	}

	public void setCreatedChallenges(List<Challenge> createdChallenges) {
		this.createdChallenges = createdChallenges;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", height=" + height
				+ ", weight=" + weight + ", firstName=" + firstName + ", lastName=" + lastName + ", birthday="
				+ birthday + ", userPhoto=" + userPhoto + ", active=" + active + "]";
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDate getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<UserChallenge> getUserChallenges() {
		return new ArrayList<UserChallenge>(userChallenges);
	}

	public void setUserChallenges(List<UserChallenge> challenges) {
		this.userChallenges = challenges;
	}

	public void addUserChallenge(UserChallenge challenge) {
		if (userChallenges == null) {
			userChallenges = new ArrayList<UserChallenge>();

		}

		if (!userChallenges.contains(challenge)) {
			userChallenges.add(challenge);
			challenge.setUser(this);
		}

	}

	public void removeUserChallenge(UserChallenge challenge) {
		if (userChallenges != null && userChallenges.contains(challenge)) {
			userChallenges.remove(challenge);

		}
		if (challenge.getUser() != null && challenge.getUser().equals(this)) {
			challenge.setUser(null);

		}
	}

	public List<ChallengeDetail> getCreatedChallengeDetails() {
		return new ArrayList<>(createdChallengeDetails);
	}

	public void setCreatedChallengeDetails(List<ChallengeDetail> createdChallengeDetails) {
		this.createdChallengeDetails = createdChallengeDetails;
	}

	public void addCreatedChallengeDetail(ChallengeDetail detail) {
		if (createdChallengeDetails == null) {
			createdChallengeDetails = new ArrayList<>();
		}
		if (!createdChallengeDetails.contains(detail)) {
			createdChallengeDetails.add(detail);
		}

	}

	public void removeCreatedChallengeDetail(ChallengeDetail detail) {
		if (createdChallengeDetails != null && createdChallengeDetails.contains(detail)) {
			createdChallengeDetails.remove(detail);
		}
	}

}
