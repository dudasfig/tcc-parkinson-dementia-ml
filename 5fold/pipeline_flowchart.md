## Fluxograma da pipeline (Mermaid)

```mermaid
flowchart TD

    A[Carregar UDS.csv<br/>(205.908 x 1.024)] --> B[Construir visit_date<br/>(VISITYR, VISITMO, VISITDAY)]
    B --> C[Filtrar período<br/>2005-09-01 a 2015-02-28]

    C --> D[Limpeza de dados]
    D --> D1[Mapear códigos de missing<br/>(8, 88, 9, 99, ... → NaN)]
    D --> D2[Remover visitas telefônicas<br/>(PACKET != 'T')]
    D --> D3[Remover registros sem data válida]

    D1 --> E[Definir baseline]
    D2 --> E
    D3 --> E

    E[Baseline por participante<br/>(NACCVNUM == 1, DEMENTED == 0,<br/>FORMVER < 3)] --> F[Calcular months_from_baseline]
    F --> G[Definir desfecho]

    G[Demência incidente ≤ 29 meses<br/>(NACCVNUM > 1 & DEMENTED == 1)] --> H[Construir rótulo<br/>incident_dementia (0/1)]

    H --> I[Seleção/Harmonização de variáveis]
    I --> I1[219 variáveis clínicas/demográficas/funcionais/cognitivas]
    I1 --> I2[Harmonizar nomes (ex.: BIRTH_#MOS→BIRTHMO)<br/>Excluir *_PROB e RANDVAR_*]

    I2 --> J[Imputação univariada<br/>(amostragem com reposição por variável)]
    J --> K[Codificação One-Hot<br/>para categóricas]
    K --> L[Padronização (z-score)]
    L --> M[Salvar dados<br/>(processed_data.pkl, encoded_data.npy,<br/>encoded_variables.npy, outcome.npy, NACCID.npy)]

    M --> N[Validação 5-Fold Estratificada<br/>com GridSearchCV (AUC)]

    N --> O1[Logistic Regression<br/>(class_weight='balanced')]
    N --> O2[SVM Linear<br/>(class_weight='balanced')]
    N --> O3[Random Forest<br/>(balanced_subsample)]
    N --> O4[Gradient Boosting]

    O1 --> P[Coletar probabilidades e métricas<br/>Accuracy, Sensitivity, Specificity, PPV, NPV, AUC]
    O2 --> P
    O3 --> P
    O4 --> P

    P --> Q[Bootstrap por fold (n=1000)<br/>para intervalos empíricos]
    Q --> R[Análise de importância de variáveis<br/>(|coef|, Gini)]
    R --> S[Experimentos AUC × Top-K features<br/>+ bandas de incerteza]
    S --> T[Exportar resultados/gráficos<br/>ROC e AUC vs Features em 5fold/]
```

Observações:
- Baseline: primeira visita sem demência, versões de formulário < 3; visitas telefônicas excluídas.
- Desfecho: demência em até 29 meses após baseline.
- Tratamento de dados: imputação univariada, One-Hot para categóricas, padronização.
- Avaliação: 5-Fold estratificado com otimização por AUC e bootstrap por fold (n=1000).
- Artefatos: resultados e figuras salvos em `5fold/`.


