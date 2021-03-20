---
title: "Choropleth; USA counties"
author: "Dereck de Mézquita"
date: "19 March, 2021"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "us-county-choropleths/us-county-choropleths.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    toc_float: yes
params:
  rmd: us-county-choropleths.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="us-county-choropleths.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiQ2hvcm9wbGV0aDsgVVNBIGNvdW50aWVzIgphdXRob3I6ICJEZXJlY2sgZGUgTcOpenF1aXRhIgpkYXRlOiAiYHIgZm9ybWF0KFN5cy50aW1lKCksICclZCAlQiwgJVknKWAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAidXMtY291bnR5LWNob3JvcGxldGhzL3VzLWNvdW50eS1jaG9yb3BsZXRocy5odG1sIikpIH0pCm91dHB1dDoKICBodG1sX2RvY3VtZW50OiAKICAgIGZpZ19jYXB0aW9uOiB5ZXMKICAgIGtlZXBfbWQ6IHllcwogICAgbnVtYmVyX3NlY3Rpb25zOiB5ZXMKICAgIHRvYzogeWVzCiAgICB0b2NfZmxvYXQ6IHllcwpwYXJhbXM6CiAgcm1kOiB1cy1jb3VudHktY2hvcm9wbGV0aHMuUm1kCmVkaXRvcl9vcHRpb25zOiAKICBjaHVua19vdXRwdXRfdHlwZTogaW5saW5lCi0tLQoKPGEgZG93bmxvYWQ9InVzLWNvdW50eS1jaG9yb3BsZXRocy5SbWQiIGhyZWY9ImByIGJhc2U2NGVuYzo6ZGF0YVVSSShmaWxlID0gcGFyYW1zJHJtZCwgbWltZSA9ICd0ZXh0L3JtZCcsIGVuY29kaW5nID0gJ2Jhc2U2NCcpYCI+UiBNYXJrZG93biBzb3VyY2UgZmlsZSAodG8gcHJvZHVjZSB0aGlzIGRvY3VtZW50KTwvYT4KCmBgYHtyIHNldHVwLCBpbmNsdWRlPUZBTFNFfQprbml0cjo6b3B0c19jaHVuayRzZXQoZWNobyA9IFRSVUUsIGZpZy5hbGlnbiA9ICJjZW50ZXIiKQpgYGAKCiMgTGlicmFyaWVzCgpgYGB7ciBsaWJyYXJpZXMsIHdhcm5pbmc9RkFMU0UsIG1lc3NhZ2U9RkFMU0V9CmxpYnJhcnkoInRpZHl2ZXJzZSIpCiMgU3VwcHJlc3Mgc3VtbWFyaXNlIGluZm8Kb3B0aW9ucyhkcGx5ci5zdW1tYXJpc2UuaW5mb3JtID0gRkFMU0UpCgpsaWJyYXJ5KCJwbG90bHkiKQpsaWJyYXJ5KCJsZWFmbGV0IikKCmxpYnJhcnkoImdlb2pzb25pbyIpCmxpYnJhcnkoInNwIikKbGlicmFyeSgiYnJvb20iKQoKbGlicmFyeSgidmlyaWRpcyIpCmBgYAoKIyBMb2FkIGRhdGEKCmBgYHtyfQojIGRhdGEgPC0gcmVhZC5jc3YoIi4vb3V0cHV0cy91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvcHJvY2Vzc2VkLWRhdGEvYWxsLW1lcmdlZC1kYXRhLmNzdiIsIHJvdy5uYW1lcyA9IDEpCmRhdGEgPC0gbGFwcGx5KGxpc3QuZmlsZXMoIi4vb3V0cHV0cy91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvIiwgcGF0dGVybiA9ICJcXC5jc3YkIiwgZnVsbC5uYW1lcyA9IFRSVUUpLCByZWFkLmNzdikKbmFtZXMoZGF0YSkgPC0gZ3N1YigiXFwuY3N2JCIsICIiLCBsaXN0LmZpbGVzKCIuL291dHB1dHMvdW5pdGVkLXN0YXRlcy1vZi1hbWVyaWNhLyIsIHBhdHRlcm4gPSAiXFwuY3N2JCIpKQpgYGAKCmBgYHtyfQpuYW1lcyhkYXRhKQpgYGAKCmBgYHtyfQpkYXRhIDwtIGxhcHBseShkYXRhLCBmdW5jdGlvbih4KSB7CiAgUmVkdWNlKGZ1bmN0aW9uKC4uLikgewogICAgbWVyZ2UoLi4uLCBhbGwueCA9IFRSVUUpCiAgfSwgbGlzdChkYXRhJGZpcF9jb2RlcywgeCkpCn0pCmBgYAoKIyBDaG9yb3BsZXRoOyBtYXAgbWFraW5nIHdpdGggUgoKLSBQZXIgc3RhdGU6ICJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vZGVsZGVyc3ZlbGQvdG9wb2pzb24vbWFzdGVyL2NvdW50cmllcy91bml0ZWQtc3RhdGVzL3VzLWFsYmVycy5qc29uIgotIFBlciBjb3VudHk6ICJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vZGVsZGVyc3ZlbGQvdG9wb2pzb24vbWFzdGVyL2NvdW50cmllcy91bml0ZWQtc3RhdGVzL3VzLWFsYmVycy1jb3VudGllcy5qc29uIgoKIyMgRG93bmxvYWQgY291bnRpZXMgZ2VvSlNPTiBVU0EKCmBgYHtyfQppZighZmlsZS5leGlzdHMoIi4vb3V0cHV0cy9tYXBwaW5nLWRhdGEvdXMtYWxiZXJzLWNvdW50aWVzLmpzb24iKSkgewogIGRvd25sb2FkLmZpbGUoImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9kZWxkZXJzdmVsZC90b3BvanNvbi9tYXN0ZXIvY291bnRyaWVzL3VuaXRlZC1zdGF0ZXMvdXMtYWxiZXJzLWNvdW50aWVzLmpzb24iLCAiLi9vdXRwdXRzL21hcHBpbmctZGF0YS91cy1hbGJlcnMtY291bnRpZXMuanNvbiIpCn0KCnVzYSA8LSBnZW9qc29uaW86Omdlb2pzb25fcmVhZCgiLi9vdXRwdXRzL21hcHBpbmctZGF0YS91cy1hbGJlcnMtY291bnRpZXMuanNvbiIsIHdoYXQgPSAic3AiKQoKcGxvdCh1c2EpCmBgYAoKYGBge3Igd2FybmluZz1GQUxTRSwgbWVzc2FnZT1GQUxTRX0KdXNhX3RkeSA8LSBicm9vbTo6dGlkeSh1c2EsIHJlZ2lvbiA9ICJmaXBzIikKCnVzYV90ZHkgJT4lCiAgZ2dwbG90KCkgKwogIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApLCBmaWxsID0gIndoaXRlIiwgY29sb3IgPSAiZ3JleSIpICsKICB0aGVtZV92b2lkKCkgKwogIGNvb3JkX21hcCgpCmBgYAoKYGBge3J9CmNob3JvcGxvdCA8LSBmdW5jdGlvbihkYXRhLCB2YWx1ZSA9IE5VTEwsIGNvbG91ciA9ICJibGFjayIsIHNpemUgPSAwLjA3NSwgYWxwaGEgPSAwLjksIHRyYW5zID0gImxvZzEwIiwgbGVuZ3RoLm91dCA9IDMsIHRpdGxlID0gIiIsIGd1aWRlX3RpdGxlID0gIiIsIGNhcHRpb24gPSAiIikgewogICMgaWYoIWFueShjb2xuYW1lcyh1c2FfcG9wKSA9PSAidmFsdWUiKSkge3N0b3AoIk11c3QgY29udGFpbiBjb2x1bW4gbmFtZWQgJ3ZhbHVlcycuIil9CiAgZGF0YSAlPiUKICAgIGdncGxvdCgpICsKICAgIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXAsIGZpbGwgPSBkYXRhWyx2YWx1ZV0pLCBjb2xvdXIgPSBjb2xvdXIsIHNpemUgPSBzaXplLCBhbHBoYSA9IGFscGhhKSArCiAgICAjIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApLCBzaXplID0gMC4wNzUsIGNvbG91ciA9ICJibGFjayIsIGFscGhhID0gMCkgKwogICAgdGhlbWVfdm9pZCgpICsKICAgIHNjYWxlX2ZpbGxfdmlyaWRpcyh0cmFucyA9IHRyYW5zLAogICAgICAgICAgICAgICAgICAgICAgIGJyZWFrcyA9IHNlcSgwLCBtYXgoZGF0YVssdmFsdWVdKSwgbGVuZ3RoLm91dCA9IGxlbmd0aC5vdXQpLCAjIHNlcSgwLCBtYXgodXNhX3BvcCR2YWx1ZSksIGJ5ID0gMTAwMDAwMCkKICAgICAgICAgICAgICAgICAgICAgICBuYW1lID0gZ3VpZGVfdGl0bGUsCiAgICAgICAgICAgICAgICAgICAgICAgZ3VpZGUgPSBndWlkZV9sZWdlbmQoa2V5aGVpZ2h0ID0gdW5pdCgyLCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXl3aWR0aCA9IHVuaXQoNSwgdW5pdHMgPSAibW0iKSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwucG9zaXRpb24gPSAiYm90dG9tIiwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGl0bGUucG9zaXRpb24gPSAndG9wJywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJvdyA9IDEpLAogICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gZnVuY3Rpb24oeCkgewogICAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCiAgICAgICAgICAgICAgICAgICAgICAgICB9KSArCiAgICBsYWJzKHRpdGxlID0gdGl0bGUsCiAgICAgICAgICMgc3VidGl0bGUgPSAiUG9wdWxhdGlvbiBwZXIgY291bnR5IiwKICAgICAgICAgY2FwdGlvbiA9IGNhcHRpb24pICsKICAgIHRoZW1lKCMgdGV4dCA9IGVsZW1lbnRfdGV4dChjb2xvciA9ICIjMjIyMTFkIiksCiAgICAgICAgICAjIHBsb3QuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAgICMgcGFuZWwuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAgICMgbGVnZW5kLmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgICBwbG90LnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemUgPSAyMiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3QgPSAwLjAxLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBjb2xvciA9ICIjNGU0ZDQ3IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40LCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICAgIHBsb3Quc3VidGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZT0gMTcsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoanVzdD0wLjAxLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQzLCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICAgIHBsb3QuY2FwdGlvbiA9IGVsZW1lbnRfdGV4dChzaXplPTEyLCBjb2xvciA9ICIjNGU0ZDQ3IiwgbWFyZ2luID0gbWFyZ2luKGIgPSAwLjMsIHIgPSAtOTksIHVuaXQgPSAiY20iKSksCiAgICAgICAgICBsZWdlbmQucG9zaXRpb24gPSBjKDAuNywgMC4wOSkpICsKICAgIGNvb3JkX21hcCgpCn0KYGBgCgojIFBvcHVsYXRpb24gY291bnRzIHBlciBjb3VudHkKCmBgYHtyfQpwb3AgPC0gZGF0YSRjZW5zdXNfcG9wdWxhdGlvbgpwb3AkcG9wZXN0aW1hdGUyMDEwIDwtIE5VTEwKY29sbmFtZXMocG9wKVs3Om5jb2wocG9wKV0gPC0gZ3N1YigiY2Vuc3VzfHBvcHxwb3Blc3RpbWF0ZSIsICIiLCBjb2xuYW1lcyhwb3ApWzc6bmNvbChwb3ApXSkKCnBvcCAlPiUKICBkcm9wX25hKCkgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSA3Om5jb2wocG9wKSwgbmFtZXNfdG8gPSAieWVhciIpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIGFycmFuZ2UoeWVhciwgLmJ5X2dyb3VwID0gVFJVRSkgJT4lCiAgbXV0YXRlKHBjdF9kaWYgPSB2YWx1ZS9sYWcodmFsdWUpICogMTAwKSAlPiUKICBmaWx0ZXIoIWlzLm5hKHBjdF9kaWYpKSAlPiUKICBncm91cF9ieShmaXBzKSAlPiUKICBzdW1tYXJpc2UoZmlwcywgYWJicnYsIHN0YXRlLCBjb3VudHksIHJlZ2lvbiwgZGl2aXNpb24sIHllYXIsIHBjdF9hdmcgPSBzdW0ocGN0X2RpZikgLyA5KSAlPiUKICAjIGZpbHRlcih5ZWFyID09IDIwMTkpICU+JQogIGdncGxvdChhZXMocGN0X2F2ZykpICsKICBnZW9tX2RlbnNpdHkoKSArCiAgbGFicyh0aXRsZSA9ICJEaXN0cmlidXRpb24iKSAKICAjIHNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKCnBvcF9wY3RfZGlmZiA8LSBwb3AgJT4lIAogIGRyb3BfbmEoKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IDc6bmNvbChwb3ApLCBuYW1lc190byA9ICJ5ZWFyIikgJT4lCiAgZ3JvdXBfYnkoZmlwcykgJT4lCiAgYXJyYW5nZSh5ZWFyLCAuYnlfZ3JvdXAgPSBUUlVFKSAlPiUKICBtdXRhdGUocGN0X2RpZiA9IHZhbHVlL2xhZyh2YWx1ZSkgKiAxMDApICU+JQogIGZpbHRlcighaXMubmEocGN0X2RpZikpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIG11dGF0ZShwY3RfYXZnID0gc3VtKHBjdF9kaWYpIC8gOSkKCnVzYV9wb3AgPC0gdXNhX3RkeSAlPiUKICBtdXRhdGUoZmlwcyA9IGFzLm51bWVyaWMoaWQpKSAlPiUKICBsZWZ0X2pvaW4ocG9wX3BjdF9kaWZmLCBieSA9IGMoImZpcHMiID0gImZpcHMiKSkKCnVzYV9wb3AkcGN0X2F2Z1tpcy5uYSh1c2FfcG9wJHBjdF9hdmcpXSA8LSAwLjAwMQoKIyB1c2FfcG9wICU+JQojICAgZ2dwbG90KCkgKwojICAgZ2VvbV9wb2x5Z29uKGFlcyhmaWxsID0gcGN0X2F2ZywgeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApKSArCiMgICB0aGVtZV92b2lkKCkgKwojICAgY29vcmRfbWFwKCkKYGBgCgoKYGBge3J9CnVzYV9wb3AgJT4lCiAgZ2dwbG90KCkgKwogIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXAsIGZpbGwgPSBwY3RfYXZnKSwgY29sb3VyID0gImJsYWNrIiwgc2l6ZSA9IDAuMDc1LCBhbHBoYSA9IDAuOSkgKwogICMgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCksIHNpemUgPSAwLjA3NSwgY29sb3VyID0gImJsYWNrIiwgYWxwaGEgPSAwKSArCiAgdGhlbWVfdm9pZCgpICsKICBzY2FsZV9maWxsX3ZpcmlkaXMoIyB0cmFucyA9ICJsb2cxMCIsCiAgICAgICAgICAgICAgICAgICAgIGJyZWFrcyA9IHNlcSgwLCBtYXgodXNhX3BvcCRwY3RfYXZnKSwgbGVuZ3RoLm91dCA9IDYpLAogICAgICAgICAgICAgICAgICAgICBuYW1lID0gIkF2ZXJhZ2UgcG9wIGNoYW5nZSBwZXIgY291bnR5IiwKICAgICAgICAgICAgICAgICAgICAgZ3VpZGUgPSBndWlkZV9sZWdlbmQoa2V5aGVpZ2h0ID0gdW5pdCgyLCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2V5d2lkdGggPSB1bml0KDMsIHVuaXRzID0gIm1tIiksIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbC5wb3NpdGlvbiA9ICJib3R0b20iLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGl0bGUucG9zaXRpb24gPSAndG9wJywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yb3cgPSAxKSwKICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSBmdW5jdGlvbih4KSB7CiAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCiAgICAgICAgICAgICAgICAgICAgIH0pICsKICBsYWJzKHRpdGxlID0gIkF2ZXJhZ2UgcG9wIGNoYW5nZSBwZXIgY291bnR5IiwKICAgICAgIHN1YnRpdGxlID0gIkF2ZXJhZ2UgY2hhbmdlIGluIHBvcHVsYXRpb24gcGVyIGNvdW50eSAyMDEwIC0gMjAxOSIsCiAgICAgICBjYXB0aW9uID0gIkRhdGE6IENFTlNVUyBCVVJFQVUgfCBCeTogRGVyZWNrIHwgZGVyZWNrc25vdGVzLmNvbSIpICsKICB0aGVtZSh0ZXh0ID0gZWxlbWVudF90ZXh0KGNvbG9yID0gIiMyMjIxMWQiKSwKICAgICAgICAjIHBsb3QuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAjIHBhbmVsLmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgIyBsZWdlbmQuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICBwbG90LnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemUgPSAyMiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhqdXN0ID0gMC4wMSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40LCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBwbG90LnN1YnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemU9IDE3LCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhqdXN0PTAuMDEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40MywgbCA9IDIsIHVuaXQgPSAiY20iKSksCiAgICAgICAgcGxvdC5jYXB0aW9uID0gZWxlbWVudF90ZXh0KHNpemU9MTIsIGNvbG9yID0gIiM0ZTRkNDciLCBtYXJnaW4gPSBtYXJnaW4oYiA9IDAuMywgciA9IC05OSwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBsZWdlbmQucG9zaXRpb24gPSBjKDAuNywgMC4wOSkpICsKICBjb29yZF9tYXAoKQpgYGAKCmBgYHtyfQpnZHAgPC0gZGF0YSRnZHBfMjAwMV8yMDE5CiMgY29sbmFtZXMoZ2RwKVs1Om5jb2woZ2RwKV0gPC0gZ3N1YigieCIsICIiLCBjb2xuYW1lcyhnZHApWzU6bmNvbChnZHApXSkKCmdkcCAlPiUKICBkcm9wX25hKCkgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSA1Om5jb2woZ2RwKSwgbmFtZXNfdG8gPSAieWVhciIpICU+JQogIG11dGF0ZSh5ZWFyID0gYXMubnVtZXJpYyhnc3ViKCJYIiwgIiIsIHllYXIpKSkgJT4lCiAgZmlsdGVyKHllYXIgPT0gMjAxOSkgJT4lCiAgZ2dwbG90KGFlcyh2YWx1ZSkpICsKICBnZW9tX2hpc3RvZ3JhbShiaW5zID0gMjApICsKICBzY2FsZV94X2NvbnRpbnVvdXModHJhbnMgPSAibG9nMiIpCgpnZHAyMDE5IDwtIGdkcCAlPiUKICAjIGRyb3BfbmEoKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IDU6bmNvbChnZHApLCBuYW1lc190byA9ICJ5ZWFyIikgJT4lCiAgbXV0YXRlKHllYXIgPSBhcy5udW1lcmljKGdzdWIoIlgiLCAiIiwgeWVhcikpKSAlPiUKICBmaWx0ZXIoeWVhciA9PSAyMDAxKQogICMgbXV0YXRlKGNoYXJfZmlwcyA9IGFzLmNoYXJhY3RlcihmaXBzKSkKCnVzYV9nZHAgPC0gdXNhX3RkeSAlPiUKICBtdXRhdGUoZmlwcyA9IGFzLm51bWVyaWMoaWQpKSAlPiUKICBsZWZ0X2pvaW4oZ2RwMjAxOSwgYnkgPSBjKCJmaXBzIiA9ICJmaXBzIikpCgp1c2FfZ2RwJHZhbHVlW2lzLm5hKHVzYV9nZHAkdmFsdWUpXSA8LSAwLjAwMQoKdXNhX2dkcCAlPiUKICBnZ3Bsb3QoKSArCiAgZ2VvbV9wb2x5Z29uKGFlcyhmaWxsID0gdmFsdWUsIHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwKSkgKwogIHRoZW1lX3ZvaWQoKSArCiAgY29vcmRfbWFwKCkKCnVzYV9nZHAgJT4lCiAgZ2dwbG90KCkgKwogIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXAsIGZpbGwgPSB2YWx1ZSksIGNvbG91ciA9ICJibGFjayIsIHNpemUgPSAwLjA3NSwgYWxwaGEgPSAwLjkpICsKICAjIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApLCBzaXplID0gMC4wNzUsIGNvbG91ciA9ICJibGFjayIsIGFscGhhID0gMCkgKwogIHRoZW1lX3ZvaWQoKSArCiAgc2NhbGVfZmlsbF92aXJpZGlzKHRyYW5zID0gImxvZzEwIiwKICAgICAgICAgICAgICAgICAgICAgYnJlYWtzID0gc2VxKDAsIG1heCh1c2FfZ2RwJHZhbHVlKSwgbGVuZ3RoLm91dCA9IDUpLCAjIHNlcSgwLCBtYXgodXNhX3BvcCR2YWx1ZSksIGJ5ID0gMTAwMDAwMCkKICAgICAgICAgICAgICAgICAgICAgbmFtZSA9ICJQb3B1bGF0aW9uIHBlciBjb3VudHkiLAogICAgICAgICAgICAgICAgICAgICBndWlkZSA9IGd1aWRlX2xlZ2VuZChrZXloZWlnaHQgPSB1bml0KDIsIHVuaXRzID0gIm1tIiksIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXl3aWR0aCA9IHVuaXQoMywgdW5pdHMgPSAibW0iKSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsLnBvc2l0aW9uID0gImJvdHRvbSIsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aXRsZS5wb3NpdGlvbiA9ICd0b3AnLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJvdyA9IDEpLAogICAgICAgICAgICAgICAgICAgICBsYWJlbCA9IGZ1bmN0aW9uKHgpIHsKICAgICAgICAgICAgICAgICAgICAgICBmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKICAgICAgICAgICAgICAgICAgICAgfSkgKwogIGxhYnModGl0bGUgPSAiR0RQIHBlciBjb3VudHkiLAogICAgICAgIyBzdWJ0aXRsZSA9ICJQb3B1bGF0aW9uIHBlciBjb3VudHkiLAogICAgICAgY2FwdGlvbiA9ICJEYXRhOiBDRU5TVVMgQlVSRUFVIHwgQnk6IERlcmVjayB8IGRlcmVja3Nub3Rlcy5jb20iKSArCiAgdGhlbWUodGV4dCA9IGVsZW1lbnRfdGV4dChjb2xvciA9ICIjMjIyMTFkIiksCiAgICAgICAgIyBwbG90LmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgIyBwYW5lbC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgICMgbGVnZW5kLmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgcGxvdC50aXRsZSA9IGVsZW1lbnRfdGV4dChzaXplID0gMjIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoanVzdCA9IDAuMDEsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBjb2xvciA9ICIjNGU0ZDQ3IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcmdpbiA9IG1hcmdpbihiID0gLTAuMSwgdCA9IDAuNCwgbCA9IDIsIHVuaXQgPSAiY20iKSksCiAgICAgICAgcGxvdC5zdWJ0aXRsZSA9IGVsZW1lbnRfdGV4dChzaXplPSAxNywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoanVzdD0wLjAxLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBjb2xvciA9ICIjNGU0ZDQ3IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcmdpbiA9IG1hcmdpbihiID0gLTAuMSwgdCA9IDAuNDMsIGwgPSAyLCB1bml0ID0gImNtIikpLAogICAgICAgIHBsb3QuY2FwdGlvbiA9IGVsZW1lbnRfdGV4dChzaXplPTEyLCBjb2xvciA9ICIjNGU0ZDQ3IiwgbWFyZ2luID0gbWFyZ2luKGIgPSAwLjMsIHIgPSAtOTksIHVuaXQgPSAiY20iKSksCiAgICAgICAgbGVnZW5kLnBvc2l0aW9uID0gYygwLjcsIDAuMDkpKSArCiAgY29vcmRfbWFwKCkKYGBgCgoKYGBge3IgZXZhbD1GQUxTRX0KcG9wMjAxOSAlPiUKICBjb3VudChzdGF0ZSkgJT4lCiAgZ2dwbG90KGFlcyhzdGF0ZSwgbiwgZmlsbCA9IHN0YXRlKSkgKwogIGdlb21fYmFyKHN0YXQgPSAiaWRlbnRpdHkiKSArCiAgbGFicyh0aXRsZSA9ICJOdW1iZXIgb2YgY291bnRpZXMgcGVyIHN0YXRlIiwgeCA9ICJTdGF0ZSIsIHkgPSAiTnVtYmVyIG9mIGNvdW50aWVzIikgKwogIHRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIiwKICAgICAgICBheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDkwLCB2anVzdCA9IDAsIGhqdXN0ID0gMSkpCiAgIyBzY2FsZV94X2NvbnRpbnVvdXModHJhbnMgPSAibG9nMiIpCmBgYAoKCmBgYHtyfQpsZWFmbGV0KCkgJT4lCiAgYWRkVGlsZXMoKSAlPiUgICMgQWRkIGRlZmF1bHQgT3BlblN0cmVldE1hcCBtYXAgdGlsZXMKICBhZGRNYXJrZXJzKGxuZz0xNzQuNzY4LCBsYXQ9LTM2Ljg1MiwgcG9wdXA9IlRoZSBiaXJ0aHBsYWNlIG9mIFIiKQpgYGAKCgoKYGBge3IgZXZhbD1GQUxTRX0KcG9wICU+JQogIGdncGxvdChhZXMoeWVhciwgdmFsdWUpKSArCiAgZ2VvbV9saW5lKGFlcyhncm91cCA9IGZpcHMpKQpgYGAKCgoKIyBCaXJ0aCBhbmQgZGVhdGggcmF0ZQoKYGBge3IgZXZhbD1GQUxTRX0KcmJpbmQoZGF0YSRjZW5zdXNfYmlydGhzLCBkYXRhJGNlbnN1c19kZWF0aHMpCmBgYAoKYGBge3IgZXZhbD1GQUxTRX0KcCA8LSBiaXJ0aF9kZWF0aCAlPiUgCiAgZHJvcF9uYSgpICU+JQogICMgZmlsdGVyKGFiYnJ2ID09ICJMQSIpICU+JQogIHBpdm90X2xvbmdlcihjb2xzID0gYyhzdGFydHNfd2l0aCgiZGVhdGhzIikpKSAlPiUgIyAsIHN0YXJ0c193aXRoKCJkZWF0aHMiKQogIHNlcGFyYXRlKG5hbWUsIGMoInR5cGUiLCAieWVhciIpLCAicyIpICU+JQogIGdncGxvdChhZXMoeCA9IHllYXIsIHkgPSB2YWx1ZSkpICsKICBnZW9tX2xpbmUoYWVzKGdyb3VwID0gZmlwcywgY29sb3VyID0gZmlwcykpICsKICB0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpCiAgIyBzY2FsZV95X2NvbnRpbnVvdXModHJhbnMgPSAibG9nMiIpCgpnZ3Bsb3RseShwKQpgYGAKCgoKCmBgYHtyIGV2YWw9RkFMU0V9CmRhdGEkYWxsX21lcmdlZF9kYXRhICU+JQogIGZpbHRlcihjb3VudHkgPT0gIlN0YW5pc2xhdXMiKQoKZGF0YSRhbGxfbWVyZ2VkX2RhdGEkZGVhdGhzMjAxNSAlPiUgCiAgZHJvcF9uYSgpICU+JQogIHN1bSgpCmBgYAoK">R Markdown source file (to produce this document)</a>



