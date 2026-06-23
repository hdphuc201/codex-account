@echo off
setlocal

set "CODEX_ACCOUNT_SCRIPT=%USERPROFILE%\.codex\.codex-account\codex-account.sh"
bash "%CODEX_ACCOUNT_SCRIPT%" %*
