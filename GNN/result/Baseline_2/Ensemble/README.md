# Summary of Ensemble

[<< Go back](../README.md)

## Ensemble structure

| Model                  |   Weight |
|:-----------------------|---------:|
| 3_Linear               |        1 |
| 4_Default_Xgboost      |        3 |
| 6_Default_RandomForest |        2 |

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.638378 |  nan        |
| auc       | 0.577829 |  nan        |
| f1        | 0.510638 |    0.335527 |
| accuracy  | 0.689956 |    0.537046 |
| precision | 0.777778 |    0.537046 |
| recall    | 1        |    0.249642 |
| mcc       | 0.191527 |    0.537046 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.638378  |  nan        |
| auc       | 0.577829  |  nan        |
| f1        | 0.164706  |    0.537046 |
| accuracy  | 0.689956  |    0.537046 |
| precision | 0.777778  |    0.537046 |
| recall    | 0.0921053 |    0.537046 |
| mcc       | 0.191527  |    0.537046 |

## Confusion matrix (at threshold=0.537046)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              151 |                2 |
| Labeled as 1 |               69 |                7 |

## Learning curves

![Learning curves](learning_curves.png)

## Confusion Matrix

![Confusion Matrix](confusion_matrix.png)

## Normalized Confusion Matrix

![Normalized Confusion Matrix](confusion_matrix_normalized.png)

## ROC Curve

![ROC Curve](roc_curve.png)

## Kolmogorov-Smirnov Statistic

![Kolmogorov-Smirnov Statistic](ks_statistic.png)

## Precision-Recall Curve

![Precision-Recall Curve](precision_recall_curve.png)

## Calibration Curve

![Calibration Curve](calibration_curve_curve.png)

## Cumulative Gains Curve

![Cumulative Gains Curve](cumulative_gains_curve.png)

## Lift Curve

![Lift Curve](lift_curve.png)

[<< Go back](../README.md)
