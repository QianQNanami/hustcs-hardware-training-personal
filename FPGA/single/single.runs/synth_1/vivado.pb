
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:022

00:00:072	
462.9612	
182.000Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/utils_1/imports/synth_1/Nexys4DDR.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2j
hD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/utils_1/imports/synth_1/Nexys4DDR.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
e
Command: %s
53*	vivadotcl24
2synth_design -top Nexys4DDR -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
33988Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 1317.191 ; gain = 440.797
h px� 
�
synthesizing module '%s'%s4497*oasys2
	Nexys4DDR2
 2`
\D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/nexys4ddr.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider2
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
L
%s
*synth24
2	Parameter N bound to: 100000000 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider2
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider__parameterized02
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter N bound to: 200000 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider__parameterized02
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider__parameterized12
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter N bound to: 781250 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider__parameterized12
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider__parameterized22
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
J
%s
*synth22
0	Parameter N bound to: 3125000 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider__parameterized22
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider__parameterized32
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
K
%s
*synth23
1	Parameter N bound to: 25000000 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider__parameterized32
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ClockDivider__parameterized42
 2c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6157h px� 
G
%s
*synth2/
-	Parameter N bound to: 1000 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ClockDivider__parameterized42
 2
02
12c
_D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ClockDivider.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

LedCounter2
 2a
]D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/LedCounter.v2
38@Z8-6157h px� 
�
default block is never used226*oasys2a
]D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/LedCounter.v2
218@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

LedCounter2
 2
02
12a
]D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/LedCounter.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
SingleCycleCPU2
 2[
WD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/main.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

Register2
 2_
[D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/register.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Register2
 2
02
12_
[D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/register.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
InstructionROM2
 2Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/rom.v2
38@Z8-6157h px� 
�
,$readmem data file '%s' is read successfully3426*oasys2B
@D:/LiuBainian/Project/HardwareCourseDesign/single-cycle-test.hex2Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/rom.v2
98@Z8-3876h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
InstructionROM2
 2
02
12Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/rom.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Adder2
 2\
XD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/adder.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Adder2
 2
02
12\
XD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/adder.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
HardwiredController2
 2k
gD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/hardware_line_layout.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
CalcController2
 2b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/calccontrol.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CalcController2
 2
02
12b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/calccontrol.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
ControlSignalGen2
 2b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/controlsign.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ControlSignalGen2
 2
02
12b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/controlsign.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
HardwiredController2
 2
02
12k
gD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/hardware_line_layout.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MUX2x12
 2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6157h px� 
L
%s
*synth24
2	Parameter DATAWIDTH bound to: 5 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX2x12
 2
02
12]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
RegFile2
 2^
ZD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/regfile.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
RegFile2
 2
02
12^
ZD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/regfile.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MUX2x1__parameterized02
 2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6157h px� 
M
%s
*synth25
3	Parameter DATAWIDTH bound to: 12 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX2x1__parameterized02
 2
02
12]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
NumberSignExtend2
 2i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_sign_extend.v2
38@Z8-6157h px� 
O
%s
*synth27
5	Parameter INPUT_WIDTH bound to: 12 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter OUTPUT_WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
NumberSignExtend2
 2
02
12i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_sign_extend.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2"
 NumberSignExtend__parameterized02
 2i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_sign_extend.v2
38@Z8-6157h px� 
O
%s
*synth27
5	Parameter INPUT_WIDTH bound to: 20 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter OUTPUT_WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
 NumberSignExtend__parameterized02
 2
02
12i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_sign_extend.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
LeftShifter2
 2b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/leftshifter.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
LeftShifter2
 2
02
12b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/leftshifter.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MUX2x1__parameterized12
 2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6157h px� 
M
%s
*synth25
3	Parameter DATAWIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX2x1__parameterized12
 2
02
12]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
myALU2
 2Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/alu.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
myALU2
 2
02
12Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/alu.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RAM2
 2Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ram.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RAM2
 2
02
12Z
VD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/ram.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MUX4x22
 2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux4x2.v2
38@Z8-6157h px� 
L
%s
*synth24
2	Parameter DATAWIDTH bound to: 8 - type: integer 
h p
x
� 
�
default block is never used226*oasys2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux4x2.v2
178@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX4x22
 2
02
12]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux4x2.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
NumberZeroExtend2
 2i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_zero_extend.v2
38@Z8-6157h px� 
N
%s
*synth26
4	Parameter INPUT_WIDTH bound to: 8 - type: integer 
h p
x
� 
P
%s
*synth28
6	Parameter OUTPUT_WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
NumberZeroExtend2
 2
02
12i
eD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/number_zero_extend.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2	
Counter2
 2^
ZD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/counter.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter WIDTH bound to: 16 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
Counter2
 2
02
12^
ZD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/counter.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2

Comparator2
 2a
]D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/comparator.v2
38@Z8-6157h px� 
I
%s
*synth21
/	Parameter WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Comparator2
 2
02
12a
]D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/comparator.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
MUX2x1__parameterized22
 2]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6157h px� 
L
%s
*synth24
2	Parameter DATAWIDTH bound to: 1 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
MUX2x1__parameterized22
 2
02
12]
YD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/mux2x1.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SingleCycleCPU2
 2
02
12[
WD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/main.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
DisplayNumber2
 2b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/7SegDisplay.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
DisplayNumber2
 2
02
12b
^D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/7SegDisplay.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	Nexys4DDR2
 2
02
12`
\D:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/sources_1/new/nexys4ddr.v2
38@Z8-6155h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1434.160 ; gain = 557.766
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1434.160 ; gain = 557.766
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:03 ; elapsed = 00:00:07 . Memory (MB): peak = 1434.160 ; gain = 557.766
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0332

