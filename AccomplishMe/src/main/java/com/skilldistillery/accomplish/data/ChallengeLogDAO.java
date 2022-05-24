package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.ChallengeLog;
import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

public interface ChallengeLogDAO {
	
	public ChallengeLog createChallengeLog(ChallengeLog log);
	public ChallengeLog updateChallengeLog(ChallengeLog log);
	public boolean deleteChallengeLog(ChallengeLog log);
	public ChallengeLog addChallengeLogDetails(ChallengeLog log, ChallengeLogDetail... details);
	public ChallengeLog createAndAddChallengeLogDetails(ChallengeLog log, ChallengeLogDetail... details);
	public ChallengeLog findById(int id);
	
}
