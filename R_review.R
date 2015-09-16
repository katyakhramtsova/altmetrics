counts_raw <- read.delim("data/counts-raw.txt.gz")
#show dimension of the data
dim(counts_raw)
#showing first few lines and last few
head(counts_raw)
tail(counts_raw)

#indexing [row,column]
counts_raw[1,10]
counts_raw[1:3,10:12]
counts_raw[1:3, ]
#refering to column by name
counts_raw[1:10, "pmid"]

#shows data structure
str(counts_raw$daysSincePublished)
#weeks since publsihed. b/c a vector, it divides all the values in the cells
head(counts_raw$daysSincePublished / 7)
# this will divide first column by 7, the second by 1, 3rd by 7, and so on
head(counts_raw$daysSincePublished / C(7,1)
#data types
is.numeric(counts_raw$daysSincePublished)
is.character

str(counts_raw$journal)
#these are factors, but stored as numbers. 
levels(counts_raw$journal)
# Factor w/ 7 levels "pbio","pcbi",..: 1 1 1 1 1 1 1 1 1 1 ..
# the ones shows that factors 
#when read need to add strings.as.factors=FALSE to read character string

#looking at missing data
counts_raw$authorsCount[1:10]
#shows which data are NA
is.na(counts_raw$authorsCount[1:10])
#are there any NA data? 
anyNA(counts_raw$authorsCount[1:10])

#shows stats 
summary(counts_raw$wosCountThru2011)
mean(counts_raw$wosCountThru2011)
#histogram
hist(counts_raw$wosCountThru2011)
hist(sqrt(counts_raw$wosCountThru2011))
plot(counts_raw$daysSincePublished, counts_raw$wosCountThru2011)

#ask certain conditions
counts_raw$authorsCount[1:10] > 7
counts_raw$authorsCount[1:10] == 7
counts_raw$authorsCount[1:10] != 7
#"pone", ] the comma and space tells to list all rows)
dim(counts_raw[counts_raw$journal == "pone", ])
dim(counts_raw[counts_raw$journal != "pone", ])

#asks whether the journal in one of the list
dim(counts_raw[counts_raw$journal %in% c("pone","pbio", "pgen"), ])

#pattern matching with grep
dim(counts_raw[grepl("Immunology", counts_raw$plosSubjectTags), ])
head(counts_raw$plosSubjectTags)

#if statements. this one willdo , if this is true, then
if (anyNA(counts_raw$authorsCount)) {
  print("NAs here")  
} else {
  print("looking good")
}

if (anyNA(c(1,1,1))) {
  print("NAs here")  
} else {
  print("looking good")
}

#levelsas

#loops
for (i in 1:10) {
  print(i)
}

# it is long to end to add to vector
x <- numeric()
for (i in 1:length(counts_raw$wosCountThru2011)) {
  x <- c(x, counts_raw$wosCountThru2011[i] + 1)
}


x <- numeric(length = length(counts_raw$wosCountThru2011))
for (i in 1:length(counts_raw$wosCountThru2011)) {
  x[i] <- counts_raw$wosCountThru2011[i] + 1
}

#shows levels of a factor
levels(counts_raw$journal)
results <- numeric(length=length(levels(counts_raw$journal)))
results
names(results)<-levels(counts_raw$journal)
results
results["pone"]

#count the avg the number of citations for a journal 
for (j in levels(counts_raw$journal)) {
  results[j] <- mean(counts_raw$wosCountThru2011[counts_raw$journal == j])
}
results
