# Data Dictionary

This file documents the current study data created by `scripts/run_study.py`.
The main analysis-ready file is `data/study_analysis_data.csv`. This is the
respondent-level file to use for figures, tables, and paper analyses.
The intermediate cleaned source file is `data/clean_analytic_data.csv`; it keeps
raw Qualtrics forecast and embedded-market fields before they are converted into
the event-level analysis variables.

The active study combines two Qualtrics exports and two CloudResearch Connect
assignment exports. The cleaning step drops unused Qualtrics module columns and
retains only fields used to reproduce the current study analysis or sample
summaries. The private respondent crosswalk in `data/private/` retains original
participant IDs and Connect completion codes for payment auditing.

Unless a note says a variable is present only in `clean_analytic_data.csv`, the
columns documented below are in `data/study_analysis_data.csv`.

## Identifier Columns

| Column | Description | Coding / notes |
| --- | --- | --- |
| `respondent_id` | Anonymous row identifier created during study preparation. | Sequential integer. |

## Treatment Assignment

| Column | Description | Coding / notes |
| --- | --- | --- |
| `Treatment` | Raw randomized treatment arm from Qualtrics. | Present in `clean_analytic_data.csv`; `0` = control; `1` = information only; `2` = accuracy incentive; `3` = betting frame. |
| `treatment` | Numeric treatment arm used in analysis. | Same coding as `Treatment`. |
| `group` | Treatment arm label. | `control`, `information_only`, `accuracy_incentive`, `betting_frame`. |
| `treat_market` | Indicator for any market-information treatment. | `1` for treatment arms 1, 2, or 3; `0` for control. |
| `treat_incentive` | Indicator for any incentivized treatment. | `1` for treatment arms 2 or 3; `0` for arms 0 or 1. |
| `treatment_1` | Information-only indicator. | `1` for treatment arm 1; `0` otherwise. |
| `treatment_2` | Accuracy-incentive indicator. | `1` for treatment arm 2; `0` otherwise. |
| `treatment_3` | Betting-frame indicator. | `1` for treatment arm 3; `0` otherwise. |

## Forecast and Market Columns

Forecast responses are exported from Qualtrics on the 0--100 slider scale.
Study-preparation columns beginning with `f_`, `f_pre_`, and `m_` are coded on
the 0--1 probability scale.

| Column | Description | Coding / notes |
| --- | --- | --- |
| `Event1_Prob_Pre_1` | Pre-treatment forecast for event 1. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event2_Prob_Pre_1` | Pre-treatment forecast for event 2. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event3_Prob_Pre_1` | Pre-treatment forecast for event 3. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event4_Prob_Pre_1` | Pre-treatment forecast for event 4. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event1_Final_Post` | Coalesced post-treatment forecast for event 1. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event2_Final_Post` | Coalesced post-treatment forecast for event 2. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event3_Final_Post` | Coalesced post-treatment forecast for event 3. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `Event4_Final_Post` | Coalesced post-treatment forecast for event 4. | Present in `clean_analytic_data.csv`; raw 0--100 slider response. |
| `f_pre_E1`--`f_pre_E4` | Normalized pre-treatment forecasts. | Forecasts divided by 100 when needed. |
| `f_E1`--`f_E4` | Normalized post-treatment forecasts. | Forecasts divided by 100 when needed. |
| `Market_Price_m_kxcpi-26apr` | Saved market probability for event 1. | Present in `clean_analytic_data.csv`; Kalshi CPI April 2026 target contract. Probability scale, 0--1. |
| `Market_Price_m_kxpayrolls-26apr` | Saved market probability for the original event-2 payroll market. | Present in `clean_analytic_data.csv`; April 2026 payrolls line. Probability scale, 0--1. |
| `Market_Price_m_kxpayrolls-26may` | Saved market probability for the revised event-2 payroll market. | Present in `clean_analytic_data.csv`; May 2026 payrolls line. Probability scale, 0--1. |
| `Market_Price_m_controls-2026` | Saved market probability for event 3. | Present in `clean_analytic_data.csv`; Senate control market. Probability scale, 0--1. |
| `Market_Price_m_kxiceero-26mar` | Saved market probability for event 4. | Present in `clean_analytic_data.csv`; ICE ERO funding market. Probability scale, 0--1. |
| `m_E1`--`m_E4` | Analysis market probabilities by event slot. | Probability scale, 0--1. `m_E2` coalesces the April and May payroll market columns. |
| `Flag_Resolved_Workforce_Market` | Event-2 resolved-market flag. | `1` when the payroll market value was already resolved at 1; these rows are excluded by the default analysis. |
| `Flag_Event2_Excluded_Missing_Market` | Event-2 missing-market exclusion flag. | `1` when the row lacks event-2 market data. These rows are excluded by the default analysis. |
| `Flag_Control_Market_Imputed_E1`--`Flag_Control_Market_Imputed_E4` | Flags for sporadic control-group market imputations. | `1` when a missing non-event-2 market value was imputed to the sample mean for retained control rows; `0` otherwise. |

