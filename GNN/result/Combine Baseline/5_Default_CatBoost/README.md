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

3.0 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.600703 | nan         |
| auc       | 0.738735 | nan         |
| f1        | 0.705256 |   0.372437  |
| accuracy  | 0.68028  |   0.524116  |
| precision | 0.898734 |   0.833308  |
| recall    | 1        |   0.0525236 |
| mcc       | 0.361119 |   0.524116  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.600703 |  nan        |
| auc       | 0.738735 |  nan        |
| f1        | 0.653165 |    0.524116 |
| accuracy  | 0.68028  |    0.524116 |
| precision | 0.696356 |    0.524116 |
| recall    | 0.615018 |    0.524116 |
| mcc       | 0.361119 |    0.524116 |

## Confusion matrix (at threshold=0.524116)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1300 |              450 |
| Labeled as 1 |              646 |             1032 |

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
