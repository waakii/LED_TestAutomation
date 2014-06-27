//==============================================================================
//
// Title:		UI_test
// Purpose:		A short description of the application.
//
// Created on:	2014-06-10 at ¿ÀÀü 11:05:47 by rkh-virtual.
// Copyright:	. All Rights Reserved.
//
//==============================================================================

//==============================================================================
// Include files

#include <windows.h>
#include <formatio.h>
#include <ansi_c.h>
#include <cvirte.h>		
#include <userint.h>
#include "UI_test.h"
#include "toolbox.h"

#include "chr616xx.h"
#include "tk22xx.h"

//==============================================================================
// Constants

//==============================================================================
// Types

//==============================================================================
// Static global variables
static int panelHandle = 0;
volatile int quit = 0;

//==============================================================================
// Static functions

//==============================================================================
// Global variables
ViSession   chr616xx;
    
//==============================================================================
// Global functions
int CVICALLBACK DataAcqThreadFunction (void *functionData);

/// HIFN The main entry-point function.
int main (int argc, char *argv[])
{
	ViStatus    error = VI_SUCCESS;
	int functionId;

	/* initialize and load resources */
	nullChk (InitCVIRTE (0, argv, 0));
	errChk (panelHandle = LoadPanel (0, "UI_test.uir", PANEL));
	
	checkErr( chr616xx_InitWithOptions ("GPIB::30::INSTR", VI_TRUE, VI_FALSE, "Simulate=0,RangeCheck=1,QueryInstrStatus=1,Cache=0,DriverSetup=Model:61502", &chr616xx));

	tek22xx_init(16);
	tek22xx_set_acq_mode(1);		 
	
//	for (int i = 0; i < 100; i ++) {
//	}
//	CloseFile (fileHandle);

	CmtScheduleThreadPoolFunction (DEFAULT_THREAD_POOL_HANDLE, DataAcqThreadFunction, NULL, &functionId);
	
	
	/* display the panel and run the user interface */
	errChk (DisplayPanel (panelHandle));
	errChk (RunUserInterface ());
	
	quit = 1;
	CmtWaitForThreadPoolFunctionCompletion (DEFAULT_THREAD_POOL_HANDLE, functionId, 0);
    
	
	
Error:
	/* clean up */
	if (panelHandle > 0)
		DiscardPanel (panelHandle);
	return 0;
}

//==============================================================================
// UI callback function prototypes

/// HIFN Exit when the user dismisses the panel.
int CVICALLBACK panelCB (int panel, int event, void *callbackData,
		int eventData1, int eventData2)
{
	if (event == EVENT_CLOSE)
		QuitUserInterface (0);
	return 0;
}

int CVICALLBACK DataAcqThreadFunction (void *functionData)
{
	ViStatus    error = VI_SUCCESS;
	double waveform[4100];
	double xincr;
	int nr_pt;
	int j;
	
	char string_temp[100];
	int fileHandle;

	
	double stg1_avg = 0;
	double stg2_avg = 0;
	double stg3_avg = 0;

    while (!quit) {
		chr616xx_OutpAcVolt (chr616xx, 225);
		chr616xx_OutputSwitch (chr616xx, 1);
		Sleep(500);
		tek22xx_read_waveform (0, 1, waveform, &xincr, &nr_pt); 
		chr616xx_OutputSwitch (chr616xx, 0);

		fileHandle = OpenFile (".\\outputs.txt", VAL_WRITE_ONLY, VAL_OPEN_AS_IS, VAL_ASCII);
		for (int j = 0; j < nr_pt; j++){
			sprintf(string_temp, "%02.2f,", waveform[j]);	
			WriteFile (fileHandle, string_temp, 6);
		}
		CloseFile(fileHandle);
		
//		SetCtrlVal(panelHandle, 1, waveform[226]);	
		stg1_avg = 0;
		for(j = 205; j < 245; j++){
			stg1_avg += waveform[j];
		}
		stg1_avg /= 40;
		
		stg2_avg = 0;
		for(j = 285; j < 325; j++){
			stg2_avg += waveform[j];
		}
		stg2_avg /= 40;
		
		stg3_avg = 0;
		for(j = 405; j < 575; j++){
			stg3_avg += waveform[j];
		}
		stg3_avg /= 170;
		
		SetCtrlVal(panelHandle, PANEL_NUMERIC, stg1_avg);
		SetCtrlVal(panelHandle, PANEL_NUMERIC_2, stg2_avg);
		SetCtrlVal(panelHandle, PANEL_NUMERIC_3, stg3_avg);
		//for (int j = 0; j < 1024; j ++){
		//	PlotStripChartPoint(panelHandle, PANEL_STRIPCHART, waveform[j]);
		//}
		ClearStripChart(panelHandle, PANEL_STRIPCHART);
		PlotStripChart(panelHandle, PANEL_STRIPCHART, waveform, nr_pt, 1, 0, VAL_DOUBLE);
		
		Sleep(10);
	}

    return 0;
}
