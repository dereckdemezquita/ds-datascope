library("vroom")

data <- vroom("https://www2.census.gov/programs-surveys/popest/datasets/2010-2019/counties/asrh/cc-est2019-alldata.csv")

head(as.data.frame(data), 40)
