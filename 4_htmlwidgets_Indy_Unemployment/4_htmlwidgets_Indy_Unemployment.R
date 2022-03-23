#https://fred.stlouisfed.org/series/INDI918URN

library(quantmod)
getSymbols("INDI918URN", src = "FRED")
names(INDI918URN) = "rate"
library(dygraphs)
dygraph(INDI918URN, main = "Unemployment Rate in Indianapolis-Carmel-Anderson, IN")
