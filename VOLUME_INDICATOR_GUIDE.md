# Indicador de Cor de Volume para MetaTrader 5

## Descrição
Indicadores MQL5 que colorem os candles de acordo com o volume de negociação. Existem duas versões otimizadas para diferentes necessidades.

## Versões Disponíveis

### 1. **Volume_Color_Candles.mq5** (RECOMENDADO)
✅ Versão otimizada com buffers de indicador
- Melhor performance
- Integração nativa com o MT5
- Candles coloridos dinamicamente
- Suporta múltiplas estratégias de cálculo

**Cores Padrão:**
- 🟢 **Verde**: Volume Alto (acima de 150% da média)
- 🟡 **Amarelo**: Volume Médio (entre 90%-150% da média)
- 🔴 **Vermelho**: Volume Baixo (abaixo de 90% da média)

### 2. **Volume_Color_Indicator.mq5**
Versão com objetos gráficos (mais pesada)
- Usa retângulos para colorir candles
- Maior consumo de memória
- Mais lento em timeframes pequenos

## Como Instalar

### Passo 1: Copiar o arquivo
```
Coloque o arquivo Volume_Color_Candles.mq5 em:
C:\Users\[SeuUsuário]\AppData\Roaming\MetaQuotes\Terminal\[ID]\MQL5\Indicators\
```

### Passo 2: Compilar
1. Abra o **MetaTrader 5**
2. Menu: **View** → **Toolbox** → **Indicators**
3. Clique com botão direito em **Expert Advisors**
4. Selecione **Compile**

### Passo 3: Aplicar ao Gráfico
1. Abra um gráfico (qualquer ativo e timeframe)
2. Menu: **Insert** → **Indicators** → **Custom**
3. Procure por "Volume Color Candles"
4. Configure os parâmetros (veja abaixo)
5. Clique em **OK**

## Configurações (Inputs)

| Parâmetro | Padrão | Descrição |
|-----------|--------|-----------|
| **VolumePeriod** | 20 | Período da média móvel do volume |
| **ColorHighVolume** | Verde | Cor para volume alto |
| **ColorMedVolume** | Amarelo | Cor para volume médio |
| **ColorLowVolume** | Vermelho | Cor para volume baixo |
| **UseMovingAverage** | Sim | Usar média móvel (recomendado) |
| **HighThreshold** | 1.5 | Multiplicador para considerar volume alto |
| **LowThreshold** | 0.9 | Multiplicador para considerar volume baixo |

### Exemplos de Ajuste

**Para Timeframe Pequeno (M5/M15):**
```
VolumePeriod = 10
HighThreshold = 1.3
LowThreshold = 0.8
```

**Para Timeframe Grande (H1/H4):**
```
VolumePeriod = 50
HighThreshold = 1.5
LowThreshold = 0.9
```

**Para Análise Agressiva:**
```
UseMovingAverage = false (usa percentil dos últimos 50 candles)
ColorHighVolume = Cor_Forte
ColorLowVolume = Cor_Fraca
```

## Como Funciona

### Lógica de Coloração (Modo Média Móvel)

```
Volume Atual > MA × HighThreshold  → VERDE (Volume Alto)
                                     ↓
MA × LowThreshold < Volume ≤ MA × HighThreshold → AMARELO (Médio)
                                     ↓
Volume Atual < MA × LowThreshold  → VERMELHO (Volume Baixo)
```

### Interpretação dos Candles

| Cor | Significado | Estratégia |
|-----|-----------|-----------|
| 🟢 Verde | Alto volume | Movimento forte, confirmação |
| 🟡 Amarelo | Volume normal | Movimento típico do ativo |
| 🔴 Vermelho | Baixo volume | Fraqueza, cuidado com reversões |

## Casos de Uso

### 1. **Confirmar Breakouts**
- Breakout com candle **verde** = movimento forte
- Breakout com candle **vermelho** = possível falsa saída

### 2. **Identificar Reversões**
- Topos/fundos com **vermelho** = reversão forte
- Topos/fundos com **verde** = possível continuação

### 3. **Encontrar Acumulação**
- Padrão: múltiplos candles **vermelhos** seguidos
- Indica: preparação para movimento

### 4. **Confirmar Suportes/Resistências**
- Teste com volume **alto** (verde) = suporte forte
- Teste com volume **baixo** (vermelho) = suporte fraco

## Exemplos Práticos

### Exemplo 1: Breakout de Resistência
```
Preço quebra resistência
↓
Candle VERDE com fecha acima
↓
Confirmação forte → Sinal de compra
```

### Exemplo 2: Fundo Duplo
```
Primeiro fundo: Volume VERMELHO
Segundo fundo: Volume VERDE com fecha
↓
Divergência positiva → Possível reversão para cima
```

### Exemplo 3: Topos em Queda
```
Topo 1: Volume VERDE
Topo 2: Volume AMARELO (menor)
Topo 3: Volume VERMELHO (muito baixo)
↓
Enfraquecimento → Possível reversão
```

## Dicas de Uso

✅ **FAÇA:**
- Combine com níveis de suporte/resistência
- Use em múltiplos timeframes (confirmar em TF maior)
- Observe padrões (sequências de cores)
- Ajuste os parâmetros para seu ativo/estilo

❌ **NÃO FAÇA:**
- Use como único sinal de entrada
- Ignore outros indicadores técnicos
- Negocie contra a tendência forte
- Configure valores extremos sem testar

## Troubleshooting

### Problema: Candles não aparecem coloridos
**Solução:**
1. Recompile o indicador (F5)
2. Remova e readicione ao gráfico
3. Verifique se "UseMovingAverage" está como verdadeiro

### Problema: Muitas barras vermelhas
**Solução:**
1. Reduza VolumePeriod (ex: 15 em vez de 20)
2. Aumente LowThreshold (ex: 0.85 em vez de 0.9)
3. O ativo pode ter volume naturalmente baixo

### Problema: Muitas barras verdes
**Solução:**
1. Aumente VolumePeriod (ex: 30 em vez de 20)
2. Reduza HighThreshold (ex: 1.3 em vez de 1.5)

## Performance

- **Versão Otimizada (Volume_Color_Candles.mq5)**
  - Uso de memória: Mínimo
  - CPU: Leve
  - Recomendada para todos os timeframes

- **Versão com Objetos (Volume_Color_Indicator.mq5)**
  - Uso de memória: Alto
  - CPU: Moderado
  - Apenas para análise ocasional

## Customização Avançada

### Mudar para Escala RGB Personalizada
No código, localize:
```mql5
input color ColorHighVolume = clrGreen;
input color ColorMedVolume = clrYellow;
input color ColorLowVolume = clrRed;
```

Substitua por cores RGB:
```mql5
input color ColorHighVolume = 0x00FF00;  // Verde
input color ColorMedVolume = 0xFFFF00;   // Amarelo
input color ColorLowVolume = 0xFF0000;   // Vermelho
```

### Adicionar Alerta de Volume
Para adicionar alertas quando volume é muito alto/baixo, adicione ao código:
```mql5
if(colorIndex == 1)  // Volume Alto
    Alert("Volume Alto Detectado em ", Symbol(), " às ", TimeToString(TimeCurrent()));
```

## Suporte e Updates

Versão: 1.00
Última atualização: 2026

---

**Dúvidas?** Teste primeiro em conta demo antes de usar em operações reais!
