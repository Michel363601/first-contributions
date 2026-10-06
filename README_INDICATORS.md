# 📊 Volume Color Indicators - MetaTrader 5

Um conjunto profissional de indicadores MQL5 que colorem os candles de acordo com o volume de negociação, oferecendo visualização clara e intuitiva dos padrões de volume.

![MetaTrader5](https://img.shields.io/badge/MetaTrader-5-blue?style=flat-square&logo=metatrader)
![MQL5](https://img.shields.io/badge/Language-MQL5-green?style=flat-square)
![Version](https://img.shields.io/badge/Version-1.0-blue?style=flat-square)
![License](https://img.shields.io/badge/License-Open%20Source-brightgreen?style=flat-square)

## 🎯 O Que É?

Indicadores que transformam informações de volume em cores visuais nos candles:
- 🟢 **Verde** = Volume Alto (movimento forte)
- 🟡 **Amarelo** = Volume Médio (normal)
- 🔴 **Vermelho** = Volume Baixo (fraqueza)

## ⭐ Características Principais

✅ **3 Versões Otimizadas:**
- Volume Color Candles (RECOMENDADO - versão principal)
- Volume Color Indicator (alternativa com objetos gráficos)
- Volume Heatmap (visualização em histograma)

✅ **Configurações Flexíveis:**
- Período da média móvel ajustável
- Cores personalizáveis
- Thresholds customizáveis
- Modo percentil opcional

✅ **Alta Performance:**
- Compatível com todos os timeframes
- Funciona com qualquer ativo (forex, ações, criptos)
- Uso mínimo de memória
- Integração nativa com MT5

✅ **Documentação Completa:**
- Guia de instalação passo-a-passo
- Exemplos práticos de uso
- Troubleshooting detalhado
- Casos de uso recomendados

## 📂 Estrutura do Projeto

```
📦 Volume-Color-Indicators-MT5/
├── 📄 README_INDICATORS.md           (este arquivo)
├── 📄 METATRADER_SETUP.md           (guia instalação passo-a-passo)
├── 📄 VOLUME_INDICATOR_GUIDE.md      (documentação completa)
│
├── 📊 INDICADORES (copiar para MT5):
│   ├── Volume_Color_Candles.mq5      ⭐ PRINCIPAL (use este)
│   ├── Volume_Color_Indicator.mq5    (alternativo)
│   └── Volume_Heatmap.mq5           (opcional)
│
└── 📋 CONFIGURAÇÕES:
    └── Exemplos de setup por estratégia
```

## 🚀 Quick Start (5 minutos)

### 1️⃣ Instalação Rápida
```bash
1. Copie Volume_Color_Candles.mq5 para:
   C:\Users\[SEU_USER]\AppData\Roaming\MetaQuotes\Terminal\[ID]\MQL5\Indicators\

2. Abra MetaTrader 5

3. Pressione F4 (MetaEditor)

4. Abra o arquivo e pressione F5 (Compile)

5. Feche MetaEditor

6. Volta ao MT5 e abra um gráfico
```

### 2️⃣ Aplicar ao Gráfico
```
Clique no gráfico → Insert → Indicators → Custom
Procure por: Volume Color Candles
Clique OK
```

### 3️⃣ Pronto! 🎉
Os candles devem aparecer coloridos conforme o volume.

**Quer instruções detalhadas?** Veja: [METATRADER_SETUP.md](METATRADER_SETUP.md)

## 📖 Documentação

| Documento | Conteúdo |
|-----------|----------|
| [METATRADER_SETUP.md](METATRADER_SETUP.md) | Instalação passo-a-passo, compilação, troubleshooting |
| [VOLUME_INDICATOR_GUIDE.md](VOLUME_INDICATOR_GUIDE.md) | Uso completo, estratégias, configurações avançadas |
| [Volume_Color_Candles.mq5](Volume_Color_Candles.mq5) | Código-fonte principal |

## 💡 Como Usar

### Cenário 1: Confirmar Breakout
```
Preço quebra resistência
     ↓
Candle VERDE aparece
     ↓
✅ Sinal forte de compra
```

### Cenário 2: Detectar Divergência
```
Topo 1: Volume VERDE
Topo 2: Volume AMARELO (descendo)
Topo 3: Volume VERMELHO (fraco)
     ↓
✅ Possível reversão
```

### Cenário 3: Analisar Suporte
```
Preço toca suporte com volume VERDE
     ↓
✅ Suporte forte, pode comprar

Preço toca suporte com volume VERMELHO
     ↓
⚠️ Suporte fraco, cuidado
```

## ⚙️ Configurações por Estilo

### 📊 Para Iniciantes (Padrão)
```
VolumePeriod = 20
HighThreshold = 1.5
LowThreshold = 0.9
Timeframe = H1 (1 hora)
```

### ⚡ Para Scalpers (M5/M15)
```
VolumePeriod = 10
HighThreshold = 1.3
LowThreshold = 0.8
Timeframe = M5 ou M15
```

### 📈 Para Swing Traders (H1/H4)
```
VolumePeriod = 50
HighThreshold = 1.5
LowThreshold = 0.9
Timeframe = H1 ou H4
```

### 🎯 Para Análise Agressiva
```
UseMovingAverage = false (modo percentil)
Período de lookback = 50 candles
ColorHighVolume = Verde forte
ColorLowVolume = Vermelho forte
```

## 🎨 Personalizações

### Mudar Cores (Mais Fácil)
1. Clique direito no indicador → **Edit...**
2. Mude **ColorHighVolume**, **ColorMedVolume**, **ColorLowVolume**
3. Clique OK

### Ajustar Sensibilidade
Para ser **mais sensível** (mais cores verdes):
- Reduza `HighThreshold` (ex: 1.5 → 1.2)
- Reduza `VolumePeriod` (ex: 20 → 15)

Para ser **menos sensível** (mais cores vermelhas):
- Aumente `HighThreshold` (ex: 1.5 → 1.8)
- Aumente `VolumePeriod` (ex: 20 → 30)

## 📊 Comparação das 3 Versões

| Recurso | Candles | Indicator | Heatmap |
|---------|---------|-----------|---------|
| Performance | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| Memória | Mínima | Alta | Baixa |
| Precisão | Máxima | Boa | Boa |
| Fácil uso | ✅ | ✅ | ✅ |
| Recomendado | ✅✅✅ | Para teste | Análise |

**Recomendação:** Use `Volume_Color_Candles.mq5`

## ⚡ Requisitos

- ✅ MetaTrader 5 (versão 5.0+)
- ✅ Windows 7 ou superior
- ✅ Permissões de usuário
- ✅ Conexão com broker (para dados)

## 📝 Exemplos de Uso Real

### Exemplo 1: Identificar Movimento Forte
```
EUR/USD em tendência de alta
Vela verde grande aparece
Volume confirmado
→ Bom momento para entrar LONG
```

### Exemplo 2: Avisar Fraqueza
```
Preço em máxima anterior
Vela vermelha pequena
Volume baixo
→ Possível rejeição
```

### Exemplo 3: Análise de Padrão
```
Padrão de duplo topo
1º topo: VERDE + VERDE
2º topo: AMARELO + VERMELHO
→ Bearish divergência
```

## 🔧 Troubleshooting Rápido

| Problema | Solução |
|----------|---------|
| Candles não coloridos | Recompile (F5) ou reinicie MT5 |
| Muitos candles verdes | Aumente `HighThreshold` para 1.8 |
| Muitos candles vermelhos | Diminua `LowThreshold` para 0.7 |
| Indicador não aparece | Copie arquivo para pasta Indicators |
| Erro na compilação | Atualize MT5 ou use versão alternativa |

**Guia completo:** [METATRADER_SETUP.md - Troubleshooting](METATRADER_SETUP.md#troubleshooting)

## 🎓 Aprender Mais

1. **Começar:** [METATRADER_SETUP.md](METATRADER_SETUP.md) - Instalação
2. **Usar:** [VOLUME_INDICATOR_GUIDE.md](VOLUME_INDICATOR_GUIDE.md) - Estratégias
3. **Personalizar:** Editar valores de `input` no código
4. **Avançado:** Modificar lógica em `DetermineVolumeColor()`

## 💰 Aplicações Práticas

✅ **Confirmar Sinais**
- Entrada com volume alto = sinal mais forte
- Entrada com volume baixo = sinal fraco

✅ **Gerenciar Risco**
- Identificar suportes/resistências fortes (volume alto)
- Evitar negociar em volume baixo

✅ **Análise Técnica**
- Divergências de volume
- Acumulação vs distribuição
- Teste de níveis

✅ **Day Trading**
- Detectar melhores momentos para entrar
- Evitar falsas saídas (volume baixo)
- Confirmar breakouts

## 📊 Estatísticas

- **Linhas de código:** ~680 MQL5
- **Buffers:** 1-4 (conforme versão)
- **Compatibilidade:** MT5 5.0+
- **Timeframes:** Todos (M1 a MN)
- **Ativos:** Todos (Forex, Ações, Índices, Criptos)

## 🤝 Contribuições

Este projeto é open source. Melhorias são bem-vindas!

### Ideias para Contribuições:
- Tradução para outros idiomas
- Temas de cores alternativos
- Alertas de volume
- Integração com EA (Expert Advisors)
- Análise estatística de volume

## 📜 Licença

Código aberto para uso pessoal e educacional.

## ⚠️ Aviso Legal

Este indicador é apenas uma ferramenta de análise. 

**NÃO é:**
- Garantia de lucro
- Sinal automático de entrada/saída
- Substituto para análise técnica completa
- Indicação de compra/venda

**Use com:**
- Análise técnica adicional
- Gerenciamento de risco
- Stop loss definido
- Conta de prática primeiro

**Trading envolve risco. Você pode perder dinheiro.**

## 📞 Suporte

### Passos para Resolver Problemas:
1. Leia [METATRADER_SETUP.md](METATRADER_SETUP.md)
2. Consulte [VOLUME_INDICATOR_GUIDE.md](VOLUME_INDICATOR_GUIDE.md)
3. Teste em conta **DEMO** antes de real
4. Verifique se MT5 está atualizado

### Erro Comum?
Procure no [Troubleshooting Guide](METATRADER_SETUP.md#troubleshooting)

## 🎯 Roadmap

- [ ] v1.1 - Alertas de volume
- [ ] v1.2 - Histórico de volume
- [ ] v1.3 - Análise estatística
- [ ] v1.4 - Integração com EA
- [ ] v2.0 - Interface gráfica

## 📚 Recursos Adicionais

- [Documentação MQL5 Oficial](https://www.mql5.com/pt/docs)
- [MetaTrader 5 Help](https://www.metatrader5.com/pt/help)
- [Community MQL5](https://www.mql5.com/pt/community)

## 🙏 Agradecimentos

Desenvolvido com ❤️ para traders que buscam análise de volume visual.

---

## 📈 Primeiros Passos

### Imediato (Agora):
1. Leia [METATRADER_SETUP.md](METATRADER_SETUP.md) - 5 min
2. Instale o indicador - 2 min
3. Abra um gráfico e veja funcionando - 1 min

### Hoje:
1. Teste em 3 timeframes diferentes
2. Ajuste cores conforme sua preferência
3. Leia exemplos em [VOLUME_INDICATOR_GUIDE.md](VOLUME_INDICATOR_GUIDE.md)

### Esta Semana:
1. Pratique identificar padrões
2. Combine com 1 outro indicador
3. Teste em conta DEMO

### Próximas Semanas:
1. Desenvolva sua estratégia usando volume
2. Teste em live (com pouco dinheiro)
3. Otimize parâmetros para seu estilo

---

**Versão:** 1.0  
**Última atualização:** 2026-10-06  
**Autor:** Claude Code  
**Idioma:** Português

**Pronto para começar?** → [METATRADER_SETUP.md](METATRADER_SETUP.md) ⚡
