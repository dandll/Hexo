@echo off
chcp 65001 >nul
title Hexo 新建文章

:: 检查是否在 Hexo 目录
if not exist "_config.yml" (
    echo [错误] 当前目录不是 Hexo 站点根目录，请将此脚本放在 Hexo 根目录下运行！
    pause
    exit /b 1
)

:loop
echo.
echo ===================================
echo     Hexo 文章创建工具
echo ===================================
echo.

:: 输入文章标题
set /p title="请输入文章标题: "

:: 检查标题是否为空
if "%title%"=="" (
    echo [错误] 标题不能为空！
    goto loop
)

echo.
echo [信息] 正在创建文章: %title%
echo.

:: 执行 Hexo 命令
hexo new post "%title%"

if %errorlevel% equ 0 (
    echo.
    echo [成功] 文章创建完成！
    echo [路径] source\_posts\%title%.md
) else (
    echo.
    echo [错误] 创建失败，请检查 Hexo 是否已正确安装。
)

echo.
set /p continue="是否继续创建新文章？(Y/N): "
if /i "%continue%"=="Y" goto loop

echo.
echo 感谢使用，再见！
timeout /t 2 >nul