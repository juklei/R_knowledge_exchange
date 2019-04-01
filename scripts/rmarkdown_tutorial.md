Rmarkdown Tutorial
================
Kate Wootton
April 1, 2019

Why Rmarkdown?
--------------

Rmarkdown lets you dynamically access data and generate figures, run analyses etc, making sure your research is reproducible. Cool things you can do

-   Show your code
-   Insert values from your data directly
-   Make figures
-   Tables
-   Reference sections / figures / equations (with bookdown)
-   Any language
-   Citations (bookdown)
-   Version control (with git)

What types of output?
---------------------

You can rapidly and easily change your output type to any of the following, and more:

-   Html
-   Word
-   Pdf (with Latex)
-   Github
-   Presentation (with beamer)
-   And more (e.g. tufte handout, Rshiny)

How does it work?
-----------------

### Sections

There are three main sections to the document:

-   Header
-   What kind of document to create
-   Title / author / date
-   Code chunks
-   Surrounded by tick marks
-   Indicate language
-   Chunk options (e.g. warning = FALSE)
-   Also inline
-   Text
-   Formatting e.g. *bold*, **italics**, numbered lists, bullet points, headings
-   Equations (using $ $ like latex)

So let's do some stuff
----------------------

### Figures

First we read in the data and make a plot. Note that our code is shown below so we know what we did and where the data came from (we can also suppress this if we want).

``` r
insects <- read.csv("../data/example_data.csv")
barplot(insects$frequency, names.arg = insects$insect)
```

![](rmarkdown_tutorial_files/figure-markdown_github/favorite%20insect-1.png)

### Referencing in text

Then we write about it:

It seems that 7 people like flea beetles best.

### Equations

And here's an equation just for the sake of it: *e* = *m**c*<sup>2</sup>

### Tables

Maybe we want to see the data, so we can make a table:

``` r
kable(insects, caption = "Table 1: Everyone's favourite insects")
```

| insect      |  frequency|
|:------------|----------:|
| dung beetle |          4|
| aphid       |          7|
| bumble bee  |          3|
| butterfly   |          9|
| flea beetle |          7|
| lady beetle |          9|