# Libraries


```r
library("tidyverse")
# Suppress summarise info
options(dplyr.summarise.inform = FALSE)

library("plotly")
library("leaflet")

library("geojsonio")
library("sp")
library("broom")

library("viridis")
```

# Load data


```r
# data <- read.csv("./outputs/united-states-of-america/processed-data/all-merged-data.csv", row.names = 1)
data <- lapply(list.files("./outputs/united-states-of-america/", pattern = "\\.csv$", full.names = TRUE), read.csv)
names(data) <- gsub("\\.csv$", "", list.files("./outputs/united-states-of-america/", pattern = "\\.csv$"))
```


```r
names(data)
```

```
##  [1] "all_merged_data"       "census_births"         "census_deaths"        
##  [4] "census_dom_migration"  "census_int_migration"  "census_net_migration" 
##  [7] "census_population"     "fip_codes"             "gdp_2001_2019"        
## [10] "jobs_education"        "jobs_povertyestimates" "jobs_unemployment"
```


```r
data <- lapply(data, function(x) {
  Reduce(function(...) {
    merge(..., all.x = TRUE)
  }, list(data$fip_codes, x))
})
```

# Choropleth; map making with R

- Per state: "https://raw.githubusercontent.com/deldersveld/topojson/master/countries/united-states/us-albers.json"
- Per county: "https://raw.githubusercontent.com/deldersveld/topojson/master/countries/united-states/us-albers-counties.json"

