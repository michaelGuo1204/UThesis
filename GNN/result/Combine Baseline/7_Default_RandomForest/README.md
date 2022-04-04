# Summary of 7_Default_RandomForest

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

14.0 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.612224 | nan         |
| auc       | 0.725593 | nan         |
| f1        | 0.700493 |   0.35222   |
| accuracy  | 0.669195 |   0.458205  |
| precision | 0.823529 |   0.784412  |
| recall    | 1        |   0.0992961 |
| mcc       | 0.341151 |   0.458205  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.612224 |  nan        |
| auc       | 0.725593 |  nan        |
| f1        | 0.678389 |    0.458205 |
| accuracy  | 0.669195 |    0.458205 |
| precision | 0.647186 |    0.458205 |
| recall    | 0.712753 |    0.458205 |
| mcc       | 0.341151 |    0.458205 |

## Confusion matrix (at threshold=0.458205)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |             1098 |              652 |
| Labeled as 1 |              482 |             1196 |

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
