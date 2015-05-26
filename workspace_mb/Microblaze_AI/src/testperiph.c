/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */


#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "gpio_header.h"
#include "uartlite_header.h"


int main() 
{


   Xil_ICacheEnable();
   Xil_DCacheEnable();

   print("---Entering main---\n\r");

   u32 statusButtons, DataReadButtons;
   u32 statusSwitches, DataReadSwitches;
   u32 statusBallX, DataReadBallX;
   u32 statusBallY, DataReadBallY;
   u32 statusBatY, DataReadBatY;
   u32 statusSync, DataReadSync;
   u32 syncBuffer[2];
   float BallBuffer[4];
   u32 y;
   
   BallBuffer[2]=0;
   BallBuffer[3]=0;

   while(1){
	   statusSwitches = GpioInputExample(XPAR_DIP_SWITCHES_4BITS_DEVICE_ID, &DataReadSwitches);
	   if (statusSwitches == 0){
		   if(DataReadSwitches == 0x1){
			   statusButtons = GpioInputExample(XPAR_AXI_GPIO_3_DEVICE_ID, &DataReadButtons);
			   if (statusButtons == 0){
				   if (DataReadButtons == 0x1){
					   print("U");
				   }
				   else if(DataReadButtons == 0x2){
					   print("D");
				   }
				   else{
					   print("S");
				   }
			   }
		   }
		   else{
			   statusBallX = GpioInputExample(XPAR_AXI_GPIO_1_DEVICE_ID, &DataReadBallX);
			   statusBallY = GpioInputExample(XPAR_AXI_GPIO_0_DEVICE_ID, &DataReadBallY);
			   statusBatY = GpioInputExample(XPAR_AXI_GPIO_2_DEVICE_ID, &DataReadBatY);
			   if(statusBallY == 0 && statusBallX == 0){
				   BallBuffer[0]=(float)DataReadBallX;
				   BallBuffer[1]=(float)DataReadBallY;
				   //xil_printf("%X\r\n", y, DataReadBallY);
				   if(BallBuffer[0]<BallBuffer[2]-5 || BallBuffer[0]>BallBuffer[2]+5){
					   y=(u32)(((BallBuffer[1]-BallBuffer[3])/(BallBuffer[0]-BallBuffer[2]))*(40.0-BallBuffer[0])+BallBuffer[1]);
					   //xil_printf("%X\r\n", y, DataReadBallY);
					   if(y<0 || y>0x1E0){
						   y=0xF0;
					   }
					   if(DataReadBatY<y && (DataReadBatY+0x64)>y){
						   print("S");
					   }
					   else{
						   if(DataReadBatY<y){
							   print("D");
						   }
						   if(DataReadBatY>y){
							    print("U");
						   }
					   }
					   //xil_printf("\r\n");
					   BallBuffer[2]=BallBuffer[0];
					   BallBuffer[3]=BallBuffer[1];
				   }
			   }
		   }
	   }
   }


   print("---Exiting main---\n\r");

   Xil_DCacheDisable();
   Xil_ICacheDisable();

   return 0;
}