## Outcome Columns

For event `E`, directional market deviation is `dev_E = f_E - m_E`.
Absolute market distance is `abs_market_dist_E = |f_E - m_E|`. Movement toward
market is `market_movement_E = |f_pre_E - m_E| - |f_E - m_E|`.

| Column | Description | Coding / notes |
| --- | --- | --- |
| `included_E1`--`included_E4` | Event-level inclusion indicator for post-treatment outcomes. | `1` when both post forecast and market probability are available for that event. |
| `dev_E1`--`dev_E4` | Event-level directional market deviation. | Positive values mean the respondent forecast is above the market. |
| `abs_market_dist_E1`--`abs_market_dist_E4` | Event-level absolute market distance. | Lower values mean the forecast is closer to the market. |
| `pre_included_E1`--`pre_included_E4` | Event-level inclusion indicator for pre-treatment outcomes. | `1` when both pre forecast and market probability are available for that event. |
| `pre_dev_E1`--`pre_dev_E4` | Event-level pre-treatment directional market deviation. | `f_pre_E - m_E`. |
| `pre_abs_market_dist_E1`--`pre_abs_market_dist_E4` | Event-level pre-treatment absolute market distance. | `|f_pre_E - m_E|`. |
| `market_movement_E1`--`market_movement_E4` | Event-level movement toward the market. | Positive values mean the post forecast moved closer to the market than the pre forecast. |
| `dev_mean` | Primary respondent-level market-deviation outcome. | Mean of available `dev_E*` columns. |
| `n_dev_events` | Number of event deviations averaged in `dev_mean`. | Usually 4 after current exclusions. |
| `abs_market_dist_mean` | Respondent-level absolute market distance. | Mean of available `abs_market_dist_E*` columns. |
| `n_abs_market_dist_events` | Number of events averaged in `abs_market_dist_mean`. | Count. |
| `pre_dev_mean` | Respondent-level mean pre-treatment market deviation. | Median-imputed if fully missing, with `pre_dev_mean_imputed` flag. |
| `n_pre_dev_events` | Number of pre-treatment deviations averaged before imputation. | Count. |
| `pre_abs_market_dist_mean` | Respondent-level mean pre-treatment absolute market distance. | Mean of available event-level values. |
| `n_pre_abs_market_dist_events` | Number of events averaged in `pre_abs_market_dist_mean`. | Count. |
| `market_movement_mean` | Respondent-level mean movement toward market. | Mean of available `market_movement_E*` columns. |
| `n_market_movement_events` | Number of events averaged in `market_movement_mean`. | Count. |
| `pre_dev_mean_imputed` | Pre-treatment deviation imputation flag. | `1` if `pre_dev_mean` was fully missing and imputed to the sample median; `0` otherwise. |

## Party and Study-Specific Covariates

