@echo off
setlocal
cd /d "%~dp0"

set "MESSAGE=%~1"
if not defined MESSAGE set /p "MESSAGE=Commit message: "
if not defined MESSAGE (
  echo A commit message is required.
  exit /b 1
)

call pnpm.cmd run build
if errorlevel 1 (
  echo Hexo build failed. Nothing was committed or pushed.
  exit /b 1
)

git add -A
git diff --cached --quiet
if not errorlevel 1 (
  echo No source changes to publish.
  exit /b 0
)

git commit -m "%MESSAGE%"
if errorlevel 1 exit /b 1

git push origin hexo-source
if errorlevel 1 exit /b 1

echo Source pushed. GitHub Actions will deploy the site automatically.
