# AutoML Leaderboard

| Best model   | name                                                         | model_type     | metric_type   |   metric_value |   train_time |
|:-------------|:-------------------------------------------------------------|:---------------|:--------------|---------------:|-------------:|
|              | [1_Baseline](1_Baseline/README.md)                           | Baseline       | auc           |       0.5      |         0.93 |
|              | [2_DecisionTree](2_DecisionTree/README.md)                   | Decision Tree  | auc           |       0.529015 |         7.02 |
|              | [3_Linear](3_Linear/README.md)                               | Linear         | auc           |       0.584224 |         5.73 |
| **the
best** | [4_Default_Xgboost](4_Default_Xgboost/README.md)             | Xgboost        | auc           |       0.647255 |        52.3  |
|              | [5_Default_NeuralNetwork](5_Default_NeuralNetwork/README.md) | Neural Network | auc           |       0.562013 |         2.91 |
|              | [6_Default_RandomForest](6_Default_RandomForest/README.md)   | Random Forest  | auc           |       0.595046 |        12.78 |
|              | [Ensemble](Ensemble/README.md)                               | Ensemble       | auc           |       0.647255 |         0.45 |

### AutoML Performance

![AutoML Performance](ldb_performance.png)

### AutoML Performance Boxplot

![AutoML Performance Boxplot](ldb_performance_boxplot.png)

### Features Importance

![features importance across models](features_heatmap.png)

### Spearman Correlation of Models

![models spearman correlation](correlation_heatmap.png)

