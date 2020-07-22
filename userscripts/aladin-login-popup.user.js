// ==UserScript==
// @name     aladin.co.kr/login
// @version  1
// @grant    none
// @match https://www.aladin.co.kr/login/wlogin_popup.aspx*
// ==/UserScript==

window.onload = () => {
  document.querySelector('.left1_right > a').click()
}
