@echo off
setlocal
cd /d %~dp0

echo ==============================================
echo Dsg 日化百货批发 ERPNext 试用版
echo ==============================================

where docker >nul 2>nul
if errorlevel 1 (
  echo [错误] 未检测到 Docker Desktop。
  pause
  exit /b 1
)

echo.
echo [1/4] 检查 Docker...
docker info >nul 2>nul
if errorlevel 1 (
  echo [错误] Docker Desktop 尚未启动。
  pause
  exit /b 1
)

echo [2/4] 拉取最新项目代码...
git pull origin feature/erpnext-daily-chemicals-demo

if errorlevel 1 (
  echo [提示] git pull 失败，将继续使用本地代码。
)

echo [3/4] 启动 ERPNext 多服务架构...
docker compose up -d
if errorlevel 1 (
  echo [错误] ERPNext 启动失败。
  echo 请执行：docker compose logs create-site
  pause
  exit /b 1
)

echo [4/4] 等待前端服务...
timeout /t 20 /nobreak >nul
start "" http://localhost:8000

echo.
echo ==============================================
echo 试用地址：http://localhost:8000
echo 用户：admin
echo 密码：admin
echo ==============================================
echo.
echo 首次启动可能需要几分钟初始化数据库。
pause
