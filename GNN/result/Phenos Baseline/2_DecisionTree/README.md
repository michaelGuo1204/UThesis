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

4.2 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643111 |  nan        |
| auc       | 0.669704 |  nan        |
| f1        | 0.680963 |    0.311696 |
| accuracy  | 0.626021 |    0.504209 |
| precision | 0.680111 |    0.618701 |
| recall    | 1        |    0.154896 |
| mcc       | 0.251784 |    0.504209 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643111 |  nan        |
| auc       | 0.669704 |  nan        |
| f1        | 0.591199 |    0.504209 |
| accuracy  | 0.626021 |    0.504209 |
| precision | 0.635802 |    0.504209 |
| recall    | 0.552443 |    0.504209 |
| mcc       | 0.251784 |    0.504209 |

## Confusion matrix (at threshold=0.504209)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1219 |              531 |
| Labeled as 1 |              751 |              927 |

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
