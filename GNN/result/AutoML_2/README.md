# AutoML Leaderboard

| Best model   | name                                                         | model_type     | metric_type   |   metric_value |   train_time |
|:-------------|:-------------------------------------------------------------|:---------------|:--------------|---------------:|-------------:|
|              | [1_Baseline](1_Baseline/README.md)                           | Baseline       | auc           |       0.5      |         0.91 |
|              | [2_DecisionTree](2_DecisionTree/README.md)                   | Decision Tree  | auc           |       0.517821 |         6.65 |
| **the
best** | [3_Linear](3_Linear/README.md)                               | Linear         | auc           |       0.603392 |         3.2  |
|              | [4_Default_Xgboost](4_Default_Xgboost/README.md)             | Xgboost        | auc           |       0.551788 |        26.29 |
|              | [5_Default_NeuralNetwork](5_Default_NeuralNetwork/README.md) | Neural Network | auc           |       0.563967 |         2.64 |
|              | [6_Default_RandomForest](6_Default_RandomForest/README.md)   | Random Forest  | auc           |       0.558326 |         7.23 |
|              | [Ensemble](Ensemble/README.md)                               | Ensemble       | auc           |       0.603392 |         0.51 |

### AutoML Performance

![AutoML Performance](ldb_performance.png)

### AutoML Performance Boxplot

![AutoML Performance Boxplot](ldb_performance_boxplot.png)

### Features Importance

![features importance across models](features_heatmap.png)

### Spearman Correlation of Models

![models spearman correlation](correlation_heatmap.png)

