# Forecasting
Time series can be presented in a wide variety of patterns. It helped with categories patterns and behaviors. We shall think time series yt as comprising three component.First one is a seasonal component, a trend-cycle component, and a reminder component. If we consider an example, for the additive model we can write it in the way where data is a summation of time-series component with trend cycle and reminder.
If we try to split a times series pattern into several components each will represent some underlying categories of a pattern.In this above yt is the data as period tt.
Additive models:- This model is most appropriate if the magnitude of the seasonal fluctuation around the trend-cycle does not vary with the level or change in time series.
 
Multiplicative models: This model is most appropriate in the seasonal pattern, or variation or fluctuation appears to be proportional to the level of time series.
 
                                                              yt=St+Tt+Et,

Time series analysis: - In this case we have dataset that contains TV viewership data. Dataset contains mainly four variables and they are Date, Network, Daypart, Number of viewers. Date is from January 2014 to December 2017.Network has five unique values A, B, C, D, E. Daypart contains 11 different values. In this dataset we have divided into two dataset one is test data and other is train data. Overall, we have 55 different datasets for train and 55 different datasets for test.
Dataset division is being done based on all the possible scenarios. In this we need to convert in time series. Using ts function dataset can be converted into time series. In this I have split dataset based on time. 
Stl function is seasonal and trend decomposition using Loess. It is used to observe annual seasonality in data. We can extract the component time series. We can divide it in seasonal, trend and residual.
“When calling stl() with s.window="periodic", the seasonal component for January is simply the mean of all January values. Similarly, the seasonal component for February is simply the mean of all February”.
Decompose function is to find the seasonal, trend and residual component. By this we can understand the real components and can analyze them.
In this I will explain all the finding for one set and explain the MSE for one network. In this I have split in 5 loops for each network. We have train and test data for network “A”. In this I will be explaining for Network “A” and daypart “S,Su 8:00 AM - 1:00 PM”. I have converted data into timeseries. With the use of ts() function and stating value as 2014 with the frequency of 12(months).We can observe time series with some high peaks in starting and a downfall in 2015 -2016.After 2016 we can see the a small peak again. This means number of viewers has decreased tremendously from 2014 to 2015 till mid of 2016.After this we can decompose the time series in trend, seasonal and random. Trend shows how data is trending without the effect of seasonality. We can’t see any kind of seasonality in this.
ACF mean it correlate itself through time. ACF is calculated and we can see through ACF graph where we can observe 4 lags above the significant value. Whereas we can observe that only 1 lag above the significant level. That means if we would have to use arima(p,q,d) in this p value is 4 and q value will be 1.
We can observe a forecast which seems like a good one but we can compare the goodness test with comparing it with real value and we can calculate the mean absolute error. We can observe MSE value as 42. Likewise, we can calculate for all the other datasets.

Conclusion: - 
We can observe high MAE values in network “B”,” C” and “E” as compared to network “A” and “D”.
We can observe high number of viewers in E, but the pattern remains same that is it goes down by the time from 2014 to 2017 with some peaks in between.
For network “A” and daypart “M, T, W, R, F 6:00 AM - 10:00 AM” we have viewer ranging from 60 to 135 seems like lowest range.
Network “C” has highest sum of viewer and “D” has lowest sum of viewer.

Daypart “M,T,W,R,F,S,Su 8:00 PM - 11:00 PM” has the highest sum of viewer.
Daypart “S,Su 6:00 AM - 8:00 AM” has the lowest sum of viewer.

 

Reference :- https://www.quora.com/What-is-the-intuitive-understanding-of-ACF-and-PACF


