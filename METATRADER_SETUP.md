# 🚀 Guia de Instalação - Indicadores de Volume no MetaTrader 5

## 📋 Sumário
1. [Requisitos](#requisitos)
2. [Instalação Passo-a-Passo](#instalação-passo-a-passo)
3. [Compilação](#compilação)
4. [Aplicação ao Gráfico](#aplicação-ao-gráfico)
5. [Configuração Inicial](#configuração-inicial)
6. [Teste Prático](#teste-prático)
7. [Troubleshooting](#troubleshooting)

---

## Requisitos

✅ MetaTrader 5 instalado (versão 5.0+)  
✅ Acesso à pasta de instalação do MT5  
✅ Windows com permissões de usuário  
✅ Conta demo ou real (para testes)  

---

## Instalação Passo-a-Passo

### Passo 1️⃣: Localizar a Pasta de Indicadores

#### Windows:

**Opção A - Via Terminal (Recomendado):**
```bash
# Abra o Prompt de Comando (CMD) como Administrador
# Ou PowerShell

# Cole este comando para encontrar o caminho:
echo %APPDATA%
```

Isso mostrará: `C:\Users\SeuUsuário\AppData\Roaming`

**Opção B - Manual:**
1. Abra o **Explorador de Arquivos**
2. Pressione `Ctrl + L` para acessar a barra de endereço
3. Cole: `%APPDATA%\MetaQuotes\Terminal`
4. Procure por uma pasta com número longo (seu Terminal ID)

#### Estrutura esperada:
```
📁 AppData\Roaming\MetaQuotes\Terminal\[SEU_TERMINAL_ID]\
├── 📁 MQL5
│   ├── 📁 Experts
│   ├── 📁 Indicators  ← AQUI!
│   ├── 📁 Libraries
│   └── 📁 Scripts
├── 📁 profiles
└── (outros arquivos)
```

### Passo 2️⃣: Copiar os Arquivos

1. **Baixe os indicadores** do repositório:
   - `Volume_Color_Candles.mq5` (PRINCIPAL)
   - `Volume_Color_Indicator.mq5` (Alternativo)
   - `Volume_Heatmap.mq5` (Opcional)

2. **Navegue até a pasta Indicators** conforme acima

3. **Cole os arquivos .mq5** dentro da pasta

**Resultado esperado:**
```
📁 Indicators\
├── Volume_Color_Candles.mq5
├── Volume_Color_Indicator.mq5
├── Volume_Heatmap.mq5
└── (outros indicadores que você já tem)
```

---

## Compilação

### Método 1️⃣: Via MetaEditor (Recomendado)

1. **Abra o MetaTrader 5**

2. **Acesse o MetaEditor:**
   - Pressione `F4` no teclado, OU
   - Menu: **Tools** → **MetaQuotes Language Editor**

3. **Abra o arquivo:**
   - Menu: **File** → **Open**
   - Navegue até: `MQL5/Indicators/Volume_Color_Candles.mq5`

4. **Compile:**
   - Pressione `F5` OU
   - Menu: **Compile** → **Compile** OU
   - Clique no botão 🔧 **Compile**

5. **Verifique se compilou:**
   - Você deve ver na parte inferior: `0 error(s), 0 warning(s)`
   - Se houver erros, veja a seção [Troubleshooting](#troubleshooting)

**Captura esperada:**
```
[15:30:45] Volume_Color_Candles: compilation successful
```

### Método 2️⃣: Compilar Todos de Uma Vez

```
Pressione F5 três vezes, uma para cada arquivo:
1. Volume_Color_Candles.mq5
2. Volume_Color_Indicator.mq5  
3. Volume_Heatmap.mq5
```

---

## Aplicação ao Gráfico

### Preparar o Gráfico:

1. **Abra o MetaTrader 5**

2. **Selecione um ativo:**
   - Clique na guia **Market Watch** (esquerda)
   - Procure por qualquer ativo: EUR/USD, AAPL, GOLD, etc.
   - Clique duas vezes para abrir um gráfico

3. **Escolha um timeframe:**
   - Recomendado para começar: **H1** (1 hora) ou **D1** (diário)
   - Botões na parte superior do gráfico

### Inserir o Indicador:

**Opção A - Via Menu:**
1. Menu: **Insert** → **Indicators** → **Custom**
2. Procure por: `Volume Color Candles`
3. Clique em **OK**

**Opção B - Via Atalho:**
1. Clique com botão direito no gráfico
2. Selecione: **Indicators List**
3. Clique em **+** (novo)
4. Procure: `Volume Color Candles`

**Opção C - Direto (Mais Rápido):**
1. Pressione `Ctrl + I` no gráfico
2. Procure: `Volume Color Candles`
3. **OK**

---

## Configuração Inicial

Quando o indicador abrir, você verá a janela de **Inputs**:

```
┌─────────────────────────────────────────┐
│ Volume Color Candles - Inputs           │
├─────────────────────────────────────────┤
│ VolumePeriod          [20]              │  ← Período da média
│ ColorHighVolume       [Verde]           │  ← Cor volume alto
│ ColorMedVolume        [Amarelo]         │  ← Cor volume médio
│ ColorLowVolume        [Vermelho]        │  ← Cor volume baixo
│ UseMovingAverage      [Verdadeiro]      │  ← Usar média móvel
│ HighThreshold         [1.5]             │  ← Limite volume alto
│ LowThreshold          [0.9]             │  ← Limite volume baixo
│                                         │
│  [OK]  [Cancelar]  [Padrão]            │
└─────────────────────────────────────────┘
```

### Configurações por Tipo de Trading:

#### 📊 Iniciante (Padrão):
```
VolumePeriod = 20
HighThreshold = 1.5
LowThreshold = 0.9
UseMovingAverage = ✓
```
✅ Clique **OK** para usar padrão

#### ⚡ Scalping (M5/M15):
```
VolumePeriod = 10
HighThreshold = 1.3
LowThreshold = 0.8
UseMovingAverage = ✓
```

#### 📈 Swing (H1/H4):
```
VolumePeriod = 50
HighThreshold = 1.5
LowThreshold = 0.9
UseMovingAverage = ✓
```

#### 🎯 Agressivo:
```
VolumePeriod = 20
HighThreshold = 1.2
LowThreshold = 0.7
UseMovingAverage = ✗ (usar percentil)
```

---

## Teste Prático

### Verificar se está funcionando:

1. **Após inserir o indicador:**
   - Os candles devem aparecer **coloridos**
   - Verde = volume alto
   - Amarelo = volume médio
   - Vermelho = volume baixo

2. **Teste de cores:**
   ```
   Procure por candles verdes grandes
   ↓
   Candle vermelho pequeno
   ↓
   Isso indica mudança de volume
   ↓
   ✅ Indicador está funcionando!
   ```

3. **Navegação:**
   - Pressione ← (seta esquerda) para voltar
   - Pressione → (seta direita) para avançar
   - Use Scroll para dar zoom
   - As cores devem aparecer em TODOS os candles

### Teste em Diferentes Timeframes:

| Timeframe | Quando usar | Volatilidade |
|-----------|-----------|-----------|
| M5 | Scalping rápido | Alta |
| M15 | Day trading | Média |
| H1 | Swing trading | Baixa |
| H4 | Médio prazo | Muito baixa |
| D1 | Longo prazo | Estável |

**Recomendação para teste:** H1 (mais estável para visualizar o padrão)

---

## Troubleshooting

### ❌ Problema: "Indicador não aparece no menu"

**Causa:** Arquivo não foi encontrado ou não compilou

**Solução:**
```
1. Verifique se o arquivo está em:
   C:\Users\[SEU_USER]\AppData\Roaming\MetaQuotes\Terminal\[ID]\MQL5\Indicators\

2. Pressione F4 (abra MetaEditor)

3. Pressione F5 (compile)

4. Feche o MT5 completamente (Ctrl+Q)

5. Aguarde 5 segundos

6. Reabra o MT5

7. Tente novamente: Insert → Indicators → Custom
```

---

### ❌ Problema: "Candles não ficam coloridos"

**Causa 1:** Indicador não carregou corretamente

**Solução:**
```
1. Clique direito no gráfico
2. Indicators → Remove
3. Pressione F1 (ajuda)
4. Feche a ajuda
5. Insira novamente: Insert → Indicators → Custom
6. Selecione: Volume Color Candles
7. Clique OK
```

**Causa 2:** Configuração incorreta

**Solução:**
```
1. Clique direito no indicador (parte superior esquerda do gráfico)
2. Edit...
3. Mude UseMovingAverage para ✓ (habilitado)
4. Clique OK
```

---

### ❌ Problema: "Erro de compilação"

**Mensagem típica:**
```
[Error] 'DRAW_COLOR_CANDLES' - unknown identifier
```

**Causa:** Versão antiga do MT5

**Solução:**
```
1. Atualize o MetaTrader 5:
   - Menu: Help → Check Updates
   
2. Se já está atualizado, use:
   Volume_Color_Indicator.mq5 (versão alternativa)
```

---

### ❌ Problema: "Muitos candles vermelhos"

**Causa:** Volume referência está alto demais

**Solução:**
```
1. Clique direito no indicador
2. Edit...
3. Mude VolumePeriod: 20 → 15
4. Mude LowThreshold: 0.9 → 0.85
5. OK
```

---

### ❌ Problema: "Muitos candles verdes"

**Causa:** Volume referência está baixo demais

**Solução:**
```
1. Clique direito no indicador
2. Edit...
3. Mude VolumePeriod: 20 → 30
4. Mude HighThreshold: 1.5 → 1.3
5. OK
```

---

## 🎨 Personalizar Cores

Para mudar as cores padrão:

### Via MT5 (Mais fácil):
1. Clique direito no indicador
2. **Edit...**
3. Mude:
   - **ColorHighVolume** → clique no campo e escolha verde
   - **ColorMedVolume** → escolha amarelo
   - **ColorLowVolume** → escolha vermelho
4. **OK**

### Via Código (Avançado):
1. Abra MetaEditor (F4)
2. File → Open → `Volume_Color_Candles.mq5`
3. Localize as linhas:
```mql5
input color       ColorHighVolume = clrGreen;
input color       ColorMedVolume = clrYellow;
input color       ColorLowVolume = clrRed;
```

4. Mude para cores personalizadas:
```mql5
input color       ColorHighVolume = 0x00FF00;  // Verde brilhante
input color       ColorMedVolume = 0xFFFF00;   // Amarelo
input color       ColorLowVolume = 0xFF0000;   // Vermelho
```

5. Compile (F5)

---

## ✅ Checklist Final

Antes de usar em operações reais:

- [ ] MetaTrader 5 atualizado
- [ ] Arquivos .mq5 copiados corretamente
- [ ] Indicadores compilados sem erros
- [ ] Candles aparecem coloridos no gráfico
- [ ] Cores mudam conforme o volume
- [ ] Testado em pelo menos 3 timeframes diferentes
- [ ] Parâmetros ajustados para seu estilo
- [ ] Testado em conta DEMO antes de usar em real

---

## 📞 Suporte Técnico

Se tiver problemas:

1. **Verifique a documentação:** `VOLUME_INDICATOR_GUIDE.md`
2. **Pesquise o erro** no fórum oficial MetaTrader
3. **Teste em conta demo** antes de usar em real
4. **Não use indicador sozinho** - combine com análise técnica

---

## 🎓 Próximos Passos

Depois de instalar:

1. **Estude os padrões:**
   - Verde grande = movimento forte
   - Vermelho = fraqueza
   - Sequência de cores = tendência

2. **Combine com indicadores:**
   - Moving Average (tendência)
   - RSI (sobrecompra/sobrevenda)
   - Bollinger Bands (volatilidade)

3. **Pratique em demo:**
   - Mínimo 1 semana antes de real
   - Teste sua estratégia

4. **Leia a documentação completa:**
   - `VOLUME_INDICATOR_GUIDE.md`

---

**Versão:** 1.0  
**Última atualização:** 2026-10-06  
**Suporte:** MetaTrader 5 v5.0+
