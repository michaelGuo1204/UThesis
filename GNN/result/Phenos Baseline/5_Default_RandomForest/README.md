# Summary of 5_Default_RandomForest

[<< Go back](../README.md)

## Random Forest

- **n_jobs**: -1
- **criterion**: gini
- **max_features**: 0.9
- **min_samples_split**: 30
- **max_depth**: 4
- **eval_metric_name**: auc
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

5.2 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643492 |  nan        |
| auc       | 0.679492 |  nan        |
| f1        | 0.681461 |    0.381365 |
| accuracy  | 0.636976 |    0.475589 |
| precision | 0.752988 |    0.730522 |
| recall    | 1        |    0.139491 |
| mcc       | 0.277119 |    0.475589 |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.643492 |  nan        |
| auc       | 0.679492 |  nan        |
| f1        | 0.648909 |    0.475589 |
| accuracy  | 0.636976 |    0.475589 |
| precision | 0.615591 |    0.475589 |
| recall    | 0.68604  |    0.475589 |
| mcc       | 0.277119 |    0.475589 |

## Confusion matrix (at threshold=0.475589)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1029 |              715 |
| Labeled as 1 |              524 |             1145 |

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

## SHAP Dependence plots

### Dependence (Fold 1)

![SHAP Dependence from Fold 1](learner_fold_0_shap_dependence.png)

## SHAP Decision plots

[<< Go back](../README.md)
