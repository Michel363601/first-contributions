#property copyright "Claude Code - Volume Color Indicator"
#property link "https://claude.ai/code"
#property version "1.00"
#property indicator_chart_window
#property indicator_buffers 0
#property indicator_plots 0

// Input parameters
input int    PeriodMA = 20;           // Período da média móvel do volume
input bool   UseMA = true;            // Usar média móvel para calcular referência
input color  VolumeHighColor = clrGreen;    // Cor para volume alto
input color  VolumeMediumColor = clrYellow; // Cor para volume médio
input color  VolumeLowColor = clrRed;       // Cor para volume baixo
input int    BarWidth = 2;                  // Largura das barras

// Variáveis globais
double volumeMA[];
int lastProcessedBar = -1;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
    // Criar array para a média móvel do volume
    ArrayResize(volumeMA, 1000);

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
    // Calcular a média móvel do volume
    if(UseMA)
    {
        for(int i = prev_calculated - 1; i < rates_total; i++)
        {
            volumeMA[i] = 0;
            int count = (i < PeriodMA) ? i + 1 : PeriodMA;

            for(int j = 0; j < count; j++)
            {
                volumeMA[i] += volume[i - j];
            }
            volumeMA[i] /= count;
        }
    }

    // Colorir os candles baseado no volume
    for(int i = prev_calculated; i < rates_total; i++)
    {
        long currentVolume = volume[i];
        double reference = UseMA ? volumeMA[i] : 0;

        // Calcular cor baseada no volume
        color barColor = CalculateColorByVolume(currentVolume, reference, i);

        // Definir propriedades do candle
        SetCandleColor(i, barColor, BarWidth);
    }

    return(rates_total);
}

//+------------------------------------------------------------------+
//| Calcular cor baseada no volume                                   |
//+------------------------------------------------------------------+
color CalculateColorByVolume(long currentVolume, double reference, int bar)
{
    color result = VolumeLowColor;

    if(UseMA)
    {
        if(currentVolume > reference * 1.5)
        {
            result = VolumeHighColor;   // Volume muito acima da média
        }
        else if(currentVolume > reference * 0.9)
        {
            result = VolumeMediumColor; // Volume próximo à média
        }
        else
        {
            result = VolumeLowColor;    // Volume abaixo da média
        }
    }
    else
    {
        // Método alternativo: usar percentil
        result = CalculateColorByPercentile(currentVolume, bar);
    }

    return result;
}

//+------------------------------------------------------------------+
//| Calcular cor por percentil de volume                             |
//+------------------------------------------------------------------+
color CalculateColorByPercentile(long currentVolume, int currentBar)
{
    // Encontrar o volume máximo e mínimo dos últimos 50 candles
    int lookback = (currentBar < 50) ? currentBar + 1 : 50;
    long maxVol = 0;
    long minVol = LONG_MAX;

    for(int i = 0; i < lookback; i++)
    {
        long v = iVolume(_Symbol, _Period, currentBar - i);
        if(v > maxVol) maxVol = v;
        if(v < minVol) minVol = v;
    }

    if(maxVol == minVol) return VolumeMediumColor;

    // Calcular percentil (0-100)
    double percentile = ((double)(currentVolume - minVol) / (double)(maxVol - minVol)) * 100;

    if(percentile >= 66.67)
        return VolumeHighColor;
    else if(percentile >= 33.33)
        return VolumeMediumColor;
    else
        return VolumeLowColor;
}

//+------------------------------------------------------------------+
//| Definir cor do candle                                            |
//+------------------------------------------------------------------+
void SetCandleColor(int bar, color barColor, int width)
{
    // Obter o tempo do candle
    datetime barTime = iTime(_Symbol, _Period, bar);

    // Criar um identificador único para a barra
    string objName = "Candle_" + IntegerToString(barTime);

    // Remover objeto anterior se existir
    ObjectDelete(0, objName);

    // Criar retângulo para colorir o candle
    if(ObjectCreate(0, objName, OBJ_RECTANGLE, 0, barTime, iHigh(_Symbol, _Period, bar),
                    barTime, iLow(_Symbol, _Period, bar)))
    {
        ObjectSetInteger(0, objName, OBJPROP_COLOR, barColor);
        ObjectSetInteger(0, objName, OBJPROP_WIDTH, width);
        ObjectSetInteger(0, objName, OBJPROP_FILL, true);
        ObjectSetInteger(0, objName, OBJPROP_BACK, true);
    }
}

//+------------------------------------------------------------------+
//| Deinit                                                           |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
    // Limpar todos os objetos criados
    for(int i = ObjectsTotal(0) - 1; i >= 0; i--)
    {
        string objName = ObjectName(0, i);
        if(StringFind(objName, "Candle_") == 0)
        {
            ObjectDelete(0, objName);
        }
    }
}
