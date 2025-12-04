# tcc-parkinson-dementia-ml

# Predição de Demência em Pacientes com Parkinson usando Aprendizado de Máquina
Repositório oficial do Trabalho de Conclusão de Curso (TCC) de Eduarda Figueredo, dedicado à construção, análise e comparação de modelos de Machine Learning para prever **progressão para Demência** em dois cenários:

1. **População geral do NACC UDS** (replicação do estudo de James et al., 2021)  
2. **Pacientes com Doença de Parkinson** (extensão inédita do estudo original)

---

## Objetivo Geral

Avaliar a capacidade de algoritmos de Machine Learning de prever a **progressão para Demência em até 29 meses**, comparando:

O estudo busca identificar:
- Desempenho preditivo dos algoritmos  
- Variáveis cognitivas mais relevantes  
- Diferenças no perfil clínico entre as populações  

---

## Metodologia

### **1. Base de Dados**
Utilizou-se o **NACC UDS v3**, contendo:
- Dados demográficos  
- Exames cognitivos  
- Histórico clínico  
- Variáveis neuropsicológicas  

Subpopulações:
- **Amostra geral** (replicação de James et al.)
- **Pacientes com Doença de Parkinson**

---

### **2. Pré-processamento**
- Remoção de colunas com muito missing
- Normalização e encoding
- Seleção automática de variáveis
- Estratificação por desfecho
- Criação do conjunto de treinamento e teste para **5-Fold Cross-Validation**

---

### **3. Modelos Avaliados**
A pipeline inclui seis algoritmos:

- Logistic Regression (LR)  
- Support Vector Machine (SVM)  
- Random Forest (RF)  
- Gradient Boosting (GB)  
- Bernoulli Naive Bayes (BNB)  
- Multilayer Perceptron (MLP)  

A parametrização segue:
- **James et al. (2021)** para LR, SVM, RF e GB  
- **Wei & Razavian (2019)** para MLP (arquiteturas 256–1024 neurônios, dropout, Adam)  
- Literatura clássica para o BNB  

---

### **4. Métricas**
- AUC ROC  
- Sensibilidade  
- Especificidade  
- Permutation Importance  
- Análises de relevância cognitiva  

---
## ⚙️ Como rodar o projeto

Para executar os notebooks deste repositório, você precisa ter o Python e algumas bibliotecas instaladas.

### 1. Requisitos
```
Python 3.9+
numpy
pandas
scikit-learn
matplotlib
seaborn
joblib
```
### 2. Instalação rápida das dependências
```
pip install numpy pandas scikit-learn matplotlib seaborn joblib
```
### 3. Executando os notebooks

Você pode abrir os arquivos diretamente usando:

- **Jupyter Notebook**
- **VS Code com extensão Jupyter**
- **Google Colab**


