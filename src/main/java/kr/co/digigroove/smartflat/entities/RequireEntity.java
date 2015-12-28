package kr.co.digigroove.smartflat.entities;

import java.util.Date;

/**
 * Created by changjo on 15. 11. 24.
 */
public class RequireEntity {

	private long requireKey;
	private String title;
	private String name;
	private String storeName;
	private String phone;
	private String email;
	private String content;
	private int state;
	private Date registDatetime;
	private Date modifyDatetime;
	private Date withdrawDatetime;
	private long reple;

	public long getRequireKey() {
		return requireKey;
	}

	public void setRequireKey(long requireKey) {
		this.requireKey = requireKey;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Date getRegistDatetime() {
		return registDatetime;
	}

	public void setRegistDatetime(Date registDatetime) {
		this.registDatetime = registDatetime;
	}

	public Date getModifyDatetime() {
		return modifyDatetime;
	}

	public void setModifyDatetime(Date modifyDatetime) {
		this.modifyDatetime = modifyDatetime;
	}

	public Date getWithdrawDatetime() {
		return withdrawDatetime;
	}

	public void setWithdrawDatetime(Date withdrawDatetime) {
		this.withdrawDatetime = withdrawDatetime;
	}

	public long getReple() {
		return reple;
	}

	public void setReple(long reple) {
		this.reple = reple;
	}
}
