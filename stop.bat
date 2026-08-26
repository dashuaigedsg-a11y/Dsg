@echo off
setlocal
cd /d %~dp0

echo 停止 Dsg ERPNext...
docker compose down
if errorlevel 1 (
  echo 停止失败，请检查 Docker Desktop。
  pause
  exit /b 1
)
echo 已停止。数据库卷不会被删除。
pause
