---
title: "USA: vote dataset preprocessing"
author: "Dereck de Mézquita"
date: "19 March, 2021"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "us-county-vote-dataset-preprocessing/us-county-vote-dataset-preprocessing.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    toc_float: yes
params:
  rmd: us-county-vote-dataset-preprocessing.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="us-county-vote-dataset-preprocessing.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiVVNBOiB2b3RlIGRhdGFzZXQgcHJlcHJvY2Vzc2luZyIKYXV0aG9yOiAiRGVyZWNrIGRlIE3DqXpxdWl0YSIKZGF0ZTogImByIGZvcm1hdChTeXMudGltZSgpLCAnJWQgJUIsICVZJylgIgprbml0OiAoZnVuY3Rpb24oaW5wdXRGaWxlLCBlbmNvZGluZykgeyAKICAgICAgcm1hcmtkb3duOjpyZW5kZXIoaW5wdXRGaWxlLAogICAgICAgICAgICAgICAgICAgICAgICBlbmNvZGluZz1lbmNvZGluZywgCiAgICAgICAgICAgICAgICAgICAgICAgIG91dHB1dF9maWxlPWZpbGUucGF0aChkaXJuYW1lKGlucHV0RmlsZSksICIuL3JlcG9ydHMvIiwgInVzLWNvdW50eS12b3RlLWRhdGFzZXQtcHJlcHJvY2Vzc2luZy91cy1jb3VudHktdm90ZS1kYXRhc2V0LXByZXByb2Nlc3NpbmcuaHRtbCIpKSB9KQpvdXRwdXQ6CiAgaHRtbF9kb2N1bWVudDogCiAgICBmaWdfY2FwdGlvbjogeWVzCiAgICBrZWVwX21kOiB5ZXMKICAgIG51bWJlcl9zZWN0aW9uczogeWVzCiAgICB0b2M6IHllcwogICAgdG9jX2Zsb2F0OiB5ZXMKcGFyYW1zOgogIHJtZDogdXMtY291bnR5LXZvdGUtZGF0YXNldC1wcmVwcm9jZXNzaW5nLlJtZAplZGl0b3Jfb3B0aW9uczogCiAgY2h1bmtfb3V0cHV0X3R5cGU6IGlubGluZQotLS0KCjxhIGRvd25sb2FkPSJ1cy1jb3VudHktdm90ZS1kYXRhc2V0LXByZXByb2Nlc3NpbmcuUm1kIiBocmVmPSJgciBiYXNlNjRlbmM6OmRhdGFVUkkoZmlsZSA9IHBhcmFtcyRybWQsIG1pbWUgPSAndGV4dC9ybWQnLCBlbmNvZGluZyA9ICdiYXNlNjQnKWAiPlIgTWFya2Rvd24gc291cmNlIGZpbGUgKHRvIHByb2R1Y2UgdGhpcyBkb2N1bWVudCk8L2E+CgpgYGB7ciBzZXR1cCwgaW5jbHVkZT1GQUxTRX0Ka25pdHI6Om9wdHNfY2h1bmskc2V0KGVjaG8gPSBUUlVFLCBvdXQud2lkdGggPSAiMTAwJSIsIG91dC5oZWlnaHQgPSAiNjB2aCIsIGZpZy5hbGlnbiA9ICJjZW50ZXIiKQpgYGAKCiMgTGlicmFyaWVzCgpgYGB7ciB3YXJuaW5nPUZBTFNFLCBtZXNzYWdlPUZBTFNFfQpsaWJyYXJ5KCJ0aWR5dmVyc2UiKQpsaWJyYXJ5KCJ0aWR5Y2Vuc3VzIikKYGBgCgpgYGB7cn0KY2xyIDwtIGxpc3QoCglyb3VnZSA9ICIjZTMyYjJiIiwKCWJsZXUgPSAiIzJiNWNlMyIsCgluZXV0cmUgPSAiIzc3Nzc3NyIKKQpgYGAKCgojIENvdW50eSBkYXRhCgpgYGB7cn0KZGF0YSgiZmlwc19jb2RlcyIpCgpmaXBzX2NvZGVzIDwtIGZpcHNfY29kZXMgJT4lCiAgIG11dGF0ZShmaXBzID0gYXMuY2hhcmFjdGVyKHBhc3RlMChzdGF0ZV9jb2RlLCBjb3VudHlfY29kZSkpKSAlPiUKICAgc2VsZWN0KGZpcHMsIHN0YXRlLCBzdGF0ZV9uYW1lLCBjb3VudHkpCgpjb2xuYW1lcyhmaXBzX2NvZGVzKSA8LSBjKCJmaXBzIiwgImFiYnJ2IiwgInN0YXRlIiwgImNvdW50eSIpCmBgYAoKIyBLYWdnbGUKCmBgYHtyfQpmb250ZXMgPC0gbGFwcGx5KGxpc3QuZmlsZXMoIi4vZGF0YS91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvcGVyLWNvdW50eS12b3Rlcy0yMC1mb250ZXMvIiwgZnVsbC5uYW1lcyA9IFRSVUUpLCByZWFkLmNzdikKbmFtZXMoZm9udGVzKSA8LSBnc3ViKCIuY3N2IiwgIiIsIGxpc3QuZmlsZXMoIi4vZGF0YS91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvcGVyLWNvdW50eS12b3Rlcy0yMC1mb250ZXMvIiksIHBlcmwgPSBUUlVFKQpgYGAKCmBgYHtyfQpwcnNkbnQgPC0gaW5uZXJfam9pbihmaXBzX2NvZGVzLCBmb250ZXMkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUsIGJ5ID0gYygic3RhdGUiLCAiY291bnR5IikpCmBgYAoKYGBge3J9CnByc2RudCAlPiUKICBtdXRhdGUocGFydHkgPSBpZmVsc2UocGFydHkgJWluJSBjKCJSRVAiLCAiREVNIiksIHBhcnR5LCAiT3RoZXIiKSwKICAgICAgICAgY29sb3VyID0gY2FzZV93aGVuKHBhcnR5ID09ICJSRVAiIH4gY2xyJHJvdWdlLCBwYXJ0eSA9PSAiREVNIiB+IGNsciRibGV1LCBUUlVFIH4gY2xyJG5ldXRyZSkpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIG11dGF0ZShuZXdfdG90YWxfdm90ZXMgPSBzdW0odG90YWxfdm90ZXMpKQpgYGAKCgojIHRvbm1jZwoKIyMgR2VuZXJhbCBlbGVjdGlvbiBwcmVzaWRlbnRpYWwgcGVyIGNvdW50eTsgdG9ubWNnCgpgYGB7cn0KCmBgYAoK">R Markdown source file (to produce this document)</a>



