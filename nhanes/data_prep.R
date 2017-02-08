library(Hmisc)
require(dplyr)
data <- sasxport.get("C:/Users/creil/Desktop/Winter 2017/Info498/demos/nhanes/data/raw/PAQ_H.XPT")
demo_data <- sasxport.get("C:/Users/creil/Desktop/Winter 2017/Info498/demos/nhanes/data/raw/DEMO_H.XPT")

merged_data <- full_join(data, demo_data)
