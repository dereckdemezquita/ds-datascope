---
title: "Choropleth; USA counties"
author: "Dereck de Mézquita"
date: "20 March, 2021"
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

<a download="us-county-choropleths.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiQ2hvcm9wbGV0aDsgVVNBIGNvdW50aWVzIgphdXRob3I6ICJEZXJlY2sgZGUgTcOpenF1aXRhIgpkYXRlOiAiYHIgZm9ybWF0KFN5cy50aW1lKCksICclZCAlQiwgJVknKWAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAidXMtY291bnR5LWNob3JvcGxldGhzL3VzLWNvdW50eS1jaG9yb3BsZXRocy5odG1sIikpIH0pCm91dHB1dDoKICBodG1sX2RvY3VtZW50OiAKICAgIGZpZ19jYXB0aW9uOiB5ZXMKICAgIGtlZXBfbWQ6IHllcwogICAgbnVtYmVyX3NlY3Rpb25zOiB5ZXMKICAgIHRvYzogeWVzCiAgICB0b2NfZmxvYXQ6IHllcwpwYXJhbXM6CiAgcm1kOiB1cy1jb3VudHktY2hvcm9wbGV0aHMuUm1kCmVkaXRvcl9vcHRpb25zOiAKICBjaHVua19vdXRwdXRfdHlwZTogaW5saW5lCi0tLQoKPGEgZG93bmxvYWQ9InVzLWNvdW50eS1jaG9yb3BsZXRocy5SbWQiIGhyZWY9ImByIGJhc2U2NGVuYzo6ZGF0YVVSSShmaWxlID0gcGFyYW1zJHJtZCwgbWltZSA9ICd0ZXh0L3JtZCcsIGVuY29kaW5nID0gJ2Jhc2U2NCcpYCI+UiBNYXJrZG93biBzb3VyY2UgZmlsZSAodG8gcHJvZHVjZSB0aGlzIGRvY3VtZW50KTwvYT4KCmBgYHtyIHNldHVwLCBpbmNsdWRlPUZBTFNFfQprbml0cjo6b3B0c19jaHVuayRzZXQoZWNobyA9IFRSVUUsIGRwaSA9IDUwMCwgZmlnLndpZHRoID0gOCwgZmlnLmhlaWdodCA9IDgsIGZpZy5hbGlnbiA9ICJjZW50ZXIiKQpgYGAKCiMgTGlicmFyaWVzCgpgYGB7ciBsaWJyYXJpZXMsIHdhcm5pbmc9RkFMU0UsIG1lc3NhZ2U9RkFMU0V9CmxpYnJhcnkoInRpZHl2ZXJzZSIpCiMgU3VwcHJlc3Mgc3VtbWFyaXNlIGluZm8Kb3B0aW9ucyhkcGx5ci5zdW1tYXJpc2UuaW5mb3JtID0gRkFMU0UpCgpsaWJyYXJ5KCJwbG90bHkiKQpsaWJyYXJ5KCJsZWFmbGV0IikKCmxpYnJhcnkoImdlb2pzb25pbyIpCmxpYnJhcnkoInNwIikKbGlicmFyeSgiYnJvb20iKQoKbGlicmFyeSgidmlyaWRpcyIpCmBgYAoKIyBMb2FkIGRhdGEKCmBgYHtyIGxvYWQtZGF0YX0KIyBkYXRhIDwtIHJlYWQuY3N2KCIuL291dHB1dHMvdW5pdGVkLXN0YXRlcy1vZi1hbWVyaWNhL3Byb2Nlc3NlZC1kYXRhL2FsbC1tZXJnZWQtZGF0YS5jc3YiLCByb3cubmFtZXMgPSAxKQpkYXRhIDwtIGxhcHBseShsaXN0LmZpbGVzKCIuL291dHB1dHMvdW5pdGVkLXN0YXRlcy1vZi1hbWVyaWNhLyIsIHBhdHRlcm4gPSAiXFwuY3N2JCIsIGZ1bGwubmFtZXMgPSBUUlVFKSwgcmVhZC5jc3YpCm5hbWVzKGRhdGEpIDwtIGdzdWIoIlxcLmNzdiQiLCAiIiwgbGlzdC5maWxlcygiLi9vdXRwdXRzL3VuaXRlZC1zdGF0ZXMtb2YtYW1lcmljYS8iLCBwYXR0ZXJuID0gIlxcLmNzdiQiKSkKYGBgCgpgYGB7ciBkYXRhc2V0LW5hbWVzfQpuYW1lcyhkYXRhKQpgYGAKCmBgYHtyIGpvaW4tbG9jYXRpb24tZGF0YX0KZGF0YSA8LSBsYXBwbHkoZGF0YSwgZnVuY3Rpb24oeCkgewogIFJlZHVjZShmdW5jdGlvbiguLi4pIHsKICAgIG1lcmdlKC4uLiwgYWxsLnggPSBUUlVFKQogIH0sIGxpc3QoZGF0YSRmaXBfY29kZXMsIHgpKQp9KQpgYGAKCiMgQ2hvcm9wbGV0aDsgbWFwIG1ha2luZyB3aXRoIFIKCi0gUGVyIHN0YXRlOiAiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2RlbGRlcnN2ZWxkL3RvcG9qc29uL21hc3Rlci9jb3VudHJpZXMvdW5pdGVkLXN0YXRlcy91cy1hbGJlcnMuanNvbiIKLSBQZXIgY291bnR5OiAiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2RlbGRlcnN2ZWxkL3RvcG9qc29uL21hc3Rlci9jb3VudHJpZXMvdW5pdGVkLXN0YXRlcy91cy1hbGJlcnMtY291bnRpZXMuanNvbiIKCiMjIERvd25sb2FkIGNvdW50aWVzIGdlb0pTT04gVVNBCgpgYGB7ciBkb3dubG9hZC11c2EtZ2VvanNvbn0KaWYoIWZpbGUuZXhpc3RzKCIuL291dHB1dHMvbWFwcGluZy1kYXRhL3VzLWFsYmVycy1jb3VudGllcy5qc29uIikpIHsKICBkb3dubG9hZC5maWxlKCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vZGVsZGVyc3ZlbGQvdG9wb2pzb24vbWFzdGVyL2NvdW50cmllcy91bml0ZWQtc3RhdGVzL3VzLWFsYmVycy1jb3VudGllcy5qc29uIiwgIi4vb3V0cHV0cy9tYXBwaW5nLWRhdGEvdXMtYWxiZXJzLWNvdW50aWVzLmpzb24iKQp9Cgp1c2EgPC0gZ2VvanNvbmlvOjpnZW9qc29uX3JlYWQoIi4vb3V0cHV0cy9tYXBwaW5nLWRhdGEvdXMtYWxiZXJzLWNvdW50aWVzLmpzb24iLCB3aGF0ID0gInNwIikKCnBsb3QodXNhKQpgYGAKCmBgYHtyIGdlb2pzb24tdG8tdGlkeSwgd2FybmluZz1GQUxTRSwgbWVzc2FnZT1GQUxTRX0KdXNhX3RkeSA8LSBicm9vbTo6dGlkeSh1c2EsIHJlZ2lvbiA9ICJmaXBzIikKCnVzYV90ZHkgJT4lCiAgZ2dwbG90KCkgKwogIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApLCBmaWxsID0gIndoaXRlIiwgY29sb3IgPSAiZ3JleSIpICsKICB0aGVtZV92b2lkKCkgKwogIGNvb3JkX21hcCgpCmBgYAoKYGBge3IgZnVuYy1jaG9yb3Bsb3R9CmNob3JvcGxvdCA8LSBmdW5jdGlvbihkYXRhLCB2YWx1ZSA9IE5VTEwsIGNvbG91ciA9ICJibGFjayIsIHNpemUgPSAwLjA3NSwgYWxwaGEgPSAwLjksIHRyYW5zID0gImxvZzEwIiwgbGVuZ3RoLm91dCA9IDMsIHRpdGxlID0gIiIsIGd1aWRlX3RpdGxlID0gIiIsIGNhcHRpb24gPSAiIikgewogICMgaWYoIWFueShjb2xuYW1lcyh1c2FfcG9wKSA9PSAidmFsdWUiKSkge3N0b3AoIk11c3QgY29udGFpbiBjb2x1bW4gbmFtZWQgJ3ZhbHVlcycuIil9CiAgZGF0YSAlPiUKICAgIGdncGxvdCgpICsKICAgIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXAsIGZpbGwgPSBkYXRhWyx2YWx1ZV0pLCBjb2xvdXIgPSBjb2xvdXIsIHNpemUgPSBzaXplLCBhbHBoYSA9IGFscGhhKSArCiAgICAjIGdlb21fcG9seWdvbihhZXMoeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApLCBzaXplID0gMC4wNzUsIGNvbG91ciA9ICJibGFjayIsIGFscGhhID0gMCkgKwogICAgdGhlbWVfdm9pZCgpICsKICAgIHNjYWxlX2ZpbGxfdmlyaWRpcyh0cmFucyA9IHRyYW5zLAogICAgICAgICAgICAgICAgICAgICAgIGJyZWFrcyA9IHNlcSgwLCBtYXgoZGF0YVssdmFsdWVdKSwgbGVuZ3RoLm91dCA9IGxlbmd0aC5vdXQpLCAjIHNlcSgwLCBtYXgodXNhX3BvcCR2YWx1ZSksIGJ5ID0gMTAwMDAwMCkKICAgICAgICAgICAgICAgICAgICAgICBuYW1lID0gZ3VpZGVfdGl0bGUsCiAgICAgICAgICAgICAgICAgICAgICAgZ3VpZGUgPSBndWlkZV9sZWdlbmQoa2V5aGVpZ2h0ID0gdW5pdCgyLCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXl3aWR0aCA9IHVuaXQoNSwgdW5pdHMgPSAibW0iKSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwucG9zaXRpb24gPSAiYm90dG9tIiwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGl0bGUucG9zaXRpb24gPSAndG9wJywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJvdyA9IDEpLAogICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gZnVuY3Rpb24oeCkgewogICAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCiAgICAgICAgICAgICAgICAgICAgICAgICB9KSArCiAgICBsYWJzKHRpdGxlID0gdGl0bGUsCiAgICAgICAgICMgc3VidGl0bGUgPSAiUG9wdWxhdGlvbiBwZXIgY291bnR5IiwKICAgICAgICAgY2FwdGlvbiA9IGNhcHRpb24pICsKICAgIHRoZW1lKCMgdGV4dCA9IGVsZW1lbnRfdGV4dChjb2xvciA9ICIjMjIyMTFkIiksCiAgICAgICAgICAjIHBsb3QuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAgICMgcGFuZWwuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAgICMgbGVnZW5kLmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgICBwbG90LnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemUgPSAyMiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3QgPSAwLjAxLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBjb2xvciA9ICIjNGU0ZDQ3IiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40LCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICAgIHBsb3Quc3VidGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZT0gMTcsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoanVzdD0wLjAxLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQzLCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICAgIHBsb3QuY2FwdGlvbiA9IGVsZW1lbnRfdGV4dChzaXplPTEyLCBjb2xvciA9ICIjNGU0ZDQ3IiwgbWFyZ2luID0gbWFyZ2luKGIgPSAwLjMsIHIgPSAtOTksIHVuaXQgPSAiY20iKSksCiAgICAgICAgICBsZWdlbmQucG9zaXRpb24gPSBjKDAuNywgMC4wOSkpICsKICAgIGNvb3JkX21hcCgpCn0KYGBgCgojIFBvcHVsYXRpb24gY291bnRzIHBlciBjb3VudHkKCmBgYHtyIHN1YnNldC1kYXRhfQpwb3AgPC0gZGF0YSRjZW5zdXNfcG9wdWxhdGlvbgpwb3AkcG9wZXN0aW1hdGUyMDEwIDwtIE5VTEwKY29sbmFtZXMocG9wKVs3Om5jb2wocG9wKV0gPC0gZ3N1YigiY2Vuc3VzfHBvcHxwb3Blc3RpbWF0ZSIsICIiLCBjb2xuYW1lcyhwb3ApWzc6bmNvbChwb3ApXSkKYGBgCgoKYGBge3IgZGVuc2l0eS1hbGwtcHJldmlldy1wb3B9CnBvcCAlPiUKICBkcm9wX25hKCkgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSA3Om5jb2wocG9wKSwgbmFtZXNfdG8gPSAieWVhciIpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIGFycmFuZ2UoeWVhciwgLmJ5X2dyb3VwID0gVFJVRSkgJT4lCiAgbXV0YXRlKHBjdF9kaWYgPSB2YWx1ZS9sYWcodmFsdWUpICogMTAwKSAlPiUKICBmaWx0ZXIoIWlzLm5hKHBjdF9kaWYpKSAlPiUKICBncm91cF9ieShmaXBzKSAlPiUKICBzdW1tYXJpc2UoZmlwcywgYWJicnYsIHN0YXRlLCBjb3VudHksIHJlZ2lvbiwgZGl2aXNpb24sIHllYXIsIHBjdF9hdmcgPSBzdW0ocGN0X2RpZikgLyA5KSAlPiUKICAjIGZpbHRlcih5ZWFyID09IDIwMTkpICU+JQogIGdncGxvdChhZXMocGN0X2F2ZykpICsKICBnZW9tX2RlbnNpdHkoKSArCiAgbGFicyh0aXRsZSA9ICJEaXN0cmlidXRpb24gcGVyY2VudGFnZSB2YWx1ZXMiLCBzdWJ0aXRsZSA9ICJWYWx1ZXMgYXJlIGF2ZXJhZ2UgcG9wdWxhdGlvbiBjaGFuZ2UgeWVhciB0byB5ZWFyIiwgeCA9ICJQZXJjZW50YWdlIHZhbHVlIiwgeSA9ICJEZW5zaXR5IG9mIHZhbHVlIikKICAjIHNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKYGBgCgpgYGB7ciBkZW5zaXR5LXByYy1wZXItc3RhdGV9CnBvcCAlPiUKICBkcm9wX25hKCkgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSA3Om5jb2wocG9wKSwgbmFtZXNfdG8gPSAieWVhciIpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIGFycmFuZ2UoeWVhciwgLmJ5X2dyb3VwID0gVFJVRSkgJT4lCiAgbXV0YXRlKHBjdF9kaWYgPSB2YWx1ZS9sYWcodmFsdWUpICogMTAwKSAlPiUKICBmaWx0ZXIoIWlzLm5hKHBjdF9kaWYpKSAlPiUKICBncm91cF9ieShmaXBzKSAlPiUKICBzdW1tYXJpc2UoZmlwcywgYWJicnYsIHN0YXRlLCBjb3VudHksIHJlZ2lvbiwgZGl2aXNpb24sIHllYXIsIHBjdF9hdmcgPSBzdW0ocGN0X2RpZikgLyA5KSAlPiUKICAjIGZpbHRlcih5ZWFyID09IDIwMTkpICU+JQogIGdncGxvdChhZXMocGN0X2F2ZywgZ3JvdXAgPSBhYmJydiwgZmlsbCA9IGFiYnJ2LCBjb2xvdXIgPSBhYmJydikpICsKICBnZW9tX2RlbnNpdHkoKSArCiAgbGFicyh0aXRsZSA9ICJEaXN0cmlidXRpb24gcGVyY2VudGFnZSB2YWx1ZXMgcGVyIHN0YXRlJ3MgY291bnR5Iiwgc3VidGl0bGUgPSAiVmFsdWVzIGFyZSBhdmVyYWdlIHBvcHVsYXRpb24gY2hhbmdlIHllYXIgdG8geWVhciIsIHggPSAiUGVyY2VudGFnZSB2YWx1ZSIsIHkgPSAiRGVuc2l0eSBvZiB2YWx1ZSIpICsKICBmYWNldF93cmFwKH4gcmVnaW9uLCBzY2FsZXMgPSAiZnJlZSIpCmBgYAoKCgpgYGB7ciBwaXZvdC1kYXRhLWpvaW4tbWFwfQpwb3BfcGN0X2RpZmYgPC0gcG9wICU+JSAKICBkcm9wX25hKCkgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSA3Om5jb2wocG9wKSwgbmFtZXNfdG8gPSAieWVhciIpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIGFycmFuZ2UoeWVhciwgLmJ5X2dyb3VwID0gVFJVRSkgJT4lCiAgbXV0YXRlKHBjdF9kaWYgPSB2YWx1ZS9sYWcodmFsdWUpICogMTAwKSAlPiUKICBmaWx0ZXIoIWlzLm5hKHBjdF9kaWYpKSAlPiUKICBncm91cF9ieShmaXBzKSAlPiUKICBtdXRhdGUocGN0X2F2ZyA9IHN1bShwY3RfZGlmKSAvIDkpCgp1c2FfcG9wIDwtIHVzYV90ZHkgJT4lCiAgbXV0YXRlKGZpcHMgPSBhcy5udW1lcmljKGlkKSkgJT4lCiAgbGVmdF9qb2luKHBvcF9wY3RfZGlmZiwgYnkgPSBjKCJmaXBzIiA9ICJmaXBzIikpCgp1c2FfcG9wJHBjdF9hdmdbaXMubmEodXNhX3BvcCRwY3RfYXZnKV0gPC0gMC4wMDEKCiMgdXNhX3BvcCAlPiUKIyAgIGdncGxvdCgpICsKIyAgIGdlb21fcG9seWdvbihhZXMoZmlsbCA9IHBjdF9hdmcsIHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwKSkgKwojICAgdGhlbWVfdm9pZCgpICsKIyAgIGNvb3JkX21hcCgpCmBgYAoKYGBge3IgYmFyLXBvcC1wY3QtZGlmZn0KcG9wX3BjdF9kaWZmICU+JQogIGdncGxvdChhZXMocGN0X2F2ZykpICsKICBnZW9tX2hpc3RvZ3JhbSgpCmBgYAoKCmBgYHtyIGNob3JvLXBvcC1wY3QtZGlmZn0KdXNhX3BvcCAlPiUKCWdncGxvdCgpICsKCSMgZ2VvbV9wb2x5Z29uKGFlcyhmaWxsID0gcHJjX2NobmcsIHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwKSwgc2l6ZSA9IDAsIGFscGhhID0gMC45KSArCiAgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCwgZmlsbCA9IHBjdF9hdmcpLCBjb2xvdXIgPSAiYmxhY2siLCBzaXplID0gMC4wNzUsIGFscGhhID0gMC45KSArCgl0aGVtZV92b2lkKCkgKwoJY29vcmRfbWFwKCkgKwoJc2NhbGVfZmlsbF92aXJpZGlzKG4uYnJlYWtzID0gMTAsIGd1aWRlID0gZ3VpZGVfbGVnZW5kKGtleWhlaWdodCA9IHVuaXQoMywgdW5pdHMgPSAibW0iKSwga2V5d2lkdGggPSB1bml0KDUsIHVuaXRzID0gIm1tIiksIG5yb3cgPSA1KSwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewoJCXBhc3RlMCh4LCAiJSIpCgl9KSArICMgbGFiZWwucG9zaXRpb24gPSAiYm90dG9tIiwgdGl0bGUucG9zaXRpb24gPSAidG9wIgoJbGFicyh0aXRsZSA9ICJBdmVyYWdlIHBlcmNlbnQgY2hhbmdlIGluIHBvcHVsYXRpb24gcGVyIGNvdW50eSAyMDEwIC0gMjAxOSIsIGNhcHRpb24gPSAiQnkgRGVyZWNrIGRlIE1lenF1aXRhIiwgZmlsbCA9IGVsZW1lbnRfYmxhbmsoKSkgKwoJdGhlbWUocGxvdC50aXRsZSA9IGVsZW1lbnRfdGV4dChzaXplID0gMTUsIGhqdXN0ID0gMC4wMSwgbWFyZ2luID0gbWFyZ2luKHIgPSAxMCwgbCA9IDIsIGIgPSAwLjUsIHVuaXQgPSAiY20iKSksIHBsb3QuY2FwdGlvbiA9IGVsZW1lbnRfdGV4dChtYXJnaW4gPSBtYXJnaW4oMTUsIDUwLCB1bml0ID0gIm1tIikpLCBsZWdlbmQucG9zaXRpb24gPSBjKDAuNSwgLTAuMDc1KSkKYGBgCgoKYGBge3J9CmdkcCA8LSBkYXRhJGdkcF8yMDAxXzIwMTkKIyBjb2xuYW1lcyhnZHApWzU6bmNvbChnZHApXSA8LSBnc3ViKCJ4IiwgIiIsIGNvbG5hbWVzKGdkcClbNTpuY29sKGdkcCldKQoKZ2RwICU+JQogIGRyb3BfbmEoKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IDU6bmNvbChnZHApLCBuYW1lc190byA9ICJ5ZWFyIikgJT4lCiAgbXV0YXRlKHllYXIgPSBhcy5udW1lcmljKGdzdWIoIlgiLCAiIiwgeWVhcikpKSAlPiUKICBmaWx0ZXIoeWVhciA9PSAyMDE5KSAlPiUKICBnZ3Bsb3QoYWVzKHZhbHVlKSkgKwogIGdlb21faGlzdG9ncmFtKGJpbnMgPSAyMCkgKwogIHNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKCmdkcDIwMTkgPC0gZ2RwICU+JQogICMgZHJvcF9uYSgpICU+JQogIHBpdm90X2xvbmdlcihjb2xzID0gNTpuY29sKGdkcCksIG5hbWVzX3RvID0gInllYXIiKSAlPiUKICBtdXRhdGUoeWVhciA9IGFzLm51bWVyaWMoZ3N1YigiWCIsICIiLCB5ZWFyKSkpICU+JQogIGZpbHRlcih5ZWFyID09IDIwMTkpCiAgIyBtdXRhdGUoY2hhcl9maXBzID0gYXMuY2hhcmFjdGVyKGZpcHMpKQoKdXNhX2dkcCA8LSB1c2FfdGR5ICU+JQogIG11dGF0ZShmaXBzID0gYXMubnVtZXJpYyhpZCkpICU+JQogIGxlZnRfam9pbihnZHAyMDE5LCBieSA9IGMoImZpcHMiID0gImZpcHMiKSkKCnVzYV9nZHAkdmFsdWVbaXMubmEodXNhX2dkcCR2YWx1ZSldIDwtIDAuMDAxCmBgYAoKCmBgYHtyIGNob3JvLWdkcC10ZXN0fQp1c2FfZ2RwICU+JQogIGdncGxvdCgpICsKICBnZW9tX3BvbHlnb24oYWVzKGZpbGwgPSB2YWx1ZSwgeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApKSArCiAgdGhlbWVfdm9pZCgpICsKICBjb29yZF9tYXAoKQpgYGAKCmBgYHtyfQpnZHAyMDE5ICU+JQogIGdncGxvdChhZXMobG9nMihsb2cyKHZhbHVlKSkpKSArCiAgZ2VvbV9oaXN0b2dyYW0oKSArCiAgc2NhbGVfeF9jb250aW51b3VzKGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsKICAgIHNjYWxlczo6bGFiZWxfbnVtYmVyX3NpKGFjY3VyYWN5ID0gMC4xKSh4IF4gKHggXiAyKSkKICB9KQoKbWF4KGdkcDIwMTkkdmFsdWVbIWlzLm5hKGdkcDIwMTkkdmFsdWUpXSk7IG1pbihnZHAyMDE5JHZhbHVlWyFpcy5uYShnZHAyMDE5JHZhbHVlKV0pCmBgYAoKCmBgYHtyIGNob3JvLWdkcC0yMDE5fQp1c2FfZ2RwICU+JQoJZ2dwbG90KCkgKwoJZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCwgZmlsbCA9IGxvZzEwKGxvZzEwKHZhbHVlKSkpLCBjb2xvdXIgPSAiYmxhY2siLCBzaXplID0gMC4wNzUsIGFscGhhID0gMC45KSArCgl0aGVtZV92b2lkKCkgKwoJY29vcmRfbWFwKCkgKwoJc2NhbGVfZmlsbF92aXJpZGlzKG4uYnJlYWtzID0gMTAsIGd1aWRlID0gZ3VpZGVfbGVnZW5kKGtleWhlaWdodCA9IHVuaXQoMywgdW5pdHMgPSAibW0iKSwgbmFtZSA9ICJsb2cxMChsb2cxMCh4KSkiLCBrZXl3aWR0aCA9IHVuaXQoNSwgdW5pdHMgPSAibW0iKSwgbnJvdyA9IDUpLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkgICMgZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCgkgIHNjYWxlczo6bGFiZWxfbnVtYmVyX3NpKGFjY3VyYWN5ID0gMC4xKSh4KQoJCSMgcGFzdGUwKHgsICIlIikKCX0pICsgIyBsYWJlbC5wb3NpdGlvbiA9ICJib3R0b20iLCB0aXRsZS5wb3NpdGlvbiA9ICJ0b3AiCglsYWJzKHRpdGxlID0gIkdEUCBwZXIgY291bnR5IDIwMTkiLCBzdWJ0aXRsZSA9ICIiLCBjYXB0aW9uID0gIkJ5IERlcmVjayBkZSBNZXpxdWl0YSIsIGZpbGwgPSBlbGVtZW50X2JsYW5rKCkpICsKCXRoZW1lKHBsb3QudGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZSA9IDE1LCBoanVzdCA9IDAuMDEsIG1hcmdpbiA9IG1hcmdpbihyID0gMTAsIGwgPSAyLCBiID0gMC41LCB1bml0ID0gImNtIikpLCBwbG90LmNhcHRpb24gPSBlbGVtZW50X3RleHQobWFyZ2luID0gbWFyZ2luKDE1LCA1MCwgdW5pdCA9ICJtbSIpKSwgbGVnZW5kLnBvc2l0aW9uID0gYygwLjUsIC0wLjA3NSkpCmBgYAoKCmBgYHtyfQp1c2FfZ2RwICU+JQogIGdncGxvdCgpICsKICBnZW9tX3BvbHlnb24oYWVzKHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwLCBmaWxsID0gdmFsdWUpLCBjb2xvdXIgPSAiYmxhY2siLCBzaXplID0gMC4wNzUsIGFscGhhID0gMC45KSArCiAgIyBnZW9tX3BvbHlnb24oYWVzKHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwKSwgc2l6ZSA9IDAuMDc1LCBjb2xvdXIgPSAiYmxhY2siLCBhbHBoYSA9IDApICsKICB0aGVtZV92b2lkKCkgKwogIHNjYWxlX2ZpbGxfdmlyaWRpcyh0cmFucyA9ICJsb2cxMCIsCiAgICAgICAgICAgICAgICAgICAgIGJyZWFrcyA9IHNlcSgwLCBtYXgodXNhX2dkcCR2YWx1ZSksIGxlbmd0aC5vdXQgPSA1KSwgIyBzZXEoMCwgbWF4KHVzYV9wb3AkdmFsdWUpLCBieSA9IDEwMDAwMDApCiAgICAgICAgICAgICAgICAgICAgIG5hbWUgPSAiUG9wdWxhdGlvbiBwZXIgY291bnR5IiwKICAgICAgICAgICAgICAgICAgICAgZ3VpZGUgPSBndWlkZV9sZWdlbmQoa2V5aGVpZ2h0ID0gdW5pdCgyLCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga2V5d2lkdGggPSB1bml0KDMsIHVuaXRzID0gIm1tIiksIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbC5wb3NpdGlvbiA9ICJib3R0b20iLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGl0bGUucG9zaXRpb24gPSAndG9wJywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yb3cgPSAxKSwKICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSBmdW5jdGlvbih4KSB7CiAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCiAgICAgICAgICAgICAgICAgICAgIH0pICsKICBsYWJzKHRpdGxlID0gIkdEUCBwZXIgY291bnR5IiwKICAgICAgICMgc3VidGl0bGUgPSAiUG9wdWxhdGlvbiBwZXIgY291bnR5IiwKICAgICAgIGNhcHRpb24gPSAiRGF0YTogQ0VOU1VTIEJVUkVBVSB8IEJ5OiBEZXJlY2sgfCBkZXJlY2tzbm90ZXMuY29tIikgKwogIHRoZW1lKHRleHQgPSBlbGVtZW50X3RleHQoY29sb3IgPSAiIzIyMjExZCIpLAogICAgICAgICMgcGxvdC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgICMgcGFuZWwuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAjIGxlZ2VuZC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgIHBsb3QudGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZSA9IDIyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3QgPSAwLjAxLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgY29sb3IgPSAiIzRlNGQ0NyIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQsIGwgPSAyLCB1bml0ID0gImNtIikpLAogICAgICAgIHBsb3Quc3VidGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZT0gMTcsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3Q9MC4wMSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgY29sb3IgPSAiIzRlNGQ0NyIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQzLCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBwbG90LmNhcHRpb24gPSBlbGVtZW50X3RleHQoc2l6ZT0xMiwgY29sb3IgPSAiIzRlNGQ0NyIsIG1hcmdpbiA9IG1hcmdpbihiID0gMC4zLCByID0gLTk5LCB1bml0ID0gImNtIikpLAogICAgICAgIGxlZ2VuZC5wb3NpdGlvbiA9IGMoMC43LCAwLjA5KSkgKwogIGNvb3JkX21hcCgpCmBgYAoKCmBgYHtyIGV2YWw9RkFMU0V9CnBvcDIwMTkgJT4lCiAgY291bnQoc3RhdGUpICU+JQogIGdncGxvdChhZXMoc3RhdGUsIG4sIGZpbGwgPSBzdGF0ZSkpICsKICBnZW9tX2JhcihzdGF0ID0gImlkZW50aXR5IikgKwogIGxhYnModGl0bGUgPSAiTnVtYmVyIG9mIGNvdW50aWVzIHBlciBzdGF0ZSIsIHggPSAiU3RhdGUiLCB5ID0gIk51bWJlciBvZiBjb3VudGllcyIpICsKICB0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIsCiAgICAgICAgYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA5MCwgdmp1c3QgPSAwLCBoanVzdCA9IDEpKQogICMgc2NhbGVfeF9jb250aW51b3VzKHRyYW5zID0gImxvZzIiKQpgYGAKCgpgYGB7cn0KbGVhZmxldCgpICU+JQogIGFkZFRpbGVzKCkgJT4lICAjIEFkZCBkZWZhdWx0IE9wZW5TdHJlZXRNYXAgbWFwIHRpbGVzCiAgYWRkTWFya2Vycyhsbmc9MTc0Ljc2OCwgbGF0PS0zNi44NTIsIHBvcHVwPSJUaGUgYmlydGhwbGFjZSBvZiBSIikKYGBgCgoKCmBgYHtyIGV2YWw9RkFMU0V9CnBvcCAlPiUKICBnZ3Bsb3QoYWVzKHllYXIsIHZhbHVlKSkgKwogIGdlb21fbGluZShhZXMoZ3JvdXAgPSBmaXBzKSkKYGBgCgoKCiMgQmlydGggYW5kIGRlYXRoIHJhdGUKCmBgYHtyIGV2YWw9RkFMU0V9CnJiaW5kKGRhdGEkY2Vuc3VzX2JpcnRocywgZGF0YSRjZW5zdXNfZGVhdGhzKQpgYGAKCmBgYHtyIGV2YWw9RkFMU0V9CnAgPC0gYmlydGhfZGVhdGggJT4lIAogIGRyb3BfbmEoKSAlPiUKICAjIGZpbHRlcihhYmJydiA9PSAiTEEiKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IGMoc3RhcnRzX3dpdGgoImRlYXRocyIpKSkgJT4lICMgLCBzdGFydHNfd2l0aCgiZGVhdGhzIikKICBzZXBhcmF0ZShuYW1lLCBjKCJ0eXBlIiwgInllYXIiKSwgInMiKSAlPiUKICBnZ3Bsb3QoYWVzKHggPSB5ZWFyLCB5ID0gdmFsdWUpKSArCiAgZ2VvbV9saW5lKGFlcyhncm91cCA9IGZpcHMsIGNvbG91ciA9IGZpcHMpKSArCiAgdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiKQogICMgc2NhbGVfeV9jb250aW51b3VzKHRyYW5zID0gImxvZzIiKQoKZ2dwbG90bHkocCkKYGBgCgoKCgpgYGB7ciBldmFsPUZBTFNFfQpkYXRhJGFsbF9tZXJnZWRfZGF0YSAlPiUKICBmaWx0ZXIoY291bnR5ID09ICJTdGFuaXNsYXVzIikKCmRhdGEkYWxsX21lcmdlZF9kYXRhJGRlYXRoczIwMTUgJT4lIAogIGRyb3BfbmEoKSAlPiUKICBzdW0oKQpgYGAKCg==">R Markdown source file (to produce this document)</a>



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

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/download-usa-geojson-1.png" style="display: block; margin: auto;" />


