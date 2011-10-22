modeval <- function(calculated,measured) {
      x <- na.omit(as.data.frame(cbind(calculated,measured)))
      calculated <- x[,1]
      measured <- x[,2]
rval <- c()
rval$N <- nrow(x) 
rval$pearson <- cor(calculated,measured) 
rval$MBE <- mean(calculated - measured,na.rm=T)
rval$MAE <- mean(abs(calculated - measured),na.rm=T)
rval$RMSE <- sqrt(mean((calculated - measured)^2,na.rm=T))
rval$RRMSE <- 100*(sqrt(mean((calculated - measured)^2,na.rm=T)))/mean(measured,na.rm=T)
m <- lm(measured ~ calculated)
rval$R2 <- summary(m)$r.squared
rval$slope <- coef(m)[2]
rval$intercept <- coef(m)[1]  
rval$EF <- 1 - (sum((calculated - measured)^2)/sum((measured-mean(measured,na.rm=T))^2))
rval$SD <- sd(calculated-measured,na.rm=T)
rval$CRM <- (mean(measured-calculated, na.rm=T))/mean(measured,na.rm=T)
rval$KS <- as.numeric(ks.test(measured,calculated)$statistic)
rval
}
