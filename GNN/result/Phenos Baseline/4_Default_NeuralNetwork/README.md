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

4.1 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643156 | nan         |
| auc       | 0.679669 | nan         |
| f1        | 0.680099 |   0.3149    |
| accuracy  | 0.632874 |   0.489397  |
| precision | 0.762887 |   0.678126  |
| recall    | 1        |   0.0028682 |
| mcc       | 0.26888  |   0.489397  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643156 |  nan        |
| auc       | 0.679669 |  nan        |
| f1        | 0.644942 |    0.489397 |
| accuracy  | 0.632874 |    0.489397 |
| precision | 0.611828 |    0.489397 |
| recall    | 0.681845 |    0.489397 |
| mcc       | 0.26888  |    0.489397 |

## Confusion matrix (at threshold=0.489397)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1022 |              722 |
| Labeled as 1 |              531 |             1138 |

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
