# AutoML Leaderboard

| Best model   | name                                                         | model_type     | metric_type   |   metric_value |   train_time |
|:-------------|:-------------------------------------------------------------|:---------------|:--------------|---------------:|-------------:|
|              | [1_Baseline](1_Baseline/README.md)                           | Baseline       | auc           |       0.5      |         0.95 |
|              | [2_DecisionTree](2_DecisionTree/README.md)                   | Decision Tree  | auc           |       0.51616  |         7.94 |
|              | [3_Default_LightGBM](3_Default_LightGBM/README.md)           | LightGBM       | auc           |       0.5369   |         3.29 |
|              | [4_Default_Xgboost](4_Default_Xgboost/README.md)             | Xgboost        | auc           |       0.560548 |        61.95 |
|              | [5_Default_CatBoost](5_Default_CatBoost/README.md)           | CatBoost       | auc           |       0.55687  |         8.54 |
|              | [6_Default_NeuralNetwork](6_Default_NeuralNetwork/README.md) | Neural Network | auc           |       0.515371 |         9.29 |
|              | [7_Default_RandomForest](7_Default_RandomForest/README.md)   | Random Forest  | auc           |       0.533887 |        14.74 |
|              | [8_Default_ExtraTrees](8_Default_ExtraTrees/README.md)       | Extra Trees    | auc           |       0.531959 |        10.73 |
| **the
best** | [Ensemble](Ensemble/README.md)                               | Ensemble       | auc           |       0.566304 |         0.75 |

### AutoML Performance
![AutoML Performance](ldb_performance.png)

### AutoML Performance Boxplot
![AutoML Performance Boxplot](ldb_performance_boxplot.png)

### Features Importance
![features importance across models](features_heatmap.png)

### Spearman Correlation of Models
![models spearman correlation](correlation_heatmap.png)

