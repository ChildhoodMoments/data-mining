## question 1

calculate the average departure delay time over 2008 and make a plot to
show that

    plot(average_departure_delay_time_over_2008)

![](Assignment-1_files/figure-markdown_strict/plot%20average%20departure%20delay%20time%20over%202008-1.png)

we can see the result that in most time, the delay time fluctulate
between 0 and 20, and around Oct, the delay time is relatively small.

    plot(delay_day)

![](Assignment-1_files/figure-markdown_strict/delay%20day-1.png)

we can find from 6am, the average delay time is increased in general,
and due to schedule arrangement, there is no flight delarture between 00
and 06

so we give a suggestion: try to catch earlier flight rather than later
flight

    plot(delay_affected_airline)

![](Assignment-1_files/figure-markdown_strict/delay%20time%20affected%20by%20airline-1.png)

from that plot we can see that overall, US airline has the minimum delay
time, but we lack their data in some months, maybe they doesn’t arrange
flightline during these months

## question 2

    the_top_10_most_popular_songs

    ## # A tibble: 10 × 3
    ## # Groups:   performer [10]
    ##    performer                                 song                          count
    ##    <chr>                                     <chr>                         <int>
    ##  1 Imagine Dragons                           Radioactive                      87
    ##  2 AWOLNATION                                Sail                             79
    ##  3 Jason Mraz                                I'm Yours                        76
    ##  4 The Weeknd                                Blinding Lights                  76
    ##  5 LeAnn Rimes                               How Do I Live                    69
    ##  6 LMFAO Featuring Lauren Bennett & GoonRock Party Rock Anthem                68
    ##  7 OneRepublic                               Counting Stars                   68
    ##  8 Adele                                     Rolling In The Deep              65
    ##  9 Jewel                                     Foolish Games/You Were Meant…    65
    ## 10 Carrie Underwood                          Before He Cheats                 64

from the table we can get top 10 most popular songs since 1958

partB

we first excludes the years 1958 and 2021 then we can counts the number
of times that a given song appears on the Top 100 in a given year

    number_of_times_that_a_given_song

    ## # A tibble: 34,467 × 3
    ## # Groups:   year [62]
    ##     year song                                               count
    ##    <int> <chr>                                              <int>
    ##  1  1959 "¿Dònde Està Santa Claus? (Where Is Santa Claus?)"     1
    ##  2  1959 "\"Yep!\""                                             9
    ##  3  1959 "('til) I Kissed You"                                 16
    ##  4  1959 "(All of a Sudden) My Heart Sings"                    15
    ##  5  1959 "(I Don't Care) Only Love Me"                          4
    ##  6  1959 "(I Wanna) Dance With The Teacher"                     3
    ##  7  1959 "(I'll Be With You In) Apple Blossom Time"            11
    ##  8  1959 "(If You Cry) True Love, True Love"                    9
    ##  9  1959 "(New In) The Ways Of Love"                            7
    ## 10  1959 "(Night Time Is) The Right Time"                       1
    ## # … with 34,457 more rows

then we count the number of unique songs that appeared on the Top 100 in
each year, irrespective of how many times it had appeared.

    plot(unique_music)

![](Assignment-1_files/figure-markdown_strict/show%20musical%20diversity%20over%20the%20years-1.png)

partC “ten-week hit” as a single song that appeared on the Billboard Top
100 for at least ten weeks. we first find performer and music satisfy
ten-week hit, then filter people who have less than 30 songs

we can get the plot like:

    plot(ten_week_hit_musicians)

![](Assignment-1_files/figure-markdown_strict/ten_week_hit_musicians%20list-1.png)

# question4

    ## 載入需要的套件：lattice

    ## 
    ## 載入套件：'caret'

    ## 下列物件被遮斷自 'package:purrr':
    ## 
    ##     lift

    ## 
    ## 載入套件：'foreach'

    ## 下列物件被遮斷自 'package:purrr':
    ## 
    ##     accumulate, when

##1 Filter 350 & 65 AMG

##2 spilt to test& training set

