package com.skilldistillery.accomplish.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="challenge_detail")
public class ChallengeDetail {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;
	
	private String name;
	
	@Column(name="calories_per_serving")
	private Double calories;
	
	@Column(name="MET")
	private Double met;
	
	@Column(name="number_of_pages")
	private Integer numberPages;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="creator_id")
	private User creator;

	public ChallengeDetail() {
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
		ChallengeDetail other = (ChallengeDetail) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getCalories() {
		return calories;
	}

	public void setCalories(Double calories) {
		this.calories = calories;
	}

	public Double getMet() {
		return met;
	}

	public void setMet(Double met) {
		this.met = met;
	}

	public Integer getNumberPages() {
		return numberPages;
	}

	public void setNumberPages(Integer numberPages) {
		this.numberPages = numberPages;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	@Override
	public String toString() {
		return "ChallengeDetail [id=" + id + ", category=" + category + ", name=" + name + ", calories=" + calories
				+ ", met=" + met + ", numberPages=" + numberPages + ", description=" + description + ", creator="
				+ creator + "]";
	}
	
	
	

}
