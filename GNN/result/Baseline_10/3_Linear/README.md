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

4.8 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.313337 |  nan        |
| auc       | 0.584224 |  nan        |
| f1        | 0.952559 |    0.14372  |
| accuracy  | 0.909416 |    0.14372  |
| precision | 0.965812 |    0.967649 |
| recall    | 1        |    0.14372  |
| mcc       | 0.120534 |    0.813619 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.313337 |   nan       |
| auc       | 0.584224 |   nan       |
| f1        | 0.952559 |     0.14372 |
| accuracy  | 0.909416 |     0.14372 |
| precision | 0.909416 |     0.14372 |
| recall    | 1        |     0.14372 |
| mcc       | 0        |     0.14372 |

## Confusion matrix (at threshold=0.14372)

|              |   Predicted as C |   Predicted as N |
|:-------------|-----------------:|-----------------:|
| Labeled as C |                0 |               76 |
| Labeled as N |                0 |              763 |

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
