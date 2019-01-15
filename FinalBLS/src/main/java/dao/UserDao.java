package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import dao.mapper.UserMapper;
import logic.User;

@Repository
public class UserDao {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NS="dao.mapper.UserMapper.";
	
	public void createuser(User user) {
		sqlSession.getMapper(UserMapper.class).insert(user);
	}

	public User selectuser(String userId) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("userId", userId);
		return sqlSession.selectOne(NS+"list",map);
	}

	public void update(User user) {
		sqlSession.getMapper(UserMapper.class).update(user);
	}

	public void delete(String Id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", Id);
		sqlSession.getMapper(UserMapper.class).delete(map);		
	}
	public List<User> userlist() {
		return sqlSession.selectList(NS+"list");
	}

	
	
	// idchks : test1, test2
	// ids : 'test1',test2'
	// sql : select * from useraccount where userid in('test1',test2')"
	   public List<User> userList(String[] idchks) {
		      Map<String, String[]> map = new HashMap<String, String[]>();
		      map.put("ids", idchks);
		      return sqlSession.selectList(NS+"list",map);
		   }


}
