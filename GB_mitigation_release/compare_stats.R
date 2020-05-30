## Helper script to compare stats_contains.csv with the excel spreadsheet
## Author: Stephen Eglen
require(readxl)
require(readr)
require(dplyr)
orig_file = "stats_mitigation_meanT8_NR10.xlsx"
excel_sheets(orig_file)
orig = read_excel(orig_file, sheet="stats")

new_file = "MeanT8_NR10/stats_mitigation.csv"
new = read_csv(new_file)

## first element of orig names is empty, needs to be X1.
names(orig) <- c("X1", names[2:11])
names(orig) == names(new)

all.equal(orig, new)



all.equal(orig[,2], new[,2])
all.equal(orig[,3], new[,3])
all.equal(orig[,4], new[,4])
all.equal(orig[,5], new[,5])
all.equal(orig[,6], new[,6])
all.equal(orig[,7], new[,7]) ## oh oh.
all.equal(orig[,8], new[,8])

## problem here, but works out okay.
all.equal(orig[,9], new[,9])

orig_mean_time = as.numeric(pull(orig, 'Mean time'))
new_mean_time = as.numeric(pull(new, 'Mean time'))
all.equal(orig_mean_time, new_mean_time)

all.equal(orig[,10], new[,10])

all.equal(orig[,11], new[,11])

orig_max_time = as.numeric(pull(orig, 'Max time'))
new_max_time = as.numeric(pull(new, 'Max time'))
all.equal(orig_max_time, new_max_time)

all.equal(orig[,'Median time'], new[,'Median time'])


orig_median_time = as.numeric(pull(orig, 'Median time'))
new_median_time = as.numeric(pull(new, 'Median time'))
all.equal(orig_median_time, new_median_time)

compare_columns = function(old, new, col) {
  old_vals = as.numeric(pull(old, col))
  new_vals = as.numeric(pull(new, col))
  differences = which(old_vals != new_vals)
  if (any(differences)) {
    x = old_vals[differences]
    y = new_vals[differences]
    p = 100.0 * (x - y) / x 
    mat = cbind(orig=x, new=y, "Percent difference"=p)
    rownames(mat) = differences
    cat(sprintf("Differences for column %s\n", col))
    print(mat)
  } else {
    cat(sprintf("No differences for column %s\n", col))
  }
}

nrow(new)

names = names(new)

names(orig) == names(new)



for (name in names) {
  compare_columns(orig, new, name)
}

compare_columns(orig, new, 2)
compare_columns(orig, new, 3)
compare_columns(orig, new, 4)
compare_columns(orig, new, 5)
compare_columns(orig, new, 6)
compare_columns(orig, new, 7)
compare_columns(orig, new, 8)
compare_columns(orig, new, 9)
compare_columns(orig, new, 10)
compare_columns(orig, new, 11)
