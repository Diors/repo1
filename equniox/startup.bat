@echo off
rem set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_73
set CMD=java
set CURRENT_DIR=%cd%


set CMD_OPT1=-Declipse.ignoreApp=true
set CMD_OPT2=-Dosgi.noShutdown=true
set CMD_OPT3=-Dconfig.dir=%CURRENT_DIR%/configuration
set CMD_OPT116=-jar org.eclipse.osgi_3.13.100.v20180827-1536.jar
set CMD_OPT117=-clean
set CMD_OPT118=-console

set CMD_OPTS=%CMD_OPT1% %CMD_OPT2% %CMD_OPT3% %CMD_OPT116% %CMD_OPT117% %CMD_OPT118%


@echo on
"%JAVA_HOME%\bin\%CMD%" %CMD_OPTS%