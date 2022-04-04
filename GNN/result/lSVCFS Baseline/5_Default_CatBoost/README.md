# Summary of 5_Default_CatBoost

[<< Go back](../README.md)

## CatBoost

- **n_jobs**: -1
- **learning_rate**: 0.1
- **depth**: 6
- **rsm**: 1
- **loss_function**: Logloss
- **eval_metric**: AUC
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

7.7 seconds

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.69495   |  nan        |
| auc       | 0.55687   |  nan        |
| f1        | 0.657266  |    0.120183 |
| accuracy  | 0.548716  |    0.502599 |
| precision | 0.578947  |    0.681924 |
| recall    | 1         |    0.120183 |
| mcc       | 0.0962618 |    0.460723 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.69495   |  nan        |
| auc       | 0.55687   |  nan        |
| f1        | 0.520012  |    0.502599 |
| accuracy  | 0.548716  |    0.502599 |
| precision | 0.542395  |    0.502599 |
| recall    | 0.499404  |    0.502599 |
| mcc       | 0.0958501 |    0.502599 |

## Confusion matrix (at threshold=0.502599)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1043 |              707 |
| Labeled as 1 |              840 |              838 |

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
