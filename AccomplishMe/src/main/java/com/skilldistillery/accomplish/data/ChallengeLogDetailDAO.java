package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

public interface ChallengeLogDetailDAO {
	
	ChallengeLogDetail addLogDetail(ChallengeLogDetail logDetail);
	ChallengeLogDetail editLogDetail(ChallengeLogDetail logDetail);
	boolean removeLogDetail(ChallengeLogDetail logDetail);

}
