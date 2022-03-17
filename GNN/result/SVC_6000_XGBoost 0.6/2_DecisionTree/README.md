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

6.4 seconds

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.698446  |  nan        |
| auc       | 0.510386  |  nan        |
| f1        | 0.660714  |    0.228814 |
| accuracy  | 0.513333  |    0.551724 |
| precision | 0.590909  |    0.665424 |
| recall    | 1         |    0.228814 |
| mcc       | 0.0307276 |    0.551724 |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.698446  |  nan        |
| auc       | 0.510386  |  nan        |
| f1        | 0.126794  |    0.551724 |
| accuracy  | 0.513333  |    0.551724 |
| precision | 0.552083  |    0.551724 |
| recall    | 0.0716216 |    0.551724 |
| mcc       | 0.0307276 |    0.551724 |

## Confusion matrix (at threshold=0.551724)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              717 |               43 |
| Labeled as 1 |              687 |               53 |

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
