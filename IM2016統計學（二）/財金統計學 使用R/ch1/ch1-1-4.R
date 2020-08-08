# 從yahoo讀取資料
# 按R內左上角之程式套件之安裝
library("tseries") #使用	tseries Package, 使用時網路需連線以便下載
price = get.hist.quote(instrument = "^gspc", start = "2000-01-01", end = "2016-01-05",
    quote="AdjClose") # S&P 500之調整後日股價
head(price) #檢視前面6個資料
tail(price) #檢視最後6個資料

# 下載台灣股市資料
price.tw = get.hist.quote(instrument = "^TWII", start = "2000-01-01", end = "2016-01-05",
    quote="AdjClose") # Taiwan Weighted Index之調整後日股價
head(price.tw)
tail(price.tw)

# 從 GRED下載美元兌新台幣匯率資料
# Use quantmod Package
library(quantmod)
ex1 = getFX("USD/TWD",from="2011-01-01",to="2015-06-30")
ex1
tex = USDTWD
head(tex)
tail(tex)

windows() 
par(mfrow=c(3,1))
plot(price,main="S&P 500日調整後收盤價",lwd=2)
plot(price.tw,main="TWI日調整後收盤價",lwd=2)
plot(tex,main="美元兌新台幣之日匯率")
