# Prep risk factor data

# Set up
library(dplyr)
library(zoo)
setwd('~/Documents/info-498c/demos/risks/')
risks <- read.csv("./data/raw/appendix-6a.csv", stringsAsFactors = FALSE)

# Track category (currently captured in blank rows)
risks <- risks %>% 
          rename(sex = Sex, 
                 all.ages = All.ages,
                 risk.type = Morbidity...Mortality,
                 outcome = Risk...Outcome, 
                 level = Category...Units) %>% 
          mutate(category = ifelse(level == '', outcome, NA))

# http://stackoverflow.com/questions/9514504/add-missing-value-in-column-with-value-from-row-above
risks$category <- na.locf(risks$category)
          
# Remove category headers
risks <- risks %>% filter(sex != '')

# Re-order columns
cols <- c('category', 'level', 'outcome')
risks <- cbind(risks[,cols],risks[ , !(names(risks) %in% cols)] )

# Remove confidence intervals from relative risks
for(group in colnames(risks[,6:ncol(risks)])) {
  # Remove text between paraentahses: http://stackoverflow.com/questions/24173194/remove-parentheses-and-text-within-from-strings-in-r
  risks[,group] <- as.numeric(gsub("\\s*\\([^\\)]+\\)","",risks[,group]))
}

# Write csv
write.csv(risks, './data/prepped/risk-factors.csv', row.names = FALSE)