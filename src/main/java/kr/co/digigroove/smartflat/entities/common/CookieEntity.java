package kr.co.digigroove.smartflat.entities.common;

import java.io.Serializable;

/**
 * Created by bearhj on 15. 1. 2.
 */
public class CookieEntity implements Serializable {

	private static final long serialVersionUID = 6710397814189802150L;

	private String name;
	private String value;
	private int time;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}
}
