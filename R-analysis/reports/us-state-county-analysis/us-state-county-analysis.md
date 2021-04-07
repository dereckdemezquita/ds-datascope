---
title: 'USA: state and county level analysis'
author: "Dereck de Mézquita"
date: "20 March, 2021"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "/us-state-county-analysis/us-state-county-analysis.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    # toc_float: yes
    # code_folding: hide
params:
  rmd: us-state-county-analysis.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="us-state-county-analysis.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAnVVNBOiBzdGF0ZSBhbmQgY291bnR5IGxldmVsIGFuYWx5c2lzJwphdXRob3I6ICJEZXJlY2sgZGUgTcOpenF1aXRhIgpkYXRlOiAiYHIgZm9ybWF0KFN5cy50aW1lKCksICclZCAlQiwgJVknKWAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAiL3VzLXN0YXRlLWNvdW50eS1hbmFseXNpcy91cy1zdGF0ZS1jb3VudHktYW5hbHlzaXMuaHRtbCIpKSB9KQpvdXRwdXQ6CiAgaHRtbF9kb2N1bWVudDogCiAgICBmaWdfY2FwdGlvbjogeWVzCiAgICBrZWVwX21kOiB5ZXMKICAgIG51bWJlcl9zZWN0aW9uczogeWVzCiAgICB0b2M6IHllcwogICAgIyB0b2NfZmxvYXQ6IHllcwogICAgIyBjb2RlX2ZvbGRpbmc6IGhpZGUKcGFyYW1zOgogIHJtZDogdXMtc3RhdGUtY291bnR5LWFuYWx5c2lzLlJtZAplZGl0b3Jfb3B0aW9uczogCiAgY2h1bmtfb3V0cHV0X3R5cGU6IGlubGluZQotLS0KCjxhIGRvd25sb2FkPSJ1cy1zdGF0ZS1jb3VudHktYW5hbHlzaXMuUm1kIiBocmVmPSJgciBiYXNlNjRlbmM6OmRhdGFVUkkoZmlsZSA9IHBhcmFtcyRybWQsIG1pbWUgPSAndGV4dC9ybWQnLCBlbmNvZGluZyA9ICdiYXNlNjQnKWAiPlIgTWFya2Rvd24gc291cmNlIGZpbGUgKHRvIHByb2R1Y2UgdGhpcyBkb2N1bWVudCk8L2E+CgpgYGB7ciBzZXR1cCwgaW5jbHVkZT1GQUxTRX0Ka25pdHI6Om9wdHNfY2h1bmskc2V0KGVjaG8gPSBUUlVFLCBkcGkgPSA1MDAsIGZpZy53aWR0aCA9IDgsIGZpZy5oZWlnaHQgPSA4LCBmaWcuYWxpZ24gPSAiY2VudGVyIikKYGBgCgojIExpYnJhcmllcwoKYGBge3IgbGlicmFyaWVzLCB3YXJuaW5nPUZBTFNFLCBtZXNzYWdlPUZBTFNFfQpsaWJyYXJ5KCJ0aWR5dmVyc2UiKQpsaWJyYXJ5KCJkZHBsb3QiKQpgYGAKCiMgZ2dwbG90IHRoZW1lCgpgYGB7ciBzZXQtZ2dwbG90LWRlZmF1bHRzfQp1cGRhdGVfZ2VvbV9kZWZhdWx0cygibGluZSIsIGxpc3QoYWxwaGEgPSAwLjY1LCBzaXplID0gMC42NSkpCgp0aGVtZV9zZXQodGhlbWVfZGVyZWNrKCkpCmBgYA==">R Markdown source file (to produce this document)</a>



# Libraries


```r
library("tidyverse")
library("ddplot")
```

# ggplot theme


```r
update_geom_defaults("line", list(alpha = 0.65, size = 0.65))

theme_set(theme_dereck())
```
