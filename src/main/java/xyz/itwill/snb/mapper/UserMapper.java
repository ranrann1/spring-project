package xyz.itwill.snb.mapper;

import xyz.itwill.snb.dto.User;

public interface UserMapper {
	int insertUser(User user);
	int deleteUser(String id);
	int updateUser(User user);
	User selectUser(String id);
	User selectUserId(User user);
	User selectUserPasswd(User user);
	int emailCheck(String email);
	int idCheck(String id);
}
