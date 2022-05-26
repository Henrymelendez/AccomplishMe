package com.skilldistillery.accomplish.data;

import com.skilldistillery.accomplish.entities.Challenge;
import com.skilldistillery.accomplish.entities.UserChallenge;

public interface UserChallengeDAO {
	
	public UserChallenge createUserChallengeExistingChallenge(UserChallenge uChallenge);
	public UserChallenge updateUserChallenge(UserChallenge uChallenge);
	public boolean deleteUserChallenge(UserChallenge uChallenge);
	public UserChallenge createUserChallengeNewChallenge(UserChallenge uChallenge, Challenge challenge);
	public UserChallenge completeUserChallenge(UserChallenge uChallenge);
	public UserChallenge abandonUserChallenge(UserChallenge uChallenge);
	public UserChallenge findById(int id);
}
