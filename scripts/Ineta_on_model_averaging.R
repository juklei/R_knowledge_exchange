summary(m1 <- glm(richness ~  scale(pond_size) + scale(Forest) +  scale(Reeds)+scale(Open.Bog)+ 
                    scale(Open.Isl)+scale(Forest.Isl) +
                    scale(Ponds)+ Management+    Flow+ 
                    scale(L.urban.1km) + scale(L.water.3km) +  scale(L.forest.1km)  +
                    scale(pond_size):scale(Ponds) +
                    scale(pond_size):scale(Reeds)  +
                    scale(L.urban.1km):scale(Reeds) 
                  , family = "poisson", na.action = "na.fail", data = richy))

library(MuMIn)
drNCR <- dredge(m1, fixed = "scale(log(pond_size))")
topNCR <- get.models(drNCR, subset = delta < 4)
est <-summary(avgNCR <- model.avg(topNCR)) # There are two estimates that are given, first - full average meaning 
#that the variables that are not in a model is estimated as 0. Therefore, the variables are down weighted. 
#The conditional average give you estimates of the variables that are used in the models, therefore the absent 
#variables are presented with average estimate just based on the models it appears.
con <-confint(avgNCR, level = 0.95, full = TRUE) 
# Check when its full=false 
# Need to find how to do it for subset, because now it gives just for the full model (the 0's one)
confint(avgNCR, level = 0.85, full = TRUE)

# Here I extract info for plotting estimates of both subsets and CI just of full model
cof<-as.data.frame(est$coefficients[1,]) #full
cof.sub <- as.data.frame(est$coefficients[2,]) #subset
library(data.table) # the setDT function takes row names and makes them as variable.
setDT(cof.sub, keep.rownames = TRUE)[]
names(cof.sub) <- c("Variable", "Est.sub")
esti <- cbind(con,cof)
setDT(esti, keep.rownames = TRUE)[]
names(esti) <- c("Variable","Lower", "Upper", "Est")
esti <- cbind(esti,cof.sub)

# The forest plot of estimates
ggplot(data=esti[,-5], aes(x=Variable, y=Est, ymin=Lower, ymax=Upper)) + # plot estimates and SD of full model
  geom_pointrange() + 
  geom_hline(yintercept=0, lty=2) +  # add a dotted line at x=1 after flip
  coord_flip() +  # flip coordinates (puts labels on y axis)
  xlab("Variable") + ylab("Estimate (95% CI)") +
  theme_bw() + # use a white background
  geom_point() + 
  geom_point(aes(y=Est.sub), color="red") # add conditional average estimates


And…
This is for the interaction plots I mentioned:
  library(jtools )
interact_plot(m1, pred = "Ponds", modx = "pond_size", data=richy,  plot.points=TRUE,
              interval = TRUE, int.width = 0.9,  outcome.scale="response" )
# plot.points=TRUE – plots original data
# m1- your model
# interval = TRUE, int.width = 0.9,  -  uncerntainty plot
# outcome.scale="response" – for “unscaling” your variables in the plot
