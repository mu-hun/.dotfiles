// ==UserScript==
// @name     www.aladin.co.kr/*
// @version  1
// @grant    none
// @match https://www.aladin.co.kr/*
// ==/UserScript==

window.onload = () => {
  const loginOrlogout = document.querySelector('.set3mf > a > img')
  if (loginOrlogout.alt === '로그인') loginOrlogout.click()
}
