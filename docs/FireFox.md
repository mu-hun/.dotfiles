# FireFox

## Add-ons
- Bitly
- Dark Mode
- Facebook Container
- HTTPS Everywhere
- Tree Tabs
- Vim Vixen
- Adblock Plus

## [TreeTabs](https://addons.mozilla.org/en-US/firefox/addon/tree-tabs/) 사용하기 : Firefox 상단 탭 제거
[프로파일 경로](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data#w_how-do-i-find-my-profile) 찾은 뒤
```
mkdir -p ~/Library/Application Support/Firefox/Profiles/<프로파일 이름>/chrome; cp ~/.dotfiles/userChrome.css ~/Library/Application Support/Firefox/Profiles/<프로파일 이름>/chrome/userChrome.css
```
