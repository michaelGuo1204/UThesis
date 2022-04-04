# Summary of 4_Default_Xgboost

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

61.0 seconds

## Metric details

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.707584  | nan         |
| auc       | 0.560548  | nan         |
| f1        | 0.657266  |   0.0820577 |
| accuracy  | 0.54755   |   0.572514  |
| precision | 0.653846  |   0.773927  |
| recall    | 1         |   0.0820577 |
| mcc       | 0.0945318 |   0.572514  |

## Metric details with threshold from accuracy metric

|           |     score |   threshold |
|:----------|----------:|------------:|
| logloss   | 0.707584  |  nan        |
| auc       | 0.560548  |  nan        |
| f1        | 0.428308  |    0.572514 |
| accuracy  | 0.54755   |    0.572514 |
| precision | 0.561353  |    0.572514 |
| recall    | 0.346246  |    0.572514 |
| mcc       | 0.0945318 |    0.572514 |

## Confusion matrix (at threshold=0.572514)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1296 |              454 |
| Labeled as 1 |             1097 |              581 |

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
