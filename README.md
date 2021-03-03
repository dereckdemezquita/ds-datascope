# ds-gapminder <img src="./images/project-logo.png" width="200" align="right">

Visualisation and analysis skills by analysing gapminder datasets. Tech stack includes `R`, `tidyverse`, `ggplot2`, `plotly`, `xml2`, `rvest`; `SQLite`; `JavaScript`, `D3.js`; `HTML`, and `CSS`.

I wanted to analyse the gapminder datasets and build a single page website for displaying some beautiful graphics using `D3.js`. I did this is a few parts:

1. Cleaning, organising and merging the datasets.
1. Exploratory analysis and visualisation with `ggplot2`.
1. Final plots and website; `JavaScript`, `D3.js`.

# Project structure

You can find all preliminary analysis and work done with R in the `R-analysis` directory. In the `website` directory you'll find all work done with `JavaScript` and `D3.js`.

## Website structure

Tech stack will include and work in the following way:

1. `ExpressJS` framework - for server creation.
1. `SQL` database - stores and manages data.
1. `Nginx` as a reverse proxy - avoids exposing server and relays client requests.
1. `NodeJS` server - runs `SQL` and `ExpressJS` server.
1. `JavaScript` - used front end and back end.
1. `SCSS` - use for styling; better than `CSS` for its modularity.
1. `HTML` - front end code.
1. `D3.js` - visualisation library.

# The dataset: gapminder

The data was taken from the [gapminder website](https://www.gapminder.org) and github repositories: [open-numbers/ddf--gapminder--fasttrack](https://github.com/open-numbers/ddf--gapminder--fasttrack).

Unfortunately the datasets provided are quite messy, it is difficult to obtain the full dataset, and manual download is often necessary for obtain certain ones. Most data is avaialable in the linked repository, but some is only available by manual download. Moreover, this data presents itself in short format. 

Reshaping the data into long format was done by the `clean-data.Rmd` script. There I use a list object to read in all data files, name the object and execute a custom algorithm for reshaping the data and passing the file name to a column name:

First the data is read and put into long format. This is held by a list object.

```r
reshape_manual_data <- function(x) {
	shift_long <- function(x) {
		x %>%
			column_to_rownames("country") %>%
			t() %>% as.data.frame() %>%
			rownames_to_column("year") %>%
			mutate(year = gsub("X", "", year)) %>%
			reshape2::melt() %>%
			return()
	}
	
	shifted <- lapply(x, shift_long)
	
	for(i in 1:length(x)) {
		colnames(shifted[[i]])[3] <- names(x)[i]
	}
	return(shifted)
}
```

This list object is now merged to produce a single dataset, NA are inserted where necessary to keep all rows.

```r
data$manual <- Reduce(function(...) {
	merge(..., all = TRUE)
}, reshape_manual_data(data$manual))
```

Finally all the data is saved to the `SQLite` database found in the `sql` directory. I then use this database with `JavaScript` and `D3.js` to produce the website.

# ggplot2 visualisations

<p align="center">
    <img src="./R-analysis/reports/dataset-choropleths-merged/dataset-choropleths-merged_files/figure-html/chor-2-prc-chng-1.png" width="1000">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/countries-u5pop-prc-1.png" width="1000">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/avg-life-aggregate-1.png" width="1000">
</p>

<p align="center">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/countries-1-fhos-1.png" width="400">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/gdp-per-capita-1.png" width="400">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/gdp-per-capita-facet-1.png" width="400">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/gini-inequality-line-aggregate-1.png" width="400">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/gpd-per-country-1.png" width="400">
    <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/pop-line-per-regions-sums-1.png" width="400">
    <!-- <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/pop-line-per-total-sums-1.png" width="400"> -->
    <!-- <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/pop-line-world-1.png" width="400"> -->
    <!-- <img src="./R-analysis/reports/dataset-analysis-merged/dataset-analysis-merged_files/figure-html/pop-line-world-facet-1.png" width="400"> -->
</p>

<p align="center">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/global-journalist-killed-line-1.png" width="400">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/global-ndisaster-tot-bar-1.png" width="400">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/unnamed-chunk-1-1.png" width="400">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/w4-conflict-death-line-2.png" width="400">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/w4-refugee-line-1.png" width="400">
    <img src="./R-analysis/reports/analysis-dataset-world/analysis-dataset-world_files/figure-html/w4-women-held-line-1.png" width="400">
</p>

