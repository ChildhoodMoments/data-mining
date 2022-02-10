question 1
----------

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

question 2
----------

    the_top_10_most_popular_songs

    ## # A tibble: 10 x 3
    ## # Groups:   performer [10]
    ##    performer                              song                             count
    ##    <chr>                                  <chr>                            <int>
    ##  1 Imagine Dragons                        Radioactive                         87
    ##  2 AWOLNATION                             Sail                                79
    ##  3 Jason Mraz                             I'm Yours                           76
    ##  4 The Weeknd                             Blinding Lights                     76
    ##  5 LeAnn Rimes                            How Do I Live                       69
    ##  6 LMFAO Featuring Lauren Bennett & Goon~ Party Rock Anthem                   68
    ##  7 OneRepublic                            Counting Stars                      68
    ##  8 Adele                                  Rolling In The Deep                 65
    ##  9 Jewel                                  Foolish Games/You Were Meant Fo~    65
    ## 10 Carrie Underwood                       Before He Cheats                    64

from the table we can get top 10 most popular songs since 1958

partB

we first excludes the years 1958 and 2021 then we can counts the number
of times that a given song appears on the Top 100 in a given year

    number_of_times_that_a_given_song

    ## # A tibble: 34,467 x 3
    ## # Groups:   year [62]
    ##     year song                                       count
    ##    <int> <chr>                                      <int>
    ##  1  1959 "\"Yep!\""                                     9
    ##  2  1959 "('til) I Kissed You"                         16
    ##  3  1959 "(All of a Sudden) My Heart Sings"            15
    ##  4  1959 "(I'll Be With You In) Apple Blossom Time"    11
    ##  5  1959 "(I Don't Care) Only Love Me"                  4
    ##  6  1959 "(I Wanna) Dance With The Teacher"             3
    ##  7  1959 "(If You Cry) True Love, True Love"            9
    ##  8  1959 "(New In) The Ways Of Love"                    7
    ##  9  1959 "(Night Time Is) The Right Time"               1
    ## 10  1959 "(Now and Then There's) A Fool Such As I"     15
    ## # ... with 34,457 more rows

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
