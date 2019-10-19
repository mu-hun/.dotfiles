// ==UserScript==
// @name     kakao-pg
// @version  1
// @match https://pg-web.kakao.com/v1/*/info
// @match https://pg-web.kakao.com/v1/*/info#none
// ==/UserScript==

window.onload = () => {
  document.querySelector('#userPhone').value = '00000000000'
  document.querySelector('#userBirth').value = 000000
  document.querySelector('button.btn_payask').click()
}
