package kr.co.digigroove.smartflat.entities;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by yusul on 15. 1. 30..
 */
public final class ApplicantEntity implements Serializable {
    private static final long serialVersionUID = -5331213881756527994L;

    private String  appType;        //타입
    private String  category;       //카테고리
    private String  name;           //이름
    private String  tel;            //연락처
    private String  email;          //이메일
    private String  subject;        //제목
    private String  company;        //회사명
    private String  content;        //내용
    private String  opt1;           //여분 컬럼
    private String  opt2;           //여분 컬럼
    private String  opt3;           //여분 컬럼
    private String  opt4;           //여분 컬럼
    private int     stat;           //상태
    private int     yammer;         //야머?
    private Date    modifyDate;     //수정일
    private Date    regDate;        //작성일

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getAppType() {
        return appType;
    }

    public void setAppType(String appType) {
        this.appType = appType;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOpt1() {
        return opt1;
    }

    public void setOpt1(String opt1) {
        this.opt1 = opt1;
    }

    public String getOpt2() {
        return opt2;
    }

    public void setOpt2(String opt2) {
        this.opt2 = opt2;
    }

    public String getOpt3() {
        return opt3;
    }

    public void setOpt3(String opt3) {
        this.opt3 = opt3;
    }

    public String getOpt4() {
        return opt4;
    }

    public void setOpt4(String opt4) {
        this.opt4 = opt4;
    }

    public int getStat() {
        return stat;
    }

    public void setStat(int stat) {
        this.stat = stat;
    }

    public int getYammer() {
        return yammer;
    }

    public void setYammer(int yammer) {
        this.yammer = yammer;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }
}
