package kr.co.digigroove.smartflat.entities;

import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.entities.common.PageEntity;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by changjo on 15. 11. 25.
 */
public class RequirePageEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID = 1740918855762818096L;

	public RequirePageEntity(){
		super(1L, Default.Page.UNIT, Default.Page.SIZE);
	}

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

	private String excelDown;

	private List<RequirePageEntity> requirePageEntityList;

	public void setPageParams() {
		Map paramsMap = new ConcurrentHashMap<String, Object>();
		if (StringUtils.isNotEmpty(getStartDate())) 	paramsMap.put("startDate", getStartDate());
		if (StringUtils.isNotEmpty(getEndDate()))   	paramsMap.put("endDate", getEndDate());
		if (StringUtils.isNotEmpty(getSearchKey()))   paramsMap.put("searchKey", getSearchKey());
		if (StringUtils.isNotEmpty(getSearchValue())) paramsMap.put("searchValue", getSearchValue());
		if (StringUtils.isNotEmpty(getSearchState())) paramsMap.put("searchState", getSearchState());
		super.setPageParams(paramsMap);
	}

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

	public List<RequirePageEntity> getRequirePageEntityList() {
		return requirePageEntityList;
	}

	public void setRequirePageEntityList(List<RequirePageEntity> requirePageEntityList) {
		this.requirePageEntityList = requirePageEntityList;
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

	public String getExcelDown() {
		return excelDown;
	}

	public void setExcelDown(String excelDown) {
		this.excelDown = excelDown;
	}
}
