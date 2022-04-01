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
| logloss   | 0.640116 |  nan        |
| auc       | 0.684196 |  nan        |
| f1        | 0.680813 |    0.343899 |
| accuracy  | 0.636683 |    0.463869 |
| precision | 0.763975 |    0.707291 |
| recall    | 1        |    0.108317 |
| mcc       | 0.281881 |    0.449139 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.640116 |  nan        |
| auc       | 0.684196 |  nan        |
| f1        | 0.661941 |    0.463869 |
| accuracy  | 0.636683 |    0.463869 |
| precision | 0.607304 |    0.463869 |
| recall    | 0.727382 |    0.463869 |
| mcc       | 0.281364 |    0.463869 |

## Confusion matrix (at threshold=0.463869)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              959 |              785 |
| Labeled as 1 |              455 |             1214 |

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
