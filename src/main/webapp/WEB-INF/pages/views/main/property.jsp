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
<script type="text/javascript">
    $(function() {
        $('.icon-inquiry, .icon-property, .icon-free-design').hide();
    });
</script>
<div id="demo1" class="fullSection" style="background:#333">
    <div class="property-video">
        <iframe src="https://www.youtube.com/embed/OBPNARwdBTo?&amp;controls=0&amp;showinfo=0&amp;autoplay=1&amp;loop=1&amp;playlist=OBPNARwdBTo&wmode=opaque" frameborder="0" allowfullscreen></iframe>
    </div>
    <div class="property-wrap">
        <div class="top-area">
            <img src="${contextPath}/resources/img/property-topcont.jpg" alt="경쟁력이 팍팍! 공인중계사 사무실에 특화된 디지털 전자 게시판 스마트플랫 스마트플랫이 잠자는 TV를 멋진 디지털게시판으로 만들어드립니다. "/>
        </div>
        <div class="bottom-area clear_fix">
            <div class="inquiry txt">
                <h1>상담 및<span class="block">문의하기</span></h1>
                <h2>TV의 놀라운 변신!!</h2>
                <p>
                    장비구입이 부담스럽다구요?<br/>
                    <span class="colorR">HDMI단자가 있는 TV만 있으면 OK!</span><br/>
                    현재 <b>사용하는 TV에 스마트플랫만</b> 장착하셔도<br/>
                    멋진 디지털 전자 게시판이 됩니다.
                </p>
            </div>
            <div class="inquiry form">
                <%--<div class="notice">--%>
                    <%--현재 서버 점검중입니다.<br/>--%>
                    <%--<b>상담 및 견적문의</b>는<br/> <b>전화</b>부탁드립니다.--%>
                <%--</div>--%>
                <form class="applicanForm">
                    <table>
                        <colgroup>
                            <col width="18%"/>
                            <col width="82%"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="subject" placeholder="제목"/></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="name" placeholder="이름"/></td>
                        </tr>
                        <tr>
                            <th>연락처</th>
                            <td><input type="tel" name="tel" placeholder="연락처"/></td>
                        </tr>
                        <tr>
                            <th>이메일<span class="inline-block">주소</span></th>
                            <td><input type="email" name="email" placeholder="이메일주소"/></td>
                        </tr>
                        <tr>
                            <th>의뢰<span class="inline-block">내용</span></th>
                            <td>
                                <textarea  class="content ui-input-text ui-shadow-inset ui-body-inherit ui-corner-all ui-textinput-autogrow" placeholder="의뢰내용" style="height: 95px;"></textarea>
                                <input type="hidden" name="content" value="" />
                            </td>
                        </tr>
                        <%--<tr>--%>
                        <%--<th>첨부<span class="inline-block">파일</span></th>--%>
                        <%--<td><input type="file"/></td>--%>
                        <%--</tr>--%>
                        </tbody>
                    </table>
                    <div class="btn-area clear_fix">
                        <input type="button" value="전송" class="btn-black submit"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>