## Download counties geoJSON USA


```r
if(!file.exists("./outputs/mapping-data/us-albers-counties.json")) {
  download.file("https://raw.githubusercontent.com/deldersveld/topojson/master/countries/united-states/us-albers-counties.json", "./outputs/mapping-data/us-albers-counties.json")
}

usa <- geojsonio::geojson_read("./outputs/mapping-data/us-albers-counties.json", what = "sp")

plot(usa)
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />


```r
usa_tdy <- broom::tidy(usa, region = "fips")

usa_tdy %>%
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "white", color = "grey") +
  theme_void() +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-5-1.png" style="display: block; margin: auto;" />


```r
choroplot <- function(data, value = NULL, colour = "black", size = 0.075, alpha = 0.9, trans = "log10", length.out = 3, title = "", guide_title = "", caption = "") {
  # if(!any(colnames(usa_pop) == "value")) {stop("Must contain column named 'values'.")}
  data %>%
    ggplot() +
    geom_polygon(aes(x = long, y = lat, group = group, fill = data[,value]), colour = colour, size = size, alpha = alpha) +
    # geom_polygon(aes(x = long, y = lat, group = group), size = 0.075, colour = "black", alpha = 0) +
    theme_void() +
    scale_fill_viridis(trans = trans,
                       breaks = seq(0, max(data[,value]), length.out = length.out), # seq(0, max(usa_pop$value), by = 1000000)
                       name = guide_title,
                       guide = guide_legend(keyheight = unit(2, units = "mm"), 
                                            keywidth = unit(5, units = "mm"), 
                                            label.position = "bottom", 
                                            title.position = 'top', 
                                            nrow = 1),
                       label = function(x) {
                         format(x, big.mark = ",", scientific = FALSE)
                         }) +
    labs(title = title,
         # subtitle = "Population per county",
         caption = caption) +
    theme(# text = element_text(color = "#22211d"),
          # plot.background = element_rect(fill = "#f5f5f2", color = NA),
          # panel.background = element_rect(fill = "#f5f5f2", color = NA),
          # legend.background = element_rect(fill = "#f5f5f2", color = NA),
          plot.title = element_text(size = 22,
                                    hjust = 0.01, 
                                    # color = "#4e4d47",
                                    margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
          plot.subtitle = element_text(size= 17, 
                                       hjust=0.01,
                                       # color = "#4e4d47",
                                       margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
          plot.caption = element_text(size=12, color = "#4e4d47", margin = margin(b = 0.3, r = -99, unit = "cm")),
          legend.position = c(0.7, 0.09)) +
    coord_map()
}
```

