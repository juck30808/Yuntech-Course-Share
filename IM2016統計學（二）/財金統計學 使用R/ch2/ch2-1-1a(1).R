#ch2
TWIm = read.table("x:\\fsr\\ch2\\TWIm.txt",header=T) # 此檔內有名稱
names(TWIm) # TWIm內有各序列名稱
attach(TWIm) # 接近此檔案
TSMCm = read.table("x:\\fsr\\ch2\\TSMCm.txt",header=T) # 此檔內有名稱
names(TSMCm) # TSMCm內有各序列名稱
attach(TSMCm) # 接近此檔案
x = 積收盤價
length(x)
x
length(x)
mean(x)
y = 週轉率
mean(y)
windows()
ts.plot(y,ylab="週轉率",main="TWI之月週轉率",lwd=2)
abline(h=mean(y),lty=2, col="red",lwd=2) # 繪出水平線
