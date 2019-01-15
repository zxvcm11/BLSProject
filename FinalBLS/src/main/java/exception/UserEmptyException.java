package exception;

public class UserEmptyException extends RuntimeException {

	private String url;

	public UserEmptyException(String msg,String url) {
		super(msg);
		this.url = url;
	}
	public String getUrl() {
		return url;
	}

}