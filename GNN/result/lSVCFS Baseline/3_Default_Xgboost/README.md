# Summary of 3_Default_Xgboost

[<< Go back](../README.md)

## Extreme Gradient Boosting (Xgboost)

- **n_jobs**: -1
- **objective**: binary:logistic
- **eta**: 0.075
- **max_depth**: 6
- **min_child_weight**: 1
- **subsample**: 1.0
- **colsample_bytree**: 1.0
- **eval_metric**: auc
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

117.6 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.618321 | nan         |
| auc       | 0.714733 | nan         |
| f1        | 0.677241 |   0.357906  |
| accuracy  | 0.671237 |   0.589947  |
| precision | 0.825806 |   0.793823  |
| recall    | 1        |   0.0822012 |
| mcc       | 0.362819 |   0.589947  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.618321 |  nan        |
| auc       | 0.714733 |  nan        |
| f1        | 0.586725 |    0.589947 |
| accuracy  | 0.671237 |    0.589947 |
| precision | 0.762631 |    0.589947 |
| recall    | 0.476758 |    0.589947 |
| mcc       | 0.362819 |    0.589947 |

## Confusion matrix (at threshold=0.589947)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1501 |              249 |
| Labeled as 1 |              878 |              800 |

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
