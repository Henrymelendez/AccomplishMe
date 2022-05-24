package com.skilldistillery.accomplish.data;

import java.util.List;

import com.skilldistillery.accomplish.entities.ChallengeDetail;

public interface ChallengeDetailDAO {
	
	List<ChallengeDetail> findByCategoryName(String name);
	ChallengeDetail addDetail(ChallengeDetail detail);
	ChallengeDetail editDetail(ChallengeDetail detail);
	ChallengeDetail removeDetail(ChallengeDetail detail);
	ChallengeDetail findbyId(int id);
	

}
