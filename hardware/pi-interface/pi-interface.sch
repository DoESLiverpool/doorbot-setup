EESchema Schematic File Version 2
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
LIBS:pi-interface-cache
EELAYER 25 0
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
L RasPI_IO_Header J1
U 1 1 55E0CB24
P 4950 2450
F 0 "J1" H 4950 3150 60  0000 C CNN
F 1 "RasPI_IO_Header" H 4950 1750 60  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x13" H 4950 2450 60  0001 C CNN
F 3 "" H 4950 2450 60  0000 C CNN
F 4 "1098052" H 4950 2450 60  0001 C CNN "Farnell Part"
	1    4950 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 55E0CC33
P 3400 2100
F 0 "P1" H 3400 2450 50  0000 C CNN
F 1 "SL030 RFID" V 3500 2100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 3400 2100 60  0001 C CNN
F 3 "" H 3400 2100 60  0000 C CNN
	1    3400 2100
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
L CONN_01X04 P2
U 1 1 55E0DD9F
P 6450 1600
F 0 "P2" H 6450 1850 50  0000 C CNN
F 1 "Molex HDD Power" V 6550 1600 50  0000 C CNN
F 2 "w_conn_pc:conn_hdd_15-24-4449" H 6450 1600 60  0001 C CNN
F 3 "" H 6450 1600 60  0000 C CNN
F 4 "148086" H 6450 1600 60  0001 C CNN "Farnell Part"
	1    6450 1600
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 55EB05B7
P 5950 3100
F 0 "R1" V 6030 3100 50  0000 C CNN
F 1 "220R" V 5950 3100 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 5880 3100 30  0001 C CNN
F 3 "" H 5950 3100 30  0000 C CNN
	1    5950 3100
	1    0    0    -1  
$EndComp
$Comp
L D D1
U 1 1 55EB05E0
P 6150 2550
F 0 "D1" H 6150 2650 50  0000 C CNN
F 1 "D" H 6150 2450 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-201AD_Horizontal_RM15" H 6150 2550 60  0001 C CNN
F 3 "" H 6150 2550 60  0000 C CNN
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
	1    6400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1850 4150 1850
Wire Wire Line
	3600 2050 3700 2050
Wire Wire Line
	3700 2050 3700 1950
Wire Wire Line
	3700 1950 4150 1950
Wire Wire Line
	3600 2150 3750 2150
Wire Wire Line
	3750 2150 3750 2050
Wire Wire Line
	3750 2050 4150 2050
Wire Wire Line
	3600 2250 3800 2250
Wire Wire Line
	3800 2250 3800 2150
Wire Wire Line
	3800 2150 4150 2150
Wire Wire Line
	3600 2350 3850 2350
Wire Wire Line
	3850 2350 3850 2250
Wire Wire Line
	3850 2250 4150 2250
Wire Wire Line
	6300 1800 6300 2250
Wire Wire Line
	6300 1850 5750 1850
Wire Wire Line
	6600 1800 6600 1950
Wire Wire Line
	5750 2850 5950 2850
Wire Wire Line
	4000 3550 7050 3550
Wire Wire Line
	4000 3550 4000 3050
Wire Wire Line
	4000 3050 4150 3050
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
	5950 2850 5950 2950
Wire Wire Line
	5950 3250 5950 3350
Wire Wire Line
	5950 3350 6200 3350
Wire Wire Line
	6600 1950 7250 1950
Wire Wire Line
	7250 3000 7250 2050
Wire Wire Line
	6800 3000 7250 3000
Connection ~ 6300 2250
Connection ~ 6300 1850
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
	7050 1800 7050 3550
Connection ~ 6500 3550
$EndSCHEMATC
