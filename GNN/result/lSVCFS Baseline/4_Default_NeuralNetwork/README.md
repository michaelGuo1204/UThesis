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

8.4 seconds

## Metric details

|           |    score |    threshold |
|:----------|---------:|-------------:|
| logloss   | 0.758628 | nan          |
| auc       | 0.649612 | nan          |
| f1        | 0.662571 |   0.301652   |
| accuracy  | 0.611144 |   0.539996   |
| precision | 0.807692 |   0.996455   |
| recall    | 1        |   0.00249847 |
| mcc       | 0.221383 |   0.539996   |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.758628 |  nan        |
| auc       | 0.649612 |  nan        |
| f1        | 0.59148  |    0.539996 |
| accuracy  | 0.611144 |    0.539996 |
| precision | 0.608833 |    0.539996 |
| recall    | 0.575089 |    0.539996 |
| mcc       | 0.221383 |    0.539996 |

## Confusion matrix (at threshold=0.539996)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1130 |              620 |
| Labeled as 1 |              713 |              965 |

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