# Population counts per county


```r
pop <- data$census_population
pop$popestimate2010 <- NULL
colnames(pop)[7:ncol(pop)] <- gsub("census|pop|popestimate", "", colnames(pop)[7:ncol(pop)])

pop %>%
  drop_na() %>%
  pivot_longer(cols = 7:ncol(pop), names_to = "year") %>%
  group_by(fips) %>%
  arrange(year, .by_group = TRUE) %>%
  mutate(pct_dif = value/lag(value) * 100) %>%
  filter(!is.na(pct_dif)) %>%
  group_by(fips) %>%
  summarise(fips, abbrv, state, county, region, division, year, pct_avg = sum(pct_dif) / 9) %>%
  # filter(year == 2019) %>%
  ggplot(aes(pct_avg)) +
  geom_density() +
  labs(title = "Distribution") 
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-7-1.png" style="display: block; margin: auto;" />

```r
  # scale_x_continuous(trans = "log2")

pop_pct_diff <- pop %>% 
  drop_na() %>%
  pivot_longer(cols = 7:ncol(pop), names_to = "year") %>%
  group_by(fips) %>%
  arrange(year, .by_group = TRUE) %>%
  mutate(pct_dif = value/lag(value) * 100) %>%
  filter(!is.na(pct_dif)) %>%
  group_by(fips) %>%
  mutate(pct_avg = sum(pct_dif) / 9)

