package kr.co.digigroove.smartflat.entities;

import java.io.Serializable;

/**
 * Created by bearhj on 14. 12. 8.
 */
public class ResultEntity implements Serializable {

	private static final long serialVersionUID = -7085419614315973729L;

	private String message;
	private String url;
	private String code;

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
