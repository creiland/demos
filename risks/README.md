# Risks
This repository contains the **relative risks** for the diseases and risk-factors of the Global Burden of Disease study. Specifically, it has the relative risks at each age for various risks. The variables include:

- `category`: The _category_ of exposure, such as _Unsafe Water Exposure_ or _Lead exposure_
- `level`: The _level_ (type) of exposure, such as _Unimproved & untreated_ or _Unimproved & chlorinated_ as levels of exposure to _Unsafe Water Exposure_
- `outcome`: The _outcome_ (disease/impairment) caused by the disease (i.e., Typhoid fever, which may be related to exposure to unsafe water)
- `risk.type`: The _type of risk_ (mortality, morbidity, or both)
- `sex`: The sex (_male_, _female_) for which the relative risk applies

**Before** answering the following questions, I suggest you create an `average.risk` column by averaging the risks across ages.

In this exercise, you'll explore the data to ask the following questions:
- To begin,  Which risk-disease combination has the highest relative risk?
- For each **risk factor**, which **disease** is it the greatest risk for?
- For each **disease**, what is the greatest **risk factor**?
- Which diseases have different risks for men and women?

## Data Preparation
Data downloaded from the [ghdx](http://ghdx.healthdata.org/record/global-burden-disease-study-2015-gbd-2015-risk-factor-results-1990-2015).

Some manual data prep (done in excel):

- Replaced all á characters with periods (`.`)
- Fixed column titles (combined first 2 rows)
- Removed footnotes
