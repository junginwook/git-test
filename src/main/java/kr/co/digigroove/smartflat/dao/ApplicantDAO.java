package kr.co.digigroove.smartflat.dao;

import kr.co.digigroove.smartflat.entities.ApplicantEntity;

/**
 * Created by yusul on 15. 1. 30..
 */
public interface ApplicantDAO {

    /**
     * 구매문의 사항 등록
     * @param applicantEntity
     * @return
     */
    int setApplicant(ApplicantEntity applicantEntity);
}
