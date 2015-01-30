package kr.co.digigroove.smartflat.controller;

import kr.co.digigroove.smartflat.entities.ApplicantEntity;
import kr.co.digigroove.smartflat.entities.ResultEntity;
import kr.co.digigroove.smartflat.service.ApplicantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by yusul on 15. 1. 30..
 */
@RestController
public class ApplicantRestController {
    @Autowired
    ApplicantService applicantService;

    @RequestMapping(value = "/setApplican", method = RequestMethod.POST)
    public ResultEntity setApplican(ApplicantEntity applicantEntity) throws Exception {
        return applicantService.setApplicant(applicantEntity);
    }
}
