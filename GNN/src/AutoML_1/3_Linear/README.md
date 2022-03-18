# Summary of 3_Linear

[<< Go back](../README.md)

## Logistic Regression (Linear)

- **n_jobs**: -1
- **explain_level**: 2

## Validation

- **validation_type**: split
- **train_ratio**: 0.75
- **shuffle**: True
- **stratify**: True

## Optimized metric

auc

## Training time

18.1 seconds

## Metric details

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.713543 | nan         |
| auc       | 0.563638 | nan         |
| f1        | 0.659517 |   0.0869947 |
| accuracy  | 0.558    |   0.521119  |
| precision | 0.652542 |   0.733536  |
| recall    | 1        |   0.0869947 |
| mcc       | 0.114922 |   0.521119  |

## Metric details with threshold from accuracy metric

|           |    score |   threshold |
|:----------|---------:|------------:|
| logloss   | 0.713543 |  nan        |
| auc       | 0.563638 |  nan        |
| f1        | 0.525412 |    0.521119 |
| accuracy  | 0.558    |    0.521119 |
| precision | 0.556904 |    0.521119 |
| recall    | 0.49729  |    0.521119 |
| mcc       | 0.114922 |    0.521119 |

## Confusion matrix (at threshold=0.521119)

|              |   Predicted as 0 |   Predicted as 1 |
|:-------------|-----------------:|-----------------:|
| Labeled as 0 |              470 |              292 |
| Labeled as 1 |              371 |              367 |

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

### Top-10 Worst decisions for class 0 (Fold 1)

![SHAP worst decisions class 0 from Fold 1](learner_fold_0_shap_class_0_worst_decisions.png)

### Top-10 Best decisions for class 0 (Fold 1)

![SHAP best decisions class 0 from Fold 1](learner_fold_0_shap_class_0_best_decisions.png)

### Top-10 Worst decisions for class 1 (Fold 1)

![SHAP worst decisions class 1 from Fold 1](learner_fold_0_shap_class_1_worst_decisions.png)

### Top-10 Best decisions for class 1 (Fold 1)

![SHAP best decisions class 1 from Fold 1](learner_fold_0_shap_class_1_best_decisions.png)

[<< Go back](../README.md)
