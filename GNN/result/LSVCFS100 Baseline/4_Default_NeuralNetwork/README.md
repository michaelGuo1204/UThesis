# Summary of 4_Default_NeuralNetwork

[<< Go back](../README.md)

## Neural Network

- **n_jobs**: -1
- **dense_1_size**: 32
- **dense_2_size**: 16
- **learning_rate**: 0.05
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

3.1 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.653513 | nan         |
| auc       | 0.681404 | nan         |
| f1        | 0.673529 |   0.248554  |
| accuracy  | 0.641482 |   0.460969  |
| precision | 0.791209 |   0.705101  |
| recall    | 1        |   0.0335846 |
| mcc       | 0.282252 |   0.460969  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.653513 |  nan        |
| auc       | 0.681404 |  nan        |
| f1        | 0.622195 |    0.460969 |
| accuracy  | 0.641482 |    0.460969 |
| precision | 0.64254  |    0.460969 |
| recall    | 0.603099 |    0.460969 |
| mcc       | 0.282252 |    0.460969 |

## Confusion matrix (at threshold=0.460969)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1187 |              563 |
| Labeled as 1 |              666 |             1012 |

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
