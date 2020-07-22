// ==UserScript==
// @name     aladin.co.kr 우체국
// @version  1
// @grant    none
// @match https://www.aladin.co.kr/order/worder_step1.aspx
// ==/UserScript==

window.onload = () => {
  document.querySelector('#DeliveryMethod2').click()
}
