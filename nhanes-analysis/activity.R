# Calculate survey weighted estimates

# Set up
setwd('C:/Users/creil/Desktop/Winter 2017/Info498/demos/nhanes-analysis')
# library(foreign)
library(survey)
library(dplyr)
library(Hmisc)

# Load demographic data, which includes survey weights
demographics <- sasxport.get('./data/DEMO_H.XPT')

# Load alcohol use data
alcohol <- sasxport.get('./data/ALQ_H.XPT')

# Merge alcohol and demographic data
nhanes <- left_join(alcohol, demographics, by='seqn')

# Take the sum of the weighting column `wtint2yr` - what is this number?
wtint2yr_sum <- sum(nhanes$wtint2yr)

# Create a survey design that indicates the id, strata, and weights
survey_design <- svydesign(id=~seqn, strata=~sdmvstra, 
                           weights=~wtint2yr, 
                           data=nhanes, nest = TRUE)

# Using the codebook, find the question that asks about 12+ drinks in the last year


# Using the `table` function get a table of 12+ drinks in the last year responses
prop.table(table(nhanes$alq101))

# Using the `prop.table` function, get the proportions of each response
svytable(~alq101, design=survey_design)

# Using the `svytable` function, compute the survey weighted responses to the same question
prop.table(svytable(~alq101, design=survey_design))

# Using `prop.table` in conjunction with `svytable`, compute the survey weighted proportions

