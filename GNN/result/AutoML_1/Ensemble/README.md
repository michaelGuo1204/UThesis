# Summary of Ensemble

[<< Go back](../README.md)

## Ensemble structure

| Model                   |   Weight |
|:------------------------|---------:|
| 3_Default_Xgboost       |        1 |
| 4_Default_NeuralNetwork |        2 |
| 5_Default_RandomForest  |        1 |

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.685014 |  nan        |
| auc       | 0.573416 |  nan        |
| f1        | 0.657266 |    0.201188 |
| accuracy  | 0.553384 |    0.490072 |
| precision | 0.607843 |    0.54043  |
| recall    | 1        |    0.201188 |
| mcc       | 0.112571 |    0.447785 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.685014 |  nan        |
| auc       | 0.573416 |  nan        |
| f1        | 0.554553 |    0.490072 |
| accuracy  | 0.553384 |    0.490072 |
| precision | 0.541785 |    0.490072 |
| recall    | 0.567938 |    0.490072 |
| mcc       | 0.10738  |    0.490072 |

## Confusion matrix (at threshold=0.490072)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              944 |              806 |
| Labeled as 1 |              725 |              953 |

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
