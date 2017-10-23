data(crabs, package = "MASS")

# log transform 
log.ir <- log(crabs[, 4:8])
print(log.ir)
ir.species <- crabs[, 1]
ir.sex <- crabs[, 2]

# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
ir.pca <- prcomp(log.ir,
                 center = TRUE,
                 scale. = TRUE) 

print(ir.pca)

plot(ir.pca, type="l")


library(devtools)
install_github("ggbiplot", "vqv")

library(ggbiplot)
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.sex, ellipse = TRUE, 
              circle = TRUE, choices = c(PC1, PC2))
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)


attach(crabs)

#Test correlation of the data
dataToPlot = crabs[,4:8]
#colnames(dataToPlot) = c("FL", "RW","CL", "CW", "BD")
pairs(dataToPlot)

out.pca = prcomp(crabs[,4:8], center = T, scale = T)
out.pca

plot(out.pca)

biplot(out.pca)
#Depois de ter os graficos podemos analisar que podemos 

summary(out.pca)
#Com O resultado do summary podemos concluir que os nossos dados podem ser reduzidos apenas para 1 dimensão 
#sabendo que o Comp.1 tem Standard deviation > 1 e que é responsável por mais de 85% da variação logo é possivel a redução


out.pred = predict(out.pca)
plot(out.pred)

plot(out.pca$x[,1], out.pca$x[,3], col=as.numeric(crabs$sp)+4, pch=19, xlab="PC1", ylab="PC3")

#Escolhemos apenas um factor no nosso caso será Comp.1 dado que 
fa = factanal(dataToPlot, factors = 2)
fa
