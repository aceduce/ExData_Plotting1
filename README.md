# Readme

> This includes the 4 plots to reconstruct the plots from the home assigments. 

> To convert the date, `as.Date()` is used. `dt$Date<-as.Date(dt$Date, format="%d/%m/%Y")` Needs Capital Y here. 

> To convert the time, 
`dt$datetime <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")`
`dt$datetime <- as.POSIXct(dt$datetime)` 
is used. Need to link the date and hours. 

> To convert to the Weekdays (Monday to Sunday), `strptime()` is used. 
`dt$datetime <- strptime(paste(dt$Date, dt$Time), "%Y-%m-%d %H:%M:%S")`
`dt$datetime <- as.POSIXct(dt$datetime)`

> Baseplot is used as plot functions.
`dv.copy()`,`dv.off()` are used for output file in PNG form.
`dev.copy(png, file = "plot4.png", height = 480, width = 480)`
