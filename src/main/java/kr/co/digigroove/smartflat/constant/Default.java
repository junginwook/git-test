package kr.co.digigroove.smartflat.constant;

public class Default {

	/** Admin */
	public static final int IS_USER		= 0;
	public static final int IS_ADMIN	= 1;
	/** ReturnResult */
	public static final int MINUS_ONE	= -1;
	public static final int ZERO			= 0;
	public static final int ONE				= 1;
	/** Y N **/
	public static final String YES	= "Y";
	public static final String NO		= "N";

	/** Result */
	public static final class Result {
		public static final String SUCCESS = "Success";
		public static final String FAIL = "Fail";
		public static final String EMPTY = "EmptyResult";
		public final static String PASSWORD_MISMATCHED = "PasswordMismatched";
	}

	/** 쿠키 */
	public static final class Cookie {
		public static final int TIME_UNIT = 60;
		public static final int LIFE_TIME_DATE = 60 * 60 * 24;
		public static final int LIFE_TIME_YEAR = 60 * 60 * 24 * 365;
		public static final String KEEP_ID_ADMIN = "keepIdAdmin";
	}

	public static final class Grade{
		public static final int ADMIN = 10;
		public static final int MANAGER = 9;
		public static final int FRANCHISE = 8;
		public static final int BRONZE = 1;
		public static final int SILVER = 2;
		public static final int GOLD = 3;
		public static final int PLATINUM = 4;
		public static final int DIAMOND = 5;
	}

	public static final class Session {
		public static final String ADMIN = "adminSession";
		public static final String USER  = "userSession";
		public static final String MANAGER = "managerSession";
	}

	/**  로그인 실패 타입 */
	public static final class LoginFailCode {
		public static final String NOT_FOUND  = "NotFoundAccount"; // 정보 미존재
		public static final String WAIT_STATE = "WaitStateAccount"; // 회원 대기상태
	}

	/** 페이지 사이즈 */
	public static class Page {
		public static final int UNIT = 10;
		public static final int SIZE = 10;
		public static final int USER_NEWS_UNIT = 6;
		public static final int USER_NEWS_SIZE = 6;
		public static final int EXCEL_UNIT = 1;
		public static final int EXCEL_SIZE = 99999999;
		public static final int MOBILE_MAIN_PRODUCT_SIZE   = 4;
		public static final int MAIN_PRODUCT_SIZE          = 12;
		public static final int CHOICE_PRODUCT_SIZE        = 30;
		public static final int MAPAGE_CHOICE_PRODUCT_SIZE = 3;
		public static final int BUYINTENTION_PAGING_NO     = 1;
	}


}