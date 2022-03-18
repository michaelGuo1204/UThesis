# Summary of Ensemble

[<< Go back](../README.md)

## Ensemble structure

| Model                   |   Weight |
|:------------------------|---------:|
| 3_Linear                |        1 |
| 4_Default_Xgboost       |        1 |
| 5_Default_NeuralNetwork |        1 |

## Metric details

|           |    score |    threshold |
|:----------|---------:|-------------:|
| logloss   | 0.395402 | nan          |
| auc       | 0.88475  | nan          |
| f1        | 0.805071 |   0.439696   |
| accuracy  | 0.842    |   0.519909   |
| precision | 1        |   0.973635   |
| recall    | 1        |   0.00300079 |
| mcc       | 0.685303 |   0.610451   |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.395402 |  nan        |
| auc       | 0.88475  |  nan        |
| f1        | 0.802005 |    0.519909 |
| accuracy  | 0.842    |    0.519909 |
| precision | 0.885609 |    0.519909 |
| recall    | 0.732824 |    0.519909 |
| mcc       | 0.680847 |    0.519909 |

## Confusion matrix (at threshold=0.519909)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              783 |               62 |
| Labeled as 1 |              175 |              480 |

## Learning curves

![Learning curves](learning_curves.png)

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
