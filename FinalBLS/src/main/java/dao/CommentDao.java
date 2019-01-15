package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dao.mapper.CommentMapper;
import logic.Comment;

@Repository
public class CommentDao {
	  @Autowired
	   private SqlSessionTemplate sqlSession;
	   private final String NS="dao.mapper.CommentMapper.";
	   
	   public void commentRegister(Comment comment) {
	      sqlSession.getMapper(CommentMapper.class).insert(comment);
	   }
	   
	   public int maxnum() {
	      int i = sqlSession.getMapper(CommentMapper.class).maxnum();
	      return i;
	   }
	   
	   public List<Comment>list(){
	      return sqlSession.selectList(NS+"list");
	   }
}
