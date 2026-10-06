#property copyright "Claude Code"
#property version "1.00"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_plots 4

//--- Definir cores dos plots
#property indicator_type1 DRAW_COLOR_CANDLES
#property indicator_type2 DRAW_COLOR_CANDLES
#property indicator_type3 DRAW_COLOR_CANDLES
#property indicator_type4 DRAW_COLOR_CANDLES

#property indicator_color1 clrWhite
#property indicator_color2 clrGreen,clrYellow,clrRed
#property indicator_color3 clrWhite
#property indicator_color4 clrWhite

// Input parameters
input int         VolumePeriod = 20;          // Período para análise de volume
input color       ColorHighVolume = clrGreen; // Cor para volume alto
input color       ColorMedVolume = clrYellow; // Cor para volume médio
input color       ColorLowVolume = clrRed;    // Cor para volume baixo
input bool        UseMovingAverage = true;    // Usar média móvel
input double      HighThreshold = 1.5;        // Multiplicador para volume alto (1.5x média)
input double      LowThreshold = 0.9;         // Multiplicador para volume baixo (0.9x média)

// Buffers do indicador
double openBuffer[];
double highBuffer[];
double lowBuffer[];
double closeBuffer[];
double colorBuffer[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
    SetIndexBuffer(0, openBuffer, INDICATOR_DATA);
    SetIndexBuffer(1, highBuffer, INDICATOR_DATA);
    SetIndexBuffer(2, lowBuffer, INDICATOR_DATA);
    SetIndexBuffer(3, closeBuffer, INDICATOR_DATA);
    SetIndexBuffer(4, colorBuffer, INDICATOR_COLOR_INDEX);

    // Propriedades dos plots
    PlotIndexSetString(0, PLOT_LABEL, "Open");
    PlotIndexSetString(1, PLOT_LABEL, "High");
    PlotIndexSetString(2, PLOT_LABEL, "Low");
    PlotIndexSetString(3, PLOT_LABEL, "Close");

    IndicatorSetString(INDICATOR_SHORTNAME, "Volume Color Candles");

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
    if(rates_total < VolumePeriod) return 0;

    int start = prev_calculated > 0 ? prev_calculated - 1 : 0;

    for(int i = start; i < rates_total; i++)
    {
        // Preencher buffers OHLC
        openBuffer[i] = open[i];
        highBuffer[i] = high[i];
        lowBuffer[i] = low[i];
        closeBuffer[i] = close[i];

        // Calcular cor baseada no volume
        long currentVolume = volume[i];
        int colorIndex = DetermineVolumeColor(currentVolume, i, volume);
        colorBuffer[i] = colorIndex;
    }

    return(rates_total);
}

//+------------------------------------------------------------------+
//| Determinar índice de cor baseado no volume                       |
//+------------------------------------------------------------------+
int DetermineVolumeColor(long currentVolume, int bar, const long &volume[])
{
    if(UseMovingAverage)
    {
        // Calcular média móvel do volume
        double volumeMA = 0;
        int period = (bar < VolumePeriod) ? bar + 1 : VolumePeriod;

        for(int i = 0; i < period; i++)
        {
            volumeMA += volume[bar - i];
        }
        volumeMA /= period;

        // Comparar volume atual com média
        if(currentVolume > volumeMA * HighThreshold)
            return 1;  // Verde - Volume Alto
        else if(currentVolume < volumeMA * LowThreshold)
            return 3;  // Vermelho - Volume Baixo
        else
            return 2;  // Amarelo - Volume Médio
    }
    else
    {
        // Método alternativo: usar percentil dos últimos candles
        return DetermineByPercentile(currentVolume, bar, volume);
    }
}

//+------------------------------------------------------------------+
//| Determinar cor por percentil                                     |
//+------------------------------------------------------------------+
int DetermineByPercentile(long currentVolume, int bar, const long &volume[])
{
    int lookback = (bar < 50) ? bar + 1 : 50;
    long maxVol = 0;
    long minVol = LONG_MAX;

    // Encontrar máximo e mínimo
    for(int i = 0; i < lookback; i++)
    {
        if(volume[bar - i] > maxVol) maxVol = volume[bar - i];
        if(volume[bar - i] < minVol) minVol = volume[bar - i];
    }

    if(maxVol == minVol) return 2; // Médio como padrão

    // Calcular percentil
    double percentile = (double)(currentVolume - minVol) / (double)(maxVol - minVol);

    if(percentile >= 0.66)
        return 1;  // Verde
    else if(percentile < 0.33)
        return 3;  // Vermelho
    else
        return 2;  // Amarelo
}

//+------------------------------------------------------------------+
//| OnDeinit                                                         |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Limpeza se necessário
}
