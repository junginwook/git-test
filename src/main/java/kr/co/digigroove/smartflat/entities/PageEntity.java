package kr.co.digigroove.smartflat.entities;

import kr.co.digigroove.commons.entities.PageNavigationEntity;

/**
 * Created by sangyong on 11/13/14.
 */
public class PageEntity extends PageNavigationEntity {

  private static final String DEFAULT_LABEL_FIRST_PAGE = "[<<]";
  private static final String DEFAULT_LABEL_LAST_PAGE  = "[>>]";
  private static final String DEFAULT_LABEL_GROUP_PREV = "[<]";
  private static final String DEFAULT_LABEL_GROUP_NEXT = "[>]";

  public PageEntity ( final long currentPageParam, final int pageGroupSizeParam, final int pageListSizeParam ) {
    super( currentPageParam, pageGroupSizeParam, pageListSizeParam );
  }

  public PageEntity ( final long currentPageParam ) {
    super( currentPageParam );
  }

  @Override
  protected void initDefaultLabels () {

    setLabelFirstPage( DEFAULT_LABEL_FIRST_PAGE );
    setLabelGroupNext( DEFAULT_LABEL_GROUP_NEXT );
    setLabelGroupPrevious( DEFAULT_LABEL_GROUP_PREV );
    setLabelLastPage( DEFAULT_LABEL_LAST_PAGE );

  }
}
