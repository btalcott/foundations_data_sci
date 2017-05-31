#################################
#
# Created by Burt Talcott
# Foundations of Data Science
# Springboard.com
#
#################################

# Load libraries
library(tidyr) 
library(plyr)
library(dplyr)

# 0: Load the data in RStudio
refine_original <- read.csv("refine_original.csv", stringsAsFactors = FALSE)

# 1: Clean up brand names
refine_original<-mutate(refine_original, company=tolower(company))

# 2: Separate product code and number
refine_original <- separate(refine_original,'Product code / number',into = c("product_code","product_number"),sep="-")

# 3: Add product categories


# 4: Add full address for geocoding


# 5: Create dummy variables for company and product category


# 6: Submit the project on Github
# https://github.com/btalcott/foundations_data_sci
