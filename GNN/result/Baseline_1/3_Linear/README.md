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

5.8 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.834594 |  nan        |
| auc       | 0.559809 |  nan        |
| f1        | 0.669565 |    0.022978 |
| accuracy  | 0.581699 |    0.467724 |
| precision | 0.666667 |    0.88009  |
| recall    | 1        |    0.022978 |
| mcc       | 0.163438 |    0.467724 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.834594 |  nan        |
| auc       | 0.559809 |  nan        |
| f1        | 0.6      |    0.467724 |
| accuracy  | 0.581699 |    0.467724 |
| precision | 0.578313 |    0.467724 |
| recall    | 0.623377 |    0.467724 |
| mcc       | 0.163438 |    0.467724 |

## Confusion matrix (at threshold=0.467724)

|              |   Predicted as C |   Predicted as N |
|:-------------|-----------------:|-----------------:|
| Labeled as C |               41 |               35 |
| Labeled as N |               29 |               48 |

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
