package kr.co.digigroove.smartflat.entities;

import java.util.Date;
import java.util.List;

/**
 * Created by changjo on 15. 11. 24.
 */
public class RepleEntity {

	private long repleKey;
	private long requireKey;
	private String name;
	private String reple;
	private Date registDatetime;

	private List<RepleEntity> repleEntityList;

	public long getRepleKey() {
		return repleKey;
	}

	public void setRepleKey(long repleKey) {
		this.repleKey = repleKey;
	}

	public long getRequireKey() {
		return requireKey;
	}

	public void setRequireKey(long requireKey) {
		this.requireKey = requireKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getReple() {
		return reple;
	}

	public void setReple(String reple) {
		this.reple = reple;
	}

	public Date getRegistDatetime() {
		return registDatetime;
	}

	public void setRegistDatetime(Date registDatetime) {
		this.registDatetime = registDatetime;
	}

	public List<RepleEntity> getRepleEntityList() {
		return repleEntityList;
	}

	public void setRepleEntityList(List<RepleEntity> repleEntityList) {
		this.repleEntityList = repleEntityList;
	}
}
