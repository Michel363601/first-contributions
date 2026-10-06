#property copyright "Claude Code - Volume Heatmap"
#property version "1.00"
#property indicator_chart_window
#property indicator_buffers 1
#property indicator_plots 1

#property indicator_type1 DRAW_HISTOGRAM
#property indicator_color1 clrGreen
#property indicator_style1 STYLE_SOLID
#property indicator_width1 3

// Input parameters
input int      VolumePeriod = 20;              // Período para cálculo
input double   OpacityFactor = 0.7;            // Fator de opacidade (0-1)
input bool     ShowValues = true;              // Mostrar valores no chart
input color    ZeroLineColor = clrGray;        // Cor da linha zero

// Buffers
double volumeBuffer[];

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
    SetIndexBuffer(0, volumeBuffer, INDICATOR_DATA);

    PlotIndexSetString(0, PLOT_LABEL, "Volume Heatmap");

    IndicatorSetString(INDICATOR_SHORTNAME, "Volume Heatmap");
    IndicatorSetInteger(INDICATOR_DIGITS, 0);

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

    // Calcular volume máximo para normalização
    long maxVolume = 0;
    long minVolume = LONG_MAX;

    for(int i = 0; i < rates_total; i++)
    {
        if(volume[i] > maxVolume) maxVolume = volume[i];
        if(volume[i] < minVolume) minVolume = volume[i];
    }

    long volumeRange = maxVolume - minVolume;
    if(volumeRange == 0) volumeRange = 1;

    // Preencher buffers
    for(int i = start; i < rates_total; i++)
    {
        // Normalizar volume entre 0-100
        double normalizedVolume = ((double)(volume[i] - minVolume) / (double)volumeRange) * 100;
        volumeBuffer[i] = normalizedVolume;

        // Desenhar histograma com cor baseada no volume
        color barColor = GetVolumeColor(normalizedVolume);
        PlotIndexSetInteger(0, PLOT_COLOR_INDEXES + i, barColor);
    }

    return(rates_total);
}

//+------------------------------------------------------------------+
//| Obter cor baseada no volume normalizado                          |
//+------------------------------------------------------------------+
color GetVolumeColor(double normalizedVolume)
{
    // Escala de cores: Vermelho → Amarelo → Verde
    color result;

    if(normalizedVolume >= 66.67)
    {
        // Verde intenso (volume alto)
        int intensity = (int)((normalizedVolume - 66.67) / 33.33 * 255);
        result = RGB(0, 255 - intensity, 0);
    }
    else if(normalizedVolume >= 33.33)
    {
        // Amarelo (volume médio)
        int intensity = (int)((normalizedVolume - 33.33) / 33.34 * 255);
        result = RGB(255, 255 - intensity, 0);
    }
    else
    {
        // Vermelho (volume baixo)
        int intensity = (int)(normalizedVolume / 33.33 * 255);
        result = RGB(255 - intensity, 0, 0);
    }

    return result;
}

//+------------------------------------------------------------------+
//| Função RGB para cores personalizadas                             |
//+------------------------------------------------------------------+
color RGB(int red, int green, int blue)
{
    return ((red << 16) | (green << 8) | blue);
}

//+------------------------------------------------------------------+
//| OnDeinit                                                         |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Limpeza se necessário
}
