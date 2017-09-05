EESchema Schematic File Version 2
LIBS:pi-interface-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:raspberrypi-gpio-cache
LIBS:w_connectors
LIBS:relays
LIBS:UserParts-KiCad
LIBS:w_transistor
LIBS:w_relay
LIBS:MCQN-Schematic-Components
LIBS:pi-interface-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X06 P1
U 1 1 55E0CC33
P 1900 2300
F 0 "P1" H 1900 2650 50  0000 C CNN
F 1 "SL030 RFID" V 2000 2300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 1900 2300 60  0001 C CNN
F 3 "" H 1900 2300 60  0000 C CNN
	1    1900 2300
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 55E0D7B3
P 7450 2000
F 0 "P3" H 7450 2150 50  0000 C CNN
F 1 "Door Solenoid" V 7550 2000 50  0000 C CNN
F 2 "w_conn_screw:mstba_2,5%2f2-g-5,08" H 7450 2000 60  0001 C CNN
F 3 "" H 7450 2000 60  0000 C CNN
F 4 "2396251" H 7450 2000 60  0001 C CNN "Farnell Part"
	1    7450 2000
	1    0    0    1   
$EndComp
$Comp
L CONN_01X04-RESCUE-pi-interface P2
U 1 1 55E0DD9F
P 6450 1600
F 0 "P2" H 6450 1850 50  0000 C CNN
F 1 "Molex HDD Power" V 6550 1600 50  0000 C CNN
F 2 "w_conn_screw:mstbva_2,5%2f4-g-5,08" H 6450 1600 60  0001 C CNN
F 3 "" H 6450 1600 60  0000 C CNN
F 4 "148086" H 6450 1600 60  0001 C CNN "Farnell Part"
	1    6450 1600
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 55EB05B7
P 5950 3350
F 0 "R1" V 6030 3350 50  0000 C CNN
F 1 "220R" V 5950 3350 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5880 3350 30  0001 C CNN
F 3 "" H 5950 3350 30  0000 C CNN
F 4 "1700228" V 5950 3350 60  0001 C CNN "Farnell Part"
	1    5950 3350
	0    1    1    0   
$EndComp
$Comp
L D D1
U 1 1 55EB05E0
P 6150 2550
F 0 "D1" H 6150 2650 50  0000 C CNN
F 1 "D" H 6150 2450 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-201AD_Horizontal_RM15" H 6150 2550 60  0001 C CNN
F 3 "" H 6150 2550 60  0000 C CNN
F 4 "2675047" H 6150 2550 60  0001 C CNN "Farnell Part"
	1    6150 2550
	0    1    1    0   
$EndComp
$Comp
L BC237 Q1
U 1 1 55EB080F
P 6400 3350
F 0 "Q1" H 6600 3425 50  0000 L CNN
F 1 "BC237" H 6600 3350 50  0000 L CNN
F 2 "Transistors_TO-220:TO-220_Neutral123_Vertical_LargePads" H 6600 3275 50  0000 L CIN
F 3 "" H 6400 3350 50  0000 L CNN
F 4 "1574377" H 6400 3350 60  0001 C CNN "Farnell Part"
	1    6400 3350
	1    0    0    -1  
$EndComp
$Comp
L RELAY_HJR-3FF_Z RLY1
U 1 1 55EC4E47
P 6650 2550
F 0 "RLY1" H 6650 2800 60  0000 C CNN
F 1 "RELAY_HJR-3FF_Z" H 6650 2315 60  0000 C CNN
F 2 "w_relay:relay_hjr-3ff_z" H 6650 2550 60  0000 C CNN
F 3 "" H 6650 2550 60  0000 C CNN
F 4 "2325631" H 6650 2550 60  0001 C CNN "Farnell Part"
	1    6650 2550
	0    -1   1    0   
$EndComp
$Comp
L MAX98357A-Breakout U1
U 1 1 598F2091
P 5300 3350
F 0 "U1" H 5300 4437 60  0000 C CNN
F 1 "MAX98357A-Breakout" H 5300 4331 60  0000 C CNN
F 2 "MCQN Ltd:MAX98357-Breakout" H 5300 3350 60  0001 C CNN
F 3 "" H 5300 3350 60  0001 C CNN
	1    5300 3350
	1    0    0    -1  
$EndComp
NoConn ~ 5800 2800
NoConn ~ 5800 2900
$Comp
L Raspberry_Pi_2_3 J1
U 1 1 598F91EF
P 3400 3150
F 0 "J1" H 3400 4628 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 3400 4537 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x20" H 4400 4400 50  0001 C CNN
F 3 "" H 3450 3000 50  0001 C CNN
F 4 "3419290" H 3400 3150 60  0001 C CNN "Farnell Part"
	1    3400 3150
	-1   0    0    -1  
$EndComp
NoConn ~ 2100 2150
NoConn ~ 4800 2950
NoConn ~ 4800 2850
Wire Wire Line
	6300 1800 6300 2250
Wire Wire Line
	6600 1800 6600 1950
Wire Wire Line
	6500 1800 6500 2150
Wire Wire Line
	6150 2400 6150 2250
Wire Wire Line
	6150 2250 6500 2250
Wire Wire Line
	6500 2850 6150 2850
Wire Wire Line
	6150 2850 6150 2700
Wire Wire Line
	6500 2750 6500 3150
Wire Wire Line
	6600 1950 7250 1950
Wire Wire Line
	7250 3000 7250 2050
Wire Wire Line
	6800 3000 7250 3000
Connection ~ 6300 2250
Wire Wire Line
	6500 2150 6750 2150
Wire Wire Line
	6750 2150 6750 2350
Wire Wire Line
	6500 2250 6500 2350
Connection ~ 6500 2850
Wire Wire Line
	6800 2750 6800 3000
Wire Wire Line
	6400 1800 7050 1800
Wire Wire Line
	7050 1800 7050 4550
Connection ~ 6500 3550
Wire Wire Line
	2200 1800 2200 2050
Wire Wire Line
	2200 2050 2100 2050
Wire Wire Line
	2500 2250 2100 2250
Wire Wire Line
	2500 2350 2100 2350
Wire Wire Line
	2500 2450 2100 2450
Wire Wire Line
	2100 2550 2200 2550
Wire Wire Line
	2200 2550 2200 4550
Wire Wire Line
	6200 3350 6100 3350
Wire Wire Line
	4300 3350 5800 3350
Wire Wire Line
	6500 4550 6500 3550
Wire Wire Line
	4800 2550 4500 2550
Wire Wire Line
	4500 2550 4500 2750
Wire Wire Line
	4500 2750 4300 2750
Wire Wire Line
	4800 2650 4300 2650
Wire Wire Line
	4800 2750 4600 2750
Wire Wire Line
	4600 2750 4600 2950
Wire Wire Line
	4600 2950 4300 2950
Wire Wire Line
	4800 3150 4400 3150
Wire Wire Line
	4400 3150 4400 1850
Wire Wire Line
	4800 3050 4700 3050
Wire Wire Line
	4700 3050 4700 4550
Wire Wire Line
	3700 4450 3700 4550
Wire Wire Line
	2200 4550 7050 4550
Connection ~ 3700 4550
Connection ~ 4700 4550
Connection ~ 6500 4550
Wire Wire Line
	2200 1800 3300 1800
Wire Wire Line
	3300 1800 3300 1850
Wire Wire Line
	3600 1850 6300 1850
Connection ~ 4400 1850
Connection ~ 6300 1850
$EndSCHEMATC