1434.1602
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2s
oD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/constrs_1/imports/board/Nexys4DDR_Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2s
oD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/constrs_1/imports/board/Nexys4DDR_Master.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2q
oD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.srcs/constrs_1/imports/board/Nexys4DDR_Master.xdc2
.Xil/Nexys4DDR_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1533.3362
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0082

1533.3362
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:05 ; elapsed = 00:00:18 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:19 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    9 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     32 Bit         XORs := 1     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 34    
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                9 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 6     
h p
x
� 
-
%s
*synth2
+---Multipliers : 
h p
x
� 
F
%s
*synth2.
,	              32x32  Multipliers := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	 283 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   8 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    8 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   9 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 32    
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
V
%s
*synth2>
<DSP Report: Generating DSP Result0, operation Mode is: A*B.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
a
%s
*synth2I
GDSP Report: Generating DSP Result0, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
V
%s
*synth2>
<DSP Report: Generating DSP Result0, operation Mode is: A*B.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
a
%s
*synth2I
GDSP Report: Generating DSP Result0, operation Mode is: (PCIN>>17)+A*B.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
U
%s
*synth2=
;DSP Report: operator Result0 is absorbed into DSP Result0.
h p
x
� 
x
9Port %s in module %s is either unconnected or has no load4866*oasys2	
Addr[9]2
InstructionROMZ8-7129h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:10 ; elapsed = 00:00:31 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
U
%s
*synth2=
; Sort Area is  Result0_0 : 0 0 : 3101 5879 : Used 1 time 0
h p
x
� 
U
%s
*synth2=
; Sort Area is  Result0_0 : 0 1 : 2778 5879 : Used 1 time 0
h p
x
� 
U
%s
*synth2=
; Sort Area is  Result0_3 : 0 0 : 2759 5418 : Used 1 time 0
h p
x
� 
U
%s
*synth2=
; Sort Area is  Result0_3 : 0 1 : 2659 5418 : Used 1 time 0
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
X
%s*synth2@
>
Distributed RAM: Preliminary Mapping Report (see note below)
h px� 
q
%s*synth2Y
W+------------+-----------------+-----------+----------------------+------------------+
h px� 
r
%s*synth2Z
X|Module Name | RTL Object      | Inference | Size (Depth x Width) | Primitives       | 
h px� 
q
%s*synth2Y
W+------------+-----------------+-----------+----------------------+------------------+
h px� 
r
%s*synth2Z
X|Nexys4DDR   | cpu/ram/mem_reg | Implied   | 1 K x 32             | RAM256X1S x 128  | 
h px� 
r
%s*synth2Z
X+------------+-----------------+-----------+----------------------+------------------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the Distributed RAMs at the current stage of the synthesis flow. Some Distributed RAMs may be reimplemented as non Distributed RAM primitives later in the synthesis flow. Multiple instantiated RAMs are reported only once.
h px� 
v
%s*synth2^
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
h px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|Module Name | DSP Mapping    | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h px� 
�
%s*synth2�
�|myALU       | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|myALU       | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|myALU       | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�|myALU       | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h px� 
�
%s*synth2�
�+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:38 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:14 ; elapsed = 00:00:39 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
A
%s
*synth2)
'
Distributed RAM: Final Mapping Report
h p
x
� 
q
%s
*synth2Y
W+------------+-----------------+-----------+----------------------+------------------+
h p
x
� 
r
%s
*synth2Z
X|Module Name | RTL Object      | Inference | Size (Depth x Width) | Primitives       | 
h p
x
� 
q
%s
*synth2Y
W+------------+-----------------+-----------+----------------------+------------------+
h p
x
� 
r
%s
*synth2Z
X|Nexys4DDR   | cpu/ram/mem_reg | Implied   | 1 K x 32             | RAM256X1S x 128  | 
h p
x
� 
r
%s
*synth2Z
X+------------+-----------------+-----------+----------------------+------------------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:15 ; elapsed = 00:00:40 . Memory (MB): peak = 1533.336 ; gain = 656.941
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
W
%s
*synth2?
=
DSP Final Report (the ' indicates corresponding REG is set)
h p
x
� 
�
%s
*synth2
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
~|Module Name | DSP Mapping  | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
h p
x
� 
�
%s
*synth2
}+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
h p
x
� 
�
%s
*synth2�
~|myALU       | A*B          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~|myALU       | A*B          | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~|myALU       | PCIN>>17+A*B | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
h p
x
� 
�
%s
*synth2�
~+------------+--------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
5
%s*synth2
+------+----------+------+
h px� 
5
%s*synth2
|      |Cell      |Count |
h px� 
5
%s*synth2
+------+----------+------+
h px� 
5
%s*synth2
|1     |BUFG      |     2|
h px� 
5
%s*synth2
|2     |CARRY4    |   372|
h px� 
5
%s*synth2
|3     |DSP48E1   |     3|
h px� 
5
%s*synth2
|4     |LUT1      |    68|
h px� 
5
%s*synth2
|5     |LUT2      |   242|
h px� 
5
%s*synth2
|6     |LUT3      |  1041|
h px� 
5
%s*synth2
|7     |LUT4      |   223|
h px� 
5
%s*synth2
|8     |LUT5      |   395|
h px� 
5
%s*synth2
|9     |LUT6      |  1090|
h px� 
5
%s*synth2
|10    |MUXF7     |   349|
h px� 
5
%s*synth2
|11    |MUXF8     |    10|
h px� 
5
%s*synth2
|12    |RAM256X1S |   128|
h px� 
5
%s*synth2
|13    |FDRE      |  1185|
h px� 
5
%s*synth2
|14    |FDSE      |     4|
h px� 
5
%s*synth2
|15    |IBUF      |    17|
h px� 
5
%s*synth2
|16    |OBUF      |    32|
h px� 
5
%s*synth2
+------+----------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:13 ; elapsed = 00:00:43 . Memory (MB): peak = 1540.031 ; gain = 564.461
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:16 ; elapsed = 00:00:45 . Memory (MB): peak = 1540.031 ; gain = 663.637
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0602

1552.1412
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
862Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1555.7892
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2w
u  A total of 128 instances were transformed.
  RAM256X1S => RAM256X1S (MUXF7(x2), MUXF8, RAMS64E(x4)): 128 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

b8ff9313Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
842
22
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:182

00:00:502

1555.7892

1088.867Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0122

1555.7892
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2Z
XD:/LiuBainian/Project/HardwareCourseDesign/FPGA/single/single.runs/synth_1/Nexys4DDR.dcpZ17-1381h px� 
�
%s4*runtcl2j
hExecuting : report_utilization -file Nexys4DDR_utilization_synth.rpt -pb Nexys4DDR_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sat Nov 16 15:40:13 2024Z17-206h px� 


End Record