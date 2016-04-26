//+------------------------------------------------------------------+
//|                                                  SwitchChart.mq4 |
//|                                                          jawakow |
//|                                  http://blog.jawakow.usermd.net/ |
//+------------------------------------------------------------------+
#property copyright "jawakow"
#property link      "http://blog.jawakow.usermd.net/"
#property version   "1.00"
#property strict
#property indicator_chart_window
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   if (id==CHARTEVENT_KEYDOWN)
   {
      Print(lparam);
      switchSymbol(lparam);
   }
   
   if (id==CHARTEVENT_KEYDOWN) 
   {
      //Print(lparam);
      
   }
  }
//+------------------------------------------------------------------+

void switchSymbol(int key)

  {
    ChartSaveTemplate(0,Symbol()); 
   string Sym;
   int handle=FileOpen("all.txt",FILE_READ|FILE_TXT,";");
   for(int cnt=0;cnt<1000;cnt++)
     {
      if(!FileIsEnding(handle) && FileReadString(handle,cnt)==Symbol() )
        {
        
         if (key==190) Sym=(FileReadString(handle,cnt+1));
         //if (key==188) Sym=(FileReadString(handle,cnt-1));
         //Print(FileSize(handle));
         //Print(FileTell(handle));
         ChartSetSymbolPeriod(0,Sym,0);
         //ChartApplyTemplate(0,"templates\\"+Symbol()+".tpl");
         ChartApplyTemplate(0,Symbol()+".tpl");
         //break;
        }
     }
   FileFlush(handle);
   FileClose(handle);
  }

// koniec