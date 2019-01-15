package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Comment;

public interface CommentMapper {
	
		@Insert("insert into shopcomment (comnum, writer,password, contents, readcnt) "
	         + "values(#{comnum},#{writer},#{password},#{contents}, 0)")
	   void insert(Comment comment);

	   @Select("select ifnull(max(comnum), 0) from shopcomment")
	   int maxnum();  
}
