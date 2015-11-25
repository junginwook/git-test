package kr.co.digigroove.smartflat;

import kr.co.digigroove.commons.messages.Messages;
import kr.co.digigroove.smartflat.entities.common.PageEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping ( "/test" )
public class HelloController {

  private static final Logger LOGGER = LoggerFactory.getLogger( HelloController.class );

  @Autowired
  private Messages messages;

  @RequestMapping ( method = RequestMethod.GET )
  public String printWelcome ( ModelMap model, Locale localeParam,
                               @RequestParam ( required = false, defaultValue = "1") String page,
                               @RequestParam (required = false, defaultValue = "name") String searchkey  ) {

    String msg = messages.getMessage( "system.welcome", localeParam );

    LOGGER.debug( "CurrentPage : " + page );

    PageEntity mPageEntity = new PageEntity( Long.valueOf( page ) );
    mPageEntity.setDataSize( 965 );
    Map<String, Object> paramMap = mPageEntity.getPageParams();
    paramMap.put( "searchkey", searchkey );

    mPageEntity.setPageParams( paramMap );

    model.addAttribute( "message", msg );
    model.addAttribute( "pageNavigationEntity", mPageEntity );

    return "main/main";
  }
}