| Column | Description | Coding / notes |
| --- | --- | --- |
| `party_id_7pt` | Seven-point party identification scale. | `1` = strong Democrat; `2` = not very strong Democrat; `3` = independent closer to Democrats; `4` = true independent/neither; `5` = independent closer to Republicans; `6` = not very strong Republican; `7` = strong Republican. |
| `party_code` | Collapsed party code used in analysis. | `-1` = Democrat or Democrat-leaning; `0` = true independent/neither; `1` = Republican or Republican-leaning. |
| `is_republican` | Republican/leaner indicator. | `1` for `party_code == 1`; `0` otherwise. Primary partisan-divergence contrasts restrict to `party_code` in `{-1, 1}`. |
| `Prior_awareness` | Cleaned raw prior-awareness response. | Present in `clean_analytic_data.csv`; `1` = yes; `0` = no; missing = unsure/unmatched. |
| `Prior_participation` | Cleaned raw prior-participation response. | Present in `clean_analytic_data.csv`; `1` = yes; `0` = no; missing = unsure/unmatched. |
| `prior_awareness` | Analysis prior-awareness covariate. | `1` = yes; `0` = no or unsure/missing. Use `prior_awareness_missing` to identify unsure/missing responses. |
| `prior_awareness_missing` | Missingness indicator for prior awareness. | `1` = unsure/unmatched/missing before imputation; `0` = yes/no observed. |
| `prior_participation` | Analysis prior-participation covariate. | `1` = yes; `0` = no or unsure/missing. Use `prior_participation_missing` to identify unsure/missing responses. |
| `prior_participation_missing` | Missingness indicator for prior participation. | `1` = unsure/unmatched/missing before imputation; `0` = yes/no observed. |
| `attention_check` | Numeric attention-check response. | Target answer is `64`. |

## Connect Demographic Columns

| Column | Description | Coding / notes |
| --- | --- | --- |
| `age` | Numeric age used in analysis. | Years. |
| `Flag_Age_OutOfRange` | Age review flag. | `1` when age is below 18 or above 100; `0` otherwise. |
| `education` | Cleaned Connect education category. | Snake-case label. |
| `bachelors_or_higher` | Simplified education covariate. | `1` = bachelor's degree or higher; `0` = less than bachelor's or missing/prefer-not-to-say. |
| `bachelors_or_higher_missing` | Education missingness indicator. | `1` = missing or prefer not to say; `0` = substantive education category. |
| `employment_status` | Cleaned Connect employment status. | Snake-case label. |
| `fulltime_or_business_owner` | Simplified employment covariate. | `1` = full-time or business owner; `0` = other status or missing/prefer-not-to-say. |
| `fulltime_or_business_owner_missing` | Employment missingness indicator. | `1` = missing or prefer not to say; `0` = substantive employment category. |
| `gender` | Cleaned Connect gender category. | Snake-case label. |
| `male` | Simplified gender covariate. | `1` = man; `0` = woman, other, unmatched, or missing. |
| `hispanic` | Hispanic/Latino/Spanish-origin indicator. | `1` = yes; `0` = no, unmatched, or missing. |
| `race` | Cleaned Connect race category. | Snake-case label. |
| `race_white` | Simplified race covariate. | `1` = white; `0` = all other categories, unmatched, or missing. |
| `race_black` | Simplified race covariate. | `1` = Black or African American; `0` = all other categories, unmatched, or missing. |
| `household_income` | Cleaned Connect household-income category. | Snake-case label. |
| `household_income_midpoint_imputed` | Income midpoint used in adjusted models. | Missing/prefer-not-to-say values set to the sample median of nonmissing midpoints. |
| `household_income_prefer_not_say` | Income missing/prefer-not indicator. | `1` = missing or prefer not to say; `0` = substantive income category. |
| `occupation_field` | Cleaned Connect occupation field. | Snake-case label. |

## Quality Flags

| Column | Description | Coding / notes |
| --- | --- | --- |
| `Flag_Dropped_Before_Post` | Missing first post-test forecast flag. | `1` = missing `Event1_Final_Post`; default analysis excludes these rows. |
| `Flag_Failed_Attention` | Attention-check failure flag. | `1` = response was not `64`; retained as a quality flag. |
| `Flag_Speeder` | Speed flag. | `1` = completed in under 60 seconds; retained as a quality flag. |
| `Flag_StraightLiner` | Straight-line response flag. | `1` = same final post forecast on all four events; retained as a quality flag. |
