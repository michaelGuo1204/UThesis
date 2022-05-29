# Summary of 3_Linear

[<< Go back](../README.md)

## Logistic Regression (Linear)

- **n_jobs**: -1
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

3.0 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.686749 | nan         |
| auc       | 0.549794 | nan         |
| f1        | 0.508834 |   0.0960719 |
| accuracy  | 0.676856 |   0.519582  |
| precision | 0.538462 |   0.690156  |
| recall    | 1        |   0.0162395 |
| mcc       | 0.188675 |   0.519582  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.686749 |  nan        |
| auc       | 0.549794 |  nan        |
| f1        | 0.362069 |    0.519582 |
| accuracy  | 0.676856 |    0.519582 |
| precision | 0.525    |    0.519582 |
| recall    | 0.276316 |    0.519582 |
| mcc       | 0.188675 |    0.519582 |

## Confusion matrix (at threshold=0.519582)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              134 |               19 |
| Labeled as 1 |               55 |               21 |

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
