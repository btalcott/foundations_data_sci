#################################
#
# Created by Burt Talcott
# Foundations of Data Science
# Springboard.com
#
#################################

if (exists("refine_original") && is.data.frame(refine_original)) { rm(refine_original)}

# Load libraries
library(tidyr) 
library(plyr)
library(dplyr)

# 0: Load the data in RStudio
refine_original <- read_csv("~/foundations_data_sci/refine_original.csv")

# 1: Clean up brand names
refine_original<-mutate(refine_original, company=tolower(company))
philips <- c("philips", "phillips", "phillps", "phlips", "fillips", "phllips")
akzo <- c("akzo", "akz0", "ak zo")
van_houten <- c("van houten")
unilever <- c("unilever", "unilver")

refine_original$company <- if_else((refine_original$company %in% philips), "philips", if_else((refine_original$company %in% akzo), "akzo", if_else((refine_original$company %in% van_houten), "van houten", if_else((refine_original$company %in% unilever), "unilever", "not a company"))))
#refine_original$company %in% philips
#match('b',v)


# 2: Separate product code and number
refine_original <- separate(refine_original,'Product code / number',into = c("product_code","product_number"),sep="-")

# 3: Add product categories
refine_original <- mutate(refine_original, product_cat = if_else(product_code == "p","Smartphone",if_else(product_code == "v","TV", if_else(product_code == "x","Laptop","Tablet"))))

# 4: Add full address for geocoding
refine_original <- mutate(refine_original, full_address = paste(address, city, country, sep = ", "))

# 5: Create dummy variables for company and product category
#Create dummy columns with variables
refine_original <- mutate(refine_original,company_philips = as.numeric(company == "philips"))
refine_original <- mutate(refine_original,company_akzo = as.numeric((company == "akzo")))
refine_original <- mutate(refine_original,company_van = as.numeric((company == "van houten")))
refine_original <- mutate(refine_original,company_unilever = as.numeric((company == "unilever")))
refine_original <- mutate(refine_original,product_smartphone = as.numeric((product_code == "p")))
refine_original <- mutate(refine_original,product_tv = as.numeric((product_code == "v")))
refine_original <- mutate(refine_original,product_laptop = as.numeric((product_code == "x")))
refine_original <- mutate(refine_original,product_tablet = as.numeric((product_code == "q")))

# 6: Submit the project on Github
# https://github.com/btalcott/foundations_data_sci