```r
usa_tdy <- broom::tidy(usa, region = "fips")

usa_tdy %>%
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "white", color = "grey") +
  theme_void() +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/geojson-to-tidy-1.png" style="display: block; margin: auto;" />


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
```



```r
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
  labs(title = "Distribution percentage values", subtitle = "Values are average population change year to year", x = "Percentage value", y = "Density of value")
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/density-all-preview-pop-1.png" style="display: block; margin: auto;" />

```r
  # scale_x_continuous(trans = "log2")
```


```r
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
  ggplot(aes(pct_avg, group = abbrv, fill = abbrv, colour = abbrv)) +
  geom_density() +
  labs(title = "Distribution percentage values per state's county", subtitle = "Values are average population change year to year", x = "Percentage value", y = "Density of value") +
  facet_wrap(~ region, scales = "free")
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/density-prc-per-state-1.png" style="display: block; margin: auto;" />




```r
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
pop_pct_diff %>%
  ggplot(aes(pct_avg)) +
  geom_histogram()
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/bar-pop-pct-diff-1.png" style="display: block; margin: auto;" />



```r
usa_pop %>%
	ggplot() +
	# geom_polygon(aes(fill = prc_chng, x = long, y = lat, group = group), size = 0, alpha = 0.9) +
  geom_polygon(aes(x = long, y = lat, group = group, fill = pct_avg), colour = "black", size = 0.075, alpha = 0.9) +
	theme_void() +
	coord_map() +
	scale_fill_viridis(n.breaks = 10, guide = guide_legend(keyheight = unit(3, units = "mm"), keywidth = unit(5, units = "mm"), nrow = 5), labels = function(x) {
		paste0(x, "%")
	}) + # label.position = "bottom", title.position = "top"
	labs(title = "Average percent change in population per county 2010 - 2019", caption = "By Dereck de Mezquita", fill = element_blank()) +
	theme(plot.title = element_text(size = 15, hjust = 0.01, margin = margin(r = 10, l = 2, b = 0.5, unit = "cm")), plot.caption = element_text(margin = margin(15, 50, unit = "mm")), legend.position = c(0.5, -0.075))
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/choro-pop-pct-diff-1.png" style="display: block; margin: auto;" />



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

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