# Libraries


```r
library("tidyverse")
library("tidycensus")
```


```r
clr <- list(
	rouge = "#e32b2b",
	bleu = "#2b5ce3",
	neutre = "#777777"
)
```


# County data


```r
data("fips_codes")

fips_codes <- fips_codes %>%
   mutate(fips = as.character(paste0(state_code, county_code))) %>%
   select(fips, state, state_name, county)

colnames(fips_codes) <- c("fips", "abbrv", "state", "county")
```

# Kaggle


```r
fontes <- lapply(list.files("./data/united-states-of-america/per-county-votes-20-fontes/", full.names = TRUE), read.csv)
names(fontes) <- gsub(".csv", "", list.files("./data/united-states-of-america/per-county-votes-20-fontes/"), perl = TRUE)
```


```r
prsdnt <- inner_join(fips_codes, fontes$president_county_candidate, by = c("state", "county"))
```


```r
prsdnt %>%
  mutate(party = ifelse(party %in% c("REP", "DEM"), party, "Other"),
         colour = case_when(party == "REP" ~ clr$rouge, party == "DEM" ~ clr$bleu, TRUE ~ clr$neutre)) %>%
  group_by(fips) %>%
  mutate(new_total_votes = sum(total_votes))
```

```
## # A tibble: 19,493 x 10
## # Groups:   fips [3,043]
##    fips  abbrv state county candidate party total_votes won   colour
##    <chr> <chr> <chr> <chr>  <chr>     <chr>       <int> <chr> <chr> 
##  1 01001 AL    Alab… Autau… "Donald … REP         19838 True  #e32b…
##  2 01001 AL    Alab… Autau… "Joe Bid… DEM          7503 False #2b5c…
##  3 01001 AL    Alab… Autau… "Jo Jorg… Other         350 False #7777…
##  4 01001 AL    Alab… Autau… " Write-… Other          79 False #7777…
##  5 01003 AL    Alab… Baldw… "Donald … REP         83544 True  #e32b…
##  6 01003 AL    Alab… Baldw… "Joe Bid… DEM         24578 False #2b5c…
##  7 01003 AL    Alab… Baldw… "Jo Jorg… Other        1229 False #7777…
##  8 01003 AL    Alab… Baldw… " Write-… Other         328 False #7777…
##  9 01005 AL    Alab… Barbo… "Donald … REP          5622 True  #e32b…
## 10 01005 AL    Alab… Barbo… "Joe Bid… DEM          4816 False #2b5c…
## # … with 19,483 more rows, and 1 more variable: new_total_votes <int>
```


# tonmcg

## General election presidential per county; tonmcg



