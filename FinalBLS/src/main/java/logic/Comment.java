package logic;

public class Comment {
	private int comnum;
	private String writer;
	private String password;
	private String contents;
	private int readcnt;
	

	
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getComnum() {
		return comnum;
	}
	public void setComnum(int comnum) {
		this.comnum = comnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "Comment [comnum=" + comnum + ", writer=" + writer + ", password=" + password + ", contents=" + contents
				+ ", readcnt=" + readcnt + "]";
	}
	
	

	
	
}
