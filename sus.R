install.packages('forecast')
library(forecast)

df = read.csv('data_sus_r.csv',header=T)

acf(df$Valor)
pacf(df$Valor)

fit = Arima(df$Valor[1:44],c(3,1,0),seasonal = T)

acf(fit$residuals)
pacf(fit$residuals)
summary(fit)

dim(df)
pred = forecast(fit,h = 4)

autoplot(decompose(x = ts(df$Valor,frequency = 12)))

autoplot(pred)

sqrt(mean((pred$mean - df$Valor[45:48])^2))

