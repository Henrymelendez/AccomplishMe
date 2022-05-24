package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.ChallengeLogDetail;

public interface ChallengeLogDetailDAO {
	
	ChallengeLogDetail addLogDetail(ChallengeLogDetail logDetail);
	ChallengeLogDetail findById(int id);
	ChallengeLogDetail editLogDetail(ChallengeLogDetail logDetail);
	ChallengeLogDetail removeLogDetail(ChallengeLogDetail logDetail);

}