##3 run k nearest neighbors RMSEs

    ## [1] 11281.95

    ## [1] 27136.79

    ##    id trim subTrim condition isOneOwner mileage year  color displacement   fuel
    ## 1 282  350    unsp       CPO          f   21929 2012  Black        3.0 L Diesel
    ## 2 284  350    unsp       CPO          f   17770 2012 Silver        3.0 L Diesel
    ## 3 285  350    unsp      Used          f   29108 2012  Black        3.0 L Diesel
    ## 4 288  350    unsp       CPO          f   35004 2013  White        3.0 L Diesel
    ## 5 289  350    unsp      Used          t   66689 2012  Black        3.0 L Diesel
    ## 6 290  350    unsp       CPO          f   19567 2012  Black        3.0 L Diesel
    ##   state region   soundSystem wheelType wheelSize featureCount price fold_id
    ## 1    MA    New          unsp      unsp      unsp           82 55994       1
    ## 2    IL    ENC       Premium     Alloy      unsp           72 60900       2
    ## 3    VA    SoA          unsp      unsp      unsp            5 54995       5
    ## 4    NH    New Harman Kardon      unsp      unsp           83 59988       1
    ## 5    NJ    Mid Harman Kardon     Alloy      unsp           79 37995       4
    ## 6    LA    WSC       Premium     Alloy      unsp           76 59977       1

    ##     id   trim subTrim condition isOneOwner mileage year  color displacement
    ## 1 1060 65 AMG    unsp       New          f     106 2015  Black        6.0 L
    ## 2 1062 65 AMG    unsp       New          f      11 2015  Black        6.0 L
    ## 3 1387 65 AMG    unsp      Used          f   74461 2006 Silver        6.0 L
    ## 4 2068 65 AMG    unsp      Used          f   73415 2007   Gray        6.0 L
    ## 5 2141 65 AMG    unsp       CPO          f   17335 2011  Black        6.0 L
    ## 6 2310 65 AMG    unsp       New          f       7 2015  White        6.0 L
    ##       fuel state region soundSystem wheelType wheelSize featureCount  price
    ## 1 Gasoline    NJ    Mid     Premium     Alloy      unsp           73 235375
    ## 2 Gasoline    CA    Pac     Premium      unsp        20           83 226465
    ## 3 Gasoline    IL    ENC        unsp     Alloy      unsp           50  24995
    ## 4 Gasoline    CA    Pac     Premium      unsp      unsp           17  54981
    ## 5 Gasoline    OH    ENC        unsp      unsp      unsp           92 102500
    ## 6 Gasoline    CA    Pac        unsp      unsp      unsp            1 230860
    ##   fold_id
    ## 1       2
    ## 2       1
    ## 3       2
    ## 4       2
    ## 5       4
    ## 6       4

    ## Warning: executing %dopar% sequentially: no parallel backend registered

    ##          k      err  std_err
    ## result.1 1 13842.58 818.5473
    ## result.2 2 11713.73 424.2141
    ## result.3 3 10989.29 449.5173
    ## result.4 4 10877.80 451.7470
    ## result.5 5 10615.34 484.4478
    ## result.6 6 10290.59 435.7895

    ##          k      err  std_err
    ## result.1 1 28850.60 1784.698
    ## result.2 2 24561.09 2122.123
    ## result.3 3 23645.39 2027.609
    ## result.4 4 22749.11 1677.285
    ## result.5 5 22612.85 1344.745
    ## result.6 6 21649.57 1345.786

##4 每個trim都畫出RMSE和K的關係，可看出optimal k（line or point）
![](Assignment-1_files/figure-markdown_strict/unnamed-chunk-6-1.png)![](Assignment-1_files/figure-markdown_strict/unnamed-chunk-6-2.png)
The optimal k for 350 is 15, and the optimal k for 65 AMG is 22

##5 該k值對應的model(for each trim)

##6哪個trim有較大的optimal k? why?

    ## [1] 11466.79

![](Assignment-1_files/figure-markdown_strict/unnamed-chunk-8-1.png)

    ## [1] 36967.38

![](Assignment-1_files/figure-markdown_strict/unnamed-chunk-8-2.png)

65 AMG has a bigger optimal value of k.

Because 65 AMG trim has more data than 350 trim level.
