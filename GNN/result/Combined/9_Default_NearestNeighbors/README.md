# Summary of 9_Default_NearestNeighbors

[<< Go back](../README.md)

## k-Nearest Neighbors (Nearest Neighbors)

- **n_jobs**: -1
- **n_neighbors**: 5
- **weights**: uniform
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

2.5 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 1.17139  |       nan   |
| auc       | 0.70975  |       nan   |
| f1        | 0.686843 |         0.2 |
| accuracy  | 0.65986  |         0.5 |
| precision | 0.813776 |         0.8 |
| recall    | 0.946961 |         0   |
| mcc       | 0.319138 |         0.5 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 1.17139  |       nan   |
| auc       | 0.70975  |       nan   |
| f1        | 0.647308 |         0.5 |
| accuracy  | 0.65986  |         0.5 |
| precision | 0.657248 |         0.5 |
| recall    | 0.637664 |         0.5 |
| mcc       | 0.319138 |         0.5 |

## Confusion matrix (at threshold=0.5)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1192 |              558 |
| Labeled as 1 |              608 |             1070 |

## Learning curves

![Learning curves](learning_curves.png)

## Permutation-based Importance

![Permutation-based Importance](permutation_importance.png)

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
