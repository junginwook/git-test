package kr.co.digigroove.smartflat.entities;

/**
 * Created by changjo on 15. 11. 24.
 */
public class UserEntity {

	private long userKey;
	private String id;
	private String password;
	private String name;
	private String team;

	private String oldPassword;
	private String newPassword;

	private int isLogin;
	private int isAdmin;     // 로그인&아웃 관리자 여부
	private String keepIdYn; // 아이디 기억하기 여부

	public long getUserKey() {
		return userKey;
	}

	public void setUserKey(long userKey) {
		this.userKey = userKey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public int getIsLogin() {
		return isLogin;
	}

	public void setIsLogin(int isLogin) {
		this.isLogin = isLogin;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getKeepIdYn() {
		return keepIdYn;
	}

	public void setKeepIdYn(String keepIdYn) {
		this.keepIdYn = keepIdYn;
	}
}
