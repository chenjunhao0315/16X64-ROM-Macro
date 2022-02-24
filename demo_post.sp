
.protect
.lib 'cic018.l' tt
.unprotect
.option post accurate

*.inc 'final.spi'
.inc 'ROM_MACRO.pex.spi'

VSS VSS GND 0V
VDD VDD GND 1.8V
VREF VREF GND 1.6V
VCLK CLK GND pulse 0 1.8 0n 0.01n 0.01n 4.99n 10n

.param v_l=1.8
.param v_h=0
.param v_ly=0
.param v_hy=1.8


XR VSS CLK VDD VREF A<7> A<6> A<2> A<1> A<0> DOUT<1> A<8> A<5> A<4> A<3> DOUT<0> / ROM_MACRO
*XR A<0> A<1> A<2> A<3> A<4> A<5> A<6> A<7> A<8> CLK DOUT<0> DOUT<1> VDD VREF VSS / ROM_MACRO

* for Xsel_FF (DEC5to32)
VA<0>	A<0>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)
VA<1>	A<1>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)
VA<2>	A<2>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)
VA<3>	A<3>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)
VA<4>	A<4>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)
VA<5>	A<5>	0	pwl(0 0 5n 0 5.01n v_l 14.99n v_l 15n 0
								+ 15.01n v_h 24.99n v_h 25n 0
								+ 25.01n v_l 34.99n v_l 35n 0
								+ 35.01n v_h 44.99n v_h 45n 0)

* for Ysel_FF (MUX8to1)

VA<6>	A<6>	0   pwl(0 0 5n 0 5.01n v_ly 14.99n v_ly 15n 0
								+ 15.01n v_ly 24.99n v_ly 25n 0
								+ 25.01n v_hy 34.99n v_hy 35n 0
								+ 35.01n v_hy 44.99n v_hy 45n 0)	
VA<7>	A<7>	0   pwl(0 0 5n 0 5.01n v_ly 14.99n v_ly 15n 0
								+ 15.01n v_ly 24.99n v_ly 25n 0
								+ 25.01n v_hy 34.99n v_hy 35n 0
								+ 35.01n v_hy 44.99n v_hy 45n 0)			
VA<8>	A<8>	0	pwl(0 0 5n 0 5.01n v_ly 14.99n v_ly 15n 0
								+ 15.01n v_ly 24.99n v_ly 25n 0
								+ 25.01n v_hy 34.99n v_hy 35n 0
								+ 35.01n v_hy 44.99n v_hy 45n 0)

.tran 1p 55n
.meas tran avgpower0 AVG P(VDD) from=10ns  to=50ns

.probe V(DOUT<0>)
.probe V(DOUT<1>)

.end
