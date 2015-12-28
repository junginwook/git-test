package kr.co.digigroove.smartflat.entities;

/**
 * Created by bearhj on 14. 12. 8.
 */
public class ErrorResultEntity extends ResultEntity {
	private static final long serialVersionUID = 5467847837982225023L;

	private String redirect;
	private String isAdmin;

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
}
