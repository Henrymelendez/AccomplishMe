package com.skilldistillery.accomplish.data;

import java.util.List;

import com.skilldistillery.accomplish.entities.Challenge;

public interface ChallengeDAO {
	
	Challenge findById(int UsedId);
	Challenge createChallenge(Challenge challenge);
	boolean deleteChallenge(int challengeId);
	Challenge editChallenge(Challenge challenge);
	List<Challenge> findByKeyword(String keyword);

}
