@echo off
setlocal
cd /d %~dp0

echo ==============================================
echo Dsg 日化百货批发 ERPNext 试用版
 echo ==============================================

where docker >nul 2>nul
if errorlevel 1 (
  echo [错误] 未检测到 Docker Desktop。
  echo 请先安装并启动 Docker Desktop，然后重新运行本文件。
  pause
  exit /b 1
)

echo.
echo [1/3] 检查 Docker...
docker info >nul 2>nul
if errorlevel 1 (
  echo [错误] Docker Desktop 尚未启动。
  echo 请启动 Docker Desktop 后重新运行。
  pause
  exit /b 1
)

echo [2/3] 启动 ERPNext...
docker compose up -d
if errorlevel 1 (
  echo [错误] ERPNext 启动失败，请执行：docker compose logs setup
  pause
  exit /b 1
)

echo [3/3] 等待服务启动...
timeout /t 10 /nobreak >nul
start "" http://localhost:8000

echo.
echo ==============================================
echo 试用地址：http://localhost:8000
 echo 用户：admin
 echo 密码：admin
 echo ==============================================
echo.
echo 首次启动可能需要几分钟下载镜像并初始化数据库。
pause
