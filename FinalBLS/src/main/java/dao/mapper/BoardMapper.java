package dao.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Board;

public interface BoardMapper {
	
	@Update("update board1 set subject=#{subject}, content=#{content},file1=#{fileurl} where num=#{num}")
	void update(Board board);

	@Insert("insert into board1 (num, subject, name, "
			+ "pass, content, regdate, readcnt, ref, reflevel, refstep, "
			+ "file1) values(#{num},#{subject},#{name},#{pass},#{content},now(),0, "
			+ "#{ref},#{reflevel},#{refstep},#{fileurl})")
	void insert(Board board);
	
	@Delete("delete from board1 where num=#{num}")
	void delete(Map<String, Integer> param);
	
	@Select("select ifnull(max(num), 0) from board1")
	int maxnum();
	@Update("update board1 set readcnt=readcnt+1 where num=#{num}")
	void readcntadd(Map<String, Integer> map);
	
	@Update("update board1 set refstep=refstep+1 where ref=#{ref} and refstep >#{refstep}")
	void refstep(Map<String, Integer> map);

}
