<%--
  Created by IntelliJ IDEA.
  User: yusul
  Date: 15. 1. 30.
  Time: 오전 4:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div id="demo1" class="fullSection">
    <div class="contents_1">
        <div class="area">
            <div class="video-area">
                <style>
                    .trailer { position:relative; padding-bottom:56.25%; }
                    .trailer iframe { position:absolute; width:100%; height:100%; }
                </style>
                <div class="trailer">
                    <iframe src="//player.vimeo.com/video/118569708?badge=0&amp;color=ffffff&amp;autoplay=1" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen>
                    </iframe></div>
            </div>
        </div>
    </div>
</div>
<div id="demo2" class="fullSection">
    <div class="contents_2">
        <div class="area">
            <h1 class="logo"><img src="${contextPath}/resources/img/smartflat-info/logo-kr.png" alt="스마트플랫"/></h1>
            <div class="smartflat-info">
                <div class="txt-area">
                    <h1 class="title">쉽고 폼나는 <b>디지털광고게시판</b>은 없을까?</h1>
                    <p>매장의 메뉴판, 게시판 글자 하나 바꾸는데 인테리어 업자를 부르고 메뉴판을 떼어내서 고치고, 붙이시는 사장님<span class="block"></span>
                        성형수술 이벤트를 하고 있는데 고객들께 생생하게 알리는 게시판은 없을까? 고민하시는 병원장님<span class="block"></span>
                        학원생들이 시간표를 그때그때 확인하고 공지사항을 수시로 바꿀 수 있는<span class="block"></span>
                        저비용이며, 쉽고 폼나는 디지털 광고 게시판은 없을까? 고민하시는 학원장 선생님 들의<span class="block"></span>
                        이런저런 고민들을 해결할 방법을 저희는 고민했죠.<span class="block"></span>
                        비용은 저렴하고, 고급스럽고 디자인도 예쁜 <span class="block"></span>
                        신개념 디지털 광고 게시판을 말이죠. 그리고 만들었습니다. <span class="block"></span>
                        스마트플랫을 말입니다.</p>
                </div>
                <div class="img-area">
                    <div class="img-left"><img src="${contextPath}/resources/img/smartflat-info/smartflat-img-01.png" alt="기존 메뉴판 만드는 예시"/></div>
                    <div class="img-right"><img src="${contextPath}/resources/img/smartflat-info/smartflat-img-02.png" alt="스마트플랫 예시"/></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="demo3" class="fullSection">
    <div class="contents_3">
        <div class="area">
            <div class="smartflat">
                <h1 class="logo"><img src="${contextPath}/resources/img/smartflat/logo.png" alt="스마트플랫"/></h1>
                <dl>
                    <dt>Smart Flat</dt>
                    <dd>LED나 LCD를 활용한 신개념 디스플레이 광고게시판으로, <br/>
                        소형PC가 내장돼있어 컨텐츠 편집이 자유롭고 다양한 파일을 선명하고 다양하게 극적으로 표현할 수 있습니다.
                        소규모 점포에서부터 효과적인 홍보수단이 필요한 체인가맹점 까지 저렴한 비용과 쉬운 유지 보수가 가능한 <span>스마트플랫</span>으로 <span>드라마틱한 효과</span>를 만나보십시오.</dd>
                    <dt>다시 말해서 이런 효과가 있습니다</dt>
                    <dd>기업 또는 개인이 고객에게 맞는 광고를 구현하여 <br/>홍보효과 극대화<br/>
                        시선을 끄는 디스플레이와 광고 효과<br/>
                        편리하고 다양한 마케팅 채널제공<br/>
                        독립적, 중앙집중, 분산구조 등 어떤 환경에서의 적용 가능<br/>
                        인력과 시간, 비용의 획기적인 감소와 광고 관리의 용이<br/>
                        네트워크 기반의 실시간 정보 제공<br/>
                        신속하고 정확한 정보 및 공지사항 전달</dd>
                </dl>
            </div>
            <div class="smartflat-img"><img src="${contextPath}/resources/img/smartflat/bg.png" alt="스마트플랫 소개"/></div>
        </div>
    </div>