usa_pop <- usa_tdy %>%
  mutate(fips = as.numeric(id)) %>%
  left_join(pop_pct_diff, by = c("fips" = "fips"))

usa_pop$pct_avg[is.na(usa_pop$pct_avg)] <- 0.001

# usa_pop %>%
#   ggplot() +
#   geom_polygon(aes(fill = pct_avg, x = long, y = lat, group = group)) +
#   theme_void() +
#   coord_map()
```



```r
usa_pop %>%
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group, fill = pct_avg), colour = "black", size = 0.075, alpha = 0.9) +
  # geom_polygon(aes(x = long, y = lat, group = group), size = 0.075, colour = "black", alpha = 0) +
  theme_void() +
  scale_fill_viridis(# trans = "log10",
                     breaks = seq(0, max(usa_pop$pct_avg), length.out = 6),
                     name = "Average pop change per county",
                     guide = guide_legend(keyheight = unit(2, units = "mm"), 
                                          keywidth = unit(3, units = "mm"), 
                                          label.position = "bottom", 
                                          title.position = 'top', 
                                          nrow = 1),
                     label = function(x) {
                       format(x, big.mark = ",", scientific = FALSE)
                     }) +
  labs(title = "Average pop change per county",
       subtitle = "Average change in population per county 2010 - 2019",
       caption = "Data: CENSUS BUREAU | By: Dereck | derecksnotes.com") +
  theme(text = element_text(color = "#22211d"),
        # plot.background = element_rect(fill = "#f5f5f2", color = NA),
        # panel.background = element_rect(fill = "#f5f5f2", color = NA),
        # legend.background = element_rect(fill = "#f5f5f2", color = NA),
        plot.title = element_text(size = 22,
                                  hjust = 0.01, 
                                  # color = "#4e4d47",
                                  margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
        plot.subtitle = element_text(size= 17, 
                                     hjust=0.01,
                                     # color = "#4e4d47",
                                     margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
        plot.caption = element_text(size=12, color = "#4e4d47", margin = margin(b = 0.3, r = -99, unit = "cm")),
        legend.position = c(0.7, 0.09)) +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />


```r
gdp <- data$gdp_2001_2019
# colnames(gdp)[5:ncol(gdp)] <- gsub("x", "", colnames(gdp)[5:ncol(gdp)])

gdp %>%
  drop_na() %>%
  pivot_longer(cols = 5:ncol(gdp), names_to = "year") %>%
  mutate(year = as.numeric(gsub("X", "", year))) %>%
  filter(year == 2019) %>%
  ggplot(aes(value)) +
  geom_histogram(bins = 20) +
  scale_x_continuous(trans = "log2")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

```r
gdp2019 <- gdp %>%
  # drop_na() %>%
  pivot_longer(cols = 5:ncol(gdp), names_to = "year") %>%
  mutate(year = as.numeric(gsub("X", "", year))) %>%
  filter(year == 2001)
  # mutate(char_fips = as.character(fips))

usa_gdp <- usa_tdy %>%
  mutate(fips = as.numeric(id)) %>%
  left_join(gdp2019, by = c("fips" = "fips"))

usa_gdp$value[is.na(usa_gdp$value)] <- 0.001

usa_gdp %>%
  ggplot() +
  geom_polygon(aes(fill = value, x = long, y = lat, group = group)) +
  theme_void() +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-9-2.png" style="display: block; margin: auto;" />

```r
usa_gdp %>%
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group, fill = value), colour = "black", size = 0.075, alpha = 0.9) +
  # geom_polygon(aes(x = long, y = lat, group = group), size = 0.075, colour = "black", alpha = 0) +
  theme_void() +
  scale_fill_viridis(trans = "log10",
                     breaks = seq(0, max(usa_gdp$value), length.out = 5), # seq(0, max(usa_pop$value), by = 1000000)
                     name = "Population per county",
                     guide = guide_legend(keyheight = unit(2, units = "mm"), 
                                          keywidth = unit(3, units = "mm"), 
                                          label.position = "bottom", 
                                          title.position = 'top', 
                                          nrow = 1),
                     label = function(x) {
                       format(x, big.mark = ",", scientific = FALSE)
                     }) +
  labs(title = "GDP per county",
       # subtitle = "Population per county",
       caption = "Data: CENSUS BUREAU | By: Dereck | derecksnotes.com") +
  theme(text = element_text(color = "#22211d"),
        # plot.background = element_rect(fill = "#f5f5f2", color = NA),
        # panel.background = element_rect(fill = "#f5f5f2", color = NA),
        # legend.background = element_rect(fill = "#f5f5f2", color = NA),
        plot.title = element_text(size = 22,
                                  hjust = 0.01, 
                                  # color = "#4e4d47",
                                  margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
        plot.subtitle = element_text(size= 17, 
                                     hjust=0.01,
                                     # color = "#4e4d47",
                                     margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
        plot.caption = element_text(size=12, color = "#4e4d47", margin = margin(b = 0.3, r = -99, unit = "cm")),
        legend.position = c(0.7, 0.09)) +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-9-3.png" style="display: block; margin: auto;" />



```r
pop2019 %>%
  count(state) %>%
  ggplot(aes(state, n, fill = state)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of counties per state", x = "State", y = "Number of counties") +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 90, vjust = 0, hjust = 1))
  # scale_x_continuous(trans = "log2")
```



```r
leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
```

<!--html_preserve--><div id="htmlwidget-672e3035e32442d4ea58" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-672e3035e32442d4ea58">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[-36.852,174.768,null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},"The birthplace of R",null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-36.852,-36.852],"lng":[174.768,174.768]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




```r
pop %>%
  ggplot(aes(year, value)) +
  geom_line(aes(group = fips))
```



# Birth and death rate


```r
rbind(data$census_births, data$census_deaths)
```


```r
p <- birth_death %>% 
  drop_na() %>%
  # filter(abbrv == "LA") %>%
  pivot_longer(cols = c(starts_with("deaths"))) %>% # , starts_with("deaths")
  separate(name, c("type", "year"), "s") %>%
  ggplot(aes(x = year, y = value)) +
  geom_line(aes(group = fips, colour = fips)) +
  theme(legend.position = "none")
  # scale_y_continuous(trans = "log2")

ggplotly(p)
```





```r
data$all_merged_data %>%
  filter(county == "Stanislaus")

data$all_merged_data$deaths2015 %>% 
  drop_na() %>%
  sum()
```

