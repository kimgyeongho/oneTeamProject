						
/*
 파일명 : Sample.jsp
 내  용 : 주소입력화면 (Sample.jsp ↔jusoPopup.jsp ↔ 도로명주소 팝업API )
*/

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript">
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
    var pop = window.open("/popup/jusoPopupENG.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
						, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddr.value = roadAddr;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
}
</script>
<title>주소 입력 샘플</title>
</head>
<body>
<form name="form" id="form" method="post">
	<table >
			<colgroup>
				<col style="width:20%"><col>
			</colgroup>
			<tbody>
				<tr>
					<th>우편번호</th>
					<td>
					    <input type="hidden" id="confmKey" name="confmKey" value=""  >
						<input type="text" id="zipNo" name="zipNo" readonly style="width:100px">
						<input type="button"  value="주소검색" onclick="goPopup();">
					</td>
				</tr>
				<tr>
					<th>도로명주소</th>
					<td><input type="text" id="roadAddr" style="width:85%"></td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td><input type="text" id="addrDetail" style="width:85%" ></td>
				</tr>
			</tbody>
		</table>
</form>
</body>
</html>