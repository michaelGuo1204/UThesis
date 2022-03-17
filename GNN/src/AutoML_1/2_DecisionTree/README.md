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

6.1 seconds

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.692644  |  nan        |
| auc       | 0.51992   |  nan        |
| f1        | 0.657266  |    0.383529 |
| accuracy  | 0.522462  |    0.495701 |
| precision | 0.565041  |    0.529706 |
| recall    | 1         |    0.383529 |
| mcc       | 0.0420179 |    0.529706 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.692644  |  nan        |
| auc       | 0.51992   |  nan        |
| f1        | 0.447892  |    0.495701 |
| accuracy  | 0.522462  |    0.495701 |
| precision | 0.515929  |    0.495701 |
| recall    | 0.395709  |    0.495701 |
| mcc       | 0.0409929 |    0.495701 |

## Confusion matrix (at threshold=0.495701)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1127 |              623 |
| Labeled as 1 |             1014 |              664 |

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
