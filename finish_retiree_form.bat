@echo off
chcp 65001 > nul
title 퇴직자지부 가입신청 - 작업 종료

cd /d C:\Users\kptu-00061\Desktop\retiree-join-form

echo.
echo ==========================================
echo [퇴직자지부 가입신청] 작업 종료
echo ==========================================
echo.

if not exist ".git" (
    echo 이 폴더는 Git 저장소가 아닙니다.
    echo GitHub 저장소 연결 상태를 확인하세요.
    pause
    exit /b
)

git status
echo.

git diff --quiet
if %errorlevel%==0 (
    git diff --cached --quiet
    if %errorlevel%==0 (
        echo 변경된 내용이 없습니다. push 없이 종료합니다.
        pause
        exit /b
    )
)

set /p msg=커밋 메시지를 입력하세요: 

if "%msg%"=="" (
    echo 커밋 메시지가 비어 있어 작업을 중단합니다.
    pause
    exit /b
)

echo.
echo 변경 파일 추가 중...
git add .

echo.
echo 커밋 생성 중...
git commit -m "%msg%"

echo.
echo GitHub로 업로드 중...
git push origin main

echo.
echo ==========================================
echo 작업 종료 및 업로드 완료
echo ==========================================
echo.
pause