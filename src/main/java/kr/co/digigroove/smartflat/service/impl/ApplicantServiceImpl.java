package kr.co.digigroove.smartflat.service.impl;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.constant.Default;
import kr.co.digigroove.smartflat.dao.ApplicantDAO;
import kr.co.digigroove.smartflat.entities.ApplicantEntity;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.service.ApplicantService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by yusul on 15. 1. 30..
 */

@Service("ApplicantService")
public class ApplicantServiceImpl implements ApplicantService {
    @Autowired
    private ApplicantDAO applicantDAO;
    @Autowired
    private Messages messages;

    private static final Logger logger = LoggerFactory.getLogger(ApplicantServiceImpl.class);

    @Override
    public ResultEntity setApplicant(ApplicantEntity applicantEntity) throws Exception {
        ResultEntity result = new ResultEntity();
        String resultCd = Default.Result.FAIL;

        String resultMsg = messages.getMessage("common.save.fail");
        try {
            int resultVal = applicantDAO.setApplicant(applicantEntity);
            if(Default.ZERO < resultVal) {
                resultCd = Default.Result.SUCCESS;
                resultMsg = messages.getMessage("common.save.success");
            }
        }catch (Exception e){
            logger.error("ApplicantServiceImpl.setApplicant:Failed", e);
        }
        result.setCode(resultCd);
        result.setMessage(resultMsg);
        return result;
    }
}
