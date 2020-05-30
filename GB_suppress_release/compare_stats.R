## Helper script to compare stats_contains.csv with the excel spreadsheet
## Stephen Eglen
require(readxl)
require(readr)
require(dplyr)
orig_file = "stats_contain_meanT8_NR10.xlsx"
excel_sheets(orig_file)
orig = read_excel(orig_file, sheet="stats_contain")

new_file = "mean8/stats_contain.csv"
new = read_csv(new_file)

## fix header of first name.
names <- names(orig)
names[1] <- "X1"
names(orig) <- names

all.equal(orig[,1], new[,1])
all.equal(orig[,2], new[,2])
all.equal(orig[,3], new[,3])
all.equal(orig[,4], new[,4])
all.equal(orig[,5], new[,5])
all.equal(orig[,6], new[,6])
all.equal(orig[,7], new[,7])
all.equal(orig[,8], new[,8])

## problem here, but works out okay.
##all.equal(orig[,9], new[,9])
orig_mean_time = as.numeric(pull(orig, 'Mean time'))
new_mean_time = as.numeric(pull(new, 'Mean time'))
all.equal(orig_mean_time, new_mean_time)

##all.equal(orig[,10], new[,10])
orig_max_time = as.numeric(pull(orig, 'Max time'))
new_max_time = as.numeric(pull(new, 'Max time'))
all.equal(orig_max_time, new_max_time)

##all.equal(orig[,'Median time'], new[,'Median time'])
orig_median_time = as.numeric(pull(orig, 'Median time'))
new_median_time = as.numeric(pull(new, 'Median time'))
all.equal(orig_median_time, new_median_time)
