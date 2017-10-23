data(crabs, package = "MASS")

attach(crabs)

#Normalization
n = crabs[,4:8]
m = apply(n,2, mean)
s = apply(n,2,sd)
n = scale(n,m,s)

#Calculate Euclidean Distance
d = dist(n)
#Cluster Complete Linkage
cl = hclust(d, method = "complete") 
#Cluster Average Linkage
al = hclust(d, method = "average")
out.cl = cutree(cl, 4)
out.al = cutree(al, 4)
plot(out.cl)
plot(out.al)
#Compare Complete vs. Average
table(out.cl, out.al)

plot(cl, labels = crabs$sex)
plot(al, labels = crabs$sp)

aggregate(n, list(out.cl), mean)
aggregate(n, list(out.al), mean)

library(cluster)
plot(silhouette(cutree(cl, 4), d))

#Determine number of clusters
wss = (nrow(n) - 1) * sum(apply(n,2,var))
for(i in 2:20) wss[i] = sum(kmeans(n, centers = i)$withinss)
plot(1:20, wss, type = "b", xlab = "# of Clusters", ylab = "Sum of Squares Withing group")

clus = kmeans(n,centers = 4)

clus

plot(RW~CW, crabs, col = clus$cluster + 1)
plot(RW~CW, crabs, col = crabs$sex)
qplot(CW, RW, data = crabs, color = sex)
qplot(CW, RW, data = crabs, color = sp)
