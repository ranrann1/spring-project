
package xyz.itwill.snb.service;

import xyz.itwill.snb.dto.User;
import xyz.itwill.snb.exception.LoginAuthFailException;
import xyz.itwill.snb.exception.UserExistsException;
import xyz.itwill.snb.exception.UserNotFoundException;

public interface UserService {
	void addUser(User user) throws UserExistsException;

	void modifyUser(User user) throws UserNotFoundException;

	void removeUser(String id) throws UserNotFoundException;

	User getUser(String id) throws UserNotFoundException;

	void loginAuth(User user) throws LoginAuthFailException;

	User findPasswd(User user) throws UserNotFoundException;

	User findId(User user) throws UserNotFoundException;

	void modifyPasswd(User user) throws UserNotFoundException;
	
	int idCheck(String id);
	
	int emailCheck(String email);
}
