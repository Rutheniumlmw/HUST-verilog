@echo off
set xv_path=D:\\studysourcefile\\verilog\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto b34c634909184a57bb88bc3211633645 -m64 --debug typical --relax --mt 2 -L secureip --snapshot ex2.1_behav xil_defaultlib.ex2.1 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
