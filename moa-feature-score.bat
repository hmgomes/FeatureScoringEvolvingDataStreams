@echo off

set BASEDIR=%~dp0\..
set MEMORY=512m

java -Xmx%MEMORY% -cp moa-feature-score.jar moa.gui.GUI