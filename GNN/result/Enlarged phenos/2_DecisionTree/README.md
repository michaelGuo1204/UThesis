# Summary of 2_DecisionTree

[<< Go back](../README.md)

## Decision Tree

- **n_jobs**: -1
- **criterion**: gini
- **max_depth**: 3
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

7.4 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.636107 |  nan        |
| auc       | 0.686825 |  nan        |
| f1        | 0.685212 |    0.360543 |
| accuracy  | 0.645123 |    0.393044 |
| precision | 0.688312 |    0.64668  |
| recall    | 1        |    0.119135 |
| mcc       | 0.290289 |    0.393044 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.636107 |  nan        |
| auc       | 0.686825 |  nan        |
| f1        | 0.640388 |    0.393044 |
| accuracy  | 0.645123 |    0.393044 |
| precision | 0.633094 |    0.393044 |
| recall    | 0.647853 |    0.393044 |
| mcc       | 0.290289 |    0.393044 |

## Confusion matrix (at threshold=0.393044)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1100 |              612 |
| Labeled as 1 |              574 |             1056 |

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