</div>
<div id="demo4" class="fullSection">
    <div class="contents_4">
        <div class="area">
            <h1 class="title">안성맞춤 같은<b>디스플레이</b></h1>
            <div class="over-hidden top-area">
                <div class="txt">
                    <dl>
                        <dt>Smart Flat은</dt>
                        <dd>
                            <p>각 매장의 공간과 특성을 감안하여 다양한 맞춤식 디스플레이를 구성합니다. <br/>
                                모니터는 32inch , 42inch, 55inch 의 디스플레이가 준비되며,  2단, 3단, 4단의 세로와 가로의 구성이 기본입니다.<br/>
                                또한, 매장의 요구에 따라 변형과 조합도 가능합니다. 스마트플랫으로 어디에도 없는 특별한 레이아웃으로 꾸며 보십시오.<br/>
                                 매장을 더욱 빛나게 해 보십시오.</p>
                        </dd>
                    </dl>
                </div>
            </div>
            <div class="over-hidden">
                <div class="display-size">
                    <img src="${contextPath}/resources/img/display/display-size.png" alt="디스플레이 사이즈 비교"/>
                </div>
                <div class="display-more">
                    <span class="button" id="btnDisplay"><img src="${contextPath}/resources/img/display/btn-display-more.png" alt="다양한 구성 자세히 보기"/></span>
                </div>
                <div id="Popup-display">
                    <div class="popup-box">
                        <div class="title">
                            스마트플랫에서 일반적으로 많이 사용하시는 조합입니다.
                            <p>물론 매장의 환경에 따라 다양하게 조합도 가능합니다.</p>
                            <p class="orenge">*공급량 변동에 따라 제조사 변경 또는 모니터 모델 변경에 따라 차이가 있을 수 있습니다.</p>
                        </div>
                        <p class="btn-close"><button class="popClose">닫기</button></p>
                    </div>
                    <img src="${contextPath}/resources/img/display/img-display-view.jpg" alt="다양한 구성 자세히 보기"/>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="demo5" class="fullSection">
    <div class="contents_5">
        <div class="area">
            <h1 class="title">특화된 기능</h1>
            <div class="portfolio-area">
                <div class="portfolio" id="portfolio">
                    <div class="portfolio-info info1">
                        <div class="info-img clear_fix">
                            <div class="board1">
                                <p>CAFE DE MAMA</p>
                                <div class="img-board">
                                    <div id="slide" class="wrap">
                                        <ul class="img-list">
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-01.png" alt="카페"/></li>
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-02.png" alt=""/></li>
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-03.png" alt=""/></li>
                                        </ul>
                                    </div>
                                    <img src="${contextPath}/resources/img/portfolio/bg-deviec1-img-01.png" alt="프레임"/>
                                </div>
                                <div class="text-board clear_fix">
                                    <div>
                                        <h2>Espresso based hot</h2>
                                        <ul>
                                            <li>아메리카노<span>5,000</span></li>
                                            <li>에스프레소<span>5,000</span></li>
                                            <li>에스프레소<span>5,000</span></li>
                                            <li>마끼아또<span>5,000</span></li>
                                            <li>에스프레소 콘파냐<span>5,000</span></li>
                                            <li>카페라떼<span>5,000</span></li>
                                            <li>카푸치노 <span>5,000</span></li>
                                            <li>카페모카<span>5,000</span></li>
                                            <li>카라멜 모카<span>5,000</span></li>
                                            <li>카라멜 마끼아토<span>5,000</span></li>
                                            <li>바닐라라떼<span>5,000</span></li>
                                            <li>토피넛라떼<span>5,000</span></li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h2>Espresso based ice</h2>
                                        <ul>
                                            <li>아메리카노<span>5,000</span></li>
                                            <li>에스프레소<span>5,000</span></li>
                                            <li>에스프레소<span>5,000</span></li>
                                            <li>마끼아또<span>5,000</span></li>
                                            <li>에스프레소 콘파냐<span>5,000</span></li>
                                            <li>카페라떼<span>5,000</span></li>
                                            <li>카푸치노 <span>5,000</span></li>
                                            <li>카페모카<span>5,000</span></li>
                                            <li>카라멜모카<span>5,000</span></li>
                                            <li>카라멜마끼아토<span>5,000</span></li>
                                            <li>바닐라라떼<span>5,000</span></li>
                                            <li>토피넛라떼<span>5,000</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="board2 bg-board">
                                <div class="widget-top">
                                    <div class="clock">
                                        <ul class="analog-clock analog">
                                            <li class="hour"></li>
                                            <li class="min"></li>
                                            <li class="sec"></li>
                                        </ul>
                                    </div>
                                    <div id="cafe_weather">
                                        <p class="today-date"></p>
                                        <p class="location">서울</p>
                                        <div class="weather"></div>
                                    </div>
                                </div>
                                <div class="text-board clear-fix">
                                    <h2>오늘의 날씨와 잘 맞는<span>추천메뉴</span></h2>
                                    <ul>
                                        <li>화이트 초콜릿마끼아또 + 코코넛와플<span>10,000</span></li>
                                        <li>카페라떼 + 초코퍼지<span>10,000</span></li>
                                        <li>카페라떼 + 크림파이<span>10,000</span></li>
                                    </ul>
                                    <dl>
                                        <dt>open</dt>
                                        <dd>pm 02:00</dd>
                                        <dt>close</dt>
                                        <dd>am 02:00</dd>
                                    </dl>
                                </div>
                                <div class="text-info">
                                    <h2>안녕하세요?</h2>
                                    <p>우리 CAFE DE MAMA를 방문해 주셔서 감사합니다.<br>2015년 을미년 새해에도 하시고자 하는 일 모두<br>성취하시고 가정과 직장에서 행복과 건강이 가득하시길<br>기원합니다. ALLWAYS는 언제나 고객님께 편안한<br>맛의 추억을 전해드리고자 노력하겠습니다.</p>
                                    <p>CAFE DE MAMA</p>
                                </div>
                            </div>
                            <div class="board1">
                                <p>CAFE DE MAMA</p>
                                <div class="img-board">
                                    <div id="slide2" class="wrap">
                                        <ul class="img-list">
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-01.png" alt=""/></li>
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-02.png" alt=""/></li>
                                            <li><img src="${contextPath}/resources/img/portfolio/device1-img-03.png" alt=""/></li>
                                        </ul>
                                    </div>
                                    <img src="${contextPath}/resources/img/portfolio/bg-deviec1-img-01.png" alt="프레임"/>
                                </div>
                                <div class="text-board clear_fix">
                                    <div>
                                        <h2>Waffle</h2>
                                        <ul>
                                            <li>비벼먹는 딸기<span>5,000</span></li>
                                            <li>페스츄리<span>5,000</span></li>
                                            <li>비벼먹는 블루베리<span>5,000</span></li>
                                            <li>페스츄리<span>5,000</span></li>
                                            <li>비벼먹는 초콜릿<span>5,000</span></li>
                                            <li>페스츄리<span>5,000</span></li>
                                            <li>티라미스 와플<span>5,000</span></li>
                                            <li>콩떡와플<span>5,000</span></li>
                                            <li>코코넛와플<span>5,000</span></li>
                                            <li>블루베리크림치즈와플<span>5,000</span></li>
                                            <li>블루베리요거트와플<span>5,000</span></li>
                                            <li>카라멜바나나와플<span>5,000</span></li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h2>Cake</h2>
                                        <ul>
                                            <li>떠먹는 플라워케이크<span>5,000</span></li>
                                            <li>승리의 그라운드케익<span>5,000</span></li>
                                            <li>리얼 티라미스컵케익<span>5,000</span></li>
                                            <li>베네치즈케익<span>5,000</span></li>
                                            <li>초코퍼지<span>5,000</span></li>
                                        </ul>
                                        <h2>Bingsu</h2>
                                        <ul>
                                            <li>떠먹는 플라워케이크<span>5,000</span></li>
                                            <li>승리의 그라운드케익<span>5,000</span></li>
                                            <li>리얼 티라미스컵케익<span>5,000</span></li>
                                            <li>베네치즈케익<span>5,000</span></li>
                                            <li>초코퍼지<span>5,000</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">추운날은 핫초코!!</p>
                            <p class="sub-txt">날씨나 기온에 따라 <span class="inline-block">걸맞는 메뉴를 추천해</span> 보거나 <br/>분위기를 바꿔보면 어떨까요?</p>
                            <p>변화 없이 잘 표시된 고정 메뉴판
                                <span class="inline-block">물론 좋습니다.</span> 그런데 날씨나 계절에 <span class="inline-block">따라 변하는게</span> 사람 심리죠.
                                <span class="inline-block">비가 오는 날이나, 눈오는 날,</span>
                                <span class="inline-block">추운날이나 더운날에</span>분위기에 맞춰
                                <span class="inline-block">테마도 바뀌고</span> 추천메뉴도 생기는 똑똑한 감성을 가진 게시판은 어떨까요? 고객님들의 감성을 자극해보세요.
                                <span class="inline-block">스마트플랫은</span> 감성을 전달해드립니다.</p>
                        </div>
                    </div>
                    <div class="portfolio-info info2">
                        <div class="info-img clear_fix">
                            <div>
                                <div class="portfolio-video"><img src="${contextPath}/resources/img/portfolio/portfolio-06-00.jpg" alt=""/></div>
                                <div class="text-contents-01">
                                    <p class="title">대표원장 인사말</p>
                                    <div class="txt-desc">
                                        손끝에 진심을 담으면 공감이 따라 옵니다.<br>
                                        성형은 단순히 외적인 변화만을 말하는 것이 아니라 내면의 변화를 통한 생활 전체의 만족을 얻는 것입니다.<br>
                                        병원의 일방적인 결정이 아닌 고객 개개인의 개성에 맞춘 진정성 있는 소통은 지금까지 OO이 걸어온 길이며, 또 앞으로도 변함없이 걸어가야 할 길이라고 합니다.<br>
                                        앞으로도 진심을 담은 소통과 고객이 OO의 한 가족이라는 철학을 잃지 않고 수준 높은 서비스로 만족과 믿을을 드리는 OO성형외과의원이 되겠습니다.<br>
                                        감사합니다.<br><br>
                                        OO성형외과의원 대표원장 OOO
                                    </div>
                                </div>
                            </div>
                            <div class="bg-board">
                                <div class="portfolio-date">
                                    <p class="today-date">2015.01.20</p>
                                    <div class="weather clear_fix">
                                        <div class="weather-area">
                                            <div id="weather"></div>
                                        </div>
                                    </div>
                                    <%--digital clock--%>
                                    <div class="clock" style="overflow:hidden;">
                                        <div class="clockWidget"></div>
                                    </div>
                                </div>
                                <div class="text-contents-02">
                                    <dl class="align-right">
                                        <dt class="font12">진료시간</dt>
                                        <dd>OPEN</dd>
                                        <dd>CLOSE</dd>
                                    </dl>
                                    <dl class="align-center">
                                        <dt>평일</dt>
                                        <dd class="font12">am09:00</dd>
                                        <dd class="font12">pm07:30</dd>
                                    </dl>
                                    <dl class="align-center">
                                        <dt>주말</dt>
                                        <dd class="font12">am09:30</dd>
                                        <dd class="font12">pm04:00</dd>
                                    </dl>
                                </div>
                                <div class="text-contents-03">
                                    <p>수,금 야간진료 pm 08:00 까지<br>일요일, 공휴일,국경일은 휴무입니다.</p>
                                    <p class="floatR">진료문의 및 상담<br>Tel. 3277-3300</p>
                                </div>
                                <%--calendar--%>
                                <div class="portfolio-calendar"></div>
                            </div>
                            <div class="slide-viewer">
                                <div id="slide-img" class="slide-wrap">
                                    <div class="slide-banner clear_fix">
                                        <img src="${contextPath}/resources/img/portfolio/portfolio-06-01.jpg" alt=""/>
                                        <img src="${contextPath}/resources/img/portfolio/portfolio-06-02.jpg" alt=""/>
                                        <img src="${contextPath}/resources/img/portfolio/portfolio-06-03.jpg" alt=""/>
                                    </div>
                                </div>
                                <div class="text-contents-04">
                                    <p class="title">울트라포머</p>
                                    <ul>
                                        <li>
                                            <span class="point-price">79</span>만원<br>
                                            울트라포머1회 + 실50개 + 사각턱보톡스
                                        </li>
                                        <li class="bg-bedge">
                                            <span class="point-price">89</span>만원<br>
                                            울트라포머1회 + 필러2개 + 사각턱보톡스
                                        </li>
                                        <li>
                                            <span class="point-price">99</span>만원<br>
                                            울트라포머2회 + 필러1개
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">글쎄요?</p>
                            <p class="sub-txt">달랑 사진 한장만으로 원장님의 실력을 전부 <br>보여주실 수 있을까요?</p>
                            <p>성공적인 시술사진들을 다양하고 <span class="inline-block">다이나믹한</span> 효과를 통한 이미지 <span class="inline-block">슬라이드로</span> 보여주세요.
                                <span class="inline-block">독특한 화면</span> 효과로 고객님들의 시선을 사로잡고
                                <span class="inline-block">병원의</span> 신뢰를 널리 홍보하십시오.
                                <span class="inline-block">텍스트만</span> 수정해도 홍보보드로 또는 <span class="inline-block">시술후기</span> 게시판으로도 활용이 됩니다.<br/>물론 쉽고 빠르게 공짜로요.</p>
                        </div>
                    </div>

                    <div class="portfolio-info info3">
                        <div class="info-img clear_fix">
                            <div class="academy">
                                <div class="bg-wood-side">
                                    <p class="class-title">수강료 안내</p>
                                    <div class="class-content">
                                        수능스쿨 모든 교육과정의 수강료는 월 48만원으로 동일합니다.  ( 3개월분 납부시 5% 할인됩니다. )<br/><br/>
                                        1:1 개인별 맞춤식의 진도이므로 월중에도 언제든시 신청하여 들으실 수 있으며, 월말까지의 나머지 수강료만 납부하시면 됩니다.<br/><br/>
                                        계좌이체나 현금납부의 경우, 현금영수증이 의무발행되며, 상담 또는 첫수업시 신용카드결제도 가능합니다.
                                    </div>
                                    <p class="class-title">강의 안내</p>
                                    <div class="class-content">
                                        <dl>
                                            <dt>중등영어中等英語</dt>
                                            <dd>교육대상/ 중학교 1~2학년<br/>수업시간/ 주 3회 1시간 30분씩 + 개별 Clinic Time</dd>
                                            <dt>고등영어高等英語</dt>
                                            <dd>교육대상/ 고등학교 1~2학년<br/>수업시간/ 주 3회 1시간 30분씩 + 개별 Clinic Time</dd>
                                            <dt>중등수학中等數學</dt>
                                            <dd>교육대상/ 중학교 1~2학년<br/>수업시간/ 주 3회 1시간 30분씩 + 개별 Clinic Time</dd>
                                            <dt>고등수학高等數學</dt>
                                            <dd>교육대상/ 예비 고1, 고2, 고3<br/>수업시간/ 주 2회 2time(주 4시간), 보충수업</dd>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                            <div class="academy bg-board">
                                <div class="bg-wood-center">
                                    <div class="class-widget">
                                        <div class="date-box">
                                            <p class="today-date day"></p>
                                            <div id="reading_room">
                                                <!--<div class="clock-area" style="width: 50%; height: 100%;float: left;"></div>-->
                                                <div class="weather-area"">
                                                    <p class="icon"></p>
                                                    <p class="location">서울</p>
                                                    <p class="today-temp"></p>
                                                </div>
                                            </div>
                                            <div class="class-clock">
                                                <!--시계-->
                                                <div class="clock">
                                                    <ul class="analog-clock analog-02">
                                                        <li class="hour"></li>
                                                        <li class="min"></li>
                                                        <li class="sec"></li>
                                                    </ul>
                                                </div>
                                                <!--시계끝-->
                                            </div>
                                        </div>
                                        <div class="d-day-box">
                                            <p class="title">수능 D-day</p>
                                            <div class="countdownwrap"></div>
                                        </div>
                                    </div>
                                    <p class="class-title">공지사항</p>
                                    <div class="class-content">
                                        <div class="notice-rolling">
                                            <dl class="pdL10 mgB10">
                                                <dt>제5회 공무원 학원 자체 모의고사 실시 안내</dt>
                                                <dd>·일시 : 1월25일(일)</dd>
                                                <dd>·시간 : 오전 11시 ~ 오후 12시40분</dd>
                                                <dd>·전형료 : 2,000원</dd>
                                                <dd>·접수 : 1월24일(토)까지</dd>
                                            </dl>
                                            <dl class="pdL10 mgB10">
                                                <dt>2015년 국가직 시험 대비 단과반 선착순 모집</dt>
                                                <dd>·개강일 : 2월2일(월)</dd>
                                                <dd>·강사 : 국어(박성민 교수), 영어(다니엘배 교수), 한국사(김춘추 교수), 사회(문인수 교수)</dd>
                                                <dd>·주의 : 시간표가 일부 변경될 수 있습니다.</dd>
                                            </dl>
                                            <dl class="pdL10 mgB10">
                                                <dt>2015 국가직 시험 대비 종합반 선착순 모집</dt>
                                                <dd>·개강일 : 3월2일(월)</dd>
                                                <dd>·강사 : 한국사(김춘추 교수), 사회(문인수 교수), 국어(박성민 교수), 영어(다니엘배 교수)</dd>
                                                <dd>·주의 : 시간표가 일부 변경될 수 있습니다.</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="academy">
                                <div class="bg-wood-side">
                                    <p class="class-title">독서실 이용안내</p>
                                    <div class="class-content">
                                        <p class="cont-tit">[Time]</p>
                                        <ul>
                                            <li>월~금</li>
                                            <li>Open pm 2:00</li>
                                            <li>Close am 2:00</li>
                                        </ul>
                                        <ul>
                                            <li>주말</li>
                                            <li>Open pm 9:00</li>
                                            <li>Close am 2:00</li>
                                        </ul>
                                        <p class="cont-tit">[Price]</p>
                                        <dl>
                                            <dd><span>지정석</span>160,000원</dd>
                                            <dd><span>일반석</span>130,000원</dd>
                                            <dd><span>학원생할인</span>100,000원(월)</dd>
                                            <dd><span>락커이용료</span>20,000원(월, 학원생무료)</dd>
                                        </dl>
                                    </div>
                                    <p class="class-title">좌석안내</p>
                                    <div class="class-content-02">
                                        <img src="${contextPath}/resources/img/portfolio/academy-seat-info.png" alt="독서실 좌석안내"/>
                                    </div>
                                    <p class="place1 flash animated infinite"></p>
                                    <p class="place2 flash animated infinite"></p>
                                </div>
                            </div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">자리있나요?</p>
                            <p class="sub-txt">독서실 실장님!! 솔직히<span class="inline-block">자리 체크하는 거</span> 힘드시죠?</p>
                            <p>독서실의 자리배치는물론 현황까지..
                                자리있나요? 라고 물어보는 것도<span class="inline-block">입아픕니다.</span>
                                이용객은 그냥 보면 되죠. 그리고 원하는자리를 고르면 됩니다.
                                스마트플랫으로 실시간으로 연동되는 좌석 체크 기능과 특화된 위젯으로<span class="inline-block">품격있는</span> 독서실로 거듭나보십시오.</p>
                        </div>
                    </div>

                    <div class="portfolio-info info4">
                        <div class="info-img clear_fix">
                            <div style="background:none;border:0px"></div>
                            <div>
                                <img src="${contextPath}/resources/img/portfolio/portfolio-01.png" alt="게시판"/>
                                <div class="txt-view">
                                    <ul>
                                    </ul>
                                </div>
                            </div>
                            <div style="background:none;border:0px"></div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">자랑하고 싶으시죠?!</p>
                            <p class="sub-txt">자랑을 어떻게하면 근사하게 할까요?</p>
                            <p>원생들과 함께 땀흘려 고생한 보람이죠 각종 수상과 입학말입니다. 간단하게 입력하는 것만으로도 디지털게시판에 떡하니 올릴수가 있죠. <br>학원의 영광과 자랑거리를 스마트플랫 게시판에 <span class="inline-block">당당하게</span> 게시해보십시오.</p>
                            <div class="txt-input">
                                <label>
                                    <textarea></textarea>
                                </label>
                                <button>적용</button>
                            </div>
                        </div>
                    </div>
                    <div class="portfolio-info info5">
                        <div class="info-img clear_fix">
                            <div style="background:none;border:0px"></div>
                            <div>
                                <img src="${contextPath}/resources/img/portfolio/portfolio-04.png" alt="매장"/>
                                <p class="portfolio-04-tit flash animated infinite"><img src="${contextPath}/resources/img/portfolio/portfolio-04-tit.png" alt=""/></p>
                            </div>
                            <div style="background:none;border:0px"></div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">와우! 당첨!!</p>
                            <p class="sub-txt">소소한 재미, 소통하는 게시판이 여기있어요!</p>
                            <p>영수증에 표시를 해서 수거함에 <span class="inline-block">넣는다던지,</span> 양식에 글씨를 쓴다던지
                                <span class="inline-block">무언가</span> 고객참여 행사를 하기위해 고민할 필요가 없습니다. 코드 스캔같은
                                <span class="inline-block">간편한 방법으로</span> 다양한 이벤트로 <span class="inline-block">고객참여도를</span> 증가 시킬 수 있습니다. </p>
                        </div>
                    </div>

                    <div class="portfolio-info info6">
                        <div class="info-img clear_fix">
                            <div style="background:none;border:0px"></div>
                            <div>
                                <img src="${contextPath}/resources/img/portfolio/portfolio-05.png" alt="캘린더"/>
                            </div>
                            <div style="background:none;border:0px"></div>
                        </div>
                        <div class="txt-info">
                            <p class="tit">캘린더<span class="font24">를</span> 어디서 구하나?</p>
                            <p class="sub-txt">요즘 캘린더 구하기 힘들죠<span class="inline-block">은행 로고찍힌</span> 촌스런
                                <span class="inline-block">캘린더도 말입니다.</span>
                                <span class="inline-block">물론 돈주고 사기도 아깝고</span></p>
                            <p>그런데, 멀티미디어게시판 <span class="inline-block">스마트플랫을 설치했더니</span> 게시판 <span class="inline-block">수정도</span> 쉽고 빠르게 되지만
                                캘린더가 시간에 밎춰 스스로 업데이트됩니다. 스킨만 바꿔도 새로운 캘린더가 <span class="inline-block">적용되구요.</span><br/>
                                멀티미디어 게시판에 능동적인 <span class="inline-block">캘린더는 덤입니다.</span></p>
                        </div>
                    </div>
                </div>
                <div class="thumb-area">
                    <ul>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-03.png" alt="카페"/></a></li>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-06.png" alt="병원"/></a></li>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-02.png" alt="독서실"/></a></li>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-01.png" alt="게시판"/></a></li>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-04.png" alt="매장"/></a></li>
                        <li><a href=""><img src="${contextPath}/resources/img/portfolio/portfolio-thumb-05.png" alt="캘린더"/></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${contextPath}/resources/js/flipclock.min.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.clock.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.calendar-widget.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/countdown.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/portfolio.js"></script>