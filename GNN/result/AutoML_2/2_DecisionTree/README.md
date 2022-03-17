# Summary of 2_DecisionTree

[<< Go back](../README.md)

## Decision Tree

- **n_jobs**: -1
- **criterion**: gini
- **max_depth**: 3
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

5.7 seconds

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.700574  |  nan        |
| auc       | 0.517821  |  nan        |
| f1        | 0.651564  |    0.366983 |
| accuracy  | 0.5288    |    0.500811 |
| precision | 0.51928   |    0.500811 |
| recall    | 1         |    0.366983 |
| mcc       | 0.0485308 |    0.500811 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.700574  |  nan        |
| auc       | 0.517821  |  nan        |
| f1        | 0.406848  |    0.500811 |
| accuracy  | 0.5288    |    0.500811 |
| precision | 0.51928   |    0.500811 |
| recall    | 0.334437  |    0.500811 |
| mcc       | 0.0485308 |    0.500811 |

## Confusion matrix (at threshold=0.500811)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              459 |              187 |
| Labeled as 1 |              402 |              202 |

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
