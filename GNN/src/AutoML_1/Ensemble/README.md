# Summary of Ensemble

[<< Go back](../README.md)

## Ensemble structure

| Model                   |   Weight |
|:------------------------|---------:|
| 4_Default_NeuralNetwork |        4 |
| 5_Default_RandomForest  |        1 |

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.690941  |  nan        |
| auc       | 0.550526  |  nan        |
| f1        | 0.657266  |    0.205179 |
| accuracy  | 0.537048  |    0.511311 |
| precision | 0.585165  |    0.520053 |
| recall    | 1         |    0.205179 |
| mcc       | 0.0795333 |    0.501198 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.690941  |  nan        |
| auc       | 0.550526  |  nan        |
| f1        | 0.537453  |    0.511311 |
| accuracy  | 0.537048  |    0.511311 |
| precision | 0.525956  |    0.511311 |
| recall    | 0.549464  |    0.511311 |
| mcc       | 0.0746094 |    0.511311 |

## Confusion matrix (at threshold=0.511311)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              919 |              831 |
| Labeled as 1 |              756 |              922 |

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
