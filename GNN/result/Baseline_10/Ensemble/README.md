# Summary of Ensemble

[<< Go back](../README.md)

## Ensemble structure

| Model             |   Weight |
|:------------------|---------:|
| 4_Default_Xgboost |        1 |

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.485151 |  nan        |
| auc       | 0.647255 |  nan        |
| f1        | 0.952559 |    0.405666 |
| accuracy  | 0.909416 |    0.405666 |
| precision | 0.951705 |    0.654602 |
| recall    | 1        |    0.405666 |
| mcc       | 0.182698 |    0.652818 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.485151 |  nan        |
| auc       | 0.647255 |  nan        |
| f1        | 0.952559 |    0.405666 |
| accuracy  | 0.909416 |    0.405666 |
| precision | 0.909416 |    0.405666 |
| recall    | 1        |    0.405666 |
| mcc       | 0        |    0.405666 |

## Confusion matrix (at threshold=0.405666)

|              |   Predicted as C |   Predicted as N |
|:-------------|-----------------:|-----------------:|
| Labeled as C |                0 |               76 |
| Labeled as N |                0 |              763 |

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
