Author: LiZhao Du YiJi Gao Jyun-Yu Cheng

## Question 1

    ## # A tibble: 336 × 4
    ## # Groups:   hour_of_day, day_of_week [112]
    ##    hour_of_day day_of_week month mean_boarding
    ##          <int> <fct>       <fct>         <dbl>
    ##  1           6 Mon         Sep            4.19
    ##  2           6 Mon         Oct            5.15
    ##  3           6 Mon         Nov            4.38
    ##  4           6 Tue         Sep            5.75
    ##  5           6 Tue         Oct            6.1 
    ##  6           6 Tue         Nov            5.44
    ##  7           6 Wed         Sep            6.38
    ##  8           6 Wed         Oct            5.3 
    ##  9           6 Wed         Nov            4.81
    ## 10           6 Thu         Sep            6.12
    ## # … with 326 more rows

![](Exercise2-group_files/figure-markdown_strict/unnamed-chunk-5-1.png)

    ##             timestamp boarding alighting day_of_week temperature hour_of_day
    ## 1 2018-09-01 06:00:00        0         1         Sat       74.82           6
    ## 2 2018-09-01 06:15:00        2         1         Sat       74.82           6
    ## 3 2018-09-01 06:30:00        3         4         Sat       74.82           6
    ## 4 2018-09-01 06:45:00        3         4         Sat       74.82           6
    ## 5 2018-09-01 07:00:00        2         4         Sat       74.39           7
    ## 6 2018-09-01 07:15:00        4         4         Sat       74.39           7
    ##   month weekend
    ## 1   Sep weekend
    ## 2   Sep weekend
    ## 3   Sep weekend
    ## 4   Sep weekend
    ## 5   Sep weekend
    ## 6   Sep weekend

    ## # A tibble: 1,443 × 4
    ## # Groups:   temperature, hour_of_day [1,433]
    ##    temperature hour_of_day weekend mean_boarding
    ##          <dbl>       <int> <chr>           <dbl>
    ##  1        29.2           6 weekday          5   
    ##  2        29.3           7 weekday         12.5 
    ##  3        30.8           6 weekday          3.75
    ##  4        31.6           7 weekday         16.8 
    ##  5        31.6           8 weekday         21.5 
    ##  6        33.4           7 weekday         13.5 
    ##  7        33.7           6 weekday          4.75
    ##  8        34.8           7 weekday         14.2 
    ##  9        35.2           6 weekday          4.25
    ## 10        35.2           8 weekday         21.2 
    ## # … with 1,433 more rows

![](Exercise2-group_files/figure-markdown_strict/unnamed-chunk-6-1.png)
Problem1: (1)The hour of peak of boarding is almost the same from day to
day, its range is about from 4 p.m. to 5 p.m.

(2)The reason that average boarding on Mondays in September look lower,
compared to other days and months, is the summer break just finish, so
not all the students come back.

(3)The reason that average boarding on Weds/Thurs/Fri in November look
lower is because of the Thanksgiving holiday , which lower the the
average boarding of November.

Problem2: When we hold hour of day and weekend status constant,
temperature seems have not an noticeable effect on the number of UT
students riding the bus,the line is horizontal.

#Question4

Using only the data in hotels.dev.csv, please compare the out-of-sample
performance of the following models:

    ## [1] 0.2691639

    ## [1] 0.2321556

    ## [1] 0.2320968

    ## [1] 0.2691029

    ## [1] 0.2248171

    ## [1] 0.2247077

    ##    actual_num predict_num difference
    ## 1          18          21          3
    ## 2          20          21          1
    ## 3          12          15          3
    ## 4          17          17          0
    ## 5          23          21         -2
    ## 6          25          25          0
    ## 7          28          21         -7
    ## 8          17          17          0
    ## 9          24          18         -6
    ## 10         18          18          0
    ## 11         14          21          7
    ## 12         19          21          2
    ## 13         17          22          5
    ## 14         18          21          3
    ## 15         19          19          0
    ## 16         20          17         -3
    ## 17         24          22         -2
    ## 18         24          24          0
    ## 19         21          20         -1
    ## 20         24          21         -3

![](Exercise2-group_files/figure-markdown_strict/unnamed-chunk-10-1.png)
