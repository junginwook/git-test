package kr.co.digigroove.smartflat.service;

import kr.co.digigroove.smartflat.entities.ApplicantEntity;
import kr.co.digigroove.smartflat.entities.ResultEntity;

/**
 * Created by yusul on 15. 1. 30..
 */
public interface ApplicantService {
    ResultEntity setApplicant(ApplicantEntity applicantEntity) throws Exception;
}
