#This R script will create differente scatterplot which allows to visualize crabs data

data(crabs, package = "MASS")
attach(crabs)
par(mfrow=c(4,3))

plot(crabs$sex, crabs$FL, main="Sex vs. Frontal lobe (mm)")
plot(crabs$sex, crabs$RW, main="Sex vs. Rear width(mm)")
plot(crabs$sex, crabs$CW, main="Sex vs. Carapage width(mm)")
plot(crabs$sex, crabs$CL, main="Sex vs. Carapage lenght(mm)")
plot(crabs$sex, crabs$BD, main="Sex vs. Body depth(mm)")

plot(crabs$sp, crabs$FL, main="Species vs. Frontal lobe(mm)")
plot(crabs$sp, crabs$RW, main="Species vs. Rear width(mm)")
plot(crabs$sp, crabs$CW, main="Species vs. Carapage width(mm)")
plot(crabs$sp, crabs$CL, main="Species vs. Carapage leght(mm)")
plot(crabs$sp, crabs$BD, main="Species vs. Body depth(mm)")

plot(crabs$sex, crabs$sp, main="Sex vs. Species")