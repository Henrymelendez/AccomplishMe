package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.ChallengeLog;

public interface ChallengeLogDAO {
	
	public ChallengeLog createChallengeLog(ChallengeLog log);
	public ChallengeLog updateChallengeLog(ChallengeLog log);
	public boolean deleteChallengeLog(ChallengeLog log);
}
