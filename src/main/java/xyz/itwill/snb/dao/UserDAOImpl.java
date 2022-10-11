
package xyz.itwill.snb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.itwill.snb.dto.User;
import xyz.itwill.snb.mapper.UserMapper;

@Repository

@RequiredArgsConstructor
public class UserDAOImpl implements UserDAO {
	private final SqlSession sqlSession;

	@Override
	public int insertUser(User user) { 
		return sqlSession.getMapper(UserMapper.class).insertUser(user);
		
	}

	@Override
	public int updateUser(User user) { 
		return sqlSession.getMapper(UserMapper.class).updateUser(user);
		
	}

	@Override
	public int deleteUser(String id) {
		// return sqlSession.getMapper(UserMapper.class).deleteUser(id);
		return 1;
	}

	@Override
	public User selectUser(String id) {
		return sqlSession.getMapper(UserMapper.class).selectUser(id);
	}
	
	@Override
	public User findId(User user) {
		return sqlSession.getMapper(UserMapper.class).selectUserId(user);
	}
	
	@Override
	public User findPasswd(User user) {
		return sqlSession.getMapper(UserMapper.class).selectUserPasswd(user);
		
	}
	
	@Override
	public int idCheck(String id) {
		return sqlSession.getMapper(UserMapper.class).idCheck(id);
	}
	
	@Override
	public int emailCheck(String email) {
		return sqlSession.getMapper(UserMapper.class).emailCheck(email);
	}

}
