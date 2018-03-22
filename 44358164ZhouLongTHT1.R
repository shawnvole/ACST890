###########################
## ACST890 TEST ONE
###########################

## QUESTION 1 Fibonacci Sequence
# Create function for Fibonacci Sequence for n > 2
Fibonacci <- function(x) {fib <- numeric(x)
                          fib[1:2] <- 1
                          for (i in 3:x) {
                            fib[i] <- fib[i-1] + fib[i-2]
                          next }
                          print (fib)}
# Generate results with any integers greater than 2
Fibonacci(4)
Fibonacci(11)
Fibonacci(20)


## QUESTION 3 PersonenSchaden
# a.  Read the data into R and name it dataset
# Current directory
getwd()
# Store the csv file in the current directory
dataset <- read.csv("PersonenSchaden.csv", header = TRUE)

# b. Calculate the mean, variance and standard deviation of the total variable (settled amounts). 
# mean, variance, standard deviation of total
mean_total <- mean(dataset$total)
var_total <- var(dataset$total)
sd_total <- sd(dataset$total)
# maximum, minimum, quartiles of total
max_total <- max(dataset$total)
min_total <- min(dataset$total)
med_total <- median(dataset$total)
up_total <- quantile(dataset$total, 0.75)
low_total <- quantile(dataset$total, 0.25)
# display the results
results <- data.frame(c(mean_total, var_total, sd_total, max_total, min_total, med_total, up_total, low_total))
rownames(results) <- c("Mean", "Variance", "SD", "Max", "Min", "Median", "Top Qu", "Bottom Qu")
colnames(results) <- c("Settle Amount")
format(results, digits=2, nsmall=2)

## c. Plot a histogram of the dollar values of the claims
# histogram of total
hist(dataset$total,
     main = "Histogram of Settled Personal Injury Insurance Claims",
     xlab = "Claims Amounts",
     ylab = "Number of Claims",
     ##ylim = c(0,25000),
     ##xlim = c(0,4500000),
     cex.main = 0.9,
     cex.axis = 0.7,
     cex.lab = 0.9,
     col = "lightblue",
     nclass = 70)
box()

## d. Plot a histogram of the settlement delay
# histogram of operational time
hist(dataset$op_time,
     main = "Histogram of Operational times",
     xlab = "Operational times",
     ylab = "Number of Claims",
     ##ylim = c(0,25000),
     ##xlim = c(0,4500000),
     cex.main = 0.9,
     cex.axis = 0.7,
     cex.lab = 0.9,
     col = "orange",
     nclass = 50)
box()

## e. Plot a histogram of the legal representation variable, but modify the vertical axis so it is a percentage of total claims.
# Generate the matrix for the legal representation
legrep_y <- sum(dataset$legrep)/length(dataset$legrep)
legrep_n <- 1 - legrep_y
legrep_p <- matrix(c(legrep_y, legrep_n))
rownames(legrep_p) <- c("YES","NO")
colnames(legrep_p) <- "Legal Representation"
# Plot histogram of legrep (barplot)
barplot(t(legrep_p),
        ylim = c(0,0.7),
        main = "Barplot for Legal Representation with Probabilities",
        ylab = "Probabilities (Frequency)",
        xlab = "Legal Representation (YES/NO)",
        col = "lightgreen")
box()

## f. Plot a histogram of the injury code variable, but modify the vertical axis so it is a percentage of total claims.
# Generate the matrix for the injury code
unique(dataset$inj1)
inj1_p <- sum(dataset$inj1 == 1)/length(dataset$inj1)
inj2_p <- sum(dataset$inj1 == 2)/length(dataset$inj1)
inj3_p <- sum(dataset$inj1 == 3)/length(dataset$inj1)
inj4_p <- sum(dataset$inj1 == 4)/length(dataset$inj1)
inj5_p <- sum(dataset$inj1 == 5)/length(dataset$inj1)
inj6_p <- sum(dataset$inj1 == 6)/length(dataset$inj1)
inj9_p <- sum(dataset$inj1 == 9)/length(dataset$inj1)
inj_p <- matrix(c(inj1_p, inj2_p, inj3_p, inj4_p, inj5_p, inj6_p, inj9_p))
rownames(inj_p) <- c("No Injury", "Injury 2", "Injury 3", "Injury 4", "Injury 5", "Fatal Injury", "Not Recorded")
colnames(inj_p) <- "Injury Codes"
# Check sum of probabilities
sum(inj_p)
# Plot histogram of Injury Codes (barplot)
barplot(t(inj_p),
        ylim = c(0,0.8),
        main = "Barplot for Injury Codes with Probabilities",
        ylab = "Probabilities (Frequency)",
        xlab = "Injury Codes/Types)",
        col = "grey",
        cex.names = 0.6)
box()

## g. Plot a histogram of the log dollar values of the claims
logtotal <- log(dataset$total)
hist(logtotal,
     main = "Histogram of Log Settled Personal Injury Insurance Claims",
     xlab = "log(Claims Amounts)",
     ylab = "Number of Claims",
     ##ylim = c(0,25000),
     ##xlim = c(0,4500000),
     cex.main = 0.9,
     cex.axis = 0.7,
     cex.lab = 0.9,
     col = "lightblue",
     nclass = 30)
box()

## i. Plot claim size (y-axis) against operational time (x-axis).
plot(dataset$op_time, dataset$total,
     main = "Scatter Plot for Claim Sizes and Operational Times",
     xlab = "Operational Times",
     ylab = "Claims Amounts")
# Plot log claim size (y-axis) against operational time (x-axis)
plot(dataset$op_time, log(dataset$total),
     main = "Scatter Plot for Log(Claim Sizes) and Operational Times",
     xlab = "Operational Times",
     ylab = "Log(Claims Amounts)")

## k. scatterplot of log claim size against operational according to legal representation
# read library for plotting
library(lattice)
# Scatter plot for claim size against operation time with log scales on y-axis
dataset$legrep[dataset$legrep == 0] <- "No"
dataset$legrep[dataset$legrep == 1] <- "Yes"
dataset$legrep <- as.factor(dataset$legrep)
xyplot(total ~ op_time, dataset,
       grid = TRUE,
       scales = list(y = list(log = 10, equispaced.log = FALSE)),
       group = legrep,
       auto.key = list(columns = nlevels(dataset$legrep)),
       main = "Scatter Plot for Claim Sizes and Operational Times with log scales on y-axis",
       xlab = "Operational Times",
       ylab = "Claims Amounts",
       cex.main = 0.5)

# Scatter plot for claim size against operation time according to legal representation in seperate graphs
xyplot(total ~ op_time | legrep, dataset,
       grid = TRUE,
       scales = list(y = list(log = 10, equispaced.log = FALSE)),
       group = legrep,
       main = "Scatter Plot for Claim Sizes and Operational Times with log scales on y-axis",
       xlab = "Operational Times",
       ylab = "Claims Amounts",
       cex.main = 0.5)
