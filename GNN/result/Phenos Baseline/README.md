# AutoML Leaderboard

| Best model   | name                                                         | model_type     | metric_type   |   metric_value |   train_time |
|:-------------|:-------------------------------------------------------------|:---------------|:--------------|---------------:|-------------:|
|              | [1_Baseline](1_Baseline/README.md)                           | Baseline       | auc           |       0.5      |         0.89 |
|              | [2_DecisionTree](2_DecisionTree/README.md)                   | Decision Tree  | auc           |       0.669704 |         5.11 |
|              | [3_Default_Xgboost](3_Default_Xgboost/README.md)             | Xgboost        | auc           |       0.687464 |         5.59 |
|              | [4_Default_NeuralNetwork](4_Default_NeuralNetwork/README.md) | Neural Network | auc           |       0.693547 |         3.13 |
|              | [5_Default_RandomForest](5_Default_RandomForest/README.md)   | Random Forest  | auc           |       0.684538 |         5.59 |
| **the
best** | [Ensemble](Ensemble/README.md)                               | Ensemble       | auc           |       0.694195 |         0.74 |

### AutoML Performance
![AutoML Performance](ldb_performance.png)

### AutoML Performance Boxplot
![AutoML Performance Boxplot](ldb_performance_boxplot.png)

### Features Importance
![features importance across models](features_heatmap.png)

### Spearman Correlation of Models
![models spearman correlation](correlation_heatmap.png)

