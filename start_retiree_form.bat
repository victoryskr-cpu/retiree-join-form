@echo off
chcp 65001 > nul
title 퇴직자지부 가입신청 - 작업 시작

cd /d C:\Users\kptu-00061\Desktop\retiree-join-form

echo.
echo ==========================================
echo [퇴직자지부 가입신청] 작업 시작
echo ==========================================
echo.

if not exist ".git" (
    echo 이 폴더는 Git 저장소가 아닙니다.
    echo 먼저 GitHub에서 clone 했는지 확인하세요.
    pause
    exit /b
)

echo 현재 상태 확인
git status

echo.
echo GitHub 최신 내용 가져오는 중...
git pull origin main

echo.
echo 작업 폴더를 엽니다...
start "" "C:\Users\kptu-00061\Desktop\retiree-join-form"

echo.
echo 작업 시작 준비 완료
echo.
pause