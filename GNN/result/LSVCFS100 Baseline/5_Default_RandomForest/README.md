# Summary of 5_Default_RandomForest

[<< Go back](../README.md)

## Random Forest

- **n_jobs**: -1
- **criterion**: gini
- **max_features**: 0.9
- **min_samples_split**: 30
- **max_depth**: 4
- **eval_metric_name**: auc
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

9.1 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.641744 |  nan        |
| auc       | 0.69098  |  nan        |
| f1        | 0.671332 |    0.356934 |
| accuracy  | 0.644399 |    0.469284 |
| precision | 0.787634 |    0.683694 |
| recall    | 1        |    0.178054 |
| mcc       | 0.293471 |    0.490833 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.641744 |  nan        |
| auc       | 0.69098  |  nan        |
| f1        | 0.603061 |    0.469284 |
| accuracy  | 0.644399 |    0.469284 |
| precision | 0.664752 |    0.469284 |
| recall    | 0.551847 |    0.469284 |
| mcc       | 0.29006  |    0.469284 |

## Confusion matrix (at threshold=0.469284)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1283 |              467 |
| Labeled as 1 |              752 |              926 |

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

## SHAP Importance

![SHAP Importance](shap_importance.png)

[<< Go back](../README.md)
