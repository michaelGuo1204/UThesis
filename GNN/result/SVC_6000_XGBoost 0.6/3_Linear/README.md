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

3.5 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.686974 | nan         |
| auc       | 0.595857 | nan         |
| f1        | 0.660714 |   0.0801389 |
| accuracy  | 0.576    |   0.492873  |
| precision | 0.675    |   0.717623  |
| recall    | 1        |   0.0801389 |
| mcc       | 0.152125 |   0.492873  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.686974 |  nan        |
| auc       | 0.595857 |  nan        |
| f1        | 0.574866 |    0.492873 |
| accuracy  | 0.576    |    0.492873 |
| precision | 0.568783 |    0.492873 |
| recall    | 0.581081 |    0.492873 |
| mcc       | 0.152125 |    0.492873 |

## Confusion matrix (at threshold=0.492873)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              434 |              326 |
| Labeled as 1 |              310 |              430 |

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
