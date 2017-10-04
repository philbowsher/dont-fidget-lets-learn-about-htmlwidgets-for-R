library(quantmod)
getSymbols("PITT342URN", src = "FRED")
names(PITT342URN) = "rate"
library(dygraphs)
dygraph(PITT342URN, main = "Unemployment Rate in Pittsburgh, PA")