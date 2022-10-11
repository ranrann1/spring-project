
package xyz.itwill.snb.dao;

import xyz.itwill.snb.dto.User;

public interface UserDAO {
	int insertUser(User user);

	int deleteUser(String id);

	int updateUser(User user);

	User selectUser(String id);

	User findId(User user);

	User findPasswd(User user);

	int idCheck(String id);

	int emailCheck(String email);
}