```r
gdp2019 <- gdp %>%
  # drop_na() %>%
  pivot_longer(cols = 5:ncol(gdp), names_to = "year") %>%
  mutate(year = as.numeric(gsub("X", "", year))) %>%
  filter(year == 2019)
  # mutate(char_fips = as.character(fips))

usa_gdp <- usa_tdy %>%
  mutate(fips = as.numeric(id)) %>%
  left_join(gdp2019, by = c("fips" = "fips"))

usa_gdp$value[is.na(usa_gdp$value)] <- 0.001
```



```r
usa_gdp %>%
  ggplot() +
  geom_polygon(aes(fill = value, x = long, y = lat, group = group)) +
  theme_void() +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/choro-gdp-test-1.png" style="display: block; margin: auto;" />


```r
gdp2019 %>%
  ggplot(aes(log2(log2(value)))) +
  geom_histogram() +
  scale_x_continuous(labels = function(x) {
    scales::label_number_si(accuracy = 0.1)(x ^ (x ^ 2))
  })
```

```
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

```
## Warning: Removed 148 rows containing non-finite values (stat_bin).
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />

```r
max(gdp2019$value[!is.na(gdp2019$value)]); min(gdp2019$value[!is.na(gdp2019$value)])
```

```
## [1] 819446415
```

```
## [1] 18403
```



```r
usa_gdp %>%
	ggplot() +
	geom_polygon(aes(x = long, y = lat, group = group, fill = log10(log10(value))), colour = "black", size = 0.075, alpha = 0.9) +
	theme_void() +
	coord_map() +
	scale_fill_viridis(n.breaks = 10, guide = guide_legend(keyheight = unit(3, units = "mm"), name = "log10(log10(x))", keywidth = unit(5, units = "mm"), nrow = 5), labels = function(x) {
	  # format(x, big.mark = ",", scientific = FALSE)
	  scales::label_number_si(accuracy = 0.1)(x)
		# paste0(x, "%")
	}) + # label.position = "bottom", title.position = "top"
	labs(title = "GDP per county 2019", subtitle = "", caption = "By Dereck de Mezquita", fill = element_blank()) +
	theme(plot.title = element_text(size = 15, hjust = 0.01, margin = margin(r = 10, l = 2, b = 0.5, unit = "cm")), plot.caption = element_text(margin = margin(15, 50, unit = "mm")), legend.position = c(0.5, -0.075))
```

```
## Warning in FUN(X[[i]], ...): NaNs produced
```

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/choro-gdp-2019-1.png" style="display: block; margin: auto;" />



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

<img src="/Users/work/Coding/projects/ds-geo-social-datascope/R-analysis/./reports//us-county-choropleths/us-county-choropleths_files/figure-html/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />



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

<!--html_preserve--><div id="htmlwidget-178664b8b1d165ee1645" style="width:4000px;height:4000px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-178664b8b1d165ee1645">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[-36.852,174.768,null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},"The birthplace of R",null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-36.852,-36.852],"lng":[174.768,174.768]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




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

