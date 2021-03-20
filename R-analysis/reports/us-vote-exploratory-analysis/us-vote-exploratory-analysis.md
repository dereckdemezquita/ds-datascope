---
title: "Exploratory analysis"
author: "Dereck de Mézquita"
date: "12/5/2020"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "us-vote-exploratory-analysis/us-vote-exploratory-analysis.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    # toc_float: yes
params:
  rmd: us-vote-exploratory-analysis.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="us-vote-exploratory-analysis.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiRXhwbG9yYXRvcnkgYW5hbHlzaXMiCmF1dGhvcjogIkRlcmVjayBkZSBNw6l6cXVpdGEiCmRhdGU6ICIxMi81LzIwMjAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAidXMtdm90ZS1leHBsb3JhdG9yeS1hbmFseXNpcy91cy12b3RlLWV4cGxvcmF0b3J5LWFuYWx5c2lzLmh0bWwiKSkgfSkKb3V0cHV0OgogIGh0bWxfZG9jdW1lbnQ6IAogICAgZmlnX2NhcHRpb246IHllcwogICAga2VlcF9tZDogeWVzCiAgICBudW1iZXJfc2VjdGlvbnM6IHllcwogICAgdG9jOiB5ZXMKICAgICMgdG9jX2Zsb2F0OiB5ZXMKcGFyYW1zOgogIHJtZDogdXMtdm90ZS1leHBsb3JhdG9yeS1hbmFseXNpcy5SbWQKZWRpdG9yX29wdGlvbnM6IAogIGNodW5rX291dHB1dF90eXBlOiBpbmxpbmUKLS0tCgo8YSBkb3dubG9hZD0idXMtdm90ZS1leHBsb3JhdG9yeS1hbmFseXNpcy5SbWQiIGhyZWY9ImByIGJhc2U2NGVuYzo6ZGF0YVVSSShmaWxlID0gcGFyYW1zJHJtZCwgbWltZSA9ICd0ZXh0L3JtZCcsIGVuY29kaW5nID0gJ2Jhc2U2NCcpYCI+UiBNYXJrZG93biBzb3VyY2UgZmlsZSAodG8gcHJvZHVjZSB0aGlzIGRvY3VtZW50KTwvYT4KCmBgYHtyIHNldHVwLCBpbmNsdWRlPUZBTFNFfQprbml0cjo6b3B0c19jaHVuayRzZXQoZWNobyA9IFRSVUUsIGRwaSA9IDUwMCwgZmlnLndpZHRoID0gOCwgZmlnLmhlaWdodCA9IDgsIGZpZy5hbGlnbiA9ICJjZW50ZXIiKSAjICBvdXQud2lkdGggPSAiMTAwJSIsIG91dC5oZWlnaHQgPSAiNjB2aCIKYGBgCgojIExpYnJhcmllcwoKYGBge3Igd2FybmluZz1GQUxTRSwgbWVzc2FnZT1GQUxTRX0KbGlicmFyeSgidGlkeXZlcnNlIikKIyBTdXBwcmVzcyBzdW1tYXJpc2UgaW5mbwpvcHRpb25zKGRwbHlyLnN1bW1hcmlzZS5pbmZvcm0gPSBGQUxTRSkKbGlicmFyeSgicGxvdGx5IikKbGlicmFyeSgiZ2dyaWRnZXMiKQpgYGAKCiMgS2FnZ2xlCgpgYGB7cn0KZGF0YSA8LSBsYXBwbHkobGlzdC5maWxlcygiLi9kYXRhL3VuaXRlZC1zdGF0ZXMtb2YtYW1lcmljYS9wZXItY291bnR5LXZvdGVzLTIwLWZvbnRlcy8iLCBmdWxsLm5hbWVzID0gVFJVRSksIHJlYWQuY3N2KQpuYW1lcyhkYXRhKSA8LSBnc3ViKCIuY3N2IiwgIiIsIGxpc3QuZmlsZXMoIi4vZGF0YS91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvcGVyLWNvdW50eS12b3Rlcy0yMC1mb250ZXMvIiksIHBlcmwgPSBUUlVFKQpgYGAKCiMgRGF0YQoKYGBge3J9Cm5hbWVzKGRhdGEpCmBgYAoKIyBQYXJhbWV0ZXJzCgpgYGB7cn0KY2xyIDwtIGxpc3QoCglyb3VnZSA9ICIjZTMyYjJiIiwKCWJsZXUgPSAiIzJiNWNlMyIsCgluZXV0cmUgPSAiIzc3Nzc3NyIKKQpgYGAKCgojIFByZXNpZGVudGlhbCBlbGVjdGlvbiAyMDIwCgojIyBQcm9jZXNzaW5nIGRhdGEKCmBgYHtyfQojIGRhdGEkcHJlc2lkZW50X2NvdW50eQojIGRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUKIyBkYXRhJHByZXNpZGVudF9zdGF0ZQpgYGAKCmBgYHtyfQpkYXRhJHByZXNpZGVudF9jb3VudHlfY2FuZGlkYXRlIDwtIGRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUgJT4lCgltdXRhdGUocGFydHkgPSBpZmVsc2UocGFydHkgJWluJSBjKCJSRVAiLCAiREVNIiksIHBhcnR5LCAiT3RoZXIiKSwKCQkJIGNvbG91ciA9IGNhc2Vfd2hlbihwYXJ0eSA9PSAiUkVQIiB+IGNsciRyb3VnZSwgcGFydHkgPT0gIkRFTSIgfiBjbHIkYmxldSwgVFJVRSB+IGNsciRuZXV0cmUpLAoJCQkgY291bnR5ID0gZ3N1YigiIENvdW50eSIsICIiLCBjb3VudHkpKSAlPiUKCWxlZnRfam9pbihkYXRhLmZyYW1lKGFiYnJ2ID0gc3RhdGUuYWJiLCBzdGF0ZSA9IHN0YXRlLm5hbWUpLCBieSA9ICJzdGF0ZSIpOyAjIGRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUKYGBgCgpgYGB7cn0KZGF0YSRwcmVzaWRlbnRfY291bnR5X2NhbmRpZGF0ZSAlPiUKCWdyb3VwX2J5KGNvdW50eSkgJT4lCglzdW1tYXJpc2UobigpKQpgYGAKCmBgYHtyfQpkYXRhJHByZXNpZGVudF9jb3VudHlfY2FuZGlkYXRlICU+JQoJZ3JvdXBfYnkocGFydHkpICU+JQoJc3VtbWFyaXNlKGBUb3RhbCB2b3Rlc2AgPSBzdW0odG90YWxfdm90ZXMpKSAlPiUKCW11dGF0ZShjb2xvdXIgPSBjYXNlX3doZW4ocGFydHkgPT0gIlJFUCIgfiBjbHIkcm91Z2UsIHBhcnR5ID09ICJERU0iIH4gY2xyJGJsZXUsIFRSVUUgfiBjbHIkbmV1dHJlKSkgJT4lCglnZ3Bsb3QoYWVzKHJlb3JkZXIocGFydHksIC1gVG90YWwgdm90ZXNgKSwgYFRvdGFsIHZvdGVzYCwgZmlsbCA9IGNvbG91cikpICsKCWdlb21fYmFyKHN0YXQgPSAiaWRlbnRpdHkiKSArCglzY2FsZV9maWxsX2lkZW50aXR5KGd1aWRlID0gImxlZ2VuZCIpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDEwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCgl9KSArCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpCgkjIHNjYWxlX3lfY29udGludW91cyh0cmFucyA9ICJsb2cyIiwgbi5icmVha3MgPSAxMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkge2Zvcm1hdChzaWduaWYoeCwgZGlnaXRzID0gMyksIHNjaWVudGlmaWMgPSBUUlVFKX0pCmBgYAoKYGBge3J9CmRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUgJT4lCglncm91cF9ieShwYXJ0eSkgJT4lCglzdW1tYXJpc2UoYFRvdGFsIHZvdGVzYCA9IHN1bSh0b3RhbF92b3RlcykpICU+JQoJbXV0YXRlKGNvbG91ciA9IGNhc2Vfd2hlbihwYXJ0eSA9PSAiUkVQIiB+IGNsciRyb3VnZSwgcGFydHkgPT0gIkRFTSIgfiBjbHIkYmxldSwgVFJVRSB+IGNsciRuZXV0cmUpKSAlPiUKCWdncGxvdChhZXMoMSwgYFRvdGFsIHZvdGVzYCwgZmlsbCA9IGNvbG91cikpICsKCWdlb21fYmFyKHN0YXQgPSAiaWRlbnRpdHkiLCBwb3NpdGlvbiA9ICJmaWxsIikgKyAjIHBvc2l0aW9uID0gImZpbGwiLCAic3RhY2siCglzY2FsZV9maWxsX2lkZW50aXR5KGd1aWRlID0gImxlZ2VuZCIpICsKCXNjYWxlX3lfY29udGludW91cyhicmVha3MgPSBjKDAsIDAuMjUsIDAuNTAsIDAuNzUsIDEuMDApLCBsYWJlbHMgPSBjKCIwJSIsICIyNSUiLCAiNTAlIiwgIjI1JSIsICIwJSIpKSArCglsYWJzKHggPSAiUGFydGllcyIsIHkgPSAiUHJvcG9ydGlvbiBvZiB2b3RlcyAoJSkiKSArCgl0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfYmxhbmsoKSwgYXhpcy50aWNrcy54ID0gZWxlbWVudF9ibGFuaygpKSArCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpCgojIGdncGxvdGx5KHAsIHRvb2x0aXAgPSBjKCJ4IiwgInkiLCAidGV4dCIpKQpgYGAKCgpgYGB7cn0KZGF0YSRwcmVzaWRlbnRfY291bnR5X2NhbmRpZGF0ZSAlPiUKCWFycmFuZ2UoZGVzYyh0b3RhbF92b3RlcykpICU+JQoJaGVhZCgyMDApICU+JQoJbXV0YXRlKHN0YXRlID0gZmFjdG9yKHN0YXRlKSwKCQkJIHN0YXRlX2NvdW50eSA9IHBhc3RlKGFiYnJ2LCBjb3VudHksIHNlcCA9ICI6ICIpKSAlPiUKCWdncGxvdChhZXMocmVvcmRlcihzdGF0ZV9jb3VudHksIHRvdGFsX3ZvdGVzKSwgdG90YWxfdm90ZXMsIGZpbGwgPSBjb2xvdXIpKSArCglnZW9tX2JhcihzdGF0ID0gImlkZW50aXR5IiwgcG9zaXRpb24gPSAiZmlsbCIsIHdpZHRoID0gMC43NSkgKwoJc2NhbGVfZmlsbF9pZGVudGl0eShndWlkZSA9ICJsZWdlbmQiKSArCglzY2FsZV95X2NvbnRpbnVvdXMoYnJlYWtzID0gYygwLCAwLjI1LCAwLjUwLCAwLjc1LCAxLjAwKSwgbGFiZWxzID0gYygiMCUiLCAiMjUlIiwgIjUwJSIsICIyNSUiLCAiMCUiKSkgKwoJIyB0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDkwLCB2anVzdCA9IDAsIGhqdXN0ID0gMSkpICsKCWNvb3JkX2ZsaXAoKSArCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpICsKCWxhYnMoeCA9ICJTdGF0ZSBhbmQgQ291bnR5IiwgeSA9ICJQcm9wb3J0aW9uIG9mIHZvdGVzICglKSIpCgojIGdncGxvdGx5KHApCgoKIyBkYXRhJHByZXNpZGVudF9jb3VudHlfY2FuZGlkYXRlICU+JQojIAlhcnJhbmdlKGRlc2ModG90YWxfdm90ZXMpKSAlPiUKIyAJZ3JvdXBfYnkoc3RhdGUpICU+JQojIAlzbGljZShoZWFkKHJvd19udW1iZXIoKSwgMSkpICU+JQojIAltdXRhdGUoc3RhdGUgPSBmYWN0b3Ioc3RhdGUpLAojIAkJCSBzdGF0ZV9jb3VudHkgPSBwYXN0ZShhYmJydiwgY291bnR5LCBzZXAgPSAiOiAiKSkgJT4lCiMgCWdncGxvdChhZXMoc3RhdGVfY291bnR5LCB0b3RhbF92b3RlcywgZ3JvdXAgPSBzdGF0ZSwgZmlsbCA9IGNvbG91cikpICsKIyAJZ2VvbV9iYXIoc3RhdCA9ICJpZGVudGl0eSIsIHBvc2l0aW9uID0gImZpbGwiKSArCiMgCXNjYWxlX2ZpbGxfaWRlbnRpdHkoZ3VpZGUgPSAibGVnZW5kIikgKwojIAl0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDkwLCB2anVzdCA9IDAuODUsIGhqdXN0ID0gMSkpIAojIAkjIGZhY2V0X3dyYXAofiBzdGF0ZSkKYGBgCgoKYGBge3J9CmRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUgJT4lCglmaWx0ZXIodG90YWxfdm90ZXMgIT0gMCkgJT4lCglnZ3Bsb3QoYWVzKHRvdGFsX3ZvdGVzLCAuLmRlbnNpdHkuLiwgZmlsbCA9IGNvbG91cikpICsKCWdlb21fZGVuc2l0eShhbHBoYSA9IDAuNjUpICsKCXNjYWxlX2ZpbGxfaWRlbnRpdHkoZ3VpZGUgPSAibGVnZW5kIikgKwoJc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMTAsIGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsKCQlmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKCX0pICsKCXNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIiwgbi5icmVha3MgPSAyMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewoJCWZvcm1hdCh4LCBiaWcubWFyayA9ICIsIiwgc2NpZW50aWZpYyA9IEZBTFNFKQoJfSkgKwoJdGhlbWUoYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAwLjg1LCBoanVzdCA9IDEpKSAgKwoJdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiKQoJIyBmYWNldF9ncmlkKHN0YXRlIH4gLikKCQojIGRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUgJT4lCiMgCWZpbHRlcih0b3RhbF92b3RlcyAhPSAwKSAlPiUKIyAJZ2dwbG90KGFlcyh0b3RhbF92b3RlcywgLi5jb3VudC4uLCBmaWxsID0gY29sb3VyKSkgKwojIAlnZW9tX2RlbnNpdHkoYWxwaGEgPSAwLjY1KSArCiMgCXNjYWxlX2ZpbGxfaWRlbnRpdHkoZ3VpZGUgPSAibGVnZW5kIikgKwojIAlzY2FsZV95X2NvbnRpbnVvdXMobi5icmVha3MgPSAxMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewojIAkJZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCiMgCX0pICsKIyAJc2NhbGVfeF9jb250aW51b3VzKHRyYW5zID0gImxvZzIiLCBuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CiMgCQlmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKIyAJfSkgKwojIAl0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDQ1LCB2anVzdCA9IDAuODUsIGhqdXN0ID0gMSkpICsKIyAJdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiKQpgYGAKCmBgYHtyIGZpZy53aWR0aD0xMCwgZmlnLmhlaWdodD0yMH0KZGF0YSRwcmVzaWRlbnRfY291bnR5X2NhbmRpZGF0ZSAlPiUKCWZpbHRlcih0b3RhbF92b3RlcyAhPSAwKSAlPiUKCWdncGxvdChhZXMoeCA9IHRvdGFsX3ZvdGVzLCB5ID0gc3RhdGUsIGZpbGwgPSBjb2xvdXIsIGhlaWdodCA9IC4uZGVuc2l0eS4uKSkgKwoJZ2VvbV9kZW5zaXR5X3JpZGdlcyhhbHBoYSA9IDAuNjUsIHNjYWxlID0gNCwgc3RhdCA9ICJkZW5zaXR5IikgKwoJc2NhbGVfZmlsbF9pZGVudGl0eShndWlkZSA9ICJsZWdlbmQiKSArCglzY2FsZV94X2NvbnRpbnVvdXModHJhbnMgPSAibG9nMiIpICsKCXRoZW1lX3JpZGdlcygpICsgCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpICsKCWxhYnMoeCA9ICJWb3RlIGNvdW50IiwgeSA9ICJTdGF0ZSIpCgojIGRhdGEkcHJlc2lkZW50X2NvdW50eV9jYW5kaWRhdGUgJT4lCiMgCWZpbHRlcih0b3RhbF92b3RlcyAhPSAwKSAlPiUKIyAJZ2dwbG90KGFlcyh4ID0gdG90YWxfdm90ZXMsIHkgPSBzdGF0ZSwgZmlsbCA9IGNvbG91cikpICsKIyAJZ2VvbV9kZW5zaXR5X3JpZGdlcyhhbHBoYSA9IDAuNjUsIHNjYWxlID0gMikgKwojIAlzY2FsZV9maWxsX2lkZW50aXR5KGd1aWRlID0gImxlZ2VuZCIpICsKIyAJc2NhbGVfeF9jb250aW51b3VzKHRyYW5zID0gImxvZzIiKSArCiMgCXRoZW1lX3JpZGdlcygpICsgCiMgCXRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIikKYGBgCgoKCmBgYHtyfQpkYXRhJHByZXNpZGVudF9jb3VudHlfY2FuZGlkYXRlICU+JQoJbXV0YXRlKHBhcnR5ID0gaWZlbHNlKHBhcnR5ICVpbiUgYygiUkVQIiwgIkRFTSIpLCBwYXJ0eSwgIk90aGVyIikpICU+JQoJIyBhcnJhbmdlKGRlc2ModG90YWxfdm90ZXMpKSAlPiUKCSMgbXV0YXRlKHBhcnR5ID0gZmFjdG9yKHBhcnR5LCBsZXZlbHMgPSB1bmlxdWUocGFydHkpKSkgJT4lCglncm91cF9ieShzdGF0ZSwgcGFydHkpICU+JQoJc3VtbWFyaXNlKGBUb3RhbCB2b3Rlc2AgPSBzdW0odG90YWxfdm90ZXMpKSAlPiUKCW11dGF0ZShjb2xvdXIgPSBjYXNlX3doZW4ocGFydHkgPT0gIlJFUCIgfiBjbHIkcm91Z2UsIHBhcnR5ID09ICJERU0iIH4gY2xyJGJsZXUsIFRSVUUgfiBjbHIkbmV1dHJlKSkgJT4lCglnZ3Bsb3QoYWVzKHggPSBzdGF0ZSwgeSA9IGBUb3RhbCB2b3Rlc2AsIGdyb3VwID0gcGFydHksIGZpbGwgPSBjb2xvdXIsIHRleHQgPSBmb3JtYXQoYFRvdGFsIHZvdGVzYCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkpKSArCglzY2FsZV9maWxsX2lkZW50aXR5KGd1aWRlID0gImxlZ2VuZCIpICsKCWdlb21fYmFyKHN0YXQgPSAiaWRlbnRpdHkiLCBwb3NpdGlvbiA9ICJmaWxsIikgKyAjIHBvc2l0aW9uID0gImZpbGwiLCAic3RhY2siCgkjIHRoZW1lKGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gOTAsIHZqdXN0ID0gMC41LCBoanVzdCA9IDEpKSArCglsYWJzKHggPSAiU3RhdGUiLCB5ID0gIlByb3BvcnRpb24gb2Ygdm90ZXMgKCUpIikgKwoJc2NhbGVfeV9jb250aW51b3VzKGJyZWFrcyA9IGMoMCwgMC4yNSwgMC41MCwgMC43NSwgMS4wMCksIGxhYmVscyA9IGMoIjAlIiwgIjI1JSIsICI1MCUiLCAiMjUlIiwgIjAlIikpICsKCXRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIikgKwoJY29vcmRfZmxpcCgpCgojIGdncGxvdGx5KHAsIHRvb2x0aXAgPSBjKCJ4IiwgInkiLCAidGV4dCIpKQpgYGAKCiMgRml2ZSB0aGlydHkgZWlnaHQKCmBgYHtyfQpkYXRhIDwtIGxhcHBseShsaXN0LmZpbGVzKCIuL2RhdGEvdW5pdGVkLXN0YXRlcy1vZi1hbWVyaWNhL2VsZWN0aW9uLWZvcmVjYXN0cy0yMDIwLWZpdmV0aGlydHllaWdodC8iLCBmdWxsLm5hbWVzID0gVFJVRSksIHJlYWQuY3N2KQpuYW1lcyhkYXRhKSA8LSBnc3ViKCIuY3N2IiwgIiIsIGxpc3QuZmlsZXMoIi4vZGF0YS91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvZWxlY3Rpb24tZm9yZWNhc3RzLTIwMjAtZml2ZXRoaXJ0eWVpZ2h0LyIpLCBwZXJsID0gVFJVRSkKYGBgCgpgYGB7cn0KZGF0YSRSRUFETUUubWQgPC0gTlVMTApuYW1lcyhkYXRhKQpgYGAKCmBgYHtyfQpkYXRhJGVjb25vbWljX2luZGV4CmBgYAoK">R Markdown source file (to produce this document)</a>



# Libraries


```r
library("tidyverse")
# Suppress summarise info
options(dplyr.summarise.inform = FALSE)
library("plotly")
library("ggridges")
```

# Kaggle


```r
data <- lapply(list.files("./data/united-states-of-america/per-county-votes-20-fontes/", full.names = TRUE), read.csv)
names(data) <- gsub(".csv", "", list.files("./data/united-states-of-america/per-county-votes-20-fontes/"), perl = TRUE)
```

# Data


```r
names(data)
```

```
##  [1] "governors_county_candidate" "governors_county"          
##  [3] "governors_state"            "house_candidate"           
##  [5] "house_state"                "president_county_candidate"
##  [7] "president_county"           "president_state"           
##  [9] "senate_county_candidate"    "senate_county"             
## [11] "senate_state"
```

# Parameters


```r
clr <- list(
	rouge = "#e32b2b",
	bleu = "#2b5ce3",
	neutre = "#777777"
)
```


# Presidential election 2020

## Processing data


```r
# data$president_county
# data$president_county_candidate
# data$president_state
```


```r
data$president_county_candidate <- data$president_county_candidate %>%
	mutate(party = ifelse(party %in% c("REP", "DEM"), party, "Other"),
			 colour = case_when(party == "REP" ~ clr$rouge, party == "DEM" ~ clr$bleu, TRUE ~ clr$neutre),
			 county = gsub(" County", "", county)) %>%
	left_join(data.frame(abbrv = state.abb, state = state.name), by = "state"); # data$president_county_candidate
```


```r
data$president_county_candidate %>%
	group_by(county) %>%
	summarise(n())
```

```
## # A tibble: 2,825 x 2
##    county        `n()`
##    <chr>         <int>
##  1 Abbeville         5
##  2 Abbot             6
##  3 Abington          5
##  4 Acadia Parish    13
##  5 Accomack          4
##  6 Acton            11
##  7 Acushnet          5
##  8 Acworth           4
##  9 Ada               7
## 10 Adair            28
## # … with 2,815 more rows
```


```r
data$president_county_candidate %>%
	group_by(party) %>%
	summarise(`Total votes` = sum(total_votes)) %>%
	mutate(colour = case_when(party == "REP" ~ clr$rouge, party == "DEM" ~ clr$bleu, TRUE ~ clr$neutre)) %>%
	ggplot(aes(reorder(party, -`Total votes`), `Total votes`, fill = colour)) +
	geom_bar(stat = "identity") +
	scale_fill_identity(guide = "legend") +
	scale_y_continuous(n.breaks = 10, labels = function(x) {
		format(x, big.mark = ",", scientific = FALSE)
	}) +
	theme(legend.position = "none")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />

```r
	# scale_y_continuous(trans = "log2", n.breaks = 10, labels = function(x) {format(signif(x, digits = 3), scientific = TRUE)})
```


```r
data$president_county_candidate %>%
	group_by(party) %>%
	summarise(`Total votes` = sum(total_votes)) %>%
	mutate(colour = case_when(party == "REP" ~ clr$rouge, party == "DEM" ~ clr$bleu, TRUE ~ clr$neutre)) %>%
	ggplot(aes(1, `Total votes`, fill = colour)) +
	geom_bar(stat = "identity", position = "fill") + # position = "fill", "stack"
	scale_fill_identity(guide = "legend") +
	scale_y_continuous(breaks = c(0, 0.25, 0.50, 0.75, 1.00), labels = c("0%", "25%", "50%", "25%", "0%")) +
	labs(x = "Parties", y = "Proportion of votes (%)") +
	theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
	theme(legend.position = "none")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

```r
# ggplotly(p, tooltip = c("x", "y", "text"))
```



```r
data$president_county_candidate %>%
	arrange(desc(total_votes)) %>%
	head(200) %>%
	mutate(state = factor(state),
			 state_county = paste(abbrv, county, sep = ": ")) %>%
	ggplot(aes(reorder(state_county, total_votes), total_votes, fill = colour)) +
	geom_bar(stat = "identity", position = "fill", width = 0.75) +
	scale_fill_identity(guide = "legend") +
	scale_y_continuous(breaks = c(0, 0.25, 0.50, 0.75, 1.00), labels = c("0%", "25%", "50%", "25%", "0%")) +
	# theme(axis.text.x = element_text(angle = 90, vjust = 0, hjust = 1)) +
	coord_flip() +
	theme(legend.position = "none") +
	labs(x = "State and County", y = "Proportion of votes (%)")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

```r
# ggplotly(p)


# data$president_county_candidate %>%
# 	arrange(desc(total_votes)) %>%
# 	group_by(state) %>%
# 	slice(head(row_number(), 1)) %>%
# 	mutate(state = factor(state),
# 			 state_county = paste(abbrv, county, sep = ": ")) %>%
# 	ggplot(aes(state_county, total_votes, group = state, fill = colour)) +
# 	geom_bar(stat = "identity", position = "fill") +
# 	scale_fill_identity(guide = "legend") +
# 	theme(axis.text.x = element_text(angle = 90, vjust = 0.85, hjust = 1)) 
# 	# facet_wrap(~ state)
```



```r
data$president_county_candidate %>%
	filter(total_votes != 0) %>%
	ggplot(aes(total_votes, ..density.., fill = colour)) +
	geom_density(alpha = 0.65) +
	scale_fill_identity(guide = "legend") +
	scale_y_continuous(n.breaks = 10, labels = function(x) {
		format(x, big.mark = ",", scientific = FALSE)
	}) +
	scale_x_continuous(trans = "log2", n.breaks = 20, labels = function(x) {
		format(x, big.mark = ",", scientific = FALSE)
	}) +
	theme(axis.text.x = element_text(angle = 45, vjust = 0.85, hjust = 1))  +
	theme(legend.position = "none")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-11-1.png" style="display: block; margin: auto;" />

```r
	# facet_grid(state ~ .)
	
# data$president_county_candidate %>%
# 	filter(total_votes != 0) %>%
# 	ggplot(aes(total_votes, ..count.., fill = colour)) +
# 	geom_density(alpha = 0.65) +
# 	scale_fill_identity(guide = "legend") +
# 	scale_y_continuous(n.breaks = 10, labels = function(x) {
# 		format(x, big.mark = ",", scientific = FALSE)
# 	}) +
# 	scale_x_continuous(trans = "log2", n.breaks = 20, labels = function(x) {
# 		format(x, big.mark = ",", scientific = FALSE)
# 	}) +
# 	theme(axis.text.x = element_text(angle = 45, vjust = 0.85, hjust = 1)) +
# 	theme(legend.position = "none")
```


```r
data$president_county_candidate %>%
	filter(total_votes != 0) %>%
	ggplot(aes(x = total_votes, y = state, fill = colour, height = ..density..)) +
	geom_density_ridges(alpha = 0.65, scale = 4, stat = "density") +
	scale_fill_identity(guide = "legend") +
	scale_x_continuous(trans = "log2") +
	theme_ridges() + 
	theme(legend.position = "none") +
	labs(x = "Vote count", y = "State")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-12-1.png" style="display: block; margin: auto;" />

```r
# data$president_county_candidate %>%
# 	filter(total_votes != 0) %>%
# 	ggplot(aes(x = total_votes, y = state, fill = colour)) +
# 	geom_density_ridges(alpha = 0.65, scale = 2) +
# 	scale_fill_identity(guide = "legend") +
# 	scale_x_continuous(trans = "log2") +
# 	theme_ridges() + 
# 	theme(legend.position = "none")
```




```r
data$president_county_candidate %>%
	mutate(party = ifelse(party %in% c("REP", "DEM"), party, "Other")) %>%
	# arrange(desc(total_votes)) %>%
	# mutate(party = factor(party, levels = unique(party))) %>%
	group_by(state, party) %>%
	summarise(`Total votes` = sum(total_votes)) %>%
	mutate(colour = case_when(party == "REP" ~ clr$rouge, party == "DEM" ~ clr$bleu, TRUE ~ clr$neutre)) %>%
	ggplot(aes(x = state, y = `Total votes`, group = party, fill = colour, text = format(`Total votes`, big.mark = ",", scientific = FALSE))) +
	scale_fill_identity(guide = "legend") +
	geom_bar(stat = "identity", position = "fill") + # position = "fill", "stack"
	# theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
	labs(x = "State", y = "Proportion of votes (%)") +
	scale_y_continuous(breaks = c(0, 0.25, 0.50, 0.75, 1.00), labels = c("0%", "25%", "50%", "25%", "0%")) +
	theme(legend.position = "none") +
	coord_flip()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-vote-exploratory-analysis/us-vote-exploratory-analysis_files/figure-html/unnamed-chunk-13-1.png" style="display: block; margin: auto;" />

```r
# ggplotly(p, tooltip = c("x", "y", "text"))
```

# Five thirty eight


```r
data <- lapply(list.files("./data/united-states-of-america/election-forecasts-2020-fivethirtyeight/", full.names = TRUE), read.csv)
names(data) <- gsub(".csv", "", list.files("./data/united-states-of-america/election-forecasts-2020-fivethirtyeight/"), perl = TRUE)
```


```r
data$README.md <- NULL
names(data)
```

```
##  [1] "economic_index"                      "electoral_college_vs_popvote"       
##  [3] "house_district_toplines_2020"        "house_fundamentals"                 
##  [5] "house_national_toplines_2020"        "house_seat_distribution"            
##  [7] "house_steps"                         "joint_probabilities"                
##  [9] "presidential_ev_probabilities_2020"  "presidential_forecast_steps"        
## [11] "presidential_national_toplines_2020" "presidential_poll_averages_2020"    
## [13] "presidential_polls_2020"             "presidential_scenario_analysis_2020"
## [15] "presidential_state_toplines_2020"    "senate_fundamentals"                
## [17] "senate_national_toplines_2020"       "senate_seat_distribution"           
## [19] "senate_state_toplines_2020"          "senate_steps"
```


```r
data$economic_index
```

```
##      cycle    branch      model  modeldate candidate_inc candidate_chal
## 1     2020 President polls-plus  11/3/2020         Trump          Biden
## 2     2020 President polls-plus  11/3/2020         Trump          Biden
## 3     2020 President polls-plus  11/3/2020         Trump          Biden
## 4     2020 President polls-plus  11/3/2020         Trump          Biden
## 5     2020 President polls-plus  11/3/2020         Trump          Biden
## 6     2020 President polls-plus  11/3/2020         Trump          Biden
## 7     2020 President polls-plus  11/3/2020         Trump          Biden
## 8     2020 President polls-plus  11/2/2020         Trump          Biden
## 9     2020 President polls-plus  11/2/2020         Trump          Biden
## 10    2020 President polls-plus  11/2/2020         Trump          Biden
## 11    2020 President polls-plus  11/2/2020         Trump          Biden
## 12    2020 President polls-plus  11/2/2020         Trump          Biden
## 13    2020 President polls-plus  11/2/2020         Trump          Biden
## 14    2020 President polls-plus  11/2/2020         Trump          Biden
## 15    2020 President polls-plus  11/1/2020         Trump          Biden
## 16    2020 President polls-plus  11/1/2020         Trump          Biden
## 17    2020 President polls-plus  11/1/2020         Trump          Biden
## 18    2020 President polls-plus  11/1/2020         Trump          Biden
## 19    2020 President polls-plus  11/1/2020         Trump          Biden
## 20    2020 President polls-plus  11/1/2020         Trump          Biden
## 21    2020 President polls-plus  11/1/2020         Trump          Biden
## 22    2020 President polls-plus 10/31/2020         Trump          Biden
## 23    2020 President polls-plus 10/31/2020         Trump          Biden
## 24    2020 President polls-plus 10/31/2020         Trump          Biden
## 25    2020 President polls-plus 10/31/2020         Trump          Biden
## 26    2020 President polls-plus 10/31/2020         Trump          Biden
## 27    2020 President polls-plus 10/31/2020         Trump          Biden
## 28    2020 President polls-plus 10/31/2020         Trump          Biden
## 29    2020 President polls-plus 10/30/2020         Trump          Biden
## 30    2020 President polls-plus 10/30/2020         Trump          Biden
## 31    2020 President polls-plus 10/30/2020         Trump          Biden
## 32    2020 President polls-plus 10/30/2020         Trump          Biden
## 33    2020 President polls-plus 10/30/2020         Trump          Biden
## 34    2020 President polls-plus 10/30/2020         Trump          Biden
## 35    2020 President polls-plus 10/30/2020         Trump          Biden
## 36    2020 President polls-plus 10/29/2020         Trump          Biden
## 37    2020 President polls-plus 10/29/2020         Trump          Biden
## 38    2020 President polls-plus 10/29/2020         Trump          Biden
## 39    2020 President polls-plus 10/29/2020         Trump          Biden
## 40    2020 President polls-plus 10/29/2020         Trump          Biden
## 41    2020 President polls-plus 10/29/2020         Trump          Biden
## 42    2020 President polls-plus 10/29/2020         Trump          Biden
## 43    2020 President polls-plus 10/28/2020         Trump          Biden
## 44    2020 President polls-plus 10/28/2020         Trump          Biden
## 45    2020 President polls-plus 10/28/2020         Trump          Biden
## 46    2020 President polls-plus 10/28/2020         Trump          Biden
## 47    2020 President polls-plus 10/28/2020         Trump          Biden
## 48    2020 President polls-plus 10/28/2020         Trump          Biden
## 49    2020 President polls-plus 10/28/2020         Trump          Biden
## 50    2020 President polls-plus 10/27/2020         Trump          Biden
## 51    2020 President polls-plus 10/27/2020         Trump          Biden
## 52    2020 President polls-plus 10/27/2020         Trump          Biden
## 53    2020 President polls-plus 10/27/2020         Trump          Biden
## 54    2020 President polls-plus 10/27/2020         Trump          Biden
## 55    2020 President polls-plus 10/27/2020         Trump          Biden
## 56    2020 President polls-plus 10/27/2020         Trump          Biden
## 57    2020 President polls-plus 10/26/2020         Trump          Biden
## 58    2020 President polls-plus 10/26/2020         Trump          Biden
## 59    2020 President polls-plus 10/26/2020         Trump          Biden
## 60    2020 President polls-plus 10/26/2020         Trump          Biden
## 61    2020 President polls-plus 10/26/2020         Trump          Biden
## 62    2020 President polls-plus 10/26/2020         Trump          Biden
## 63    2020 President polls-plus 10/26/2020         Trump          Biden
## 64    2020 President polls-plus 10/25/2020         Trump          Biden
## 65    2020 President polls-plus 10/25/2020         Trump          Biden
## 66    2020 President polls-plus 10/25/2020         Trump          Biden
## 67    2020 President polls-plus 10/25/2020         Trump          Biden
## 68    2020 President polls-plus 10/25/2020         Trump          Biden
## 69    2020 President polls-plus 10/25/2020         Trump          Biden
## 70    2020 President polls-plus 10/25/2020         Trump          Biden
## 71    2020 President polls-plus 10/24/2020         Trump          Biden
## 72    2020 President polls-plus 10/24/2020         Trump          Biden
## 73    2020 President polls-plus 10/24/2020         Trump          Biden
## 74    2020 President polls-plus 10/24/2020         Trump          Biden
## 75    2020 President polls-plus 10/24/2020         Trump          Biden
## 76    2020 President polls-plus 10/24/2020         Trump          Biden
## 77    2020 President polls-plus 10/24/2020         Trump          Biden
## 78    2020 President polls-plus 10/23/2020         Trump          Biden
## 79    2020 President polls-plus 10/23/2020         Trump          Biden
## 80    2020 President polls-plus 10/23/2020         Trump          Biden
## 81    2020 President polls-plus 10/23/2020         Trump          Biden
## 82    2020 President polls-plus 10/23/2020         Trump          Biden
## 83    2020 President polls-plus 10/23/2020         Trump          Biden
## 84    2020 President polls-plus 10/23/2020         Trump          Biden
## 85    2020 President polls-plus 10/22/2020         Trump          Biden
## 86    2020 President polls-plus 10/22/2020         Trump          Biden
## 87    2020 President polls-plus 10/22/2020         Trump          Biden
## 88    2020 President polls-plus 10/22/2020         Trump          Biden
## 89    2020 President polls-plus 10/22/2020         Trump          Biden
## 90    2020 President polls-plus 10/22/2020         Trump          Biden
## 91    2020 President polls-plus 10/22/2020         Trump          Biden
## 92    2020 President polls-plus 10/21/2020         Trump          Biden
## 93    2020 President polls-plus 10/21/2020         Trump          Biden
## 94    2020 President polls-plus 10/21/2020         Trump          Biden
## 95    2020 President polls-plus 10/21/2020         Trump          Biden
## 96    2020 President polls-plus 10/21/2020         Trump          Biden
## 97    2020 President polls-plus 10/21/2020         Trump          Biden
## 98    2020 President polls-plus 10/21/2020         Trump          Biden
## 99    2020 President polls-plus 10/20/2020         Trump          Biden
## 100   2020 President polls-plus 10/20/2020         Trump          Biden
## 101   2020 President polls-plus 10/20/2020         Trump          Biden
## 102   2020 President polls-plus 10/20/2020         Trump          Biden
## 103   2020 President polls-plus 10/20/2020         Trump          Biden
## 104   2020 President polls-plus 10/20/2020         Trump          Biden
## 105   2020 President polls-plus 10/20/2020         Trump          Biden
## 106   2020 President polls-plus 10/19/2020         Trump          Biden
## 107   2020 President polls-plus 10/19/2020         Trump          Biden
## 108   2020 President polls-plus 10/19/2020         Trump          Biden
## 109   2020 President polls-plus 10/19/2020         Trump          Biden
## 110   2020 President polls-plus 10/19/2020         Trump          Biden
## 111   2020 President polls-plus 10/19/2020         Trump          Biden
## 112   2020 President polls-plus 10/19/2020         Trump          Biden
## 113   2020 President polls-plus 10/18/2020         Trump          Biden
## 114   2020 President polls-plus 10/18/2020         Trump          Biden
## 115   2020 President polls-plus 10/18/2020         Trump          Biden
## 116   2020 President polls-plus 10/18/2020         Trump          Biden
## 117   2020 President polls-plus 10/18/2020         Trump          Biden
## 118   2020 President polls-plus 10/18/2020         Trump          Biden
## 119   2020 President polls-plus 10/18/2020         Trump          Biden
## 120   2020 President polls-plus 10/17/2020         Trump          Biden
## 121   2020 President polls-plus 10/17/2020         Trump          Biden
## 122   2020 President polls-plus 10/17/2020         Trump          Biden
## 123   2020 President polls-plus 10/17/2020         Trump          Biden
## 124   2020 President polls-plus 10/17/2020         Trump          Biden
## 125   2020 President polls-plus 10/17/2020         Trump          Biden
## 126   2020 President polls-plus 10/17/2020         Trump          Biden
## 127   2020 President polls-plus 10/16/2020         Trump          Biden
## 128   2020 President polls-plus 10/16/2020         Trump          Biden
## 129   2020 President polls-plus 10/16/2020         Trump          Biden
## 130   2020 President polls-plus 10/16/2020         Trump          Biden
## 131   2020 President polls-plus 10/16/2020         Trump          Biden
## 132   2020 President polls-plus 10/16/2020         Trump          Biden
## 133   2020 President polls-plus 10/16/2020         Trump          Biden
## 134   2020 President polls-plus 10/15/2020         Trump          Biden
## 135   2020 President polls-plus 10/15/2020         Trump          Biden
## 136   2020 President polls-plus 10/15/2020         Trump          Biden
## 137   2020 President polls-plus 10/15/2020         Trump          Biden
## 138   2020 President polls-plus 10/15/2020         Trump          Biden
## 139   2020 President polls-plus 10/15/2020         Trump          Biden
## 140   2020 President polls-plus 10/15/2020         Trump          Biden
## 141   2020 President polls-plus 10/14/2020         Trump          Biden
## 142   2020 President polls-plus 10/14/2020         Trump          Biden
## 143   2020 President polls-plus 10/14/2020         Trump          Biden
## 144   2020 President polls-plus 10/14/2020         Trump          Biden
## 145   2020 President polls-plus 10/14/2020         Trump          Biden
## 146   2020 President polls-plus 10/14/2020         Trump          Biden
## 147   2020 President polls-plus 10/14/2020         Trump          Biden
## 148   2020 President polls-plus 10/13/2020         Trump          Biden
## 149   2020 President polls-plus 10/13/2020         Trump          Biden
## 150   2020 President polls-plus 10/13/2020         Trump          Biden
## 151   2020 President polls-plus 10/13/2020         Trump          Biden
## 152   2020 President polls-plus 10/13/2020         Trump          Biden
## 153   2020 President polls-plus 10/13/2020         Trump          Biden
## 154   2020 President polls-plus 10/13/2020         Trump          Biden
## 155   2020 President polls-plus 10/12/2020         Trump          Biden
## 156   2020 President polls-plus 10/12/2020         Trump          Biden
## 157   2020 President polls-plus 10/12/2020         Trump          Biden
## 158   2020 President polls-plus 10/12/2020         Trump          Biden
## 159   2020 President polls-plus 10/12/2020         Trump          Biden
## 160   2020 President polls-plus 10/12/2020         Trump          Biden
## 161   2020 President polls-plus 10/12/2020         Trump          Biden
## 162   2020 President polls-plus 10/11/2020         Trump          Biden
## 163   2020 President polls-plus 10/11/2020         Trump          Biden
## 164   2020 President polls-plus 10/11/2020         Trump          Biden
## 165   2020 President polls-plus 10/11/2020         Trump          Biden
## 166   2020 President polls-plus 10/11/2020         Trump          Biden
## 167   2020 President polls-plus 10/11/2020         Trump          Biden
## 168   2020 President polls-plus 10/11/2020         Trump          Biden
## 169   2020 President polls-plus 10/10/2020         Trump          Biden
## 170   2020 President polls-plus 10/10/2020         Trump          Biden
## 171   2020 President polls-plus 10/10/2020         Trump          Biden
## 172   2020 President polls-plus 10/10/2020         Trump          Biden
## 173   2020 President polls-plus 10/10/2020         Trump          Biden
## 174   2020 President polls-plus 10/10/2020         Trump          Biden
## 175   2020 President polls-plus 10/10/2020         Trump          Biden
## 176   2020 President polls-plus  10/9/2020         Trump          Biden
## 177   2020 President polls-plus  10/9/2020         Trump          Biden
## 178   2020 President polls-plus  10/9/2020         Trump          Biden
## 179   2020 President polls-plus  10/9/2020         Trump          Biden
## 180   2020 President polls-plus  10/9/2020         Trump          Biden
## 181   2020 President polls-plus  10/9/2020         Trump          Biden
## 182   2020 President polls-plus  10/9/2020         Trump          Biden
## 183   2020 President polls-plus  10/8/2020         Trump          Biden
## 184   2020 President polls-plus  10/8/2020         Trump          Biden
## 185   2020 President polls-plus  10/8/2020         Trump          Biden
## 186   2020 President polls-plus  10/8/2020         Trump          Biden
## 187   2020 President polls-plus  10/8/2020         Trump          Biden
## 188   2020 President polls-plus  10/8/2020         Trump          Biden
## 189   2020 President polls-plus  10/8/2020         Trump          Biden
## 190   2020 President polls-plus  10/7/2020         Trump          Biden
## 191   2020 President polls-plus  10/7/2020         Trump          Biden
## 192   2020 President polls-plus  10/7/2020         Trump          Biden
## 193   2020 President polls-plus  10/7/2020         Trump          Biden
## 194   2020 President polls-plus  10/7/2020         Trump          Biden
## 195   2020 President polls-plus  10/7/2020         Trump          Biden
## 196   2020 President polls-plus  10/7/2020         Trump          Biden
## 197   2020 President polls-plus  10/6/2020         Trump          Biden
## 198   2020 President polls-plus  10/6/2020         Trump          Biden
## 199   2020 President polls-plus  10/6/2020         Trump          Biden
## 200   2020 President polls-plus  10/6/2020         Trump          Biden
## 201   2020 President polls-plus  10/6/2020         Trump          Biden
## 202   2020 President polls-plus  10/6/2020         Trump          Biden
## 203   2020 President polls-plus  10/6/2020         Trump          Biden
## 204   2020 President polls-plus  10/5/2020         Trump          Biden
## 205   2020 President polls-plus  10/5/2020         Trump          Biden
## 206   2020 President polls-plus  10/5/2020         Trump          Biden
## 207   2020 President polls-plus  10/5/2020         Trump          Biden
## 208   2020 President polls-plus  10/5/2020         Trump          Biden
## 209   2020 President polls-plus  10/5/2020         Trump          Biden
## 210   2020 President polls-plus  10/5/2020         Trump          Biden
## 211   2020 President polls-plus  10/4/2020         Trump          Biden
## 212   2020 President polls-plus  10/4/2020         Trump          Biden
## 213   2020 President polls-plus  10/4/2020         Trump          Biden
## 214   2020 President polls-plus  10/4/2020         Trump          Biden
## 215   2020 President polls-plus  10/4/2020         Trump          Biden
## 216   2020 President polls-plus  10/4/2020         Trump          Biden
## 217   2020 President polls-plus  10/4/2020         Trump          Biden
## 218   2020 President polls-plus  10/3/2020         Trump          Biden
## 219   2020 President polls-plus  10/3/2020         Trump          Biden
## 220   2020 President polls-plus  10/3/2020         Trump          Biden
## 221   2020 President polls-plus  10/3/2020         Trump          Biden
## 222   2020 President polls-plus  10/3/2020         Trump          Biden
## 223   2020 President polls-plus  10/3/2020         Trump          Biden
## 224   2020 President polls-plus  10/3/2020         Trump          Biden
## 225   2020 President polls-plus  10/2/2020         Trump          Biden
## 226   2020 President polls-plus  10/2/2020         Trump          Biden
## 227   2020 President polls-plus  10/2/2020         Trump          Biden
## 228   2020 President polls-plus  10/2/2020         Trump          Biden
## 229   2020 President polls-plus  10/2/2020         Trump          Biden
## 230   2020 President polls-plus  10/2/2020         Trump          Biden
## 231   2020 President polls-plus  10/2/2020         Trump          Biden
## 232   2020 President polls-plus  10/1/2020         Trump          Biden
## 233   2020 President polls-plus  10/1/2020         Trump          Biden
## 234   2020 President polls-plus  10/1/2020         Trump          Biden
## 235   2020 President polls-plus  10/1/2020         Trump          Biden
## 236   2020 President polls-plus  10/1/2020         Trump          Biden
## 237   2020 President polls-plus  10/1/2020         Trump          Biden
## 238   2020 President polls-plus  10/1/2020         Trump          Biden
## 239   2020 President polls-plus  9/30/2020         Trump          Biden
## 240   2020 President polls-plus  9/30/2020         Trump          Biden
## 241   2020 President polls-plus  9/30/2020         Trump          Biden
## 242   2020 President polls-plus  9/30/2020         Trump          Biden
## 243   2020 President polls-plus  9/30/2020         Trump          Biden
## 244   2020 President polls-plus  9/30/2020         Trump          Biden
## 245   2020 President polls-plus  9/30/2020         Trump          Biden
## 246   2020 President polls-plus  9/29/2020         Trump          Biden
## 247   2020 President polls-plus  9/29/2020         Trump          Biden
## 248   2020 President polls-plus  9/29/2020         Trump          Biden
## 249   2020 President polls-plus  9/29/2020         Trump          Biden
## 250   2020 President polls-plus  9/29/2020         Trump          Biden
## 251   2020 President polls-plus  9/29/2020         Trump          Biden
## 252   2020 President polls-plus  9/29/2020         Trump          Biden
## 253   2020 President polls-plus  9/28/2020         Trump          Biden
## 254   2020 President polls-plus  9/28/2020         Trump          Biden
## 255   2020 President polls-plus  9/28/2020         Trump          Biden
## 256   2020 President polls-plus  9/28/2020         Trump          Biden
## 257   2020 President polls-plus  9/28/2020         Trump          Biden
## 258   2020 President polls-plus  9/28/2020         Trump          Biden
## 259   2020 President polls-plus  9/28/2020         Trump          Biden
## 260   2020 President polls-plus  9/27/2020         Trump          Biden
## 261   2020 President polls-plus  9/27/2020         Trump          Biden
## 262   2020 President polls-plus  9/27/2020         Trump          Biden
## 263   2020 President polls-plus  9/27/2020         Trump          Biden
## 264   2020 President polls-plus  9/27/2020         Trump          Biden
## 265   2020 President polls-plus  9/27/2020         Trump          Biden
## 266   2020 President polls-plus  9/27/2020         Trump          Biden
## 267   2020 President polls-plus  9/26/2020         Trump          Biden
## 268   2020 President polls-plus  9/26/2020         Trump          Biden
## 269   2020 President polls-plus  9/26/2020         Trump          Biden
## 270   2020 President polls-plus  9/26/2020         Trump          Biden
## 271   2020 President polls-plus  9/26/2020         Trump          Biden
## 272   2020 President polls-plus  9/26/2020         Trump          Biden
## 273   2020 President polls-plus  9/26/2020         Trump          Biden
## 274   2020 President polls-plus  9/25/2020         Trump          Biden
## 275   2020 President polls-plus  9/25/2020         Trump          Biden
## 276   2020 President polls-plus  9/25/2020         Trump          Biden
## 277   2020 President polls-plus  9/25/2020         Trump          Biden
## 278   2020 President polls-plus  9/25/2020         Trump          Biden
## 279   2020 President polls-plus  9/25/2020         Trump          Biden
## 280   2020 President polls-plus  9/25/2020         Trump          Biden
## 281   2020 President polls-plus  9/24/2020         Trump          Biden
## 282   2020 President polls-plus  9/24/2020         Trump          Biden
## 283   2020 President polls-plus  9/24/2020         Trump          Biden
## 284   2020 President polls-plus  9/24/2020         Trump          Biden
## 285   2020 President polls-plus  9/24/2020         Trump          Biden
## 286   2020 President polls-plus  9/24/2020         Trump          Biden
## 287   2020 President polls-plus  9/24/2020         Trump          Biden
## 288   2020 President polls-plus  9/23/2020         Trump          Biden
## 289   2020 President polls-plus  9/23/2020         Trump          Biden
## 290   2020 President polls-plus  9/23/2020         Trump          Biden
## 291   2020 President polls-plus  9/23/2020         Trump          Biden
## 292   2020 President polls-plus  9/23/2020         Trump          Biden
## 293   2020 President polls-plus  9/23/2020         Trump          Biden
## 294   2020 President polls-plus  9/23/2020         Trump          Biden
## 295   2020 President polls-plus  9/22/2020         Trump          Biden
## 296   2020 President polls-plus  9/22/2020         Trump          Biden
## 297   2020 President polls-plus  9/22/2020         Trump          Biden
## 298   2020 President polls-plus  9/22/2020         Trump          Biden
## 299   2020 President polls-plus  9/22/2020         Trump          Biden
## 300   2020 President polls-plus  9/22/2020         Trump          Biden
## 301   2020 President polls-plus  9/22/2020         Trump          Biden
## 302   2020 President polls-plus  9/21/2020         Trump          Biden
## 303   2020 President polls-plus  9/21/2020         Trump          Biden
## 304   2020 President polls-plus  9/21/2020         Trump          Biden
## 305   2020 President polls-plus  9/21/2020         Trump          Biden
## 306   2020 President polls-plus  9/21/2020         Trump          Biden
## 307   2020 President polls-plus  9/21/2020         Trump          Biden
## 308   2020 President polls-plus  9/21/2020         Trump          Biden
## 309   2020 President polls-plus  9/20/2020         Trump          Biden
## 310   2020 President polls-plus  9/20/2020         Trump          Biden
## 311   2020 President polls-plus  9/20/2020         Trump          Biden
## 312   2020 President polls-plus  9/20/2020         Trump          Biden
## 313   2020 President polls-plus  9/20/2020         Trump          Biden
## 314   2020 President polls-plus  9/20/2020         Trump          Biden
## 315   2020 President polls-plus  9/20/2020         Trump          Biden
## 316   2020 President polls-plus  9/19/2020         Trump          Biden
## 317   2020 President polls-plus  9/19/2020         Trump          Biden
## 318   2020 President polls-plus  9/19/2020         Trump          Biden
## 319   2020 President polls-plus  9/19/2020         Trump          Biden
## 320   2020 President polls-plus  9/19/2020         Trump          Biden
## 321   2020 President polls-plus  9/19/2020         Trump          Biden
## 322   2020 President polls-plus  9/19/2020         Trump          Biden
## 323   2020 President polls-plus  9/18/2020         Trump          Biden
## 324   2020 President polls-plus  9/18/2020         Trump          Biden
## 325   2020 President polls-plus  9/18/2020         Trump          Biden
## 326   2020 President polls-plus  9/18/2020         Trump          Biden
## 327   2020 President polls-plus  9/18/2020         Trump          Biden
## 328   2020 President polls-plus  9/18/2020         Trump          Biden
## 329   2020 President polls-plus  9/18/2020         Trump          Biden
## 330   2020 President polls-plus  9/17/2020         Trump          Biden
## 331   2020 President polls-plus  9/17/2020         Trump          Biden
## 332   2020 President polls-plus  9/17/2020         Trump          Biden
## 333   2020 President polls-plus  9/17/2020         Trump          Biden
## 334   2020 President polls-plus  9/17/2020         Trump          Biden
## 335   2020 President polls-plus  9/17/2020         Trump          Biden
## 336   2020 President polls-plus  9/17/2020         Trump          Biden
## 337   2020 President polls-plus  9/16/2020         Trump          Biden
## 338   2020 President polls-plus  9/16/2020         Trump          Biden
## 339   2020 President polls-plus  9/16/2020         Trump          Biden
## 340   2020 President polls-plus  9/16/2020         Trump          Biden
## 341   2020 President polls-plus  9/16/2020         Trump          Biden
## 342   2020 President polls-plus  9/16/2020         Trump          Biden
## 343   2020 President polls-plus  9/16/2020         Trump          Biden
## 344   2020 President polls-plus  9/15/2020         Trump          Biden
## 345   2020 President polls-plus  9/15/2020         Trump          Biden
## 346   2020 President polls-plus  9/15/2020         Trump          Biden
## 347   2020 President polls-plus  9/15/2020         Trump          Biden
## 348   2020 President polls-plus  9/15/2020         Trump          Biden
## 349   2020 President polls-plus  9/15/2020         Trump          Biden
## 350   2020 President polls-plus  9/15/2020         Trump          Biden
## 351   2020 President polls-plus  9/14/2020         Trump          Biden
## 352   2020 President polls-plus  9/14/2020         Trump          Biden
## 353   2020 President polls-plus  9/14/2020         Trump          Biden
## 354   2020 President polls-plus  9/14/2020         Trump          Biden
## 355   2020 President polls-plus  9/14/2020         Trump          Biden
## 356   2020 President polls-plus  9/14/2020         Trump          Biden
## 357   2020 President polls-plus  9/14/2020         Trump          Biden
## 358   2020 President polls-plus  9/13/2020         Trump          Biden
## 359   2020 President polls-plus  9/13/2020         Trump          Biden
## 360   2020 President polls-plus  9/13/2020         Trump          Biden
## 361   2020 President polls-plus  9/13/2020         Trump          Biden
## 362   2020 President polls-plus  9/13/2020         Trump          Biden
## 363   2020 President polls-plus  9/13/2020         Trump          Biden
## 364   2020 President polls-plus  9/13/2020         Trump          Biden
## 365   2020 President polls-plus  9/12/2020         Trump          Biden
## 366   2020 President polls-plus  9/12/2020         Trump          Biden
## 367   2020 President polls-plus  9/12/2020         Trump          Biden
## 368   2020 President polls-plus  9/12/2020         Trump          Biden
## 369   2020 President polls-plus  9/12/2020         Trump          Biden
## 370   2020 President polls-plus  9/12/2020         Trump          Biden
## 371   2020 President polls-plus  9/12/2020         Trump          Biden
## 372   2020 President polls-plus  9/11/2020         Trump          Biden
## 373   2020 President polls-plus  9/11/2020         Trump          Biden
## 374   2020 President polls-plus  9/11/2020         Trump          Biden
## 375   2020 President polls-plus  9/11/2020         Trump          Biden
## 376   2020 President polls-plus  9/11/2020         Trump          Biden
## 377   2020 President polls-plus  9/11/2020         Trump          Biden
## 378   2020 President polls-plus  9/11/2020         Trump          Biden
## 379   2020 President polls-plus  9/10/2020         Trump          Biden
## 380   2020 President polls-plus  9/10/2020         Trump          Biden
## 381   2020 President polls-plus  9/10/2020         Trump          Biden
## 382   2020 President polls-plus  9/10/2020         Trump          Biden
## 383   2020 President polls-plus  9/10/2020         Trump          Biden
## 384   2020 President polls-plus  9/10/2020         Trump          Biden
## 385   2020 President polls-plus  9/10/2020         Trump          Biden
## 386   2020 President polls-plus   9/9/2020         Trump          Biden
## 387   2020 President polls-plus   9/9/2020         Trump          Biden
## 388   2020 President polls-plus   9/9/2020         Trump          Biden
## 389   2020 President polls-plus   9/9/2020         Trump          Biden
## 390   2020 President polls-plus   9/9/2020         Trump          Biden
## 391   2020 President polls-plus   9/9/2020         Trump          Biden
## 392   2020 President polls-plus   9/9/2020         Trump          Biden
## 393   2020 President polls-plus   9/8/2020         Trump          Biden
## 394   2020 President polls-plus   9/8/2020         Trump          Biden
## 395   2020 President polls-plus   9/8/2020         Trump          Biden
## 396   2020 President polls-plus   9/8/2020         Trump          Biden
## 397   2020 President polls-plus   9/8/2020         Trump          Biden
## 398   2020 President polls-plus   9/8/2020         Trump          Biden
## 399   2020 President polls-plus   9/8/2020         Trump          Biden
## 400   2020 President polls-plus   9/7/2020         Trump          Biden
## 401   2020 President polls-plus   9/7/2020         Trump          Biden
## 402   2020 President polls-plus   9/7/2020         Trump          Biden
## 403   2020 President polls-plus   9/7/2020         Trump          Biden
## 404   2020 President polls-plus   9/7/2020         Trump          Biden
## 405   2020 President polls-plus   9/7/2020         Trump          Biden
## 406   2020 President polls-plus   9/7/2020         Trump          Biden
## 407   2020 President polls-plus   9/6/2020         Trump          Biden
## 408   2020 President polls-plus   9/6/2020         Trump          Biden
## 409   2020 President polls-plus   9/6/2020         Trump          Biden
## 410   2020 President polls-plus   9/6/2020         Trump          Biden
## 411   2020 President polls-plus   9/6/2020         Trump          Biden
## 412   2020 President polls-plus   9/6/2020         Trump          Biden
## 413   2020 President polls-plus   9/6/2020         Trump          Biden
## 414   2020 President polls-plus   9/5/2020         Trump          Biden
## 415   2020 President polls-plus   9/5/2020         Trump          Biden
## 416   2020 President polls-plus   9/5/2020         Trump          Biden
## 417   2020 President polls-plus   9/5/2020         Trump          Biden
## 418   2020 President polls-plus   9/5/2020         Trump          Biden
## 419   2020 President polls-plus   9/5/2020         Trump          Biden
## 420   2020 President polls-plus   9/5/2020         Trump          Biden
## 421   2020 President polls-plus   9/4/2020         Trump          Biden
## 422   2020 President polls-plus   9/4/2020         Trump          Biden
## 423   2020 President polls-plus   9/4/2020         Trump          Biden
## 424   2020 President polls-plus   9/4/2020         Trump          Biden
## 425   2020 President polls-plus   9/4/2020         Trump          Biden
## 426   2020 President polls-plus   9/4/2020         Trump          Biden
## 427   2020 President polls-plus   9/4/2020         Trump          Biden
## 428   2020 President polls-plus   9/3/2020         Trump          Biden
## 429   2020 President polls-plus   9/3/2020         Trump          Biden
## 430   2020 President polls-plus   9/3/2020         Trump          Biden
## 431   2020 President polls-plus   9/3/2020         Trump          Biden
## 432   2020 President polls-plus   9/3/2020         Trump          Biden
## 433   2020 President polls-plus   9/3/2020         Trump          Biden
## 434   2020 President polls-plus   9/3/2020         Trump          Biden
## 435   2020 President polls-plus   9/2/2020         Trump          Biden
## 436   2020 President polls-plus   9/2/2020         Trump          Biden
## 437   2020 President polls-plus   9/2/2020         Trump          Biden
## 438   2020 President polls-plus   9/2/2020         Trump          Biden
## 439   2020 President polls-plus   9/2/2020         Trump          Biden
## 440   2020 President polls-plus   9/2/2020         Trump          Biden
## 441   2020 President polls-plus   9/2/2020         Trump          Biden
## 442   2020 President polls-plus   9/1/2020         Trump          Biden
## 443   2020 President polls-plus   9/1/2020         Trump          Biden
## 444   2020 President polls-plus   9/1/2020         Trump          Biden
## 445   2020 President polls-plus   9/1/2020         Trump          Biden
## 446   2020 President polls-plus   9/1/2020         Trump          Biden
## 447   2020 President polls-plus   9/1/2020         Trump          Biden
## 448   2020 President polls-plus   9/1/2020         Trump          Biden
## 449   2020 President polls-plus  8/31/2020         Trump          Biden
## 450   2020 President polls-plus  8/31/2020         Trump          Biden
## 451   2020 President polls-plus  8/31/2020         Trump          Biden
## 452   2020 President polls-plus  8/31/2020         Trump          Biden
## 453   2020 President polls-plus  8/31/2020         Trump          Biden
## 454   2020 President polls-plus  8/31/2020         Trump          Biden
## 455   2020 President polls-plus  8/31/2020         Trump          Biden
## 456   2020 President polls-plus  8/30/2020         Trump          Biden
## 457   2020 President polls-plus  8/30/2020         Trump          Biden
## 458   2020 President polls-plus  8/30/2020         Trump          Biden
## 459   2020 President polls-plus  8/30/2020         Trump          Biden
## 460   2020 President polls-plus  8/30/2020         Trump          Biden
## 461   2020 President polls-plus  8/30/2020         Trump          Biden
## 462   2020 President polls-plus  8/30/2020         Trump          Biden
## 463   2020 President polls-plus  8/29/2020         Trump          Biden
## 464   2020 President polls-plus  8/29/2020         Trump          Biden
## 465   2020 President polls-plus  8/29/2020         Trump          Biden
## 466   2020 President polls-plus  8/29/2020         Trump          Biden
## 467   2020 President polls-plus  8/29/2020         Trump          Biden
## 468   2020 President polls-plus  8/29/2020         Trump          Biden
## 469   2020 President polls-plus  8/29/2020         Trump          Biden
## 470   2020 President polls-plus  8/28/2020         Trump          Biden
## 471   2020 President polls-plus  8/28/2020         Trump          Biden
## 472   2020 President polls-plus  8/28/2020         Trump          Biden
## 473   2020 President polls-plus  8/28/2020         Trump          Biden
## 474   2020 President polls-plus  8/28/2020         Trump          Biden
## 475   2020 President polls-plus  8/28/2020         Trump          Biden
## 476   2020 President polls-plus  8/28/2020         Trump          Biden
## 477   2020 President polls-plus  8/27/2020         Trump          Biden
## 478   2020 President polls-plus  8/27/2020         Trump          Biden
## 479   2020 President polls-plus  8/27/2020         Trump          Biden
## 480   2020 President polls-plus  8/27/2020         Trump          Biden
## 481   2020 President polls-plus  8/27/2020         Trump          Biden
## 482   2020 President polls-plus  8/27/2020         Trump          Biden
## 483   2020 President polls-plus  8/27/2020         Trump          Biden
## 484   2020 President polls-plus  8/26/2020         Trump          Biden
## 485   2020 President polls-plus  8/26/2020         Trump          Biden
## 486   2020 President polls-plus  8/26/2020         Trump          Biden
## 487   2020 President polls-plus  8/26/2020         Trump          Biden
## 488   2020 President polls-plus  8/26/2020         Trump          Biden
## 489   2020 President polls-plus  8/26/2020         Trump          Biden
## 490   2020 President polls-plus  8/26/2020         Trump          Biden
## 491   2020 President polls-plus  8/25/2020         Trump          Biden
## 492   2020 President polls-plus  8/25/2020         Trump          Biden
## 493   2020 President polls-plus  8/25/2020         Trump          Biden
## 494   2020 President polls-plus  8/25/2020         Trump          Biden
## 495   2020 President polls-plus  8/25/2020         Trump          Biden
## 496   2020 President polls-plus  8/25/2020         Trump          Biden
## 497   2020 President polls-plus  8/25/2020         Trump          Biden
## 498   2020 President polls-plus  8/24/2020         Trump          Biden
## 499   2020 President polls-plus  8/24/2020         Trump          Biden
## 500   2020 President polls-plus  8/24/2020         Trump          Biden
## 501   2020 President polls-plus  8/24/2020         Trump          Biden
## 502   2020 President polls-plus  8/24/2020         Trump          Biden
## 503   2020 President polls-plus  8/24/2020         Trump          Biden
## 504   2020 President polls-plus  8/24/2020         Trump          Biden
## 505   2020 President polls-plus  8/23/2020         Trump          Biden
## 506   2020 President polls-plus  8/23/2020         Trump          Biden
## 507   2020 President polls-plus  8/23/2020         Trump          Biden
## 508   2020 President polls-plus  8/23/2020         Trump          Biden
## 509   2020 President polls-plus  8/23/2020         Trump          Biden
## 510   2020 President polls-plus  8/23/2020         Trump          Biden
## 511   2020 President polls-plus  8/23/2020         Trump          Biden
## 512   2020 President polls-plus  8/22/2020         Trump          Biden
## 513   2020 President polls-plus  8/22/2020         Trump          Biden
## 514   2020 President polls-plus  8/22/2020         Trump          Biden
## 515   2020 President polls-plus  8/22/2020         Trump          Biden
## 516   2020 President polls-plus  8/22/2020         Trump          Biden
## 517   2020 President polls-plus  8/22/2020         Trump          Biden
## 518   2020 President polls-plus  8/22/2020         Trump          Biden
## 519   2020 President polls-plus  8/21/2020         Trump          Biden
## 520   2020 President polls-plus  8/21/2020         Trump          Biden
## 521   2020 President polls-plus  8/21/2020         Trump          Biden
## 522   2020 President polls-plus  8/21/2020         Trump          Biden
## 523   2020 President polls-plus  8/21/2020         Trump          Biden
## 524   2020 President polls-plus  8/21/2020         Trump          Biden
## 525   2020 President polls-plus  8/21/2020         Trump          Biden
## 526   2020 President polls-plus  8/20/2020         Trump          Biden
## 527   2020 President polls-plus  8/20/2020         Trump          Biden
## 528   2020 President polls-plus  8/20/2020         Trump          Biden
## 529   2020 President polls-plus  8/20/2020         Trump          Biden
## 530   2020 President polls-plus  8/20/2020         Trump          Biden
## 531   2020 President polls-plus  8/20/2020         Trump          Biden
## 532   2020 President polls-plus  8/20/2020         Trump          Biden
## 533   2020 President polls-plus  8/19/2020         Trump          Biden
## 534   2020 President polls-plus  8/19/2020         Trump          Biden
## 535   2020 President polls-plus  8/19/2020         Trump          Biden
## 536   2020 President polls-plus  8/19/2020         Trump          Biden
## 537   2020 President polls-plus  8/19/2020         Trump          Biden
## 538   2020 President polls-plus  8/19/2020         Trump          Biden
## 539   2020 President polls-plus  8/19/2020         Trump          Biden
## 540   2020 President polls-plus  8/18/2020         Trump          Biden
## 541   2020 President polls-plus  8/18/2020         Trump          Biden
## 542   2020 President polls-plus  8/18/2020         Trump          Biden
## 543   2020 President polls-plus  8/18/2020         Trump          Biden
## 544   2020 President polls-plus  8/18/2020         Trump          Biden
## 545   2020 President polls-plus  8/18/2020         Trump          Biden
## 546   2020 President polls-plus  8/18/2020         Trump          Biden
## 547   2020 President polls-plus  8/17/2020         Trump          Biden
## 548   2020 President polls-plus  8/17/2020         Trump          Biden
## 549   2020 President polls-plus  8/17/2020         Trump          Biden
## 550   2020 President polls-plus  8/17/2020         Trump          Biden
## 551   2020 President polls-plus  8/17/2020         Trump          Biden
## 552   2020 President polls-plus  8/17/2020         Trump          Biden
## 553   2020 President polls-plus  8/17/2020         Trump          Biden
## 554   2020 President polls-plus  8/16/2020         Trump          Biden
## 555   2020 President polls-plus  8/16/2020         Trump          Biden
## 556   2020 President polls-plus  8/16/2020         Trump          Biden
## 557   2020 President polls-plus  8/16/2020         Trump          Biden
## 558   2020 President polls-plus  8/16/2020         Trump          Biden
## 559   2020 President polls-plus  8/16/2020         Trump          Biden
## 560   2020 President polls-plus  8/16/2020         Trump          Biden
## 561   2020 President polls-plus  8/15/2020         Trump          Biden
## 562   2020 President polls-plus  8/15/2020         Trump          Biden
## 563   2020 President polls-plus  8/15/2020         Trump          Biden
## 564   2020 President polls-plus  8/15/2020         Trump          Biden
## 565   2020 President polls-plus  8/15/2020         Trump          Biden
## 566   2020 President polls-plus  8/15/2020         Trump          Biden
## 567   2020 President polls-plus  8/15/2020         Trump          Biden
## 568   2020 President polls-plus  8/14/2020         Trump          Biden
## 569   2020 President polls-plus  8/14/2020         Trump          Biden
## 570   2020 President polls-plus  8/14/2020         Trump          Biden
## 571   2020 President polls-plus  8/14/2020         Trump          Biden
## 572   2020 President polls-plus  8/14/2020         Trump          Biden
## 573   2020 President polls-plus  8/14/2020         Trump          Biden
## 574   2020 President polls-plus  8/14/2020         Trump          Biden
## 575   2020 President polls-plus  8/13/2020         Trump          Biden
## 576   2020 President polls-plus  8/13/2020         Trump          Biden
## 577   2020 President polls-plus  8/13/2020         Trump          Biden
## 578   2020 President polls-plus  8/13/2020         Trump          Biden
## 579   2020 President polls-plus  8/13/2020         Trump          Biden
## 580   2020 President polls-plus  8/13/2020         Trump          Biden
## 581   2020 President polls-plus  8/13/2020         Trump          Biden
## 582   2020 President polls-plus  8/12/2020         Trump          Biden
## 583   2020 President polls-plus  8/12/2020         Trump          Biden
## 584   2020 President polls-plus  8/12/2020         Trump          Biden
## 585   2020 President polls-plus  8/12/2020         Trump          Biden
## 586   2020 President polls-plus  8/12/2020         Trump          Biden
## 587   2020 President polls-plus  8/12/2020         Trump          Biden
## 588   2020 President polls-plus  8/12/2020         Trump          Biden
## 589   2020 President polls-plus  8/11/2020         Trump          Biden
## 590   2020 President polls-plus  8/11/2020         Trump          Biden
## 591   2020 President polls-plus  8/11/2020         Trump          Biden
## 592   2020 President polls-plus  8/11/2020         Trump          Biden
## 593   2020 President polls-plus  8/11/2020         Trump          Biden
## 594   2020 President polls-plus  8/11/2020         Trump          Biden
## 595   2020 President polls-plus  8/11/2020         Trump          Biden
## 596   2020 President polls-plus  8/10/2020         Trump          Biden
## 597   2020 President polls-plus  8/10/2020         Trump          Biden
## 598   2020 President polls-plus  8/10/2020         Trump          Biden
## 599   2020 President polls-plus  8/10/2020         Trump          Biden
## 600   2020 President polls-plus  8/10/2020         Trump          Biden
## 601   2020 President polls-plus  8/10/2020         Trump          Biden
## 602   2020 President polls-plus  8/10/2020         Trump          Biden
## 603   2020 President polls-plus   8/9/2020         Trump          Biden
## 604   2020 President polls-plus   8/9/2020         Trump          Biden
## 605   2020 President polls-plus   8/9/2020         Trump          Biden
## 606   2020 President polls-plus   8/9/2020         Trump          Biden
## 607   2020 President polls-plus   8/9/2020         Trump          Biden
## 608   2020 President polls-plus   8/9/2020         Trump          Biden
## 609   2020 President polls-plus   8/9/2020         Trump          Biden
## 610   2020 President polls-plus   8/8/2020         Trump          Biden
## 611   2020 President polls-plus   8/8/2020         Trump          Biden
## 612   2020 President polls-plus   8/8/2020         Trump          Biden
## 613   2020 President polls-plus   8/8/2020         Trump          Biden
## 614   2020 President polls-plus   8/8/2020         Trump          Biden
## 615   2020 President polls-plus   8/8/2020         Trump          Biden
## 616   2020 President polls-plus   8/8/2020         Trump          Biden
## 617   2020 President polls-plus   8/7/2020         Trump          Biden
## 618   2020 President polls-plus   8/7/2020         Trump          Biden
## 619   2020 President polls-plus   8/7/2020         Trump          Biden
## 620   2020 President polls-plus   8/7/2020         Trump          Biden
## 621   2020 President polls-plus   8/7/2020         Trump          Biden
## 622   2020 President polls-plus   8/7/2020         Trump          Biden
## 623   2020 President polls-plus   8/7/2020         Trump          Biden
## 624   2020 President polls-plus   8/6/2020         Trump          Biden
## 625   2020 President polls-plus   8/6/2020         Trump          Biden
## 626   2020 President polls-plus   8/6/2020         Trump          Biden
## 627   2020 President polls-plus   8/6/2020         Trump          Biden
## 628   2020 President polls-plus   8/6/2020         Trump          Biden
## 629   2020 President polls-plus   8/6/2020         Trump          Biden
## 630   2020 President polls-plus   8/6/2020         Trump          Biden
## 631   2020 President polls-plus   8/5/2020         Trump          Biden
## 632   2020 President polls-plus   8/5/2020         Trump          Biden
## 633   2020 President polls-plus   8/5/2020         Trump          Biden
## 634   2020 President polls-plus   8/5/2020         Trump          Biden
## 635   2020 President polls-plus   8/5/2020         Trump          Biden
## 636   2020 President polls-plus   8/5/2020         Trump          Biden
## 637   2020 President polls-plus   8/5/2020         Trump          Biden
## 638   2020 President polls-plus   8/4/2020         Trump          Biden
## 639   2020 President polls-plus   8/4/2020         Trump          Biden
## 640   2020 President polls-plus   8/4/2020         Trump          Biden
## 641   2020 President polls-plus   8/4/2020         Trump          Biden
## 642   2020 President polls-plus   8/4/2020         Trump          Biden
## 643   2020 President polls-plus   8/4/2020         Trump          Biden
## 644   2020 President polls-plus   8/4/2020         Trump          Biden
## 645   2020 President polls-plus   8/3/2020         Trump          Biden
## 646   2020 President polls-plus   8/3/2020         Trump          Biden
## 647   2020 President polls-plus   8/3/2020         Trump          Biden
## 648   2020 President polls-plus   8/3/2020         Trump          Biden
## 649   2020 President polls-plus   8/3/2020         Trump          Biden
## 650   2020 President polls-plus   8/3/2020         Trump          Biden
## 651   2020 President polls-plus   8/3/2020         Trump          Biden
## 652   2020 President polls-plus   8/2/2020         Trump          Biden
## 653   2020 President polls-plus   8/2/2020         Trump          Biden
## 654   2020 President polls-plus   8/2/2020         Trump          Biden
## 655   2020 President polls-plus   8/2/2020         Trump          Biden
## 656   2020 President polls-plus   8/2/2020         Trump          Biden
## 657   2020 President polls-plus   8/2/2020         Trump          Biden
## 658   2020 President polls-plus   8/2/2020         Trump          Biden
## 659   2020 President polls-plus   8/1/2020         Trump          Biden
## 660   2020 President polls-plus   8/1/2020         Trump          Biden
## 661   2020 President polls-plus   8/1/2020         Trump          Biden
## 662   2020 President polls-plus   8/1/2020         Trump          Biden
## 663   2020 President polls-plus   8/1/2020         Trump          Biden
## 664   2020 President polls-plus   8/1/2020         Trump          Biden
## 665   2020 President polls-plus   8/1/2020         Trump          Biden
## 666   2020 President polls-plus  7/31/2020         Trump          Biden
## 667   2020 President polls-plus  7/31/2020         Trump          Biden
## 668   2020 President polls-plus  7/31/2020         Trump          Biden
## 669   2020 President polls-plus  7/31/2020         Trump          Biden
## 670   2020 President polls-plus  7/31/2020         Trump          Biden
## 671   2020 President polls-plus  7/31/2020         Trump          Biden
## 672   2020 President polls-plus  7/31/2020         Trump          Biden
## 673   2020 President polls-plus  7/30/2020         Trump          Biden
## 674   2020 President polls-plus  7/30/2020         Trump          Biden
## 675   2020 President polls-plus  7/30/2020         Trump          Biden
## 676   2020 President polls-plus  7/30/2020         Trump          Biden
## 677   2020 President polls-plus  7/30/2020         Trump          Biden
## 678   2020 President polls-plus  7/30/2020         Trump          Biden
## 679   2020 President polls-plus  7/30/2020         Trump          Biden
## 680   2020 President polls-plus  7/29/2020         Trump          Biden
## 681   2020 President polls-plus  7/29/2020         Trump          Biden
## 682   2020 President polls-plus  7/29/2020         Trump          Biden
## 683   2020 President polls-plus  7/29/2020         Trump          Biden
## 684   2020 President polls-plus  7/29/2020         Trump          Biden
## 685   2020 President polls-plus  7/29/2020         Trump          Biden
## 686   2020 President polls-plus  7/29/2020         Trump          Biden
## 687   2020 President polls-plus  7/28/2020         Trump          Biden
## 688   2020 President polls-plus  7/28/2020         Trump          Biden
## 689   2020 President polls-plus  7/28/2020         Trump          Biden
## 690   2020 President polls-plus  7/28/2020         Trump          Biden
## 691   2020 President polls-plus  7/28/2020         Trump          Biden
## 692   2020 President polls-plus  7/28/2020         Trump          Biden
## 693   2020 President polls-plus  7/28/2020         Trump          Biden
## 694   2020 President polls-plus  7/27/2020         Trump          Biden
## 695   2020 President polls-plus  7/27/2020         Trump          Biden
## 696   2020 President polls-plus  7/27/2020         Trump          Biden
## 697   2020 President polls-plus  7/27/2020         Trump          Biden
## 698   2020 President polls-plus  7/27/2020         Trump          Biden
## 699   2020 President polls-plus  7/27/2020         Trump          Biden
## 700   2020 President polls-plus  7/27/2020         Trump          Biden
## 701   2020 President polls-plus  7/26/2020         Trump          Biden
## 702   2020 President polls-plus  7/26/2020         Trump          Biden
## 703   2020 President polls-plus  7/26/2020         Trump          Biden
## 704   2020 President polls-plus  7/26/2020         Trump          Biden
## 705   2020 President polls-plus  7/26/2020         Trump          Biden
## 706   2020 President polls-plus  7/26/2020         Trump          Biden
## 707   2020 President polls-plus  7/26/2020         Trump          Biden
## 708   2020 President polls-plus  7/25/2020         Trump          Biden
## 709   2020 President polls-plus  7/25/2020         Trump          Biden
## 710   2020 President polls-plus  7/25/2020         Trump          Biden
## 711   2020 President polls-plus  7/25/2020         Trump          Biden
## 712   2020 President polls-plus  7/25/2020         Trump          Biden
## 713   2020 President polls-plus  7/25/2020         Trump          Biden
## 714   2020 President polls-plus  7/25/2020         Trump          Biden
## 715   2020 President polls-plus  7/24/2020         Trump          Biden
## 716   2020 President polls-plus  7/24/2020         Trump          Biden
## 717   2020 President polls-plus  7/24/2020         Trump          Biden
## 718   2020 President polls-plus  7/24/2020         Trump          Biden
## 719   2020 President polls-plus  7/24/2020         Trump          Biden
## 720   2020 President polls-plus  7/24/2020         Trump          Biden
## 721   2020 President polls-plus  7/24/2020         Trump          Biden
## 722   2020 President polls-plus  7/23/2020         Trump          Biden
## 723   2020 President polls-plus  7/23/2020         Trump          Biden
## 724   2020 President polls-plus  7/23/2020         Trump          Biden
## 725   2020 President polls-plus  7/23/2020         Trump          Biden
## 726   2020 President polls-plus  7/23/2020         Trump          Biden
## 727   2020 President polls-plus  7/23/2020         Trump          Biden
## 728   2020 President polls-plus  7/23/2020         Trump          Biden
## 729   2020 President polls-plus  7/22/2020         Trump          Biden
## 730   2020 President polls-plus  7/22/2020         Trump          Biden
## 731   2020 President polls-plus  7/22/2020         Trump          Biden
## 732   2020 President polls-plus  7/22/2020         Trump          Biden
## 733   2020 President polls-plus  7/22/2020         Trump          Biden
## 734   2020 President polls-plus  7/22/2020         Trump          Biden
## 735   2020 President polls-plus  7/22/2020         Trump          Biden
## 736   2020 President polls-plus  7/21/2020         Trump          Biden
## 737   2020 President polls-plus  7/21/2020         Trump          Biden
## 738   2020 President polls-plus  7/21/2020         Trump          Biden
## 739   2020 President polls-plus  7/21/2020         Trump          Biden
## 740   2020 President polls-plus  7/21/2020         Trump          Biden
## 741   2020 President polls-plus  7/21/2020         Trump          Biden
## 742   2020 President polls-plus  7/21/2020         Trump          Biden
## 743   2020 President polls-plus  7/20/2020         Trump          Biden
## 744   2020 President polls-plus  7/20/2020         Trump          Biden
## 745   2020 President polls-plus  7/20/2020         Trump          Biden
## 746   2020 President polls-plus  7/20/2020         Trump          Biden
## 747   2020 President polls-plus  7/20/2020         Trump          Biden
## 748   2020 President polls-plus  7/20/2020         Trump          Biden
## 749   2020 President polls-plus  7/20/2020         Trump          Biden
## 750   2020 President polls-plus  7/19/2020         Trump          Biden
## 751   2020 President polls-plus  7/19/2020         Trump          Biden
## 752   2020 President polls-plus  7/19/2020         Trump          Biden
## 753   2020 President polls-plus  7/19/2020         Trump          Biden
## 754   2020 President polls-plus  7/19/2020         Trump          Biden
## 755   2020 President polls-plus  7/19/2020         Trump          Biden
## 756   2020 President polls-plus  7/19/2020         Trump          Biden
## 757   2020 President polls-plus  7/18/2020         Trump          Biden
## 758   2020 President polls-plus  7/18/2020         Trump          Biden
## 759   2020 President polls-plus  7/18/2020         Trump          Biden
## 760   2020 President polls-plus  7/18/2020         Trump          Biden
## 761   2020 President polls-plus  7/18/2020         Trump          Biden
## 762   2020 President polls-plus  7/18/2020         Trump          Biden
## 763   2020 President polls-plus  7/18/2020         Trump          Biden
## 764   2020 President polls-plus  7/17/2020         Trump          Biden
## 765   2020 President polls-plus  7/17/2020         Trump          Biden
## 766   2020 President polls-plus  7/17/2020         Trump          Biden
## 767   2020 President polls-plus  7/17/2020         Trump          Biden
## 768   2020 President polls-plus  7/17/2020         Trump          Biden
## 769   2020 President polls-plus  7/17/2020         Trump          Biden
## 770   2020 President polls-plus  7/17/2020         Trump          Biden
## 771   2020 President polls-plus  7/16/2020         Trump          Biden
## 772   2020 President polls-plus  7/16/2020         Trump          Biden
## 773   2020 President polls-plus  7/16/2020         Trump          Biden
## 774   2020 President polls-plus  7/16/2020         Trump          Biden
## 775   2020 President polls-plus  7/16/2020         Trump          Biden
## 776   2020 President polls-plus  7/16/2020         Trump          Biden
## 777   2020 President polls-plus  7/16/2020         Trump          Biden
## 778   2020 President polls-plus  7/15/2020         Trump          Biden
## 779   2020 President polls-plus  7/15/2020         Trump          Biden
## 780   2020 President polls-plus  7/15/2020         Trump          Biden
## 781   2020 President polls-plus  7/15/2020         Trump          Biden
## 782   2020 President polls-plus  7/15/2020         Trump          Biden
## 783   2020 President polls-plus  7/15/2020         Trump          Biden
## 784   2020 President polls-plus  7/15/2020         Trump          Biden
## 785   2020 President polls-plus  7/14/2020         Trump          Biden
## 786   2020 President polls-plus  7/14/2020         Trump          Biden
## 787   2020 President polls-plus  7/14/2020         Trump          Biden
## 788   2020 President polls-plus  7/14/2020         Trump          Biden
## 789   2020 President polls-plus  7/14/2020         Trump          Biden
## 790   2020 President polls-plus  7/14/2020         Trump          Biden
## 791   2020 President polls-plus  7/14/2020         Trump          Biden
## 792   2020 President polls-plus  7/13/2020         Trump          Biden
## 793   2020 President polls-plus  7/13/2020         Trump          Biden
## 794   2020 President polls-plus  7/13/2020         Trump          Biden
## 795   2020 President polls-plus  7/13/2020         Trump          Biden
## 796   2020 President polls-plus  7/13/2020         Trump          Biden
## 797   2020 President polls-plus  7/13/2020         Trump          Biden
## 798   2020 President polls-plus  7/13/2020         Trump          Biden
## 799   2020 President polls-plus  7/12/2020         Trump          Biden
## 800   2020 President polls-plus  7/12/2020         Trump          Biden
## 801   2020 President polls-plus  7/12/2020         Trump          Biden
## 802   2020 President polls-plus  7/12/2020         Trump          Biden
## 803   2020 President polls-plus  7/12/2020         Trump          Biden
## 804   2020 President polls-plus  7/12/2020         Trump          Biden
## 805   2020 President polls-plus  7/12/2020         Trump          Biden
## 806   2020 President polls-plus  7/11/2020         Trump          Biden
## 807   2020 President polls-plus  7/11/2020         Trump          Biden
## 808   2020 President polls-plus  7/11/2020         Trump          Biden
## 809   2020 President polls-plus  7/11/2020         Trump          Biden
## 810   2020 President polls-plus  7/11/2020         Trump          Biden
## 811   2020 President polls-plus  7/11/2020         Trump          Biden
## 812   2020 President polls-plus  7/11/2020         Trump          Biden
## 813   2020 President polls-plus  7/10/2020         Trump          Biden
## 814   2020 President polls-plus  7/10/2020         Trump          Biden
## 815   2020 President polls-plus  7/10/2020         Trump          Biden
## 816   2020 President polls-plus  7/10/2020         Trump          Biden
## 817   2020 President polls-plus  7/10/2020         Trump          Biden
## 818   2020 President polls-plus  7/10/2020         Trump          Biden
## 819   2020 President polls-plus  7/10/2020         Trump          Biden
## 820   2020 President polls-plus   7/9/2020         Trump          Biden
## 821   2020 President polls-plus   7/9/2020         Trump          Biden
## 822   2020 President polls-plus   7/9/2020         Trump          Biden
## 823   2020 President polls-plus   7/9/2020         Trump          Biden
## 824   2020 President polls-plus   7/9/2020         Trump          Biden
## 825   2020 President polls-plus   7/9/2020         Trump          Biden
## 826   2020 President polls-plus   7/9/2020         Trump          Biden
## 827   2020 President polls-plus   7/8/2020         Trump          Biden
## 828   2020 President polls-plus   7/8/2020         Trump          Biden
## 829   2020 President polls-plus   7/8/2020         Trump          Biden
## 830   2020 President polls-plus   7/8/2020         Trump          Biden
## 831   2020 President polls-plus   7/8/2020         Trump          Biden
## 832   2020 President polls-plus   7/8/2020         Trump          Biden
## 833   2020 President polls-plus   7/8/2020         Trump          Biden
## 834   2020 President polls-plus   7/7/2020         Trump          Biden
## 835   2020 President polls-plus   7/7/2020         Trump          Biden
## 836   2020 President polls-plus   7/7/2020         Trump          Biden
## 837   2020 President polls-plus   7/7/2020         Trump          Biden
## 838   2020 President polls-plus   7/7/2020         Trump          Biden
## 839   2020 President polls-plus   7/7/2020         Trump          Biden
## 840   2020 President polls-plus   7/7/2020         Trump          Biden
## 841   2020 President polls-plus   7/6/2020         Trump          Biden
## 842   2020 President polls-plus   7/6/2020         Trump          Biden
## 843   2020 President polls-plus   7/6/2020         Trump          Biden
## 844   2020 President polls-plus   7/6/2020         Trump          Biden
## 845   2020 President polls-plus   7/6/2020         Trump          Biden
## 846   2020 President polls-plus   7/6/2020         Trump          Biden
## 847   2020 President polls-plus   7/6/2020         Trump          Biden
## 848   2020 President polls-plus   7/5/2020         Trump          Biden
## 849   2020 President polls-plus   7/5/2020         Trump          Biden
## 850   2020 President polls-plus   7/5/2020         Trump          Biden
## 851   2020 President polls-plus   7/5/2020         Trump          Biden
## 852   2020 President polls-plus   7/5/2020         Trump          Biden
## 853   2020 President polls-plus   7/5/2020         Trump          Biden
## 854   2020 President polls-plus   7/5/2020         Trump          Biden
## 855   2020 President polls-plus   7/4/2020         Trump          Biden
## 856   2020 President polls-plus   7/4/2020         Trump          Biden
## 857   2020 President polls-plus   7/4/2020         Trump          Biden
## 858   2020 President polls-plus   7/4/2020         Trump          Biden
## 859   2020 President polls-plus   7/4/2020         Trump          Biden
## 860   2020 President polls-plus   7/4/2020         Trump          Biden
## 861   2020 President polls-plus   7/4/2020         Trump          Biden
## 862   2020 President polls-plus   7/3/2020         Trump          Biden
## 863   2020 President polls-plus   7/3/2020         Trump          Biden
## 864   2020 President polls-plus   7/3/2020         Trump          Biden
## 865   2020 President polls-plus   7/3/2020         Trump          Biden
## 866   2020 President polls-plus   7/3/2020         Trump          Biden
## 867   2020 President polls-plus   7/3/2020         Trump          Biden
## 868   2020 President polls-plus   7/3/2020         Trump          Biden
## 869   2020 President polls-plus   7/2/2020         Trump          Biden
## 870   2020 President polls-plus   7/2/2020         Trump          Biden
## 871   2020 President polls-plus   7/2/2020         Trump          Biden
## 872   2020 President polls-plus   7/2/2020         Trump          Biden
## 873   2020 President polls-plus   7/2/2020         Trump          Biden
## 874   2020 President polls-plus   7/2/2020         Trump          Biden
## 875   2020 President polls-plus   7/2/2020         Trump          Biden
## 876   2020 President polls-plus   7/1/2020         Trump          Biden
## 877   2020 President polls-plus   7/1/2020         Trump          Biden
## 878   2020 President polls-plus   7/1/2020         Trump          Biden
## 879   2020 President polls-plus   7/1/2020         Trump          Biden
## 880   2020 President polls-plus   7/1/2020         Trump          Biden
## 881   2020 President polls-plus   7/1/2020         Trump          Biden
## 882   2020 President polls-plus   7/1/2020         Trump          Biden
## 883   2020 President polls-plus  6/30/2020         Trump          Biden
## 884   2020 President polls-plus  6/30/2020         Trump          Biden
## 885   2020 President polls-plus  6/30/2020         Trump          Biden
## 886   2020 President polls-plus  6/30/2020         Trump          Biden
## 887   2020 President polls-plus  6/30/2020         Trump          Biden
## 888   2020 President polls-plus  6/30/2020         Trump          Biden
## 889   2020 President polls-plus  6/30/2020         Trump          Biden
## 890   2020 President polls-plus  6/29/2020         Trump          Biden
## 891   2020 President polls-plus  6/29/2020         Trump          Biden
## 892   2020 President polls-plus  6/29/2020         Trump          Biden
## 893   2020 President polls-plus  6/29/2020         Trump          Biden
## 894   2020 President polls-plus  6/29/2020         Trump          Biden
## 895   2020 President polls-plus  6/29/2020         Trump          Biden
## 896   2020 President polls-plus  6/29/2020         Trump          Biden
## 897   2020 President polls-plus  6/28/2020         Trump          Biden
## 898   2020 President polls-plus  6/28/2020         Trump          Biden
## 899   2020 President polls-plus  6/28/2020         Trump          Biden
## 900   2020 President polls-plus  6/28/2020         Trump          Biden
## 901   2020 President polls-plus  6/28/2020         Trump          Biden
## 902   2020 President polls-plus  6/28/2020         Trump          Biden
## 903   2020 President polls-plus  6/28/2020         Trump          Biden
## 904   2020 President polls-plus  6/27/2020         Trump          Biden
## 905   2020 President polls-plus  6/27/2020         Trump          Biden
## 906   2020 President polls-plus  6/27/2020         Trump          Biden
## 907   2020 President polls-plus  6/27/2020         Trump          Biden
## 908   2020 President polls-plus  6/27/2020         Trump          Biden
## 909   2020 President polls-plus  6/27/2020         Trump          Biden
## 910   2020 President polls-plus  6/27/2020         Trump          Biden
## 911   2020 President polls-plus  6/26/2020         Trump          Biden
## 912   2020 President polls-plus  6/26/2020         Trump          Biden
## 913   2020 President polls-plus  6/26/2020         Trump          Biden
## 914   2020 President polls-plus  6/26/2020         Trump          Biden
## 915   2020 President polls-plus  6/26/2020         Trump          Biden
## 916   2020 President polls-plus  6/26/2020         Trump          Biden
## 917   2020 President polls-plus  6/26/2020         Trump          Biden
## 918   2020 President polls-plus  6/25/2020         Trump          Biden
## 919   2020 President polls-plus  6/25/2020         Trump          Biden
## 920   2020 President polls-plus  6/25/2020         Trump          Biden
## 921   2020 President polls-plus  6/25/2020         Trump          Biden
## 922   2020 President polls-plus  6/25/2020         Trump          Biden
## 923   2020 President polls-plus  6/25/2020         Trump          Biden
## 924   2020 President polls-plus  6/25/2020         Trump          Biden
## 925   2020 President polls-plus  6/24/2020         Trump          Biden
## 926   2020 President polls-plus  6/24/2020         Trump          Biden
## 927   2020 President polls-plus  6/24/2020         Trump          Biden
## 928   2020 President polls-plus  6/24/2020         Trump          Biden
## 929   2020 President polls-plus  6/24/2020         Trump          Biden
## 930   2020 President polls-plus  6/24/2020         Trump          Biden
## 931   2020 President polls-plus  6/24/2020         Trump          Biden
## 932   2020 President polls-plus  6/23/2020         Trump          Biden
## 933   2020 President polls-plus  6/23/2020         Trump          Biden
## 934   2020 President polls-plus  6/23/2020         Trump          Biden
## 935   2020 President polls-plus  6/23/2020         Trump          Biden
## 936   2020 President polls-plus  6/23/2020         Trump          Biden
## 937   2020 President polls-plus  6/23/2020         Trump          Biden
## 938   2020 President polls-plus  6/23/2020         Trump          Biden
## 939   2020 President polls-plus  6/22/2020         Trump          Biden
## 940   2020 President polls-plus  6/22/2020         Trump          Biden
## 941   2020 President polls-plus  6/22/2020         Trump          Biden
## 942   2020 President polls-plus  6/22/2020         Trump          Biden
## 943   2020 President polls-plus  6/22/2020         Trump          Biden
## 944   2020 President polls-plus  6/22/2020         Trump          Biden
## 945   2020 President polls-plus  6/22/2020         Trump          Biden
## 946   2020 President polls-plus  6/21/2020         Trump          Biden
## 947   2020 President polls-plus  6/21/2020         Trump          Biden
## 948   2020 President polls-plus  6/21/2020         Trump          Biden
## 949   2020 President polls-plus  6/21/2020         Trump          Biden
## 950   2020 President polls-plus  6/21/2020         Trump          Biden
## 951   2020 President polls-plus  6/21/2020         Trump          Biden
## 952   2020 President polls-plus  6/21/2020         Trump          Biden
## 953   2020 President polls-plus  6/20/2020         Trump          Biden
## 954   2020 President polls-plus  6/20/2020         Trump          Biden
## 955   2020 President polls-plus  6/20/2020         Trump          Biden
## 956   2020 President polls-plus  6/20/2020         Trump          Biden
## 957   2020 President polls-plus  6/20/2020         Trump          Biden
## 958   2020 President polls-plus  6/20/2020         Trump          Biden
## 959   2020 President polls-plus  6/20/2020         Trump          Biden
## 960   2020 President polls-plus  6/19/2020         Trump          Biden
## 961   2020 President polls-plus  6/19/2020         Trump          Biden
## 962   2020 President polls-plus  6/19/2020         Trump          Biden
## 963   2020 President polls-plus  6/19/2020         Trump          Biden
## 964   2020 President polls-plus  6/19/2020         Trump          Biden
## 965   2020 President polls-plus  6/19/2020         Trump          Biden
## 966   2020 President polls-plus  6/19/2020         Trump          Biden
## 967   2020 President polls-plus  6/18/2020         Trump          Biden
## 968   2020 President polls-plus  6/18/2020         Trump          Biden
## 969   2020 President polls-plus  6/18/2020         Trump          Biden
## 970   2020 President polls-plus  6/18/2020         Trump          Biden
## 971   2020 President polls-plus  6/18/2020         Trump          Biden
## 972   2020 President polls-plus  6/18/2020         Trump          Biden
## 973   2020 President polls-plus  6/18/2020         Trump          Biden
## 974   2020 President polls-plus  6/17/2020         Trump          Biden
## 975   2020 President polls-plus  6/17/2020         Trump          Biden
## 976   2020 President polls-plus  6/17/2020         Trump          Biden
## 977   2020 President polls-plus  6/17/2020         Trump          Biden
## 978   2020 President polls-plus  6/17/2020         Trump          Biden
## 979   2020 President polls-plus  6/17/2020         Trump          Biden
## 980   2020 President polls-plus  6/17/2020         Trump          Biden
## 981   2020 President polls-plus  6/16/2020         Trump          Biden
## 982   2020 President polls-plus  6/16/2020         Trump          Biden
## 983   2020 President polls-plus  6/16/2020         Trump          Biden
## 984   2020 President polls-plus  6/16/2020         Trump          Biden
## 985   2020 President polls-plus  6/16/2020         Trump          Biden
## 986   2020 President polls-plus  6/16/2020         Trump          Biden
## 987   2020 President polls-plus  6/16/2020         Trump          Biden
## 988   2020 President polls-plus  6/15/2020         Trump          Biden
## 989   2020 President polls-plus  6/15/2020         Trump          Biden
## 990   2020 President polls-plus  6/15/2020         Trump          Biden
## 991   2020 President polls-plus  6/15/2020         Trump          Biden
## 992   2020 President polls-plus  6/15/2020         Trump          Biden
## 993   2020 President polls-plus  6/15/2020         Trump          Biden
## 994   2020 President polls-plus  6/15/2020         Trump          Biden
## 995   2020 President polls-plus  6/14/2020         Trump          Biden
## 996   2020 President polls-plus  6/14/2020         Trump          Biden
## 997   2020 President polls-plus  6/14/2020         Trump          Biden
## 998   2020 President polls-plus  6/14/2020         Trump          Biden
## 999   2020 President polls-plus  6/14/2020         Trump          Biden
## 1000  2020 President polls-plus  6/14/2020         Trump          Biden
## 1001  2020 President polls-plus  6/14/2020         Trump          Biden
## 1002  2020 President polls-plus  6/13/2020         Trump          Biden
## 1003  2020 President polls-plus  6/13/2020         Trump          Biden
## 1004  2020 President polls-plus  6/13/2020         Trump          Biden
## 1005  2020 President polls-plus  6/13/2020         Trump          Biden
## 1006  2020 President polls-plus  6/13/2020         Trump          Biden
## 1007  2020 President polls-plus  6/13/2020         Trump          Biden
## 1008  2020 President polls-plus  6/13/2020         Trump          Biden
## 1009  2020 President polls-plus  6/12/2020         Trump          Biden
## 1010  2020 President polls-plus  6/12/2020         Trump          Biden
## 1011  2020 President polls-plus  6/12/2020         Trump          Biden
## 1012  2020 President polls-plus  6/12/2020         Trump          Biden
## 1013  2020 President polls-plus  6/12/2020         Trump          Biden
## 1014  2020 President polls-plus  6/12/2020         Trump          Biden
## 1015  2020 President polls-plus  6/12/2020         Trump          Biden
## 1016  2020 President polls-plus  6/11/2020         Trump          Biden
## 1017  2020 President polls-plus  6/11/2020         Trump          Biden
## 1018  2020 President polls-plus  6/11/2020         Trump          Biden
## 1019  2020 President polls-plus  6/11/2020         Trump          Biden
## 1020  2020 President polls-plus  6/11/2020         Trump          Biden
## 1021  2020 President polls-plus  6/11/2020         Trump          Biden
## 1022  2020 President polls-plus  6/11/2020         Trump          Biden
## 1023  2020 President polls-plus  6/10/2020         Trump          Biden
## 1024  2020 President polls-plus  6/10/2020         Trump          Biden
## 1025  2020 President polls-plus  6/10/2020         Trump          Biden
## 1026  2020 President polls-plus  6/10/2020         Trump          Biden
## 1027  2020 President polls-plus  6/10/2020         Trump          Biden
## 1028  2020 President polls-plus  6/10/2020         Trump          Biden
## 1029  2020 President polls-plus  6/10/2020         Trump          Biden
## 1030  2020 President polls-plus   6/9/2020         Trump          Biden
## 1031  2020 President polls-plus   6/9/2020         Trump          Biden
## 1032  2020 President polls-plus   6/9/2020         Trump          Biden
## 1033  2020 President polls-plus   6/9/2020         Trump          Biden
## 1034  2020 President polls-plus   6/9/2020         Trump          Biden
## 1035  2020 President polls-plus   6/9/2020         Trump          Biden
## 1036  2020 President polls-plus   6/9/2020         Trump          Biden
## 1037  2020 President polls-plus   6/8/2020         Trump          Biden
## 1038  2020 President polls-plus   6/8/2020         Trump          Biden
## 1039  2020 President polls-plus   6/8/2020         Trump          Biden
## 1040  2020 President polls-plus   6/8/2020         Trump          Biden
## 1041  2020 President polls-plus   6/8/2020         Trump          Biden
## 1042  2020 President polls-plus   6/8/2020         Trump          Biden
## 1043  2020 President polls-plus   6/8/2020         Trump          Biden
## 1044  2020 President polls-plus   6/7/2020         Trump          Biden
## 1045  2020 President polls-plus   6/7/2020         Trump          Biden
## 1046  2020 President polls-plus   6/7/2020         Trump          Biden
## 1047  2020 President polls-plus   6/7/2020         Trump          Biden
## 1048  2020 President polls-plus   6/7/2020         Trump          Biden
## 1049  2020 President polls-plus   6/7/2020         Trump          Biden
## 1050  2020 President polls-plus   6/7/2020         Trump          Biden
## 1051  2020 President polls-plus   6/6/2020         Trump          Biden
## 1052  2020 President polls-plus   6/6/2020         Trump          Biden
## 1053  2020 President polls-plus   6/6/2020         Trump          Biden
## 1054  2020 President polls-plus   6/6/2020         Trump          Biden
## 1055  2020 President polls-plus   6/6/2020         Trump          Biden
## 1056  2020 President polls-plus   6/6/2020         Trump          Biden
## 1057  2020 President polls-plus   6/6/2020         Trump          Biden
## 1058  2020 President polls-plus   6/5/2020         Trump          Biden
## 1059  2020 President polls-plus   6/5/2020         Trump          Biden
## 1060  2020 President polls-plus   6/5/2020         Trump          Biden
## 1061  2020 President polls-plus   6/5/2020         Trump          Biden
## 1062  2020 President polls-plus   6/5/2020         Trump          Biden
## 1063  2020 President polls-plus   6/5/2020         Trump          Biden
## 1064  2020 President polls-plus   6/5/2020         Trump          Biden
## 1065  2020 President polls-plus   6/4/2020         Trump          Biden
## 1066  2020 President polls-plus   6/4/2020         Trump          Biden
## 1067  2020 President polls-plus   6/4/2020         Trump          Biden
## 1068  2020 President polls-plus   6/4/2020         Trump          Biden
## 1069  2020 President polls-plus   6/4/2020         Trump          Biden
## 1070  2020 President polls-plus   6/4/2020         Trump          Biden
## 1071  2020 President polls-plus   6/4/2020         Trump          Biden
## 1072  2020 President polls-plus   6/3/2020         Trump          Biden
## 1073  2020 President polls-plus   6/3/2020         Trump          Biden
## 1074  2020 President polls-plus   6/3/2020         Trump          Biden
## 1075  2020 President polls-plus   6/3/2020         Trump          Biden
## 1076  2020 President polls-plus   6/3/2020         Trump          Biden
## 1077  2020 President polls-plus   6/3/2020         Trump          Biden
## 1078  2020 President polls-plus   6/3/2020         Trump          Biden
## 1079  2020 President polls-plus   6/2/2020         Trump          Biden
## 1080  2020 President polls-plus   6/2/2020         Trump          Biden
## 1081  2020 President polls-plus   6/2/2020         Trump          Biden
## 1082  2020 President polls-plus   6/2/2020         Trump          Biden
## 1083  2020 President polls-plus   6/2/2020         Trump          Biden
## 1084  2020 President polls-plus   6/2/2020         Trump          Biden
## 1085  2020 President polls-plus   6/2/2020         Trump          Biden
## 1086  2020 President polls-plus   6/1/2020         Trump          Biden
## 1087  2020 President polls-plus   6/1/2020         Trump          Biden
## 1088  2020 President polls-plus   6/1/2020         Trump          Biden
## 1089  2020 President polls-plus   6/1/2020         Trump          Biden
## 1090  2020 President polls-plus   6/1/2020         Trump          Biden
## 1091  2020 President polls-plus   6/1/2020         Trump          Biden
## 1092  2020 President polls-plus   6/1/2020         Trump          Biden
##      candidate_3rd current_zscore projected_zscore projected_hi projected_lo
## 1               NA      0.5749069        0.5749069    0.5749069    0.5749069
## 2               NA     -0.5550531       -0.5550531   -0.5550531   -0.5550531
## 3               NA     -1.4632960       -1.4632960   -1.4632960   -1.4632960
## 4               NA     -2.7627440       -2.7627440   -2.7627440   -2.7627440
## 5               NA      0.6586296        0.6586296    0.6586296    0.6586296
## 6               NA      1.2295160        1.2295160    1.2295160    1.2295160
## 7               NA     -0.3863400       -0.3863400   -0.3863400   -0.3863400
## 8               NA      0.5749069        0.5728478    0.5914657    0.5542299
## 9               NA     -0.5550531       -0.5458516   -0.5272337   -0.5644695
## 10              NA     -1.4632960       -1.4551720   -1.4365540   -1.4737900
## 11              NA     -2.7627440       -2.7507680   -2.7321510   -2.7693860
## 12              NA      0.6586296        0.6598516    0.6784695    0.6412337
## 13              NA      1.2295160        1.2247620    1.2433800    1.2061440
## 14              NA     -0.3863400       -0.3823884   -0.3692236   -0.3955533
## 15              NA      0.4917023        0.4876431    0.5248760    0.4504102
## 16              NA     -0.5550531       -0.5371021   -0.4998692   -0.5743350
## 17              NA     -1.4632960       -1.4475380   -1.4103050   -1.4847710
## 18              NA     -2.7627440       -2.7390530   -2.7018210   -2.7762860
## 19              NA      0.6586296        0.6610737    0.6983066    0.6238408
## 20              NA      1.2295160        1.2199540    1.2571870    1.1827210
## 21              NA     -0.4002074       -0.3925037   -0.3661761   -0.4188313
## 22              NA      0.4917023        0.4856135    0.5414628    0.4297642
## 23              NA     -0.5550531       -0.5281265   -0.4722772   -0.5839759
## 24              NA     -1.4632960       -1.4396590   -1.3838100   -1.4955080
## 25              NA     -2.7627440       -2.7272080   -2.6713590   -2.7830570
## 26              NA      0.6586296        0.6622957    0.7181450    0.6064464
## 27              NA      1.2295160        1.2151730    1.2710230    1.1593240
## 28              NA     -0.4002074       -0.3886519   -0.3491605   -0.4281433
## 29              NA      0.4917023        0.4835839    0.5586132    0.4085546
## 30              NA     -1.3651420       -1.3266080   -1.2515790   -1.4016380
## 31              NA     -1.4632960       -1.4317800   -1.3567510   -1.5068100
## 32              NA     -2.7627440       -2.7153630   -2.6403330   -2.7903920
## 33              NA      0.6586296        0.6635178    0.7385471    0.5884884
## 34              NA      1.1382750        1.1206400    1.1956690    1.0456110
## 35              NA     -0.5504292       -0.5343350   -0.4812812   -0.5873887
## 36              NA      0.5823077        0.5720065    0.6658235    0.4781895
## 37              NA     -1.4521900       -1.4023360   -1.3085190   -1.4961530
## 38              NA     -1.4632960       -1.4224820   -1.3286650   -1.5162990
## 39              NA     -2.7627440       -2.7027630   -2.6089460   -2.7965800
## 40              NA      0.6586296        0.6647398    0.7585568    0.5709228
## 41              NA      0.6656389        0.6446980    0.7385150    0.5508810
## 42              NA     -0.6286088       -0.6076894   -0.5413508   -0.6740281
## 43              NA      0.5008667        0.4886798    0.6012609    0.3760987
## 44              NA     -1.4521900       -1.3936930   -1.2811120   -1.5062750
## 45              NA     -1.4632960       -1.4157580   -1.3031770   -1.5283390
## 46              NA     -2.7627440       -2.6915320   -2.5789510   -2.8041130
## 47              NA      0.6586296        0.6659618    0.7785429    0.5533807
## 48              NA      0.6656389        0.6403539    0.7529350    0.5277727
## 49              NA     -0.6421824       -0.6176646   -0.5380577   -0.6972715
## 50              NA      0.7569501        0.7421317    0.8733967    0.6108666
## 51              NA     -1.4521900       -1.3788590   -1.2475940   -1.5101240
## 52              NA     -1.4632960       -1.4023260   -1.2710610   -1.5335910
## 53              NA     -2.7627440       -2.6767340   -2.5454690   -2.8079990
## 54              NA      0.6586296        0.6671839    0.7984489    0.5359188
## 55              NA      0.6656389        0.6367369    0.7680020    0.5054719
## 56              NA     -0.5995018       -0.5686444   -0.4758260   -0.6614628
## 57              NA      0.7824879        0.7655333    0.9155709    0.6154958
## 58              NA     -1.4521900       -1.3677530   -1.2177150   -1.5177900
## 59              NA     -1.4632960       -1.3929330   -1.2428960   -1.5429710
## 60              NA     -2.7627440       -2.6640840   -2.5140460   -2.8141210
## 61              NA      0.6586296        0.6684059    0.8184434    0.5183684
## 62              NA      0.6656389        0.6326821    0.7827196    0.4826446
## 63              NA     -0.5952455       -0.5596914   -0.4535989   -0.6657840
## 64              NA      0.9200202        0.9005930    1.0693440    0.7318423
## 65              NA     -1.4521900       -1.3536600   -1.1849090   -1.5224110
## 66              NA     -1.4632960       -1.3803060   -1.2115550   -1.5490560
## 67              NA     -2.7627440       -2.6497140   -2.4809630   -2.8184640
## 68              NA      0.6586296        0.6696280    0.8383787    0.5008773
## 69              NA      0.6656389        0.6289780    0.7977287    0.4602273
## 70              NA     -0.5723234       -0.5307467   -0.4114220   -0.6500714
## 71              NA      0.9200202        0.8984345    1.0859350    0.7109337
## 72              NA     -1.4521900       -1.3427120   -1.1552120   -1.5302130
## 73              NA     -1.4632960       -1.3710840   -1.1835840   -1.5585850
## 74              NA     -2.7627440       -2.6371550   -2.4496540   -2.8246550
## 75              NA      0.6586296        0.6708500    0.8583508    0.4833492
## 76              NA      0.6656389        0.6249046    0.8124053    0.4374038
## 77              NA     -0.5723234       -0.5261270   -0.3935440   -0.6587101
## 78              NA      0.9200202        0.8962759    1.1025270    0.6900250
## 79              NA     -1.4521900       -1.3317650   -1.1255140   -1.5380150
## 80              NA     -1.4632960       -1.3618630   -1.1556120   -1.5681140
## 81              NA     -2.7627440       -2.6245960   -2.4183450   -2.8308470
## 82              NA      0.6586296        0.6720720    0.8783228    0.4658211
## 83              NA      0.6656389        0.6208311    0.8270820    0.4145803
## 84              NA     -0.5723234       -0.5215074   -0.3756660   -0.6673487
## 85              NA      0.8992956        0.8735979    1.0986340    0.6485615
## 86              NA     -1.4521900       -1.3214360   -1.0964000   -1.5464720
## 87              NA     -1.4632960       -1.3533130   -1.1282760   -1.5783490
## 88              NA     -2.7627440       -2.6123930   -2.3873570   -2.8374300
## 89              NA      0.6586296        0.6732941    0.8983304    0.4482577
## 90              NA      0.6656389        0.6166849    0.8417212    0.3916486
## 91              NA     -0.5757775       -0.5205942   -0.3614695   -0.6797190
## 92              NA      0.8658906        0.8383233    1.0821380    0.5945089
## 93              NA     -1.4521900       -1.3116770   -1.0678620   -1.5554910
## 94              NA     -1.4632960       -1.3453790   -1.1015640   -1.5891930
## 95              NA     -2.7627440       -2.6005190   -2.3567040   -2.8443330
## 96              NA      0.6586296        0.6745161    0.9183304    0.4307017
## 97              NA      0.6656389        0.6124719    0.8562863    0.3686576
## 98              NA     -0.5813450       -0.5220438   -0.3496411   -0.6944466
## 99              NA      0.8854578        0.8558034    1.1184090    0.5931979
## 100             NA     -1.4521900       -1.3000120   -1.0374060   -1.5626180
## 101             NA     -1.4632960       -1.3353810   -1.0727750   -1.5979860
## 102             NA     -2.7627440       -2.5875470   -2.3249410   -2.8501520
## 103             NA      0.6586296        0.6757382    0.9383437    0.4131326
## 104             NA      0.6656389        0.6084828    0.8710883    0.3458772
## 105             NA     -0.5780838       -0.5138192   -0.3281291   -0.6995094
## 106             NA      0.8555455        0.8240662    1.1054570    0.5426749
## 107             NA     -1.4521900       -1.2903130   -1.0089210   -1.5717040
## 108             NA     -1.4632960       -1.3275120   -1.0461210   -1.6089040
## 109             NA     -2.7627440       -2.5757070   -2.2943160   -2.8570980
## 110             NA      0.6586296        0.6769602    0.9583514    0.3955689
## 111             NA      0.6656389        0.6042627    0.8856540    0.3228715
## 112             NA     -0.5830692       -0.5147071   -0.3157335   -0.7136808
## 113             NA      0.9768798        0.9427938    1.2428930    0.6426945
## 114             NA     -1.4521900       -1.2739760   -0.9738768   -1.5740750
## 115             NA     -1.4632960       -1.3124540   -1.0123540   -1.6125530
## 116             NA     -2.7627440       -2.5600440   -2.2599450   -2.8601440
## 117             NA      0.6586296        0.6781822    0.9782815    0.3780829
## 118             NA      0.6656389        0.6008220    0.9009213    0.3007227
## 119             NA     -0.5628468       -0.4874460   -0.2752437   -0.6996482
## 120             NA      0.9768798        0.9406635    1.2595190    0.6218079
## 121             NA     -1.4521900       -1.2628380   -0.9439822   -1.5816930
## 122             NA     -1.4632960       -1.3030260   -0.9841704   -1.6218810
## 123             NA     -2.7627440       -2.5473760   -2.2285200   -2.8662310
## 124             NA      0.6586296        0.6794043    0.9982598    0.3605488
## 125             NA      0.6656389        0.5967710    0.9156265    0.2779155
## 126             NA     -0.5628468       -0.4827334   -0.2572685   -0.7081983
## 127             NA      0.9768798        0.9385331    1.2761450    0.6009213
## 128             NA     -1.4521900       -1.2516990   -0.9140877   -1.5893110
## 129             NA     -1.4632960       -1.2935980   -0.9559866   -1.6312100
## 130             NA     -2.7627440       -2.5347070   -2.1970950   -2.8723190
## 131             NA      0.6586296        0.6806263    1.0182380    0.3430146
## 132             NA      0.6656389        0.5927199    0.9303316    0.2551082
## 133             NA     -0.5628468       -0.4780209   -0.2392934   -0.7167484
## 134             NA      0.9725868        0.9324245    1.2892530    0.5755957
## 135             NA     -1.4521900       -1.2406800   -0.8838512   -1.5975090
## 136             NA     -1.6259100       -1.4442130   -1.0873840   -1.8010420
## 137             NA     -2.7627440       -2.5221070   -2.1652780   -2.8789360
## 138             NA      0.6025671        0.6251516    0.9819804    0.2683227
## 139             NA      0.6656389        0.5886549    0.9454838    0.2318261
## 140             NA     -0.6000084       -0.5101281   -0.2578120   -0.7624443
## 141             NA      0.9874091        0.9452695    1.3209450    0.5695944
## 142             NA     -1.4521900       -1.2286100   -0.8529352   -1.6042850
## 143             NA     -1.6259100       -1.4336340   -1.0579590   -1.8093090
## 144             NA     -2.7627440       -2.5089010   -2.1332260   -2.8845770
## 145             NA      0.6025671        0.6263402    1.0020150    0.2506651
## 146             NA      0.6656389        0.5847133    0.9603884    0.2090382
## 147             NA     -0.5975380       -0.5024705   -0.2368281   -0.7681129
## 148             NA      1.0386290        0.9942777    1.3887520    0.5998031
## 149             NA     -1.4521900       -1.2143050   -0.8198305   -1.6087800
## 150             NA     -1.6259100       -1.4206340   -1.0261590   -1.8151080
## 151             NA     -2.7627440       -2.4944080   -2.0999340   -2.8888830
## 152             NA      0.6025671        0.6275289    1.0220030    0.2330544
## 153             NA      0.6656389        0.5810344    0.9755089    0.1865598
## 154             NA     -0.5890014       -0.4877510   -0.2088154   -0.7666867
## 155             NA      1.0875730        1.0410460    1.4543230    0.6277683
## 156             NA     -1.4521900       -1.1998480   -0.7865706   -1.6131250
## 157             NA     -1.6259100       -1.4074690   -0.9941916   -1.8207460
## 158             NA     -2.7627440       -2.4798280   -2.0665510   -2.8931060
## 159             NA      0.6025671        0.6287175    1.0419950    0.2154402
## 160             NA      0.6656389        0.5773729    0.9906502    0.1640956
## 161             NA     -0.5808441       -0.4733348   -0.1811036   -0.7655660
## 162             NA      0.9751105        0.9276743    1.3596930    0.4956554
## 163             NA     -1.4521900       -1.1955390   -0.7635198   -1.6275580
## 164             NA     -1.6259100       -1.4052970   -0.9732782   -1.8373160
## 165             NA     -2.7627440       -2.4710930   -2.0390740   -2.9031110
## 166             NA      0.6025671        0.6299062    1.0619250    0.1978873
## 167             NA      0.6656389        0.5725198    1.0045390    0.1405010
## 168             NA     -0.5995877       -0.4903047   -0.1848212   -0.7957881
## 169             NA      0.9751105        0.9256119    1.3764140    0.4748096
## 170             NA     -1.4521900       -1.1843800   -0.7335777   -1.6351820
## 171             NA     -1.6259100       -1.3957050   -0.9449030   -1.8465070
## 172             NA     -2.7627440       -2.4584120   -2.0076100   -2.9092140
## 173             NA      0.6025671        0.6310949    1.0818970    0.1802926
## 174             NA      0.6656389        0.5684712    1.0192730    0.1176689
## 175             NA     -0.5995877       -0.4855532   -0.1667879   -0.8043185
## 176             NA      0.9750898        0.9235289    1.3931150    0.4539432
## 177             NA     -1.4521900       -1.1732220   -0.7036366   -1.6428080
## 178             NA     -1.6259100       -1.3861150   -0.9165292   -1.8557000
## 179             NA     -2.7627440       -2.4457330   -1.9761470   -2.9153180
## 180             NA      0.6025671        0.6322835    1.1018690    0.1626978
## 181             NA      0.6656389        0.5644225    1.0340080    0.0948369
## 182             NA     -0.5995912       -0.4808058   -0.1487586   -0.8128530
## 183             NA      0.9161234        0.8633307    1.3516970    0.3749647
## 184             NA     -1.4521900       -1.1662580   -0.6778914   -1.6546240
## 185             NA     -1.6259100       -1.3810660   -0.8927003   -1.8694320
## 186             NA     -2.7627440       -2.4354680   -1.9471020   -2.9238340
## 187             NA      0.6025671        0.6334722    1.1218380    0.1451061
## 188             NA      0.6656389        0.5598813    1.0482470    0.0715152
## 189             NA     -0.6094189       -0.4876846   -0.1423576   -0.8330116
## 190             NA      0.8627464        0.8086958    1.3158950    0.3014968
## 191             NA     -1.4521900       -1.1251090   -0.6179100   -1.6323080
## 192             NA     -1.6259100       -1.3492090   -0.8420101   -1.8564080
## 193             NA     -2.7627440       -2.4047220   -1.8975230   -2.9119210
## 194             NA      0.6025671        0.6416451    1.1488440    0.1344461
## 195             NA      0.6656389        0.5745167    1.0817160    0.0673177
## 196             NA     -0.6183151       -0.4756970   -0.1170532   -0.8343408
## 197             NA      0.7422428        0.6875903    1.2134880    0.1616923
## 198             NA     -1.4521900       -1.1223620   -0.5964635   -1.6482600
## 199             NA     -1.6259100       -1.3491080   -0.8232103   -1.8750060
## 200             NA     -2.7627440       -2.3968570   -1.8709590   -2.9227550
## 201             NA      0.6025671        0.6430925    1.1689900    0.1171944
## 202             NA      0.6656389        0.5700418    1.0959400    0.0441438
## 203             NA     -0.6383991       -0.4946003   -0.1227343   -0.8664664
## 204             NA      0.8459117        0.7884979    1.3354510    0.2415449
## 205             NA     -1.4521900       -1.1020300   -0.5550773   -1.6489830
## 206             NA     -1.6259100       -1.3299580   -0.7830053   -1.8769110
## 207             NA     -3.2045520       -2.8644290   -2.3174770   -3.4113820
## 208             NA      0.6025671        0.6445398    1.1914930    0.0975868
## 209             NA      0.6656389        0.5676320    1.1145850    0.0206790
## 210             NA     -0.6947556       -0.5492914   -0.1625372   -0.9360456
## 211             NA      0.7222743        0.6644047    1.2301730    0.0986360
## 212             NA     -1.4521900       -1.1002670   -0.5344986   -1.6660360
## 213             NA     -1.6259100       -1.3309230   -0.7651548   -1.8966920
## 214             NA     -3.2045520       -2.8586410   -2.2928720   -3.4244090
## 215             NA      0.6025671        0.6459871    1.2117560    0.0802184
## 216             NA      0.6656389        0.5630414    1.1288100   -0.0027272
## 217             NA     -0.7153618       -0.5693997   -0.1693409   -0.9694586
## 218             NA      0.7222743        0.6623473    1.2335900    0.0911050
## 219             NA     -1.4521900       -1.0891170   -0.5178744   -1.6603590
## 220             NA     -1.6259100       -1.3214930   -0.7502505   -1.8927350
## 221             NA     -3.2045520       -2.8468570   -2.2756150   -3.4181000
## 222             NA      0.6025671        0.6474161    1.2186580    0.0761739
## 223             NA      0.6656389        0.5594752    1.1307170   -0.0117670
## 224             NA     -0.7153618       -0.5647047   -0.1607755   -0.9686339
## 225             NA      0.7222743        0.6602898    1.2370060    0.0835740
## 226             NA     -1.4521900       -1.0779660   -0.5012501   -1.6546820
## 227             NA     -1.6259100       -1.3120620   -0.7353461   -1.8887780
## 228             NA     -3.2045520       -2.8350740   -2.2583580   -3.4117900
## 229             NA      0.6025671        0.6488451    1.2255610    0.0721294
## 230             NA      0.6656389        0.5559089    1.1326250   -0.0208068
## 231             NA     -0.7153618       -0.5600097   -0.1522100   -0.9678093
## 232             NA      0.7945145        0.7297305    1.3114050    0.1480563
## 233             NA     -1.4521900       -1.0601150   -0.4784406   -1.6417890
## 234             NA     -1.6259100       -1.2953140   -0.7136397   -1.8769880
## 235             NA     -3.2604230       -2.8765420   -2.2948680   -3.4582160
## 236             NA      0.6025671        0.6502742    1.2319480    0.0685999
## 237             NA      0.6656389        0.5531510    1.1348250   -0.0285232
## 238             NA     -0.7126337       -0.5498025   -0.1384967   -0.9611083
## 239             NA      0.7605334        0.6943838    1.2741460    0.1146215
## 240             NA     -1.9790270       -1.5655130   -0.9857512   -2.1452760
## 241             NA     -1.6259100       -1.2890420   -0.7092801   -1.8688050
## 242             NA     -3.2604230       -2.8664580   -2.2866950   -3.4462200
## 243             NA      0.6025671        0.6517032    1.2314650    0.0719409
## 244             NA      2.8913830        2.7922170    3.3719790    2.2124550
## 245             NA     -0.4351460       -0.2637850    0.1461689   -0.6737388
## 246             NA      0.7053884        0.6382558    1.2234510    0.0530605
## 247             NA     -1.9790270       -1.5589240   -0.9737285   -2.1441190
## 248             NA     -1.6259100       -1.2851870   -0.6999919   -1.8703830
## 249             NA     -3.2604230       -2.8576650   -2.2724700   -3.4428610
## 250             NA      0.6025671        0.6531322    1.2383280    0.0679369
## 251             NA      2.8913830        2.7878260    3.3730210    2.2026300
## 252             NA     -0.4443369       -0.2704271    0.1433685   -0.6842227
## 253             NA      0.7436004        0.6740435    1.2647730    0.0833136
## 254             NA     -1.9790270       -1.5434230   -0.9526929   -2.1341530
## 255             NA     -1.6259100       -1.2715570   -0.6808269   -1.8622870
## 256             NA     -3.2604230       -2.8436570   -2.2529270   -3.4343870
## 257             NA      0.6025671        0.6545613    1.2452910    0.0638314
## 258             NA      2.8913830        2.7845250    3.3752550    2.1937950
## 259             NA     -0.4379682       -0.2575843    0.1601247   -0.6752934
## 260             NA      0.6333736        0.5639390    1.1600250   -0.0321474
## 261             NA     -1.9790270       -1.5426680   -0.9465815   -2.1387540
## 262             NA     -1.6259100       -1.2741580   -0.6780716   -1.8702450
## 263             NA     -3.2604230       -2.8383180   -2.2422310   -3.4344040
## 264             NA      0.6025671        0.6559903    1.2520770    0.0599038
## 265             NA      2.8913830        2.7793990    3.3754850    2.1833120
## 266             NA     -0.4563393       -0.2759693    0.1455275   -0.6974661
## 267             NA      0.6333736        0.5620031    1.1634880   -0.0394815
## 268             NA     -1.9790270       -1.5311830   -0.9296981   -2.1326670
## 269             NA     -1.6259100       -1.2649600   -0.6634755   -1.8664450
## 270             NA     -3.2604230       -2.8266790   -2.2251940   -3.4281630
## 271             NA      0.6025671        0.6574193    1.2589040    0.0559348
## 272             NA      2.8913830        2.7755970    3.3770820    2.1741130
## 273             NA     -0.4563393       -0.2713003    0.1540135   -0.6966141
## 274             NA      0.6333736        0.5600671    1.1669500   -0.0468155
## 275             NA     -1.9790270       -1.5196970   -0.9128149   -2.1265800
## 276             NA     -1.6259100       -1.2557620   -0.6488794   -1.8626450
## 277             NA     -3.2604230       -2.8150390   -2.2081570   -3.4219220
## 278             NA      0.6025671        0.6588483    1.2657310    0.0519657
## 279             NA      2.8913830        2.7717950    3.3786780    2.1649130
## 280             NA     -0.4563393       -0.2666313    0.1624995   -0.6957622
## 281             NA      0.5230193        0.4502226    1.0624130   -0.1619673
## 282             NA     -1.9790270       -1.5199780   -0.9077879   -2.1321680
## 283             NA     -1.6259100       -1.2596020   -0.6474122   -1.8717920
## 284             NA     -3.2604230       -2.8103770   -2.1981870   -3.4225670
## 285             NA      0.6025671        0.6602774    1.2724670    0.0480875
## 286             NA      2.8913830        2.7665040    3.3786940    2.1543150
## 287             NA     -0.4747317       -0.2854921    0.1473915   -0.7183757
## 288             NA      0.5054775        0.4313202    1.0490080   -0.1863675
## 289             NA     -1.9790270       -1.5105770   -0.8928892   -2.1282640
## 290             NA     -1.6259100       -1.2527400   -0.6350527   -1.8704280
## 291             NA     -3.2604230       -2.7999920   -2.1823040   -3.4176800
## 292             NA      0.6025671        0.6617064    1.2793940    0.0440187
## 293             NA      2.8913830        2.7624290    3.3801170    2.1447410
## 294             NA     -0.4776554       -0.2846422    0.1521289   -0.7214134
## 295             NA      0.6787787        0.5989662    1.2218250   -0.0238922
## 296             NA     -1.9790270       -1.4798530   -0.8569943   -2.1027110
## 297             NA     -1.6259100       -1.2221760   -0.5993176   -1.8450340
## 298             NA     -3.2604230       -2.7769120   -2.1540540   -3.3997710
## 299             NA      0.6025671        0.6631354    1.2859940    0.0402770
## 300             NA      2.8913830        2.7610790    3.3839380    2.1382210
## 301             NA     -0.4487718       -0.2426267    0.1978007   -0.6830541
## 302             NA      0.6074108        0.5275533    1.1558010   -0.1006941
## 303             NA     -1.9790270       -1.4763370   -0.8480892   -2.1045840
## 304             NA     -1.6259100       -1.2218430   -0.5935957   -1.8500910
## 305             NA     -3.2604230       -2.7700220   -2.1417740   -3.3982690
## 306             NA      0.6025671        0.6645644    1.2928120    0.0363170
## 307             NA      2.8913830        2.7562560    3.3845040    2.1280090
## 308             NA     -0.4606665       -0.2533046    0.1909334   -0.6975426
## 309             NA      0.6949242        0.6111798    1.2448070   -0.0224471
## 310             NA     -1.9790270       -1.4545940   -0.8209677   -2.0882210
## 311             NA     -1.6259100       -1.2012100   -0.5675827   -1.8348360
## 312             NA     -3.2604230       -2.7522540   -2.1186270   -3.3858800
## 313             NA      0.6025671        0.6659935    1.2996200    0.0323666
## 314             NA      2.8913830        2.7537780    3.3874050    2.1201510
## 315             NA     -0.4460809       -0.2295177    0.2185241   -0.6775596
## 316             NA      0.6949242        0.6091890    1.2482120   -0.0298337
## 317             NA     -1.9790270       -1.4429560   -0.8039338   -2.0819790
## 318             NA     -1.6259100       -1.1918280   -0.5528057   -1.8308510
## 319             NA     -3.2604230       -2.7405140   -2.1014920   -3.3795370
## 320             NA      0.6025671        0.6674225    1.3064450    0.0283998
## 321             NA      2.8913830        2.7500000    3.3890230    2.1109780
## 322             NA     -0.4460809       -0.2247812    0.2270761   -0.6766384
## 323             NA      0.6949242        0.6071981    1.2516170   -0.0372204
## 324             NA     -1.9790270       -1.4313180   -0.7868999   -2.0757370
## 325             NA     -1.6259100       -1.1824470   -0.5380287   -1.8268660
## 326             NA     -3.2604230       -2.7287750   -2.0843570   -3.3731940
## 327             NA      0.6025671        0.6688516    1.3132700    0.0244330
## 328             NA      2.8913830        2.7462230    3.3906420    2.1018050
## 329             NA     -0.4460809       -0.2200446    0.2356281   -0.6757174
## 330             NA      0.7786006        0.6868388    1.3365910    0.0370871
## 331             NA     -1.9790270       -1.4092370   -0.7594857   -2.0589890
## 332             NA     -1.6259100       -1.1613700   -0.5116181   -1.8111210
## 333             NA     -3.2604230       -2.7107590   -2.0610070   -3.3605110
## 334             NA      0.6025671        0.6702806    1.3200320    0.0205289
## 335             NA      2.8913830        2.7438130    3.3935640    2.0940610
## 336             NA     -0.4321348       -0.1967390    0.2627048   -0.6561828
## 337             NA      0.8424696        0.7471771    1.4023340    0.0920204
## 338             NA     -1.9790270       -1.3892690   -0.7341128   -2.0444260
## 339             NA     -1.6259100       -1.1426320   -0.4874756   -1.7977890
## 340             NA     -3.2604230       -2.6939940   -2.0388380   -3.3491510
## 341             NA      0.6025671        0.6717096    1.3268660    0.0165529
## 342             NA      2.8913830        2.7411360    3.3962920    2.0859790
## 343             NA     -0.4214900       -0.1776456    0.2856202   -0.6409113
## 344             NA      0.8792177        0.7811658    1.4417530    0.1205781
## 345             NA     -1.9790270       -1.3724940   -0.7119060   -2.0330810
## 346             NA     -1.6259100       -1.1274560   -0.4668683   -1.7880440
## 347             NA     -3.2604230       -2.6791390   -2.0185510   -3.3397260
## 348             NA      0.6025671        0.6731386    1.3337260    0.0125510
## 349             NA      2.8913830        2.7380460    3.3986330    2.0774580
## 350             NA     -0.4153653       -0.1644564    0.3026496   -0.6315624
## 351             NA      0.8476182        0.7488744    1.4158110    0.0819374
## 352             NA     -1.9790270       -1.3644930   -0.6975566   -2.0314300
## 353             NA     -2.0572160       -1.5987080   -0.9317710   -2.2656450
## 354             NA     -3.2604230       -2.6695740   -2.0026380   -3.3365110
## 355             NA      0.6458718        0.7161678    1.3831050    0.0492309
## 356             NA      2.8913830        2.7337980    3.4007350    2.0668610
## 357             NA     -0.4852988       -0.2389892    0.2326064   -0.7105849
## 358             NA      0.7613009        0.6637105    1.3359830   -0.0085623
## 359             NA     -1.9790270       -1.3639240   -0.6916515   -2.0361970
## 360             NA     -2.0572160       -1.6024510   -0.9301785   -2.2747240
## 361             NA     -3.2604230       -2.6645120   -1.9922400   -3.3367850
## 362             NA      0.6458718        0.7176017    1.3898740    0.0453289
## 363             NA      2.8913830        2.7285590    3.4008320    2.0562870
## 364             NA     -0.4996850       -0.2535028    0.2218659   -0.7288714
## 365             NA      0.7613009        0.6616845    1.3393600   -0.0159914
## 366             NA     -1.9790270       -1.3521250   -0.6744494   -2.0298010
## 367             NA     -2.0572160       -1.5935700   -0.9158938   -2.2712460
## 368             NA     -3.2604230       -2.6526680   -1.9749920   -3.3303440
## 369             NA      0.6458718        0.7190356    1.3967110    0.0413596
## 370             NA      2.8913830        2.7248080    3.4024830    2.0471320
## 371             NA     -0.4996850       -0.2488059    0.2303833   -0.7279952
## 372             NA      0.7613009        0.6596586    1.3427380   -0.0234205
## 373             NA     -1.9790270       -1.3403270   -0.6572475   -2.0234060
## 374             NA     -2.0572160       -1.5846880   -0.9016092   -2.2677670
## 375             NA     -3.2604230       -2.6408230   -1.9577440   -3.3239020
## 376             NA      0.6458718        0.7204695    1.4035490    0.0373904
## 377             NA      2.8913830        2.7210560    3.4041350    2.0379770
## 378             NA     -0.4996850       -0.2441090    0.2389008   -0.7271189
## 379             NA      0.7611750        0.6579434    1.3465580   -0.0306709
## 380             NA     -1.9790270       -1.3284920   -0.6398779   -2.0171070
## 381             NA     -2.0572160       -1.5757660   -0.8871521   -2.2643810
## 382             NA     -3.2604230       -2.6289570   -1.9403430   -3.3175710
## 383             NA      0.6458718        0.7219034    1.4105180    0.0332891
## 384             NA      2.8913830        2.7173090    3.4059230    2.0286950
## 385             NA     -0.4997060       -0.2393433    0.2475805   -0.7262672
## 386             NA      0.8904973        0.7810007    1.4748480    0.0871536
## 387             NA     -1.9790270       -1.2422830   -0.5484359   -1.9361300
## 388             NA     -2.0572160       -1.5026400   -0.8087934   -2.1964880
## 389             NA     -3.2604230       -2.5720250   -1.8781780   -3.2658720
## 390             NA      0.6458718        0.7455913    1.4394380    0.0517442
## 391             NA      2.8913830        2.7471200    3.4409680    2.0532730
## 392             NA     -0.4781523       -0.1738726    0.3167514   -0.6644967
## 393             NA      0.7502039        0.6444213    1.3434770   -0.0546341
## 394             NA     -1.9790270       -1.2494610   -0.5504056   -1.9485160
## 395             NA     -2.0572160       -1.5155690   -0.8165140   -2.2146250
## 396             NA     -3.2604230       -2.5717160   -1.8726600   -3.2707710
## 397             NA      0.6458718        0.7473833    1.4464390    0.0483279
## 398             NA      2.8913830        2.7412190    3.4402740    2.0421630
## 399             NA     -0.5015345       -0.2006206    0.2936863   -0.6949274
## 400             NA      0.9536672        0.8385430    1.5426950    0.1343913
## 401             NA     -1.9790270       -1.2067510   -0.5025998   -1.9109030
## 402             NA     -2.0572160       -1.4720490   -0.7678977   -2.1762010
## 403             NA     -3.2604230       -2.5410280   -1.8368770   -3.2451800
## 404             NA      0.6458718        0.7491753    1.4533270    0.0450235
## 405             NA      2.8913830        2.7420590    3.4462110    2.0379070
## 406             NA     -0.4676240       -0.1483420    0.3495684   -0.6462525
## 407             NA      0.9536672        0.8363429    1.5458930    0.1267923
## 408             NA     -1.9790270       -1.1935160   -0.4839659   -1.9030670
## 409             NA     -2.0572160       -1.4618740   -0.7523237   -2.1714250
## 410             NA     -3.2604230       -2.5282850   -1.8187340   -3.2378360
## 411             NA      0.6458718        0.7509673    1.4605180    0.0414167
## 412             NA      2.8913830        2.7389180    3.4484690    2.0293680
## 413             NA     -0.4676240       -0.1429079    0.3588201   -0.6446359
## 414             NA      0.9536672        0.8341427    1.5490920    0.1191933
## 415             NA     -1.9790270       -1.1802820   -0.4653321   -1.8952310
## 416             NA     -2.0572160       -1.4516990   -0.7367496   -2.1666480
## 417             NA     -3.2604230       -2.5155420   -1.8005920   -3.2304910
## 418             NA      0.6458718        0.7527593    1.4677090    0.0378098
## 419             NA      2.8913830        2.7357780    3.4507270    2.0208280
## 420             NA     -0.4676240       -0.1374738    0.3680719   -0.6430194
## 421             NA      0.9536672        0.8319426    1.5509870    0.1128980
## 422             NA     -1.9790270       -1.1670460   -0.4480018   -1.8860910
## 423             NA     -2.0572160       -1.4415240   -0.7224793   -2.1605680
## 424             NA     -3.9481040       -3.3081640   -2.5891190   -4.0272090
## 425             NA      0.6458718        0.7545512    1.4735960    0.0355066
## 426             NA      2.8913830        2.7326370    3.4516820    2.0135920
## 427             NA     -0.5822374       -0.2662673    0.2421740   -0.7747086
## 428             NA      1.0154040        0.8896283    1.6142130    0.1650435
## 429             NA     -1.9790270       -1.1441400   -0.4195554   -1.8687250
## 430             NA     -2.0572160       -1.4203580   -0.6957733   -2.1449430
## 431             NA     -3.9328090       -3.2756210   -2.5510360   -4.0002060
## 432             NA      0.6458718        0.7563432    1.4809280    0.0317585
## 433             NA      2.8913830        2.7308200    3.4554050    2.0062360
## 434             NA     -0.5693988       -0.2438879    0.2684709   -0.7562466
## 435             NA      1.2699960        1.1312950    1.8609600    0.4016309
## 436             NA     -1.9790270       -1.0904040   -0.3607396   -1.8200680
## 437             NA     -2.0572160       -1.3637620   -0.6340973   -2.0934260
## 438             NA     -3.9328090       -3.2385010   -2.5088370   -3.9681650
## 439             NA      0.6458718        0.7581874    1.4878520    0.0285231
## 440             NA      2.8913830        2.7321690    3.4618330    2.0025050
## 441             NA     -0.5269667       -0.1785025    0.3374481   -0.6944531
## 442             NA      1.1637700        1.0282710    1.7633610    0.2931808
## 443             NA     -1.9790270       -1.0935130   -0.3584228   -1.8286030
## 444             NA     -2.0572160       -1.3718540   -0.6367637   -2.1069440
## 445             NA     -3.9328090       -3.2362480   -2.5011580   -3.9713380
## 446             NA      0.6458718        0.7600316    1.4951210    0.0249417
## 447             NA      2.8913830        2.7257010    3.4607910    1.9906110
## 448             NA     -0.5446709       -0.1979351    0.3218519   -0.7177222
## 449             NA      1.1135520        0.9788297    1.7195690    0.2380899
## 450             NA     -1.9790270       -1.0879670   -0.3472273   -1.8287070
## 451             NA     -2.0572160       -1.3701310   -0.6293908   -2.1108700
## 452             NA     -3.9328090       -3.2287090   -2.4879690   -3.9694490
## 453             NA      0.6458718        0.7618757    1.5026150    0.0211360
## 454             NA      2.8913830        2.7204100    3.4611500    1.9796700
## 455             NA     -0.5530407       -0.2042819    0.3195002   -0.7280639
## 456             NA      1.1342590        0.9969450    1.7434000    0.2504902
## 457             NA     -1.9790270       -1.0709840   -0.3245291   -1.8174390
## 458             NA     -2.0572160       -1.3553300   -0.6088754   -2.1017850
## 459             NA     -3.9328090       -3.2141130   -2.4676580   -3.9605670
## 460             NA      0.6458718        0.7637199    1.5101750    0.0172651
## 461             NA      2.8913830        2.7167150    3.4631700    1.9702600
## 462             NA     -0.5495895       -0.1938411    0.3339821   -0.7216644
## 463             NA      1.1342590        0.9942605    1.7449250    0.2435960
## 464             NA     -2.9673960       -2.0252760   -1.2746120   -2.7759410
## 465             NA     -2.0572160       -1.3443370   -0.5936730   -2.0950020
## 466             NA     -3.9328090       -3.2015720   -2.4509070   -3.9522360
## 467             NA      0.6458718        0.7655641    1.5162290    0.0148996
## 468             NA      3.1691110        3.0587960    3.8094610    2.3081320
## 469             NA     -0.6680298       -0.2920941    0.2387059   -0.8228940
## 470             NA      1.1342590        0.9915760    1.7477960    0.2353555
## 471             NA     -2.9673960       -2.0108950   -1.2546740   -2.7671150
## 472             NA     -2.0572160       -1.3333450   -0.5771242   -2.0895650
## 473             NA     -3.9328090       -3.1890310   -2.4328100   -3.9452510
## 474             NA      0.6458718        0.7674083    1.5236290    0.0111878
## 475             NA      3.1691110        3.0554560    3.8116760    2.2992350
## 476             NA     -0.6680298       -0.2864718    0.2482568   -0.8212004
## 477             NA      1.0898160        0.9480487    1.7081700    0.1879275
## 478             NA     -3.2466250       -2.2718410   -1.5117200   -3.0319620
## 479             NA     -2.0572160       -1.3311390   -0.5710176   -2.0912600
## 480             NA     -3.9328090       -3.1812440   -2.4211230   -3.9413650
## 481             NA      0.6458718        0.7692524    1.5293740    0.0091312
## 482             NA      2.9126070        2.8100720    3.5701930    2.0499510
## 483             NA     -0.7647259       -0.3761419    0.1613449   -0.9136288
## 484             NA      1.0815010        0.9387347    1.7044980    0.1729709
## 485             NA     -3.2466250       -2.2587560   -1.4929920   -3.0245200
## 486             NA     -2.0572160       -1.3219930   -0.5562295   -2.0877570
## 487             NA     -3.9328090       -3.1697060   -2.4039420   -3.9354700
## 488             NA      0.6458718        0.7710966    1.5368600    0.0053328
## 489             NA      2.9126070        2.8068340    3.5725980    2.0410700
## 490             NA     -0.7661117       -0.3722984    0.1691784   -0.9137751
## 491             NA      1.0122690        0.8720858    1.6434300    0.1007410
## 492             NA     -3.2466250       -2.2563220   -1.4849770   -3.0276670
## 493             NA     -2.0572160       -1.3252040   -0.5538592   -2.0965490
## 494             NA     -3.9328090       -3.1648620   -2.3935170   -3.9362060
## 495             NA      0.6458718        0.7729408    1.5442860    0.0015960
## 496             NA      2.9126070        2.8020460    3.5733900    2.0307010
## 497             NA     -0.7776502       -0.3832192    0.1622039   -0.9286423
## 498             NA      0.9901701        0.8499128    1.6269120    0.0729132
## 499             NA     -3.2466250       -2.2458770   -1.4688770   -3.0228770
## 500             NA     -2.0572160       -1.3191630   -0.5421638   -2.0961630
## 501             NA     -3.9328090       -3.1550110   -2.3780110   -3.9320110
## 502             NA      0.6458718        0.7747849    1.5517850   -0.0022147
## 503             NA      2.9126070        2.7984090    3.5754090    2.0214090
## 504             NA     -0.7813335       -0.3828242    0.1665976   -0.9322459
## 505             NA      0.9233390        0.7858249    1.5683410    0.0033084
## 506             NA     -3.2466250       -2.2434950   -1.4609790   -3.0260110
## 507             NA     -2.0572160       -1.3225260   -0.5400099   -2.1050430
## 508             NA     -3.9328090       -3.1502620   -2.3677450   -3.9327780
## 509             NA      0.6458718        0.7766291    1.5591460   -0.0058874
## 510             NA      2.9126070        2.7935800    3.5760960    2.0110630
## 511             NA     -0.7924720       -0.3933749    0.1599477   -0.9466977
## 512             NA      0.9233390        0.7835637    1.5716250   -0.0044979
## 513             NA     -3.2466250       -2.2292490   -1.4411870   -3.0173100
## 514             NA     -2.0572160       -1.3121060   -0.5240442   -2.1001670
## 515             NA     -3.9328090       -3.1380430   -2.3499820   -3.9261050
## 516             NA      0.6458718        0.7784733    1.5665350   -0.0095884
## 517             NA      2.9126070        2.7904850    3.5785470    2.0024240
## 518             NA     -0.7924720       -0.3878126    0.1694311   -0.9450563
## 519             NA      0.9233390        0.7813026    1.5749090   -0.0123041
## 520             NA     -3.2466250       -2.2150030   -1.4213960   -3.0086090
## 521             NA     -2.0572160       -1.3016850   -0.5080785   -2.0952920
## 522             NA     -3.9328090       -3.1258240   -2.3322180   -3.9194310
## 523             NA      0.6458718        0.7803174    1.5739240   -0.0132894
## 524             NA      2.9126070        2.7873910    3.5809970    1.9937840
## 525             NA     -0.7924720       -0.3822502    0.1789145   -0.9434149
## 526             NA      0.9023111        0.7603636    1.5596670   -0.0389395
## 527             NA     -3.2466250       -2.2047380   -1.4054350   -3.0040410
## 528             NA     -2.0572160       -1.2959250   -0.4966217   -2.0952280
## 529             NA     -3.9328090       -3.1161360   -2.3168330   -3.9154390
## 530             NA      0.6458718        0.7821616    1.5814650   -0.0171415
## 531             NA      2.9126070        2.7837010    3.5830040    1.9843980
## 532             NA     -0.7959766       -0.3817621    0.1834306   -0.9469547
## 533             NA      0.8832840        0.7413503    1.5464820   -0.0637814
## 534             NA     -3.2466250       -2.1941990   -1.3890670   -2.9993300
## 535             NA     -2.0572160       -1.2898570   -0.4847257   -2.0949890
## 536             NA     -3.9328090       -3.1062830   -2.3011510   -3.9114140
## 537             NA      0.6458718        0.7840058    1.5891370   -0.0211259
## 538             NA      2.9126070        2.7800470    3.5851790    1.9749160
## 539             NA     -0.7991478       -0.3808226    0.1884914   -0.9501367
## 540             NA      0.9182777        0.7726326    1.5833540   -0.0380885
## 541             NA     -3.2466250       -2.1735970   -1.3628760   -2.9843180
## 542             NA     -2.0572160       -1.2719900   -0.4612688   -2.0827110
## 543             NA     -3.9328090       -3.0900190   -2.2792980   -3.9007400
## 544             NA      0.6458718        0.7858499    1.5965710   -0.0248711
## 545             NA      2.9126070        2.7779060    3.5886270    1.9671850
## 546             NA     -0.7933155       -0.3665363    0.2067301   -0.9398027
## 547             NA      0.9053224        0.7593727    1.5757960   -0.0570504
## 548             NA     -3.2466250       -2.1619750   -1.3455520   -2.9783980
## 549             NA     -2.0572160       -1.2646590   -0.4482356   -2.0810820
## 550             NA     -3.9328090       -3.0794800   -2.2630570   -3.8959030
## 551             NA      0.6458718        0.7876941    1.6041170   -0.0287290
## 552             NA      2.9126070        2.7744130    3.5908360    1.9579900
## 553             NA     -0.7954748       -0.3641057    0.2131926   -0.9414040
## 554             NA      0.8907912        0.7446991    1.5668220   -0.0774241
## 555             NA     -3.2466250       -2.1507200   -1.3285970   -2.9728430
## 556             NA     -2.0572160       -1.2577700   -0.4356469   -2.0798930
## 557             NA     -3.9328090       -3.0691840   -2.2470610   -3.8913070
## 558             NA      0.6458718        0.7895383    1.6116610   -0.0325849
## 559             NA      2.9126070        2.7708600    3.5929830    1.9487370
## 560             NA     -0.7978966       -0.3620961    0.2192328   -0.9434249
## 561             NA      0.8907912        0.7425370    1.5702110   -0.0851368
## 562             NA     -3.2466250       -2.1365450   -1.3088710   -2.9642190
## 563             NA     -2.0572160       -1.2474470   -0.4197730   -2.0751210
## 564             NA     -3.9328090       -3.0570190   -2.2293460   -3.8846930
## 565             NA      0.6458718        0.7913824    1.6190560   -0.0362914
## 566             NA      2.9126070        2.7677500    3.5954230    1.9400760
## 567             NA     -0.7978966       -0.3565570    0.2286967   -0.9418108
## 568             NA      0.9086453        0.7562163    1.5830760   -0.0706431
## 569             NA     -3.2466250       -2.1189270   -1.2920680   -2.9457860
## 570             NA     -2.8977110       -2.1907700   -1.3639100   -3.0176290
## 571             NA     -3.9328090       -3.0426400   -2.2157810   -3.8694990
## 572             NA      0.8142259        0.9572022    1.7840620    0.1303428
## 573             NA      2.9126070        2.7651680    3.5920280    1.9383090
## 574             NA     -0.9069445       -0.4789583    0.1057195   -1.0636360
## 575             NA      0.9131616        0.7592029    1.5926830   -0.0742771
## 576             NA     -3.2466250       -2.1039990   -1.2705190   -2.9374790
## 577             NA     -2.8430960       -2.1226910   -1.2892110   -2.9561710
## 578             NA     -3.9328090       -3.0299860   -2.1965060   -3.8634660
## 579             NA      0.8142259        0.9589389    1.7924190    0.1254589
## 580             NA      2.9126070        2.7621770    3.5956570    1.9286970
## 581             NA     -0.8970892       -0.4627262    0.1266331   -1.0520860
## 582             NA      0.9310586        0.7745144    1.6137130   -0.0646839
## 583             NA     -3.2466250       -2.0100870   -1.1708880   -2.8492850
## 584             NA     -2.8430960       -2.0505990   -1.2114010   -2.8897970
## 585             NA     -3.9328090       -2.9689390   -2.1297400   -3.8081370
## 586             NA      0.8142259        0.9606755    1.7998740    0.1214772
## 587             NA      2.9126070        2.8014450    3.6406440    1.9622470
## 588             NA     -0.8941063       -0.4154982    0.1779046   -1.0089010
## 589             NA      0.8343312        0.6845887    1.5291750   -0.1599980
## 590             NA     -3.2466250       -2.0146510   -1.1700640   -2.8592370
## 591             NA     -2.8430960       -2.0637300   -1.2191430   -2.9083160
## 592             NA     -3.9328090       -2.9689070   -2.1243210   -3.8134940
## 593             NA      0.8142259        0.9624122    1.8069990    0.1178256
## 594             NA      2.9126070        2.7957610    3.6403480    1.9511740
## 595             NA     -0.9102276       -0.4340876    0.1631254   -1.0313010
## 596             NA      0.8945068        0.7386118    1.5889310   -0.1117073
## 597             NA     -3.2466250       -1.9876510   -1.1373320   -2.8379700
## 598             NA     -2.8430960       -2.0394000   -1.1890810   -2.8897190
## 599             NA     -3.9328090       -2.9484640   -2.0981450   -3.7987830
## 600             NA      0.8142259        0.9641489    1.8144680    0.1138298
## 601             NA      2.9126070        2.7949830    3.6453030    1.9446640
## 602             NA     -0.9001983       -0.4129617    0.1883047   -1.0142280
## 603             NA      0.8790978        0.7234454    1.5794950   -0.1326045
## 604             NA     -3.2466250       -1.9759700   -1.1199200   -2.8320190
## 605             NA     -2.8430960       -2.0332670   -1.1772180   -2.8893170
## 606             NA     -3.9328090       -2.9379390   -2.0818890   -3.7939880
## 607             NA      0.8142259        0.9658856    1.8219350    0.1098358
## 608             NA      2.9126070        2.7918180    3.6478680    1.9357680
## 609             NA     -0.9027665       -0.4110045    0.1943142   -1.0163230
## 610             NA      0.8790978        0.7213370    1.5829050   -0.1402308
## 611             NA     -3.2466250       -1.9609290   -1.0993610   -2.8224970
## 612             NA     -2.8430960       -2.0231410   -1.1615740   -2.8847090
## 613             NA     -3.9328090       -2.9252360   -2.0636680   -3.7868040
## 614             NA      0.8142259        0.9676223    1.8291900    0.1060544
## 615             NA      2.9126070        2.7891770    3.6507450    1.9276090
## 616             NA     -0.9027665       -0.4051949    0.2040255   -1.0144150
## 617             NA      0.8790978        0.7192287    1.5863150   -0.1478571
## 618             NA     -3.2466250       -1.9458880   -1.0788020   -2.8129740
## 619             NA     -2.8430960       -2.0130150   -1.1459290   -2.8801010
## 620             NA     -3.9328090       -2.9125330   -2.0454470   -3.7796190
## 621             NA      0.8142259        0.9693589    1.8364450    0.1022731
## 622             NA      2.9126070        2.7865370    3.6536230    1.9194510
## 623             NA     -0.9027665       -0.3993854    0.2137369   -1.0125080
## 624             NA      0.8777651        0.7169809    1.5898230   -0.1558612
## 625             NA     -3.2466250       -1.9313700   -1.0585270   -2.8042120
## 626             NA     -2.8430960       -2.0035130   -1.1306710   -2.8763550
## 627             NA     -3.9328090       -2.9001710   -2.0273290   -3.7730130
## 628             NA      0.8142259        0.9710956    1.8439380    0.0982535
## 629             NA      2.9126070        2.7838130    3.6566550    1.9109710
## 630             NA     -0.9029886       -0.3938606    0.2233319   -1.0110530
## 631             NA      0.8350078        0.6771618    1.5555900   -0.2012667
## 632             NA     -3.2466250       -1.9257140   -1.0472850   -2.8041420
## 633             NA     -2.8430960       -2.0046220   -1.1261930   -2.8830500
## 634             NA     -3.9328090       -2.8936040   -2.0151750   -3.7720320
## 635             NA      0.8142259        0.9728323    1.8512610    0.0944039
## 636             NA      2.9126070        2.7796790    3.6581070    1.9012500
## 637             NA     -0.9101148       -0.3990444    0.2220983   -1.0201870
## 638             NA      0.7922188        0.6373982    1.5160080   -0.2412119
## 639             NA     -3.2466250       -1.9202480   -1.0416380   -2.7988580
## 640             NA     -2.8430960       -2.0059860   -1.1273760   -2.8845960
## 641             NA     -4.7388620       -3.8903610   -3.0117510   -4.7689710
## 642             NA      0.8142259        0.9745690    1.8531790    0.0959588
## 643             NA      2.9126070        2.7755030    3.6541130    1.8968930
## 644             NA     -1.0515890       -0.5715208    0.0497504   -1.1927920
## 645             NA      0.7695446        0.6157985    1.4997880   -0.2681910
## 646             NA     -3.2466250       -1.9112430   -1.0272540   -2.7952330
## 647             NA     -2.8430960       -2.0023130   -1.1183230   -2.8863020
## 648             NA     -4.7388620       -3.8821070   -2.9981180   -4.7660970
## 649             NA      0.8142259        0.9761707    1.8601600    0.0921812
## 650             NA      2.9126070        2.7710670    3.6550570    1.8870780
## 651             NA     -1.0553670       -0.5721045    0.0529704   -1.1971790
## 652             NA      0.7223313        0.5721640    1.4615710   -0.3172426
## 653             NA     -3.2466250       -1.9076770   -1.0182700   -2.7970840
## 654             NA     -2.8430960       -2.0052180   -1.1158110   -2.8946240
## 655             NA     -4.7388620       -3.8774550   -2.9880480   -4.7668610
## 656             NA      0.8142259        0.9777724    1.8671790    0.0883657
## 657             NA      2.9126070        2.7657400    3.6551470    1.8763330
## 658             NA     -1.0632360       -0.5791122    0.0497933   -1.2080180
## 659             NA      0.7223313        0.5702786    1.4649950   -0.3244378
## 660             NA     -3.2466250       -1.8935860   -0.9988700   -2.7883030
## 661             NA     -2.8430960       -1.9954790   -1.1007630   -2.8901960
## 662             NA     -4.7388620       -3.8658910   -2.9711750   -4.7606080
## 663             NA      0.8142259        0.9793740    1.8740900    0.0846576
## 664             NA      2.9126070        2.7621050    3.6568210    1.8673890
## 665             NA     -1.0632360       -0.5738665    0.0587935   -1.2065270
## 666             NA      0.7223313        0.5683932    1.4684190   -0.3316331
## 667             NA     -3.2466250       -1.8794960   -0.9794696   -2.7795220
## 668             NA     -2.8430960       -1.9857410   -1.0857140   -2.8857670
## 669             NA     -4.7388620       -3.8543280   -2.9543020   -4.7543540
## 670             NA      0.8142259        0.9809757    1.8810020    0.0809494
## 671             NA      2.9126070        2.7584700    3.6584960    1.8584440
## 672             NA     -1.0632360       -0.5686209    0.0677938   -1.2050360
## 673             NA      0.6708095        0.5212771    1.3890230   -0.3464688
## 674             NA     -6.1920260       -4.7537820   -3.8860360   -5.6215280
## 675             NA     -2.8430960       -1.9902810   -1.1225350   -2.8580270
## 676             NA     -4.7388620       -3.8505870   -2.9828410   -4.7183330
## 677             NA      0.8142259        0.9825774    1.8503230    0.1148314
## 678             NA      4.0508070        3.9749240    4.8426690    3.1071780
## 679             NA     -1.3730240       -0.8526454   -0.2390563   -1.4662340
## 680             NA      0.7008775        0.5470969    1.4200480   -0.3258537
## 681             NA     -6.1920260       -4.7309980   -3.8580470   -5.6039480
## 682             NA     -2.8430960       -1.9728450   -1.0998940   -2.8457960
## 683             NA     -4.7388620       -3.8348100   -2.9618590   -4.7077600
## 684             NA      0.8142259        0.9841791    1.8571300    0.1112285
## 685             NA      4.0508070        3.9723670    4.8453180    3.0994170
## 686             NA     -1.3680120       -0.8391681   -0.2218988   -1.4564370
## 687             NA      0.6153275        0.4699879    1.3479820   -0.4080062
## 688             NA     -6.1920260       -4.7342330   -3.8562390   -5.6122270
## 689             NA     -2.8430960       -1.9870660   -1.1090720   -2.8650600
## 690             NA     -4.7388620       -3.8363890   -2.9583950   -4.7143830
## 691             NA      0.8142259        0.9857808    1.8637750    0.1077866
## 692             NA      4.0508070        3.9654810    4.8434750    3.0874870
## 693             NA     -1.3822700       -0.8560730   -0.2352374   -1.4769090
## 694             NA      0.6648234        0.5129575    1.3961310   -0.3702164
## 695             NA     -6.1920260       -4.7070490   -3.8238750   -5.5902230
## 696             NA     -2.8430960       -1.9642610   -1.0810870   -2.8474350
## 697             NA     -4.7388620       -3.8176640   -2.9344900   -4.7008380
## 698             NA      0.8142259        0.9873824    1.8705560    0.1042085
## 699             NA      4.0508070        3.9636630    4.8468370    3.0804890
## 700             NA     -1.3740210       -0.8374952   -0.2129970   -1.4619930
## 701             NA      0.6165572        0.4692890    1.3575620   -0.4189836
## 702             NA     -6.1920260       -4.7020840   -3.8138110   -5.5903560
## 703             NA     -2.8430960       -1.9685770   -1.0803040   -2.8568490
## 704             NA     -4.7388620       -3.8138220   -2.9255490   -4.7020950
## 705             NA      0.8142259        0.9889841    1.8772570    0.1007115
## 706             NA      4.0508070        3.9581150    4.8463880    3.0698430
## 707             NA     -1.3820660       -0.8446823   -0.2165788   -1.4727860
## 708             NA      0.6165572        0.4676724    1.3610300   -0.4256846
## 709             NA     -6.1920260       -4.6858240   -3.7924670   -5.5791820
## 710             NA     -2.8430960       -1.9591070   -1.0657500   -2.8524640
## 711             NA     -4.7388620       -3.8024150   -2.9090580   -4.6957720
## 712             NA      0.8142259        0.9905858    1.8839430    0.0972288
## 713             NA      4.0508070        3.9544630    4.8478200    3.0611060
## 714             NA     -1.3820660       -0.8391041   -0.2074053   -1.4708030
## 715             NA      0.6165572        0.4660558    1.3644970   -0.4323856
## 716             NA     -6.1920260       -4.6695650   -3.7711230   -5.5680060
## 717             NA     -2.8430960       -1.9496370   -1.0511960   -2.8480780
## 718             NA     -4.7388620       -3.7910080   -2.8925670   -4.6894500
## 719             NA      0.8142259        0.9921875    1.8906290    0.0937461
## 720             NA      4.0508070        3.9508110    4.8492520    3.0523700
## 721             NA     -1.3820660       -0.8335260   -0.1982320   -1.4688200
## 722             NA      0.6640027        0.5068089    1.4103490   -0.3967318
## 723             NA     -6.1920260       -4.6425920   -3.7390510   -5.5461330
## 724             NA     -2.8430960       -1.9269810   -1.0234410   -2.8305220
## 725             NA     -4.7388620       -3.7723510   -2.8688110   -4.6758920
## 726             NA      0.8142259        0.9937892    1.8973300    0.0902485
## 727             NA      4.0508070        3.9489970    4.8525380    3.0454560
## 728             NA     -1.3741580       -0.8153882   -0.1764885   -1.4542880
## 729             NA      0.7552286        0.5858170    1.4943660   -0.3227319
## 730             NA     -6.1920260       -4.6052240   -3.6966750   -5.5137730
## 731             NA     -2.8430960       -1.8914540   -0.9829046   -2.8000020
## 732             NA     -4.7388620       -3.7466060   -2.8380570   -4.6551550
## 733             NA      0.8142259        0.9953908    1.9039400    0.0868420
## 734             NA      4.0508070        3.9489950    4.8575440    3.0404470
## 735             NA     -1.3589540       -0.7855134   -0.1430723   -1.4279540
## 736             NA      0.7173409        0.5518336    1.4655390   -0.3618713
## 737             NA     -6.1920260       -4.5980710   -3.6843660   -5.5117750
## 738             NA     -2.8430960       -1.8931580   -0.9794530   -2.8068630
## 739             NA     -4.7388620       -3.7413390   -2.8276340   -4.6550440
## 740             NA      0.8142259        0.9969925    1.9106970    0.0832876
## 741             NA      4.0508070        3.9437930    4.8574980    3.0300880
## 742             NA     -1.3652680       -0.7899914   -0.1439044   -1.4360780
## 743             NA      0.7085050        0.5432712    1.4622150   -0.3756729
## 744             NA     -6.1920260       -4.5841420   -3.6651980   -5.5030870
## 745             NA     -2.8430960       -1.8865200   -0.9675755   -2.8054640
## 746             NA     -4.7388620       -3.7314840   -2.8125400   -4.6504280
## 747             NA      0.8142259        0.9985942    1.9175380    0.0796501
## 748             NA      4.0508070        3.9397540    4.8586990    3.0208100
## 749             NA     -1.3667410       -0.7867543   -0.1369627   -1.4365460
## 750             NA      0.6529305        0.4941310    1.4181850   -0.4299227
## 751             NA     -6.1920260       -4.5814190   -3.6573650   -5.5054730
## 752             NA     -2.8430960       -1.8937920   -0.9697387   -2.8178460
## 753             NA     -4.7388620       -3.7292940   -2.8052410   -4.6533480
## 754             NA      0.8142259        1.0001960    1.9242500    0.0761422
## 755             NA      4.0508070        3.9337490    4.8578030    3.0096960
## 756             NA     -1.3760030       -0.7960715   -0.1426669   -1.4494760
## 757             NA      0.6529305        0.4924530    1.4215920   -0.4366861
## 758             NA     -6.1920260       -4.5651170   -3.6359780   -5.4942560
## 759             NA     -2.8430960       -1.8842540   -0.9551151   -2.8133930
## 760             NA     -4.7388620       -3.7178480   -2.7887090   -4.6469870
## 761             NA      0.8142259        1.0017980    1.9309370    0.0726585
## 762             NA      4.0508070        3.9301100    4.8592500    3.0009710
## 763             NA     -1.3760030       -0.7904764   -0.1334758   -1.4474770
## 764             NA      0.6529305        0.4907750    1.4250000   -0.4434496
## 765             NA     -6.1920260       -4.5488160   -3.6145910   -5.4830400
## 766             NA     -2.8430960       -1.8747160   -0.9404914   -2.8089410
## 767             NA     -4.7388620       -3.7064010   -2.7721770   -4.6406260
## 768             NA      0.8142259        1.0033990    1.9376240    0.0691746
## 769             NA      4.0508070        3.9264720    4.8606960    2.9922470
## 770             NA     -1.3760030       -0.7848812   -0.1242846   -1.4454780
## 771             NA      0.6357057        0.4751042    1.4145240   -0.4643152
## 772             NA     -6.1920260       -4.5371040   -3.5976840   -5.4765230
## 773             NA     -2.8430960       -1.8709020   -0.9314830   -2.8103220
## 774             NA     -4.7388620       -3.6981120   -2.7586930   -4.6375320
## 775             NA      0.8142259        1.0050010    1.9444200    0.0655815
## 776             NA      4.0508070        3.9220170    4.8614370    2.9825980
## 777             NA     -1.3788740       -0.7839993   -0.1197295   -1.4482690
## 778             NA      0.7016242        0.5292825    1.4544220   -0.3958565
## 779             NA     -6.1920260       -4.5052270   -3.5800880   -5.4303660
## 780             NA     -4.2255000       -3.3987290   -2.4735900   -4.3238680
## 781             NA     -4.7388620       -3.6759310   -2.7507930   -4.6010700
## 782             NA      1.0086680        1.1967110    2.1218500    0.2715716
## 783             NA      4.0508070        3.9211550    4.8462940    2.9960160
## 784             NA     -1.5658810       -0.9887899   -0.3346178   -1.6429620
## 785             NA      0.6394486        0.4751685    1.4052540   -0.4549166
## 786             NA     -6.1920260       -3.9858070   -3.0557220   -4.9158920
## 787             NA     -4.2255000       -3.0157860   -2.0857010   -3.9458720
## 788             NA     -4.7388620       -3.3546170   -2.4245310   -4.2847020
## 789             NA      1.0086680        1.1981860    2.1282710    0.2681009
## 790             NA      4.0508070        4.1953260    5.1254110    3.2652410
## 791             NA     -1.5762440       -0.7479216   -0.0902521   -1.4055910
## 792             NA      0.5463575        0.3947687    1.3297300   -0.5401928
## 793             NA     -6.1920260       -3.9887400   -3.0537790   -4.9237020
## 794             NA     -4.2255000       -3.0328820   -2.0979210   -3.9678440
## 795             NA     -4.7388620       -3.3567120   -2.4217510   -4.2916740
## 796             NA      1.0086680        1.1996610    2.1346230    0.2647000
## 797             NA      4.0508070        4.1896370    5.1245980    3.2546750
## 798             NA     -1.5917590       -0.7657114   -0.1045938   -1.4268290
## 799             NA      0.6165068        0.4538071    1.3936950   -0.4860806
## 800             NA     -6.1920260       -3.9512800   -3.0113920   -4.8911680
## 801             NA     -4.2255000       -2.9993340   -2.0594460   -3.9392220
## 802             NA     -4.7388620       -3.3308360   -2.3909490   -4.2707240
## 803             NA      1.0086680        1.2011370    2.1410250    0.2612492
## 804             NA      4.0508070        4.1912190    5.1311070    3.2513310
## 805             NA     -1.5800680       -0.7392146   -0.0746136   -1.4038160
## 806             NA      0.6165068        0.4522151    1.3970810   -0.4926507
## 807             NA     -6.1920260       -3.9307780   -2.9859120   -4.8756440
## 808             NA     -4.2255000       -2.9870530   -2.0421870   -3.9319190
## 809             NA     -4.7388620       -3.3167080   -2.3718420   -4.2615730
## 810             NA      1.0086680        1.2026120    2.1474780    0.2577466
## 811             NA      4.0508070        4.1897460    5.1346120    3.2448810
## 812             NA     -1.5800680       -0.7316608   -0.0635398   -1.3997820
## 813             NA      0.6165068        0.4506230    1.4004670   -0.4992208
## 814             NA     -6.1920260       -3.9102750   -2.9604320   -4.8601190
## 815             NA     -4.2255000       -2.9747720   -2.0249280   -3.9246160
## 816             NA     -4.7388620       -3.3025790   -2.3527350   -4.2524230
## 817             NA      1.0086680        1.2040880    2.1539320    0.2542439
## 818             NA      4.0508070        4.1882740    5.1381180    3.2384300
## 819             NA     -1.5800680       -0.7241070   -0.0524660   -1.3957480
## 820             NA      0.5443977        0.3888593    1.3435780   -0.5658593
## 821             NA     -6.1920260       -3.9084950   -2.9537760   -4.8632140
## 822             NA     -4.2255000       -2.9861320   -2.0314130   -3.9408500
## 823             NA     -4.7388620       -3.3015290   -2.3468100   -4.2562480
## 824             NA      1.0086680        1.2055630    2.1602820    0.2508446
## 825             NA      4.0508070        4.1833690    5.1380880    3.2286510
## 826             NA     -1.5920860       -0.7363940   -0.0613060   -1.4114820
## 827             NA      0.5873923        0.4243665    1.3841080   -0.5353750
## 828             NA     -6.1920260       -3.8775780   -2.9178370   -4.8373200
## 829             NA     -4.2255000       -2.9607180   -2.0009760   -3.9204600
## 830             NA     -4.7388620       -3.2801370   -2.3203950   -4.2398790
## 831             NA      1.0086680        1.2070390    2.1667800    0.2472971
## 832             NA      4.0508070        4.1838000    5.1435410    3.2240580
## 833             NA     -1.5849200       -0.7172047   -0.0385650   -1.3958440
## 834             NA      0.5341107        0.3787943    1.3434920   -0.5859032
## 835             NA     -6.1920260       -3.8712440   -2.9065460   -4.8359410
## 836             NA     -4.2255000       -2.9664030   -2.0017060   -3.9311000
## 837             NA     -4.7388620       -3.2759570   -2.3112600   -4.2406550
## 838             NA      1.0086680        1.2085140    2.1732120    0.2438167
## 839             NA      4.0508070        4.1797020    5.1443990    3.2150040
## 840             NA     -1.5938000       -0.7244324   -0.0422883   -1.4065770
## 841             NA      0.6140568        0.4451240    1.4147130   -0.5244646
## 842             NA     -6.1920260       -3.8307060   -2.8611170   -4.8002940
## 843             NA     -4.2255000       -2.9287440   -1.9591560   -3.8983330
## 844             NA     -4.7388620       -3.2477790   -2.2781900   -4.2173680
## 845             NA      1.0086680        1.2099890    2.1795780    0.2404008
## 846             NA      4.0508070        4.1819310    5.1515200    3.2123430
## 847             NA     -1.5804760       -0.6950307   -0.0094281   -1.3806330
## 848             NA      0.5040413        0.3523580    1.2970430   -0.5923272
## 849             NA     -6.1920260       -3.8392310   -2.8945460   -4.7839160
## 850             NA     -4.2255000       -2.9533600   -2.0086750   -3.8980450
## 851             NA     -6.7364660       -5.5520080   -4.6073220   -6.4966930
## 852             NA      1.0086680        1.2114650    2.1561500    0.2667796
## 853             NA      4.0508070        4.1750480    5.1197340    3.2303630
## 854             NA     -1.9317460       -1.1009550   -0.4329612   -1.7689480
## 855             NA      0.5040413        0.3510319    1.3005380   -0.5984740
## 856             NA     -6.1920260       -3.8189060   -2.8694010   -4.7684120
## 857             NA     -4.2255000       -2.9413680   -1.9918620   -3.8908740
## 858             NA     -6.7364660       -5.5390490   -4.5895430   -6.4885550
## 859             NA      1.0086680        1.2129400    2.1624460    0.2634345
## 860             NA      4.0508070        4.1735200    5.1230250    3.2240140
## 861             NA     -1.9317460       -1.0936390   -0.4222366   -1.7650410
## 862             NA      0.5040413        0.3497328    1.3042200   -0.6047544
## 863             NA     -6.1920260       -3.7976120   -2.8431250   -4.7521000
## 864             NA     -4.2255000       -2.9281800   -1.9736930   -3.8826670
## 865             NA     -6.7364660       -5.5237570   -4.5692690   -6.4782440
## 866             NA      1.0086680        1.2143050    2.1687920    0.2598175
## 867             NA      4.0508070        4.1703270    5.1248150    3.2158400
## 868             NA     -1.9317460       -1.0858640   -0.4109397   -1.7607880
## 869             NA      0.5040413        0.3484337    1.3079020   -0.6110348
## 870             NA     -6.1920260       -3.7763190   -2.8168500   -4.7357870
## 871             NA     -4.2255000       -2.9149910   -1.9555230   -3.8744600
## 872             NA     -6.7364660       -5.5084630   -4.5489950   -6.4679320
## 873             NA      1.0086680        1.2156690    2.1751380    0.2562007
## 874             NA      4.0508070        4.1671340    5.1266030    3.2076660
## 875             NA     -1.9317460       -1.0780890   -0.3996428   -1.7565360
## 876             NA      0.4742025        0.3230890    1.2876320   -0.6414537
## 877             NA     -6.1920260       -3.7633860   -2.7988430   -4.7279290
## 878             NA     -4.2255000       -2.9125300   -1.9479880   -3.8770730
## 879             NA     -6.7364660       -5.4991280   -4.5345850   -6.4636710
## 880             NA      1.0086680        1.2170340    2.1815760    0.2524908
## 881             NA      4.0508070        4.1623470    5.1268900    3.1978040
## 882             NA     -1.9367190       -1.0787620   -0.3967277   -1.7607970
## 883             NA      0.4408508        0.2949552    1.2645260   -0.6746154
## 884             NA     -6.1920260       -3.7514550   -2.7818840   -4.7210250
## 885             NA     -4.2255000       -2.9114120   -1.9418420   -3.8809830
## 886             NA     -6.7364660       -5.4905450   -4.5209740   -6.4601150
## 887             NA      1.0086680        1.2183980    2.1879680    0.2488274
## 888             NA      4.0508070        4.1573470    5.1269170    3.1877760
## 889             NA     -1.9422780       -1.0804520   -0.3948621   -1.7660420
## 890             NA      0.3332596        0.2060234    1.0846770   -0.6726301
## 891             NA    -10.7598000       -8.2226190   -7.3439660   -9.1012730
## 892             NA     -4.2255000       -2.9359350   -2.0572810   -3.8145890
## 893             NA     -6.7364660       -5.4962230   -4.6175700   -6.3748770
## 894             NA      1.0086680        1.2197620    2.0984160    0.3411088
## 895             NA      6.9798160        7.1327640    8.0114180    6.2541110
## 896             NA     -2.2333370       -1.3493710   -0.7280694   -1.9706730
## 897             NA      0.2312708        0.1219991    1.0049330   -0.7609343
## 898             NA    -10.7598000       -8.2250350   -7.3421020   -9.1079680
## 899             NA     -4.2255000       -2.9590080   -2.0760750   -3.8419410
## 900             NA     -6.7364660       -5.5011210   -4.6181880   -6.3840540
## 901             NA      1.0086680        1.2211270    2.1040600    0.3381934
## 902             NA      6.9798160        7.1220410    8.0049740    6.2391080
## 903             NA     -2.2503350       -1.3699990   -0.7456712   -1.9943280
## 904             NA      0.2312708        0.1214699    1.0088810   -0.7659417
## 905             NA    -10.7598000       -8.1998140   -7.3124020   -9.0872260
## 906             NA     -4.2255000       -2.9464410   -2.0590290   -3.8338520
## 907             NA     -6.7364660       -5.4862050   -4.5987930   -6.3736160
## 908             NA      1.0086680        1.2224910    2.1099030    0.3350796
## 909             NA      6.9798160        7.1166570    8.0040680    6.2292450
## 910             NA     -2.2503350       -1.3619740   -0.7344788   -1.9894680
## 911             NA      0.2312708        0.1209407    1.0128300   -0.7709491
## 912             NA    -10.7598000       -8.1745930   -7.2827030   -9.0664830
## 913             NA     -4.2255000       -2.9338730   -2.0419840   -3.8257630
## 914             NA     -6.7364660       -5.4712880   -4.5793990   -6.3631780
## 915             NA      1.0086680        1.2238560    2.1157450    0.3319659
## 916             NA      6.9798160        7.1112720    8.0031620    6.2193830
## 917             NA     -2.2503350       -1.3539480   -0.7232863   -1.9846090
## 918             NA      0.4069038        0.2624562    1.1584070   -0.6334944
## 919             NA    -10.7598000       -8.1023950   -7.2064440   -8.9983450
## 920             NA     -4.2255000       -2.8601220   -1.9641710   -3.7560730
## 921             NA     -6.7364660       -5.4222800   -4.5263290   -6.3182310
## 922             NA      1.0086680        1.2252200    2.1211710    0.3292693
## 923             NA      6.9798160        7.1151830    8.0111340    6.2192330
## 924             NA     -2.2210630       -1.2969900   -0.6634567   -1.9305220
## 925             NA      0.3310905        0.2006916    1.1010430   -0.6996596
## 926             NA    -10.7598000       -8.0980730   -7.1977220   -8.9984250
## 927             NA     -4.2255000       -2.8746910   -1.9743400   -3.7750430
## 928             NA     -6.7364660       -5.4224730   -4.5221220   -6.3228240
## 929             NA      1.0086680        1.2265840    2.1269360    0.3262331
## 930             NA      6.9798160        7.1056930    8.0060440    6.2053420
## 931             NA     -2.2336980       -1.3103780   -0.6737335   -1.9470220
## 932             NA      0.5183388        0.3505695    1.2548870   -0.5537478
## 933             NA    -10.7598000       -8.0222540   -7.1179370   -8.9265710
## 934             NA     -4.2255000       -2.7958210   -1.8915040   -3.7001390
## 935             NA     -6.7364660       -5.3705640   -4.4662460   -6.2748810
## 936             NA      1.0086680        1.2279490    2.1322660    0.3236315
## 937             NA      6.9798160        7.1104680    8.0147850    6.2061510
## 938             NA     -2.2024900       -1.2499420   -0.6104931   -1.8893910
## 939             NA      0.4900356        0.3272957    1.2361400   -0.5815482
## 940             NA    -10.7598000       -8.0049950   -7.0961510   -8.9138390
## 941             NA     -4.2255000       -2.7934630   -1.8846190   -3.7023070
## 942             NA     -6.7364660       -5.3613150   -4.4524710   -6.2701590
## 943             NA      1.0086680        1.2293130    2.1381570    0.3204694
## 944             NA      6.9798160        7.1035680    8.0124110    6.1947240
## 945             NA     -2.2072070       -1.2499330   -0.6072831   -1.8925820
## 946             NA      0.4465198        0.2919726    1.2053800   -0.6214345
## 947             NA    -10.7598000       -7.9919810   -7.0785740   -8.9053880
## 948             NA     -4.2255000       -2.7967340   -1.8833270   -3.7101410
## 949             NA     -6.7364660       -5.3552160   -4.4418080   -6.2686230
## 950             NA      1.0086680        1.2306780    2.1440850    0.3172705
## 951             NA      6.9798160        7.0957900    8.0091970    6.1823830
## 952             NA     -2.2144600       -1.2542480   -0.6083722   -1.9001250
## 953             NA      0.4465198        0.2908453    1.2087260   -0.6270356
## 954             NA    -10.7598000       -7.9665450   -7.0486640   -8.8844260
## 955             NA     -4.2255000       -2.7837100   -1.8658300   -3.7015910
## 956             NA     -6.7364660       -5.3400230   -4.4221420   -6.2579040
## 957             NA      1.0086680        1.2320420    2.1499230    0.3141612
## 958             NA      6.9798160        7.0905120    8.0083930    6.1726310
## 959             NA     -2.2144600       -1.2461460   -0.5971066   -1.8951860
## 960             NA      0.4465198        0.2897180    1.2120730   -0.6326367
## 961             NA    -10.7598000       -7.9411090   -7.0187540   -8.8634630
## 962             NA     -4.2255000       -2.7706870   -1.8483320   -3.6930410
## 963             NA     -6.7364660       -5.3248290   -4.4024740   -6.2471840
## 964             NA      1.0086680        1.2334060    2.1557610    0.3110517
## 965             NA      6.9798160        7.0852350    8.0075890    6.1628800
## 966             NA     -2.2144600       -1.2380440   -0.5858410   -1.8902480
## 967             NA      0.4893447        0.3229578    1.2497950   -0.6038796
## 968             NA    -10.7598000       -7.9043160   -6.9774790   -8.8311540
## 969             NA     -4.2255000       -2.7426260   -1.8157890   -3.6694640
## 970             NA     -6.7364660       -5.3012270   -4.3743900   -6.2280650
## 971             NA      1.0086680        1.2347710    2.1616080    0.3079334
## 972             NA      6.9798160        7.0822950    8.0091320    6.1554570
## 973             NA     -2.2073230       -1.2180240   -0.5626514   -1.8733970
## 974             NA      0.4875406        0.3209704    1.2524360   -0.6104950
## 975             NA    -10.7598000       -7.8798790   -6.9484130   -8.8113440
## 976             NA     -4.2255000       -2.7308950   -1.7994290   -3.6623600
## 977             NA     -6.7364660       -5.2867530   -4.3552870   -6.2182180
## 978             NA      1.0086680        1.2361350    2.1676010    0.3046698
## 979             NA      6.9798160        7.0768230    8.0082880    6.1453580
## 980             NA     -2.2076230       -1.2106000   -0.5519542   -1.8692450
## 981             NA      0.5156969        0.3424913    1.2785800   -0.5935976
## 982             NA    -10.7598000       -7.8470740   -6.9109850   -8.7831630
## 983             NA     -4.2255000       -2.7080390   -1.7719500   -3.6441280
## 984             NA     -6.7364660       -5.2660520   -4.3299630   -6.2021410
## 985             NA      1.0086680        1.2375000    2.1735890    0.3014107
## 986             NA      6.9798160        7.0730900    8.0091790    6.1370010
## 987             NA     -2.2029310       -1.1946810   -0.5327659   -1.8565960
## 988             NA      0.3826116        0.2379640    1.1781870   -0.7022586
## 989             NA    -10.7598000       -7.8594880   -6.9192660   -8.7997110
## 990             NA     -4.2255000       -2.7454170   -1.8051940   -3.6856390
## 991             NA     -6.7364660       -5.2790810   -4.3388590   -6.2193040
## 992             NA      1.0086680        1.2388640    2.1790870    0.2986415
## 993             NA      6.9798160        7.0599170    8.0001400    6.1196950
## 994             NA     -2.2251110       -1.2245400   -0.5597023   -1.8893780
## 995             NA      0.3361953        0.2007680    1.1406580   -0.7391223
## 996             NA    -10.7598000       -8.0937880   -7.1538980   -9.0336780
## 997             NA     -4.5912660       -3.5285580   -2.5886670   -4.4684480
## 998             NA     -6.7364660       -5.4280400   -4.4881490   -6.3679300
## 999             NA      0.9519582        1.1976940    2.1375850    0.2578040
## 1000            NA      6.9798160        6.9206620    7.8605520    5.9807720
## 1001            NA     -2.3032600       -1.4552100   -0.7906076   -2.1198130
## 1002            NA      0.3361953        0.1999500    1.1442910   -0.7443905
## 1003            NA    -10.7598000       -8.0700640   -7.1257230   -9.0144040
## 1004            NA     -4.5912660       -3.5177330   -2.5733930   -4.4620740
## 1005            NA     -6.7364660       -5.4140560   -4.4697150   -6.3583970
## 1006            NA      0.9519582        1.1992190    2.1435590    0.2548783
## 1007            NA      6.9798160        6.9145410    7.8588810    5.9702000
## 1008            NA     -2.3032600       -1.4480240   -0.7802742   -2.1157730
## 1009            NA      0.3361953        0.1991321    1.1479230   -0.7496587
## 1010            NA    -10.7598000       -8.0463380   -7.0975470   -8.9951290
## 1011            NA     -4.5912660       -3.5069080   -2.5581180   -4.4556990
## 1012            NA     -6.7364660       -5.4000720   -4.4512810   -6.3488630
## 1013            NA      0.9519582        1.2007430    2.1495340    0.2519526
## 1014            NA      6.9798160        6.9084200    7.8572110    5.9596290
## 1015            NA     -2.3032600       -1.4408370   -0.7699409   -2.1117340
## 1016            NA      0.2451606        0.1284725    1.0815060   -0.8245605
## 1017            NA    -10.7598000       -8.0491090   -7.0960760   -9.0021420
## 1018            NA     -4.5912660       -3.5317080   -2.5786760   -4.4847420
## 1019            NA     -6.7364660       -5.4060790   -4.4530460   -6.3591120
## 1020            NA      0.9519582        1.2022680    2.1553010    0.2492352
## 1021            NA      6.9798160        6.8966460    7.8496790    5.9436130
## 1022            NA     -2.3184330       -1.4599180   -0.7860221   -2.1338140
## 1023            NA      0.6686627        0.4528901    1.4088560   -0.5030753
## 1024            NA    -10.7598000       -7.9049230   -6.9489570   -8.8608880
## 1025            NA     -4.5912660       -3.3586530   -2.4026880   -4.3146190
## 1026            NA     -6.7364660       -5.3010300   -4.3450650   -6.2569960
## 1027            NA      0.9519582        1.2037930    2.1597580    0.2478272
## 1028            NA      6.9798160        6.9163220    7.8722870    5.9603560
## 1029            NA     -2.2478490       -1.3319340   -0.6559640   -2.0079030
## 1030            NA      0.7088988        0.4831597    1.4436020   -0.4772825
## 1031            NA    -10.7598000       -7.8698750   -6.9094330   -8.8303170
## 1032            NA     -4.5912660       -3.3322760   -2.3718330   -4.2927180
## 1033            NA     -6.7364660       -5.2782790   -4.3178370   -6.2387210
## 1034            NA      0.9519582        1.2053170    2.1657600    0.2448751
## 1035            NA      6.9798160        6.9127370    7.8731790    5.9522950
## 1036            NA     -2.2411430       -1.3132030   -0.6340674   -1.9923380
## 1037            NA      0.7668824        0.5268562    1.4916830   -0.4379705
## 1038            NA    -10.7598000       -7.8296430   -6.8648170   -8.7944700
## 1039            NA     -4.5912660       -3.2988220   -2.3339950   -4.2636490
## 1040            NA     -6.7364660       -5.2515440   -4.2867180   -6.2163710
## 1041            NA      0.9519582        1.2068420    2.1716690    0.2420152
## 1042            NA      6.9798160        6.9102970    7.8751240    5.9454710
## 1043            NA     -2.2314790       -1.2893360   -0.6071002   -1.9715710
## 1044            NA      0.6832830        0.4629590    1.4320390   -0.5061210
## 1045            NA    -10.7598000       -7.8302360   -6.8611560   -8.7993160
## 1046            NA     -4.5912660       -3.3206300   -2.3515500   -4.2897100
## 1047            NA     -6.7364660       -5.2558640   -4.2867840   -6.2249440
## 1048            NA      0.9519582        1.2083670    2.1774460    0.2392866
## 1049            NA      6.9798160        6.8990120    7.8680920    5.9299320
## 1050            NA     -2.2454120       -1.3060650   -0.6208224   -1.9913080
## 1051            NA      0.6832830        0.4611760    1.4346970   -0.5123450
## 1052            NA    -10.7598000       -7.8061590   -6.8326380   -8.7796800
## 1053            NA     -4.5912660       -3.3090580   -2.3355370   -4.2825790
## 1054            NA     -6.7364660       -5.2414270   -4.2679060   -6.2149480
## 1055            NA      0.9519582        1.2098910    2.1834120    0.2363701
## 1056            NA      6.9798160        6.8930660    7.8665870    5.9195460
## 1057            NA     -2.2454120       -1.2987520   -0.6103685   -1.9871350
## 1058            NA      0.6832830        0.4593931    1.4373550   -0.5185690
## 1059            NA    -10.7598000       -7.7820820   -6.8041200   -8.7600440
## 1060            NA     -4.5912660       -3.2974860   -2.3195240   -4.2754480
## 1061            NA     -6.7364660       -5.2269910   -4.2490290   -6.2049530
## 1062            NA      0.9519582        1.2114160    2.1893780    0.2334537
## 1063            NA      6.9798160        6.8871210    7.8650830    5.9091590
## 1064            NA     -2.2454120       -1.2914380   -0.5999145   -1.9829620
## 1065            NA      0.4981917        0.3200221    1.2818400   -0.6417959
## 1066            NA    -10.7598000       -7.8127010   -6.8508830   -8.7745190
## 1067            NA     -4.5912660       -3.3605190   -2.3987010   -4.3223370
## 1068            NA     -7.8457840       -6.7602640   -5.7984460   -7.7220820
## 1069            NA      0.9519582        1.2129400    2.1747580    0.2511222
## 1070            NA      6.9798160        6.8691160    7.8309350    5.9072980
## 1071            NA     -2.4611470       -1.5885670   -0.9084594   -2.2686760
## 1072            NA      0.5244246        0.3391895    1.3053710   -0.6269922
## 1073            NA    -10.7598000       -7.7811720   -6.8149910   -8.7473540
## 1074            NA     -4.5912660       -3.3389480   -2.3727670   -4.3051300
## 1075            NA     -7.8457840       -6.7400660   -5.7738840   -7.7062470
## 1076            NA      0.9519582        1.2142610    2.1804420    0.2480791
## 1077            NA      6.9798160        6.8625310    7.8287130    5.8963490
## 1078            NA     -2.4567750       -1.5740340   -0.8908406   -2.2572280
## 1079            NA      0.4291241        0.2677850    1.2380050   -0.7024354
## 1080            NA    -10.7598000       -7.7852950   -6.8150740   -8.7555150
## 1081            NA     -4.5912660       -3.3662280   -2.3960080   -4.3364490
## 1082            NA     -7.8457840       -6.7473920   -5.7771710   -7.7176120
## 1083            NA      0.9519582        1.2155810    2.1858020    0.2453608
## 1084            NA      6.9798160        6.8480040    7.8182240    5.8777830
## 1085            NA     -2.4726580       -1.5945910   -0.9085414   -2.2806400
## 1086            NA      0.3726307        0.2254873    1.1999210   -0.7489465
## 1087            NA    -10.7598000       -7.7781070   -6.8036730   -8.7525410
## 1088            NA     -4.5912660       -3.3781690   -2.4037350   -4.3526030
## 1089            NA     -7.8457840       -6.7460940   -5.7716600   -7.7205280
## 1090            NA      0.9519582        1.2169020    2.1913350    0.2424678
## 1091            NA      6.9798160        6.8359370    7.8103710    5.8615030
## 1092            NA     -2.4820740       -1.6040070   -0.9149786   -2.2930360
##           category                         indicator            timestamp
## 1     stock market                           S&P 500 00:00:48  3 Nov 2020
## 2         spending Personal consumption expenditures 00:00:48  3 Nov 2020
## 3    manufacturing             Industrial production 00:00:48  3 Nov 2020
## 4             jobs                  Nonfarm payrolls 00:00:48  3 Nov 2020
## 5        inflation              Consumer price index 00:00:48  3 Nov 2020
## 6           income   Real disposable personal income 00:00:48  3 Nov 2020
## 7         combined     Average of all six indicators 00:00:48  3 Nov 2020
## 8     stock market                           S&P 500 23:45:03  2 Nov 2020
## 9         spending Personal consumption expenditures 23:45:03  2 Nov 2020
## 10   manufacturing             Industrial production 23:45:03  2 Nov 2020
## 11            jobs                  Nonfarm payrolls 23:45:03  2 Nov 2020
## 12       inflation              Consumer price index 23:45:03  2 Nov 2020
## 13          income   Real disposable personal income 23:45:03  2 Nov 2020
## 14        combined     Average of all six indicators 23:45:03  2 Nov 2020
## 15    stock market                           S&P 500 23:11:03  1 Nov 2020
## 16        spending Personal consumption expenditures 23:11:03  1 Nov 2020
## 17   manufacturing             Industrial production 23:11:03  1 Nov 2020
## 18            jobs                  Nonfarm payrolls 23:11:03  1 Nov 2020
## 19       inflation              Consumer price index 23:11:03  1 Nov 2020
## 20          income   Real disposable personal income 23:11:03  1 Nov 2020
## 21        combined     Average of all six indicators 23:11:03  1 Nov 2020
## 22    stock market                           S&P 500 22:23:03 31 Oct 2020
## 23        spending Personal consumption expenditures 22:23:03 31 Oct 2020
## 24   manufacturing             Industrial production 22:23:03 31 Oct 2020
## 25            jobs                  Nonfarm payrolls 22:23:03 31 Oct 2020
## 26       inflation              Consumer price index 22:23:03 31 Oct 2020
## 27          income   Real disposable personal income 22:23:03 31 Oct 2020
## 28        combined     Average of all six indicators 22:23:03 31 Oct 2020
## 29    stock market                           S&P 500 21:34:03 30 Oct 2020
## 30        spending Personal consumption expenditures 21:34:03 30 Oct 2020
## 31   manufacturing             Industrial production 21:34:03 30 Oct 2020
## 32            jobs                  Nonfarm payrolls 21:34:03 30 Oct 2020
## 33       inflation              Consumer price index 21:34:03 30 Oct 2020
## 34          income   Real disposable personal income 21:34:03 30 Oct 2020
## 35        combined     Average of all six indicators 21:34:03 30 Oct 2020
## 36    stock market                           S&P 500 22:17:03 29 Oct 2020
## 37        spending Personal consumption expenditures 22:17:03 29 Oct 2020
## 38   manufacturing             Industrial production 22:17:03 29 Oct 2020
## 39            jobs                  Nonfarm payrolls 22:17:03 29 Oct 2020
## 40       inflation              Consumer price index 22:17:03 29 Oct 2020
## 41          income   Real disposable personal income 22:17:03 29 Oct 2020
## 42        combined     Average of all six indicators 22:17:03 29 Oct 2020
## 43    stock market                           S&P 500 21:36:04 28 Oct 2020
## 44        spending Personal consumption expenditures 21:36:04 28 Oct 2020
## 45   manufacturing             Industrial production 21:36:04 28 Oct 2020
## 46            jobs                  Nonfarm payrolls 21:36:04 28 Oct 2020
## 47       inflation              Consumer price index 21:36:04 28 Oct 2020
## 48          income   Real disposable personal income 21:36:04 28 Oct 2020
## 49        combined     Average of all six indicators 21:36:04 28 Oct 2020
## 50    stock market                           S&P 500 21:01:03 27 Oct 2020
## 51        spending Personal consumption expenditures 21:01:03 27 Oct 2020
## 52   manufacturing             Industrial production 21:01:03 27 Oct 2020
## 53            jobs                  Nonfarm payrolls 21:01:03 27 Oct 2020
## 54       inflation              Consumer price index 21:01:03 27 Oct 2020
## 55          income   Real disposable personal income 21:01:03 27 Oct 2020
## 56        combined     Average of all six indicators 21:01:03 27 Oct 2020
## 57    stock market                           S&P 500 20:38:03 26 Oct 2020
## 58        spending Personal consumption expenditures 20:38:03 26 Oct 2020
## 59   manufacturing             Industrial production 20:38:03 26 Oct 2020
## 60            jobs                  Nonfarm payrolls 20:38:03 26 Oct 2020
## 61       inflation              Consumer price index 20:38:03 26 Oct 2020
## 62          income   Real disposable personal income 20:38:03 26 Oct 2020
## 63        combined     Average of all six indicators 20:38:03 26 Oct 2020
## 64    stock market                           S&P 500 20:47:03 25 Oct 2020
## 65        spending Personal consumption expenditures 20:47:03 25 Oct 2020
## 66   manufacturing             Industrial production 20:47:03 25 Oct 2020
## 67            jobs                  Nonfarm payrolls 20:47:03 25 Oct 2020
## 68       inflation              Consumer price index 20:47:03 25 Oct 2020
## 69          income   Real disposable personal income 20:47:03 25 Oct 2020
## 70        combined     Average of all six indicators 20:47:03 25 Oct 2020
## 71    stock market                           S&P 500 22:24:03 24 Oct 2020
## 72        spending Personal consumption expenditures 22:24:03 24 Oct 2020
## 73   manufacturing             Industrial production 22:24:03 24 Oct 2020
## 74            jobs                  Nonfarm payrolls 22:24:03 24 Oct 2020
## 75       inflation              Consumer price index 22:24:03 24 Oct 2020
## 76          income   Real disposable personal income 22:24:03 24 Oct 2020
## 77        combined     Average of all six indicators 22:24:03 24 Oct 2020
## 78    stock market                           S&P 500 22:19:03 23 Oct 2020
## 79        spending Personal consumption expenditures 22:19:03 23 Oct 2020
## 80   manufacturing             Industrial production 22:19:03 23 Oct 2020
## 81            jobs                  Nonfarm payrolls 22:19:03 23 Oct 2020
## 82       inflation              Consumer price index 22:19:03 23 Oct 2020
## 83          income   Real disposable personal income 22:19:03 23 Oct 2020
## 84        combined     Average of all six indicators 22:19:03 23 Oct 2020
## 85    stock market                           S&P 500 19:00:04 22 Oct 2020
## 86        spending Personal consumption expenditures 19:00:04 22 Oct 2020
## 87   manufacturing             Industrial production 19:00:04 22 Oct 2020
## 88            jobs                  Nonfarm payrolls 19:00:04 22 Oct 2020
## 89       inflation              Consumer price index 19:00:04 22 Oct 2020
## 90          income   Real disposable personal income 19:00:04 22 Oct 2020
## 91        combined     Average of all six indicators 19:00:04 22 Oct 2020
## 92    stock market                           S&P 500 20:34:25 21 Oct 2020
## 93        spending Personal consumption expenditures 20:34:25 21 Oct 2020
## 94   manufacturing             Industrial production 20:34:25 21 Oct 2020
## 95            jobs                  Nonfarm payrolls 20:34:25 21 Oct 2020
## 96       inflation              Consumer price index 20:34:25 21 Oct 2020
## 97          income   Real disposable personal income 20:34:25 21 Oct 2020
## 98        combined     Average of all six indicators 20:34:25 21 Oct 2020
## 99    stock market                           S&P 500 21:36:03 20 Oct 2020
## 100       spending Personal consumption expenditures 21:36:03 20 Oct 2020
## 101  manufacturing             Industrial production 21:36:03 20 Oct 2020
## 102           jobs                  Nonfarm payrolls 21:36:03 20 Oct 2020
## 103      inflation              Consumer price index 21:36:03 20 Oct 2020
## 104         income   Real disposable personal income 21:36:03 20 Oct 2020
## 105       combined     Average of all six indicators 21:36:03 20 Oct 2020
## 106   stock market                           S&P 500 21:55:04 19 Oct 2020
## 107       spending Personal consumption expenditures 21:55:04 19 Oct 2020
## 108  manufacturing             Industrial production 21:55:04 19 Oct 2020
## 109           jobs                  Nonfarm payrolls 21:55:04 19 Oct 2020
## 110      inflation              Consumer price index 21:55:04 19 Oct 2020
## 111         income   Real disposable personal income 21:55:04 19 Oct 2020
## 112       combined     Average of all six indicators 21:55:04 19 Oct 2020
## 113   stock market                           S&P 500 21:11:03 18 Oct 2020
## 114       spending Personal consumption expenditures 21:11:03 18 Oct 2020
## 115  manufacturing             Industrial production 21:11:03 18 Oct 2020
## 116           jobs                  Nonfarm payrolls 21:11:03 18 Oct 2020
## 117      inflation              Consumer price index 21:11:03 18 Oct 2020
## 118         income   Real disposable personal income 21:11:03 18 Oct 2020
## 119       combined     Average of all six indicators 21:11:03 18 Oct 2020
## 120   stock market                           S&P 500 19:17:03 17 Oct 2020
## 121       spending Personal consumption expenditures 19:17:03 17 Oct 2020
## 122  manufacturing             Industrial production 19:17:03 17 Oct 2020
## 123           jobs                  Nonfarm payrolls 19:17:03 17 Oct 2020
## 124      inflation              Consumer price index 19:17:03 17 Oct 2020
## 125         income   Real disposable personal income 19:17:03 17 Oct 2020
## 126       combined     Average of all six indicators 19:17:03 17 Oct 2020
## 127   stock market                           S&P 500 21:08:11 16 Oct 2020
## 128       spending Personal consumption expenditures 21:08:11 16 Oct 2020
## 129  manufacturing             Industrial production 21:08:11 16 Oct 2020
## 130           jobs                  Nonfarm payrolls 21:08:11 16 Oct 2020
## 131      inflation              Consumer price index 21:08:11 16 Oct 2020
## 132         income   Real disposable personal income 21:08:11 16 Oct 2020
## 133       combined     Average of all six indicators 21:08:11 16 Oct 2020
## 134   stock market                           S&P 500 20:38:03 15 Oct 2020
## 135       spending Personal consumption expenditures 20:38:03 15 Oct 2020
## 136  manufacturing             Industrial production 20:38:03 15 Oct 2020
## 137           jobs                  Nonfarm payrolls 20:38:03 15 Oct 2020
## 138      inflation              Consumer price index 20:38:03 15 Oct 2020
## 139         income   Real disposable personal income 20:38:03 15 Oct 2020
## 140       combined     Average of all six indicators 20:38:03 15 Oct 2020
## 141   stock market                           S&P 500 21:42:04 14 Oct 2020
## 142       spending Personal consumption expenditures 21:42:04 14 Oct 2020
## 143  manufacturing             Industrial production 21:42:04 14 Oct 2020
## 144           jobs                  Nonfarm payrolls 21:42:04 14 Oct 2020
## 145      inflation              Consumer price index 21:42:04 14 Oct 2020
## 146         income   Real disposable personal income 21:42:04 14 Oct 2020
## 147       combined     Average of all six indicators 21:42:04 14 Oct 2020
## 148   stock market                           S&P 500 23:16:03 13 Oct 2020
## 149       spending Personal consumption expenditures 23:16:03 13 Oct 2020
## 150  manufacturing             Industrial production 23:16:03 13 Oct 2020
## 151           jobs                  Nonfarm payrolls 23:16:03 13 Oct 2020
## 152      inflation              Consumer price index 23:16:03 13 Oct 2020
## 153         income   Real disposable personal income 23:16:03 13 Oct 2020
## 154       combined     Average of all six indicators 23:16:03 13 Oct 2020
## 155   stock market                           S&P 500 21:07:03 12 Oct 2020
## 156       spending Personal consumption expenditures 21:07:03 12 Oct 2020
## 157  manufacturing             Industrial production 21:07:03 12 Oct 2020
## 158           jobs                  Nonfarm payrolls 21:07:03 12 Oct 2020
## 159      inflation              Consumer price index 21:07:03 12 Oct 2020
## 160         income   Real disposable personal income 21:07:03 12 Oct 2020
## 161       combined     Average of all six indicators 21:07:03 12 Oct 2020
## 162   stock market                           S&P 500 19:00:04 11 Oct 2020
## 163       spending Personal consumption expenditures 19:00:04 11 Oct 2020
## 164  manufacturing             Industrial production 19:00:04 11 Oct 2020
## 165           jobs                  Nonfarm payrolls 19:00:04 11 Oct 2020
## 166      inflation              Consumer price index 19:00:04 11 Oct 2020
## 167         income   Real disposable personal income 19:00:04 11 Oct 2020
## 168       combined     Average of all six indicators 19:00:04 11 Oct 2020
## 169   stock market                           S&P 500 19:00:03 10 Oct 2020
## 170       spending Personal consumption expenditures 19:00:03 10 Oct 2020
## 171  manufacturing             Industrial production 19:00:03 10 Oct 2020
## 172           jobs                  Nonfarm payrolls 19:00:03 10 Oct 2020
## 173      inflation              Consumer price index 19:00:03 10 Oct 2020
## 174         income   Real disposable personal income 19:00:03 10 Oct 2020
## 175       combined     Average of all six indicators 19:00:03 10 Oct 2020
## 176   stock market                           S&P 500 19:46:04  9 Oct 2020
## 177       spending Personal consumption expenditures 19:46:04  9 Oct 2020
## 178  manufacturing             Industrial production 19:46:04  9 Oct 2020
## 179           jobs                  Nonfarm payrolls 19:46:04  9 Oct 2020
## 180      inflation              Consumer price index 19:46:04  9 Oct 2020
## 181         income   Real disposable personal income 19:46:04  9 Oct 2020
## 182       combined     Average of all six indicators 19:46:04  9 Oct 2020
## 183   stock market                           S&P 500 21:25:03  8 Oct 2020
## 184       spending Personal consumption expenditures 21:25:03  8 Oct 2020
## 185  manufacturing             Industrial production 21:25:03  8 Oct 2020
## 186           jobs                  Nonfarm payrolls 21:25:03  8 Oct 2020
## 187      inflation              Consumer price index 21:25:03  8 Oct 2020
## 188         income   Real disposable personal income 21:25:03  8 Oct 2020
## 189       combined     Average of all six indicators 21:25:03  8 Oct 2020
## 190   stock market                           S&P 500 20:48:03  7 Oct 2020
## 191       spending Personal consumption expenditures 20:48:03  7 Oct 2020
## 192  manufacturing             Industrial production 20:48:03  7 Oct 2020
## 193           jobs                  Nonfarm payrolls 20:48:03  7 Oct 2020
## 194      inflation              Consumer price index 20:48:03  7 Oct 2020
## 195         income   Real disposable personal income 20:48:03  7 Oct 2020
## 196       combined     Average of all six indicators 20:48:03  7 Oct 2020
## 197   stock market                           S&P 500 22:00:03  6 Oct 2020
## 198       spending Personal consumption expenditures 22:00:03  6 Oct 2020
## 199  manufacturing             Industrial production 22:00:03  6 Oct 2020
## 200           jobs                  Nonfarm payrolls 22:00:03  6 Oct 2020
## 201      inflation              Consumer price index 22:00:03  6 Oct 2020
## 202         income   Real disposable personal income 22:00:03  6 Oct 2020
## 203       combined     Average of all six indicators 22:00:03  6 Oct 2020
## 204   stock market                           S&P 500 23:45:04  5 Oct 2020
## 205       spending Personal consumption expenditures 23:45:04  5 Oct 2020
## 206  manufacturing             Industrial production 23:45:04  5 Oct 2020
## 207           jobs                  Nonfarm payrolls 23:45:04  5 Oct 2020
## 208      inflation              Consumer price index 23:45:04  5 Oct 2020
## 209         income   Real disposable personal income 23:45:04  5 Oct 2020
## 210       combined     Average of all six indicators 23:45:04  5 Oct 2020
## 211   stock market                           S&P 500 20:24:03  4 Oct 2020
## 212       spending Personal consumption expenditures 20:24:03  4 Oct 2020
## 213  manufacturing             Industrial production 20:24:03  4 Oct 2020
## 214           jobs                  Nonfarm payrolls 20:24:03  4 Oct 2020
## 215      inflation              Consumer price index 20:24:03  4 Oct 2020
## 216         income   Real disposable personal income 20:24:03  4 Oct 2020
## 217       combined     Average of all six indicators 20:24:03  4 Oct 2020
## 218   stock market                           S&P 500 20:48:03  3 Oct 2020
## 219       spending Personal consumption expenditures 20:48:03  3 Oct 2020
## 220  manufacturing             Industrial production 20:48:03  3 Oct 2020
## 221           jobs                  Nonfarm payrolls 20:48:03  3 Oct 2020
## 222      inflation              Consumer price index 20:48:03  3 Oct 2020
## 223         income   Real disposable personal income 20:48:03  3 Oct 2020
## 224       combined     Average of all six indicators 20:48:03  3 Oct 2020
## 225   stock market                           S&P 500 22:26:02  2 Oct 2020
## 226       spending Personal consumption expenditures 22:26:02  2 Oct 2020
## 227  manufacturing             Industrial production 22:26:02  2 Oct 2020
## 228           jobs                  Nonfarm payrolls 22:26:02  2 Oct 2020
## 229      inflation              Consumer price index 22:26:02  2 Oct 2020
## 230         income   Real disposable personal income 22:26:02  2 Oct 2020
## 231       combined     Average of all six indicators 22:26:02  2 Oct 2020
## 232   stock market                           S&P 500 21:27:02  1 Oct 2020
## 233       spending Personal consumption expenditures 21:27:02  1 Oct 2020
## 234  manufacturing             Industrial production 21:27:02  1 Oct 2020
## 235           jobs                  Nonfarm payrolls 21:27:02  1 Oct 2020
## 236      inflation              Consumer price index 21:27:02  1 Oct 2020
## 237         income   Real disposable personal income 21:27:02  1 Oct 2020
## 238       combined     Average of all six indicators 21:27:02  1 Oct 2020
## 239   stock market                           S&P 500 20:24:04 30 Sep 2020
## 240       spending Personal consumption expenditures 20:24:04 30 Sep 2020
## 241  manufacturing             Industrial production 20:24:04 30 Sep 2020
## 242           jobs                  Nonfarm payrolls 20:24:04 30 Sep 2020
## 243      inflation              Consumer price index 20:24:04 30 Sep 2020
## 244         income   Real disposable personal income 20:24:04 30 Sep 2020
## 245       combined     Average of all six indicators 20:24:04 30 Sep 2020
## 246   stock market                           S&P 500 20:44:03 29 Sep 2020
## 247       spending Personal consumption expenditures 20:44:03 29 Sep 2020
## 248  manufacturing             Industrial production 20:44:03 29 Sep 2020
## 249           jobs                  Nonfarm payrolls 20:44:03 29 Sep 2020
## 250      inflation              Consumer price index 20:44:03 29 Sep 2020
## 251         income   Real disposable personal income 20:44:03 29 Sep 2020
## 252       combined     Average of all six indicators 20:44:03 29 Sep 2020
## 253   stock market                           S&P 500 22:13:03 28 Sep 2020
## 254       spending Personal consumption expenditures 22:13:03 28 Sep 2020
## 255  manufacturing             Industrial production 22:13:03 28 Sep 2020
## 256           jobs                  Nonfarm payrolls 22:13:03 28 Sep 2020
## 257      inflation              Consumer price index 22:13:03 28 Sep 2020
## 258         income   Real disposable personal income 22:13:03 28 Sep 2020
## 259       combined     Average of all six indicators 22:13:03 28 Sep 2020
## 260   stock market                           S&P 500 20:00:04 27 Sep 2020
## 261       spending Personal consumption expenditures 20:00:04 27 Sep 2020
## 262  manufacturing             Industrial production 20:00:04 27 Sep 2020
## 263           jobs                  Nonfarm payrolls 20:00:04 27 Sep 2020
## 264      inflation              Consumer price index 20:00:04 27 Sep 2020
## 265         income   Real disposable personal income 20:00:04 27 Sep 2020
## 266       combined     Average of all six indicators 20:00:04 27 Sep 2020
## 267   stock market                           S&P 500 19:00:04 26 Sep 2020
## 268       spending Personal consumption expenditures 19:00:04 26 Sep 2020
## 269  manufacturing             Industrial production 19:00:04 26 Sep 2020
## 270           jobs                  Nonfarm payrolls 19:00:04 26 Sep 2020
## 271      inflation              Consumer price index 19:00:04 26 Sep 2020
## 272         income   Real disposable personal income 19:00:04 26 Sep 2020
## 273       combined     Average of all six indicators 19:00:04 26 Sep 2020
## 274   stock market                           S&P 500 22:17:03 25 Sep 2020
## 275       spending Personal consumption expenditures 22:17:03 25 Sep 2020
## 276  manufacturing             Industrial production 22:17:03 25 Sep 2020
## 277           jobs                  Nonfarm payrolls 22:17:03 25 Sep 2020
## 278      inflation              Consumer price index 22:17:03 25 Sep 2020
## 279         income   Real disposable personal income 22:17:03 25 Sep 2020
## 280       combined     Average of all six indicators 22:17:03 25 Sep 2020
## 281   stock market                           S&P 500 19:10:02 24 Sep 2020
## 282       spending Personal consumption expenditures 19:10:02 24 Sep 2020
## 283  manufacturing             Industrial production 19:10:02 24 Sep 2020
## 284           jobs                  Nonfarm payrolls 19:10:02 24 Sep 2020
## 285      inflation              Consumer price index 19:10:02 24 Sep 2020
## 286         income   Real disposable personal income 19:10:02 24 Sep 2020
## 287       combined     Average of all six indicators 19:10:02 24 Sep 2020
## 288   stock market                           S&P 500 20:53:03 23 Sep 2020
## 289       spending Personal consumption expenditures 20:53:03 23 Sep 2020
## 290  manufacturing             Industrial production 20:53:03 23 Sep 2020
## 291           jobs                  Nonfarm payrolls 20:53:03 23 Sep 2020
## 292      inflation              Consumer price index 20:53:03 23 Sep 2020
## 293         income   Real disposable personal income 20:53:03 23 Sep 2020
## 294       combined     Average of all six indicators 20:53:03 23 Sep 2020
## 295   stock market                           S&P 500 19:00:04 22 Sep 2020
## 296       spending Personal consumption expenditures 19:00:04 22 Sep 2020
## 297  manufacturing             Industrial production 19:00:04 22 Sep 2020
## 298           jobs                  Nonfarm payrolls 19:00:04 22 Sep 2020
## 299      inflation              Consumer price index 19:00:04 22 Sep 2020
## 300         income   Real disposable personal income 19:00:04 22 Sep 2020
## 301       combined     Average of all six indicators 19:00:04 22 Sep 2020
## 302   stock market                           S&P 500 19:00:04 21 Sep 2020
## 303       spending Personal consumption expenditures 19:00:04 21 Sep 2020
## 304  manufacturing             Industrial production 19:00:04 21 Sep 2020
## 305           jobs                  Nonfarm payrolls 19:00:04 21 Sep 2020
## 306      inflation              Consumer price index 19:00:04 21 Sep 2020
## 307         income   Real disposable personal income 19:00:04 21 Sep 2020
## 308       combined     Average of all six indicators 19:00:04 21 Sep 2020
## 309   stock market                           S&P 500 22:02:03 20 Sep 2020
## 310       spending Personal consumption expenditures 22:02:03 20 Sep 2020
## 311  manufacturing             Industrial production 22:02:03 20 Sep 2020
## 312           jobs                  Nonfarm payrolls 22:02:03 20 Sep 2020
## 313      inflation              Consumer price index 22:02:03 20 Sep 2020
## 314         income   Real disposable personal income 22:02:03 20 Sep 2020
## 315       combined     Average of all six indicators 22:02:03 20 Sep 2020
## 316   stock market                           S&P 500 19:00:04 19 Sep 2020
## 317       spending Personal consumption expenditures 19:00:04 19 Sep 2020
## 318  manufacturing             Industrial production 19:00:04 19 Sep 2020
## 319           jobs                  Nonfarm payrolls 19:00:04 19 Sep 2020
## 320      inflation              Consumer price index 19:00:04 19 Sep 2020
## 321         income   Real disposable personal income 19:00:04 19 Sep 2020
## 322       combined     Average of all six indicators 19:00:04 19 Sep 2020
## 323   stock market                           S&P 500 19:20:04 18 Sep 2020
## 324       spending Personal consumption expenditures 19:20:04 18 Sep 2020
## 325  manufacturing             Industrial production 19:20:04 18 Sep 2020
## 326           jobs                  Nonfarm payrolls 19:20:04 18 Sep 2020
## 327      inflation              Consumer price index 19:20:04 18 Sep 2020
## 328         income   Real disposable personal income 19:20:04 18 Sep 2020
## 329       combined     Average of all six indicators 19:20:04 18 Sep 2020
## 330   stock market                           S&P 500 19:00:03 17 Sep 2020
## 331       spending Personal consumption expenditures 19:00:03 17 Sep 2020
## 332  manufacturing             Industrial production 19:00:03 17 Sep 2020
## 333           jobs                  Nonfarm payrolls 19:00:03 17 Sep 2020
## 334      inflation              Consumer price index 19:00:03 17 Sep 2020
## 335         income   Real disposable personal income 19:00:03 17 Sep 2020
## 336       combined     Average of all six indicators 19:00:03 17 Sep 2020
## 337   stock market                           S&P 500 23:12:03 16 Sep 2020
## 338       spending Personal consumption expenditures 23:12:03 16 Sep 2020
## 339  manufacturing             Industrial production 23:12:03 16 Sep 2020
## 340           jobs                  Nonfarm payrolls 23:12:03 16 Sep 2020
## 341      inflation              Consumer price index 23:12:03 16 Sep 2020
## 342         income   Real disposable personal income 23:12:03 16 Sep 2020
## 343       combined     Average of all six indicators 23:12:03 16 Sep 2020
## 344   stock market                           S&P 500 23:33:03 15 Sep 2020
## 345       spending Personal consumption expenditures 23:33:03 15 Sep 2020
## 346  manufacturing             Industrial production 23:33:03 15 Sep 2020
## 347           jobs                  Nonfarm payrolls 23:33:03 15 Sep 2020
## 348      inflation              Consumer price index 23:33:03 15 Sep 2020
## 349         income   Real disposable personal income 23:33:03 15 Sep 2020
## 350       combined     Average of all six indicators 23:33:03 15 Sep 2020
## 351   stock market                           S&P 500 23:33:03 14 Sep 2020
## 352       spending Personal consumption expenditures 23:33:03 14 Sep 2020
## 353  manufacturing             Industrial production 23:33:03 14 Sep 2020
## 354           jobs                  Nonfarm payrolls 23:33:03 14 Sep 2020
## 355      inflation              Consumer price index 23:33:03 14 Sep 2020
## 356         income   Real disposable personal income 23:33:03 14 Sep 2020
## 357       combined     Average of all six indicators 23:33:03 14 Sep 2020
## 358   stock market                           S&P 500 19:00:03 13 Sep 2020
## 359       spending Personal consumption expenditures 19:00:03 13 Sep 2020
## 360  manufacturing             Industrial production 19:00:03 13 Sep 2020
## 361           jobs                  Nonfarm payrolls 19:00:03 13 Sep 2020
## 362      inflation              Consumer price index 19:00:03 13 Sep 2020
## 363         income   Real disposable personal income 19:00:03 13 Sep 2020
## 364       combined     Average of all six indicators 19:00:03 13 Sep 2020
## 365   stock market                           S&P 500 19:00:04 12 Sep 2020
## 366       spending Personal consumption expenditures 19:00:04 12 Sep 2020
## 367  manufacturing             Industrial production 19:00:04 12 Sep 2020
## 368           jobs                  Nonfarm payrolls 19:00:04 12 Sep 2020
## 369      inflation              Consumer price index 19:00:04 12 Sep 2020
## 370         income   Real disposable personal income 19:00:04 12 Sep 2020
## 371       combined     Average of all six indicators 19:00:04 12 Sep 2020
## 372   stock market                           S&P 500 19:00:03 11 Sep 2020
## 373       spending Personal consumption expenditures 19:00:03 11 Sep 2020
## 374  manufacturing             Industrial production 19:00:03 11 Sep 2020
## 375           jobs                  Nonfarm payrolls 19:00:03 11 Sep 2020
## 376      inflation              Consumer price index 19:00:03 11 Sep 2020
## 377         income   Real disposable personal income 19:00:03 11 Sep 2020
## 378       combined     Average of all six indicators 19:00:03 11 Sep 2020
## 379   stock market                           S&P 500 21:47:02 10 Sep 2020
## 380       spending Personal consumption expenditures 21:47:02 10 Sep 2020
## 381  manufacturing             Industrial production 21:47:02 10 Sep 2020
## 382           jobs                  Nonfarm payrolls 21:47:02 10 Sep 2020
## 383      inflation              Consumer price index 21:47:02 10 Sep 2020
## 384         income   Real disposable personal income 21:47:02 10 Sep 2020
## 385       combined     Average of all six indicators 21:47:02 10 Sep 2020
## 386   stock market                           S&P 500 23:52:03  9 Sep 2020
## 387       spending Personal consumption expenditures 23:52:03  9 Sep 2020
## 388  manufacturing             Industrial production 23:52:03  9 Sep 2020
## 389           jobs                  Nonfarm payrolls 23:52:03  9 Sep 2020
## 390      inflation              Consumer price index 23:52:03  9 Sep 2020
## 391         income   Real disposable personal income 23:52:03  9 Sep 2020
## 392       combined     Average of all six indicators 23:52:03  9 Sep 2020
## 393   stock market                           S&P 500 22:02:02  8 Sep 2020
## 394       spending Personal consumption expenditures 22:02:02  8 Sep 2020
## 395  manufacturing             Industrial production 22:02:02  8 Sep 2020
## 396           jobs                  Nonfarm payrolls 22:02:02  8 Sep 2020
## 397      inflation              Consumer price index 22:02:02  8 Sep 2020
## 398         income   Real disposable personal income 22:02:02  8 Sep 2020
## 399       combined     Average of all six indicators 22:02:02  8 Sep 2020
## 400   stock market                           S&P 500 21:01:02  7 Sep 2020
## 401       spending Personal consumption expenditures 21:01:02  7 Sep 2020
## 402  manufacturing             Industrial production 21:01:02  7 Sep 2020
## 403           jobs                  Nonfarm payrolls 21:01:02  7 Sep 2020
## 404      inflation              Consumer price index 21:01:02  7 Sep 2020
## 405         income   Real disposable personal income 21:01:02  7 Sep 2020
## 406       combined     Average of all six indicators 21:01:02  7 Sep 2020
## 407   stock market                           S&P 500 21:06:02  6 Sep 2020
## 408       spending Personal consumption expenditures 21:06:02  6 Sep 2020
## 409  manufacturing             Industrial production 21:06:02  6 Sep 2020
## 410           jobs                  Nonfarm payrolls 21:06:02  6 Sep 2020
## 411      inflation              Consumer price index 21:06:02  6 Sep 2020
## 412         income   Real disposable personal income 21:06:02  6 Sep 2020
## 413       combined     Average of all six indicators 21:06:02  6 Sep 2020
## 414   stock market                           S&P 500 22:17:02  5 Sep 2020
## 415       spending Personal consumption expenditures 22:17:02  5 Sep 2020
## 416  manufacturing             Industrial production 22:17:02  5 Sep 2020
## 417           jobs                  Nonfarm payrolls 22:17:02  5 Sep 2020
## 418      inflation              Consumer price index 22:17:02  5 Sep 2020
## 419         income   Real disposable personal income 22:17:02  5 Sep 2020
## 420       combined     Average of all six indicators 22:17:02  5 Sep 2020
## 421   stock market                           S&P 500 22:34:02  4 Sep 2020
## 422       spending Personal consumption expenditures 22:34:02  4 Sep 2020
## 423  manufacturing             Industrial production 22:34:02  4 Sep 2020
## 424           jobs                  Nonfarm payrolls 22:34:02  4 Sep 2020
## 425      inflation              Consumer price index 22:34:02  4 Sep 2020
## 426         income   Real disposable personal income 22:34:02  4 Sep 2020
## 427       combined     Average of all six indicators 22:34:02  4 Sep 2020
## 428   stock market                           S&P 500 21:55:03  3 Sep 2020
## 429       spending Personal consumption expenditures 21:55:03  3 Sep 2020
## 430  manufacturing             Industrial production 21:55:03  3 Sep 2020
## 431           jobs                  Nonfarm payrolls 21:55:03  3 Sep 2020
## 432      inflation              Consumer price index 21:55:03  3 Sep 2020
## 433         income   Real disposable personal income 21:55:03  3 Sep 2020
## 434       combined     Average of all six indicators 21:55:03  3 Sep 2020
## 435   stock market                           S&P 500 21:52:26  2 Sep 2020
## 436       spending Personal consumption expenditures 21:52:26  2 Sep 2020
## 437  manufacturing             Industrial production 21:52:26  2 Sep 2020
## 438           jobs                  Nonfarm payrolls 21:52:26  2 Sep 2020
## 439      inflation              Consumer price index 21:52:26  2 Sep 2020
## 440         income   Real disposable personal income 21:52:26  2 Sep 2020
## 441       combined     Average of all six indicators 21:52:26  2 Sep 2020
## 442   stock market                           S&P 500 19:06:02  1 Sep 2020
## 443       spending Personal consumption expenditures 19:06:02  1 Sep 2020
## 444  manufacturing             Industrial production 19:06:02  1 Sep 2020
## 445           jobs                  Nonfarm payrolls 19:06:02  1 Sep 2020
## 446      inflation              Consumer price index 19:06:02  1 Sep 2020
## 447         income   Real disposable personal income 19:06:02  1 Sep 2020
## 448       combined     Average of all six indicators 19:06:02  1 Sep 2020
## 449   stock market                           S&P 500 19:00:04 31 Aug 2020
## 450       spending Personal consumption expenditures 19:00:04 31 Aug 2020
## 451  manufacturing             Industrial production 19:00:04 31 Aug 2020
## 452           jobs                  Nonfarm payrolls 19:00:04 31 Aug 2020
## 453      inflation              Consumer price index 19:00:04 31 Aug 2020
## 454         income   Real disposable personal income 19:00:04 31 Aug 2020
## 455       combined     Average of all six indicators 19:00:04 31 Aug 2020
## 456   stock market                           S&P 500 20:23:02 30 Aug 2020
## 457       spending Personal consumption expenditures 20:23:02 30 Aug 2020
## 458  manufacturing             Industrial production 20:23:02 30 Aug 2020
## 459           jobs                  Nonfarm payrolls 20:23:02 30 Aug 2020
## 460      inflation              Consumer price index 20:23:02 30 Aug 2020
## 461         income   Real disposable personal income 20:23:02 30 Aug 2020
## 462       combined     Average of all six indicators 20:23:02 30 Aug 2020
## 463   stock market                           S&P 500 19:00:02 29 Aug 2020
## 464       spending Personal consumption expenditures 19:00:02 29 Aug 2020
## 465  manufacturing             Industrial production 19:00:02 29 Aug 2020
## 466           jobs                  Nonfarm payrolls 19:00:02 29 Aug 2020
## 467      inflation              Consumer price index 19:00:02 29 Aug 2020
## 468         income   Real disposable personal income 19:00:02 29 Aug 2020
## 469       combined     Average of all six indicators 19:00:02 29 Aug 2020
## 470   stock market                           S&P 500 19:00:03 28 Aug 2020
## 471       spending Personal consumption expenditures 19:00:03 28 Aug 2020
## 472  manufacturing             Industrial production 19:00:03 28 Aug 2020
## 473           jobs                  Nonfarm payrolls 19:00:03 28 Aug 2020
## 474      inflation              Consumer price index 19:00:03 28 Aug 2020
## 475         income   Real disposable personal income 19:00:03 28 Aug 2020
## 476       combined     Average of all six indicators 19:00:03 28 Aug 2020
## 477   stock market                           S&P 500 19:00:04 27 Aug 2020
## 478       spending Personal consumption expenditures 19:00:04 27 Aug 2020
## 479  manufacturing             Industrial production 19:00:04 27 Aug 2020
## 480           jobs                  Nonfarm payrolls 19:00:04 27 Aug 2020
## 481      inflation              Consumer price index 19:00:04 27 Aug 2020
## 482         income   Real disposable personal income 19:00:04 27 Aug 2020
## 483       combined     Average of all six indicators 19:00:04 27 Aug 2020
## 484   stock market                           S&P 500 19:01:03 26 Aug 2020
## 485       spending Personal consumption expenditures 19:01:03 26 Aug 2020
## 486  manufacturing             Industrial production 19:01:03 26 Aug 2020
## 487           jobs                  Nonfarm payrolls 19:01:03 26 Aug 2020
## 488      inflation              Consumer price index 19:01:03 26 Aug 2020
## 489         income   Real disposable personal income 19:01:03 26 Aug 2020
## 490       combined     Average of all six indicators 19:01:03 26 Aug 2020
## 491   stock market                           S&P 500 23:50:03 25 Aug 2020
## 492       spending Personal consumption expenditures 23:50:03 25 Aug 2020
## 493  manufacturing             Industrial production 23:50:03 25 Aug 2020
## 494           jobs                  Nonfarm payrolls 23:50:03 25 Aug 2020
## 495      inflation              Consumer price index 23:50:03 25 Aug 2020
## 496         income   Real disposable personal income 23:50:03 25 Aug 2020
## 497       combined     Average of all six indicators 23:50:03 25 Aug 2020
## 498   stock market                           S&P 500 20:38:02 24 Aug 2020
## 499       spending Personal consumption expenditures 20:38:02 24 Aug 2020
## 500  manufacturing             Industrial production 20:38:02 24 Aug 2020
## 501           jobs                  Nonfarm payrolls 20:38:02 24 Aug 2020
## 502      inflation              Consumer price index 20:38:02 24 Aug 2020
## 503         income   Real disposable personal income 20:38:02 24 Aug 2020
## 504       combined     Average of all six indicators 20:38:02 24 Aug 2020
## 505   stock market                           S&P 500 19:00:03 23 Aug 2020
## 506       spending Personal consumption expenditures 19:00:03 23 Aug 2020
## 507  manufacturing             Industrial production 19:00:03 23 Aug 2020
## 508           jobs                  Nonfarm payrolls 19:00:03 23 Aug 2020
## 509      inflation              Consumer price index 19:00:03 23 Aug 2020
## 510         income   Real disposable personal income 19:00:03 23 Aug 2020
## 511       combined     Average of all six indicators 19:00:03 23 Aug 2020
## 512   stock market                           S&P 500 19:00:03 22 Aug 2020
## 513       spending Personal consumption expenditures 19:00:03 22 Aug 2020
## 514  manufacturing             Industrial production 19:00:03 22 Aug 2020
## 515           jobs                  Nonfarm payrolls 19:00:03 22 Aug 2020
## 516      inflation              Consumer price index 19:00:03 22 Aug 2020
## 517         income   Real disposable personal income 19:00:03 22 Aug 2020
## 518       combined     Average of all six indicators 19:00:03 22 Aug 2020
## 519   stock market                           S&P 500 19:26:02 21 Aug 2020
## 520       spending Personal consumption expenditures 19:26:02 21 Aug 2020
## 521  manufacturing             Industrial production 19:26:02 21 Aug 2020
## 522           jobs                  Nonfarm payrolls 19:26:02 21 Aug 2020
## 523      inflation              Consumer price index 19:26:02 21 Aug 2020
## 524         income   Real disposable personal income 19:26:02 21 Aug 2020
## 525       combined     Average of all six indicators 19:26:02 21 Aug 2020
## 526   stock market                           S&P 500 19:00:04 20 Aug 2020
## 527       spending Personal consumption expenditures 19:00:04 20 Aug 2020
## 528  manufacturing             Industrial production 19:00:04 20 Aug 2020
## 529           jobs                  Nonfarm payrolls 19:00:04 20 Aug 2020
## 530      inflation              Consumer price index 19:00:04 20 Aug 2020
## 531         income   Real disposable personal income 19:00:04 20 Aug 2020
## 532       combined     Average of all six indicators 19:00:04 20 Aug 2020
## 533   stock market                           S&P 500 23:52:08 19 Aug 2020
## 534       spending Personal consumption expenditures 23:52:08 19 Aug 2020
## 535  manufacturing             Industrial production 23:52:08 19 Aug 2020
## 536           jobs                  Nonfarm payrolls 23:52:08 19 Aug 2020
## 537      inflation              Consumer price index 23:52:08 19 Aug 2020
## 538         income   Real disposable personal income 23:52:08 19 Aug 2020
## 539       combined     Average of all six indicators 23:52:08 19 Aug 2020
## 540   stock market                           S&P 500 19:23:03 18 Aug 2020
## 541       spending Personal consumption expenditures 19:23:03 18 Aug 2020
## 542  manufacturing             Industrial production 19:23:03 18 Aug 2020
## 543           jobs                  Nonfarm payrolls 19:23:03 18 Aug 2020
## 544      inflation              Consumer price index 19:23:03 18 Aug 2020
## 545         income   Real disposable personal income 19:23:03 18 Aug 2020
## 546       combined     Average of all six indicators 19:23:03 18 Aug 2020
## 547   stock market                           S&P 500 22:43:02 17 Aug 2020
## 548       spending Personal consumption expenditures 22:43:02 17 Aug 2020
## 549  manufacturing             Industrial production 22:43:02 17 Aug 2020
## 550           jobs                  Nonfarm payrolls 22:43:02 17 Aug 2020
## 551      inflation              Consumer price index 22:43:02 17 Aug 2020
## 552         income   Real disposable personal income 22:43:02 17 Aug 2020
## 553       combined     Average of all six indicators 22:43:02 17 Aug 2020
## 554   stock market                           S&P 500 20:17:02 16 Aug 2020
## 555       spending Personal consumption expenditures 20:17:02 16 Aug 2020
## 556  manufacturing             Industrial production 20:17:02 16 Aug 2020
## 557           jobs                  Nonfarm payrolls 20:17:02 16 Aug 2020
## 558      inflation              Consumer price index 20:17:02 16 Aug 2020
## 559         income   Real disposable personal income 20:17:02 16 Aug 2020
## 560       combined     Average of all six indicators 20:17:02 16 Aug 2020
## 561   stock market                           S&P 500 19:00:05 15 Aug 2020
## 562       spending Personal consumption expenditures 19:00:05 15 Aug 2020
## 563  manufacturing             Industrial production 19:00:05 15 Aug 2020
## 564           jobs                  Nonfarm payrolls 19:00:05 15 Aug 2020
## 565      inflation              Consumer price index 19:00:05 15 Aug 2020
## 566         income   Real disposable personal income 19:00:05 15 Aug 2020
## 567       combined     Average of all six indicators 19:00:05 15 Aug 2020
## 568   stock market                           S&P 500 19:00:02 14 Aug 2020
## 569       spending Personal consumption expenditures 19:00:02 14 Aug 2020
## 570  manufacturing             Industrial production 19:00:02 14 Aug 2020
## 571           jobs                  Nonfarm payrolls 19:00:02 14 Aug 2020
## 572      inflation              Consumer price index 19:00:02 14 Aug 2020
## 573         income   Real disposable personal income 19:00:02 14 Aug 2020
## 574       combined     Average of all six indicators 19:00:02 14 Aug 2020
## 575   stock market                           S&P 500 21:50:04 13 Aug 2020
## 576       spending Personal consumption expenditures 21:50:04 13 Aug 2020
## 577  manufacturing             Industrial production 21:50:04 13 Aug 2020
## 578           jobs                  Nonfarm payrolls 21:50:04 13 Aug 2020
## 579      inflation              Consumer price index 21:50:04 13 Aug 2020
## 580         income   Real disposable personal income 21:50:04 13 Aug 2020
## 581       combined     Average of all six indicators 21:50:04 13 Aug 2020
## 582   stock market                           S&P 500 23:41:03 12 Aug 2020
## 583       spending Personal consumption expenditures 23:41:03 12 Aug 2020
## 584  manufacturing             Industrial production 23:41:03 12 Aug 2020
## 585           jobs                  Nonfarm payrolls 23:41:03 12 Aug 2020
## 586      inflation              Consumer price index 23:41:03 12 Aug 2020
## 587         income   Real disposable personal income 23:41:03 12 Aug 2020
## 588       combined     Average of all six indicators 23:41:03 12 Aug 2020
## 589   stock market                           S&P 500 19:08:03 11 Aug 2020
## 590       spending Personal consumption expenditures 19:08:03 11 Aug 2020
## 591  manufacturing             Industrial production 19:08:03 11 Aug 2020
## 592           jobs                  Nonfarm payrolls 19:08:03 11 Aug 2020
## 593      inflation              Consumer price index 19:08:03 11 Aug 2020
## 594         income   Real disposable personal income 19:08:03 11 Aug 2020
## 595       combined     Average of all six indicators 19:08:03 11 Aug 2020
## 596   stock market                           S&P 500 23:50:02 10 Aug 2020
## 597       spending Personal consumption expenditures 23:50:02 10 Aug 2020
## 598  manufacturing             Industrial production 23:50:02 10 Aug 2020
## 599           jobs                  Nonfarm payrolls 23:50:02 10 Aug 2020
## 600      inflation              Consumer price index 23:50:02 10 Aug 2020
## 601         income   Real disposable personal income 23:50:02 10 Aug 2020
## 602       combined     Average of all six indicators 23:50:02 10 Aug 2020
## 603   stock market                           S&P 500 10:15:37 10 Aug 2020
## 604       spending Personal consumption expenditures 10:15:37 10 Aug 2020
## 605  manufacturing             Industrial production 10:15:37 10 Aug 2020
## 606           jobs                  Nonfarm payrolls 10:15:37 10 Aug 2020
## 607      inflation              Consumer price index 10:15:37 10 Aug 2020
## 608         income   Real disposable personal income 10:15:37 10 Aug 2020
## 609       combined     Average of all six indicators 10:15:37 10 Aug 2020
## 610   stock market                           S&P 500 10:19:17 10 Aug 2020
## 611       spending Personal consumption expenditures 10:19:17 10 Aug 2020
## 612  manufacturing             Industrial production 10:19:17 10 Aug 2020
## 613           jobs                  Nonfarm payrolls 10:19:17 10 Aug 2020
## 614      inflation              Consumer price index 10:19:17 10 Aug 2020
## 615         income   Real disposable personal income 10:19:17 10 Aug 2020
## 616       combined     Average of all six indicators 10:19:17 10 Aug 2020
## 617   stock market                           S&P 500 10:19:37 10 Aug 2020
## 618       spending Personal consumption expenditures 10:19:37 10 Aug 2020
## 619  manufacturing             Industrial production 10:19:37 10 Aug 2020
## 620           jobs                  Nonfarm payrolls 10:19:37 10 Aug 2020
## 621      inflation              Consumer price index 10:19:37 10 Aug 2020
## 622         income   Real disposable personal income 10:19:37 10 Aug 2020
## 623       combined     Average of all six indicators 10:19:37 10 Aug 2020
## 624   stock market                           S&P 500 10:19:52 10 Aug 2020
## 625       spending Personal consumption expenditures 10:19:52 10 Aug 2020
## 626  manufacturing             Industrial production 10:19:52 10 Aug 2020
## 627           jobs                  Nonfarm payrolls 10:19:52 10 Aug 2020
## 628      inflation              Consumer price index 10:19:52 10 Aug 2020
## 629         income   Real disposable personal income 10:19:52 10 Aug 2020
## 630       combined     Average of all six indicators 10:19:52 10 Aug 2020
## 631   stock market                           S&P 500 10:19:56 10 Aug 2020
## 632       spending Personal consumption expenditures 10:19:56 10 Aug 2020
## 633  manufacturing             Industrial production 10:19:56 10 Aug 2020
## 634           jobs                  Nonfarm payrolls 10:19:56 10 Aug 2020
## 635      inflation              Consumer price index 10:19:56 10 Aug 2020
## 636         income   Real disposable personal income 10:19:56 10 Aug 2020
## 637       combined     Average of all six indicators 10:19:56 10 Aug 2020
## 638   stock market                           S&P 500 10:22:17 10 Aug 2020
## 639       spending Personal consumption expenditures 10:22:17 10 Aug 2020
## 640  manufacturing             Industrial production 10:22:17 10 Aug 2020
## 641           jobs                  Nonfarm payrolls 10:22:17 10 Aug 2020
## 642      inflation              Consumer price index 10:22:17 10 Aug 2020
## 643         income   Real disposable personal income 10:22:17 10 Aug 2020
## 644       combined     Average of all six indicators 10:22:17 10 Aug 2020
## 645   stock market                           S&P 500 10:25:40 10 Aug 2020
## 646       spending Personal consumption expenditures 10:25:40 10 Aug 2020
## 647  manufacturing             Industrial production 10:25:40 10 Aug 2020
## 648           jobs                  Nonfarm payrolls 10:25:40 10 Aug 2020
## 649      inflation              Consumer price index 10:25:40 10 Aug 2020
## 650         income   Real disposable personal income 10:25:40 10 Aug 2020
## 651       combined     Average of all six indicators 10:25:40 10 Aug 2020
## 652   stock market                           S&P 500 10:26:03 10 Aug 2020
## 653       spending Personal consumption expenditures 10:26:03 10 Aug 2020
## 654  manufacturing             Industrial production 10:26:03 10 Aug 2020
## 655           jobs                  Nonfarm payrolls 10:26:03 10 Aug 2020
## 656      inflation              Consumer price index 10:26:03 10 Aug 2020
## 657         income   Real disposable personal income 10:26:03 10 Aug 2020
## 658       combined     Average of all six indicators 10:26:03 10 Aug 2020
## 659   stock market                           S&P 500 10:26:11 10 Aug 2020
## 660       spending Personal consumption expenditures 10:26:11 10 Aug 2020
## 661  manufacturing             Industrial production 10:26:11 10 Aug 2020
## 662           jobs                  Nonfarm payrolls 10:26:11 10 Aug 2020
## 663      inflation              Consumer price index 10:26:11 10 Aug 2020
## 664         income   Real disposable personal income 10:26:11 10 Aug 2020
## 665       combined     Average of all six indicators 10:26:11 10 Aug 2020
## 666   stock market                           S&P 500 10:26:36 10 Aug 2020
## 667       spending Personal consumption expenditures 10:26:36 10 Aug 2020
## 668  manufacturing             Industrial production 10:26:36 10 Aug 2020
## 669           jobs                  Nonfarm payrolls 10:26:36 10 Aug 2020
## 670      inflation              Consumer price index 10:26:36 10 Aug 2020
## 671         income   Real disposable personal income 10:26:36 10 Aug 2020
## 672       combined     Average of all six indicators 10:26:36 10 Aug 2020
## 673   stock market                           S&P 500 10:28:57 10 Aug 2020
## 674       spending Personal consumption expenditures 10:28:57 10 Aug 2020
## 675  manufacturing             Industrial production 10:28:57 10 Aug 2020
## 676           jobs                  Nonfarm payrolls 10:28:57 10 Aug 2020
## 677      inflation              Consumer price index 10:28:57 10 Aug 2020
## 678         income   Real disposable personal income 10:28:57 10 Aug 2020
## 679       combined     Average of all six indicators 10:28:57 10 Aug 2020
## 680   stock market                           S&P 500 10:32:02 10 Aug 2020
## 681       spending Personal consumption expenditures 10:32:02 10 Aug 2020
## 682  manufacturing             Industrial production 10:32:02 10 Aug 2020
## 683           jobs                  Nonfarm payrolls 10:32:02 10 Aug 2020
## 684      inflation              Consumer price index 10:32:02 10 Aug 2020
## 685         income   Real disposable personal income 10:32:02 10 Aug 2020
## 686       combined     Average of all six indicators 10:32:02 10 Aug 2020
## 687   stock market                           S&P 500 10:32:31 10 Aug 2020
## 688       spending Personal consumption expenditures 10:32:31 10 Aug 2020
## 689  manufacturing             Industrial production 10:32:31 10 Aug 2020
## 690           jobs                  Nonfarm payrolls 10:32:31 10 Aug 2020
## 691      inflation              Consumer price index 10:32:31 10 Aug 2020
## 692         income   Real disposable personal income 10:32:31 10 Aug 2020
## 693       combined     Average of all six indicators 10:32:31 10 Aug 2020
## 694   stock market                           S&P 500 10:32:26 10 Aug 2020
## 695       spending Personal consumption expenditures 10:32:26 10 Aug 2020
## 696  manufacturing             Industrial production 10:32:26 10 Aug 2020
## 697           jobs                  Nonfarm payrolls 10:32:26 10 Aug 2020
## 698      inflation              Consumer price index 10:32:26 10 Aug 2020
## 699         income   Real disposable personal income 10:32:26 10 Aug 2020
## 700       combined     Average of all six indicators 10:32:26 10 Aug 2020
## 701   stock market                           S&P 500 10:33:13 10 Aug 2020
## 702       spending Personal consumption expenditures 10:33:13 10 Aug 2020
## 703  manufacturing             Industrial production 10:33:13 10 Aug 2020
## 704           jobs                  Nonfarm payrolls 10:33:13 10 Aug 2020
## 705      inflation              Consumer price index 10:33:13 10 Aug 2020
## 706         income   Real disposable personal income 10:33:13 10 Aug 2020
## 707       combined     Average of all six indicators 10:33:13 10 Aug 2020
## 708   stock market                           S&P 500 10:35:37 10 Aug 2020
## 709       spending Personal consumption expenditures 10:35:37 10 Aug 2020
## 710  manufacturing             Industrial production 10:35:37 10 Aug 2020
## 711           jobs                  Nonfarm payrolls 10:35:37 10 Aug 2020
## 712      inflation              Consumer price index 10:35:37 10 Aug 2020
## 713         income   Real disposable personal income 10:35:37 10 Aug 2020
## 714       combined     Average of all six indicators 10:35:37 10 Aug 2020
## 715   stock market                           S&P 500 10:38:25 10 Aug 2020
## 716       spending Personal consumption expenditures 10:38:25 10 Aug 2020
## 717  manufacturing             Industrial production 10:38:25 10 Aug 2020
## 718           jobs                  Nonfarm payrolls 10:38:25 10 Aug 2020
## 719      inflation              Consumer price index 10:38:25 10 Aug 2020
## 720         income   Real disposable personal income 10:38:25 10 Aug 2020
## 721       combined     Average of all six indicators 10:38:25 10 Aug 2020
## 722   stock market                           S&P 500 10:38:51 10 Aug 2020
## 723       spending Personal consumption expenditures 10:38:51 10 Aug 2020
## 724  manufacturing             Industrial production 10:38:51 10 Aug 2020
## 725           jobs                  Nonfarm payrolls 10:38:51 10 Aug 2020
## 726      inflation              Consumer price index 10:38:51 10 Aug 2020
## 727         income   Real disposable personal income 10:38:51 10 Aug 2020
## 728       combined     Average of all six indicators 10:38:51 10 Aug 2020
## 729   stock market                           S&P 500 10:38:41 10 Aug 2020
## 730       spending Personal consumption expenditures 10:38:41 10 Aug 2020
## 731  manufacturing             Industrial production 10:38:41 10 Aug 2020
## 732           jobs                  Nonfarm payrolls 10:38:41 10 Aug 2020
## 733      inflation              Consumer price index 10:38:41 10 Aug 2020
## 734         income   Real disposable personal income 10:38:41 10 Aug 2020
## 735       combined     Average of all six indicators 10:38:41 10 Aug 2020
## 736   stock market                           S&P 500 10:39:48 10 Aug 2020
## 737       spending Personal consumption expenditures 10:39:48 10 Aug 2020
## 738  manufacturing             Industrial production 10:39:48 10 Aug 2020
## 739           jobs                  Nonfarm payrolls 10:39:48 10 Aug 2020
## 740      inflation              Consumer price index 10:39:48 10 Aug 2020
## 741         income   Real disposable personal income 10:39:48 10 Aug 2020
## 742       combined     Average of all six indicators 10:39:48 10 Aug 2020
## 743   stock market                           S&P 500 10:42:12 10 Aug 2020
## 744       spending Personal consumption expenditures 10:42:12 10 Aug 2020
## 745  manufacturing             Industrial production 10:42:12 10 Aug 2020
## 746           jobs                  Nonfarm payrolls 10:42:12 10 Aug 2020
## 747      inflation              Consumer price index 10:42:12 10 Aug 2020
## 748         income   Real disposable personal income 10:42:12 10 Aug 2020
## 749       combined     Average of all six indicators 10:42:12 10 Aug 2020
## 750   stock market                           S&P 500 10:44:46 10 Aug 2020
## 751       spending Personal consumption expenditures 10:44:46 10 Aug 2020
## 752  manufacturing             Industrial production 10:44:46 10 Aug 2020
## 753           jobs                  Nonfarm payrolls 10:44:46 10 Aug 2020
## 754      inflation              Consumer price index 10:44:46 10 Aug 2020
## 755         income   Real disposable personal income 10:44:46 10 Aug 2020
## 756       combined     Average of all six indicators 10:44:46 10 Aug 2020
## 757   stock market                           S&P 500 10:45:11 10 Aug 2020
## 758       spending Personal consumption expenditures 10:45:11 10 Aug 2020
## 759  manufacturing             Industrial production 10:45:11 10 Aug 2020
## 760           jobs                  Nonfarm payrolls 10:45:11 10 Aug 2020
## 761      inflation              Consumer price index 10:45:11 10 Aug 2020
## 762         income   Real disposable personal income 10:45:11 10 Aug 2020
## 763       combined     Average of all six indicators 10:45:11 10 Aug 2020
## 764   stock market                           S&P 500 10:44:52 10 Aug 2020
## 765       spending Personal consumption expenditures 10:44:52 10 Aug 2020
## 766  manufacturing             Industrial production 10:44:52 10 Aug 2020
## 767           jobs                  Nonfarm payrolls 10:44:52 10 Aug 2020
## 768      inflation              Consumer price index 10:44:52 10 Aug 2020
## 769         income   Real disposable personal income 10:44:52 10 Aug 2020
## 770       combined     Average of all six indicators 10:44:52 10 Aug 2020
## 771   stock market                           S&P 500 10:46:23 10 Aug 2020
## 772       spending Personal consumption expenditures 10:46:23 10 Aug 2020
## 773  manufacturing             Industrial production 10:46:23 10 Aug 2020
## 774           jobs                  Nonfarm payrolls 10:46:23 10 Aug 2020
## 775      inflation              Consumer price index 10:46:23 10 Aug 2020
## 776         income   Real disposable personal income 10:46:23 10 Aug 2020
## 777       combined     Average of all six indicators 10:46:23 10 Aug 2020
## 778   stock market                           S&P 500 10:48:47 10 Aug 2020
## 779       spending Personal consumption expenditures 10:48:47 10 Aug 2020
## 780  manufacturing             Industrial production 10:48:47 10 Aug 2020
## 781           jobs                  Nonfarm payrolls 10:48:47 10 Aug 2020
## 782      inflation              Consumer price index 10:48:47 10 Aug 2020
## 783         income   Real disposable personal income 10:48:47 10 Aug 2020
## 784       combined     Average of all six indicators 10:48:47 10 Aug 2020
## 785   stock market                           S&P 500 10:51:08 10 Aug 2020
## 786       spending Personal consumption expenditures 10:51:08 10 Aug 2020
## 787  manufacturing             Industrial production 10:51:08 10 Aug 2020
## 788           jobs                  Nonfarm payrolls 10:51:08 10 Aug 2020
## 789      inflation              Consumer price index 10:51:08 10 Aug 2020
## 790         income   Real disposable personal income 10:51:08 10 Aug 2020
## 791       combined     Average of all six indicators 10:51:08 10 Aug 2020
## 792   stock market                           S&P 500 10:51:31 10 Aug 2020
## 793       spending Personal consumption expenditures 10:51:31 10 Aug 2020
## 794  manufacturing             Industrial production 10:51:31 10 Aug 2020
## 795           jobs                  Nonfarm payrolls 10:51:31 10 Aug 2020
## 796      inflation              Consumer price index 10:51:31 10 Aug 2020
## 797         income   Real disposable personal income 10:51:31 10 Aug 2020
## 798       combined     Average of all six indicators 10:51:31 10 Aug 2020
## 799   stock market                           S&P 500 10:51:04 10 Aug 2020
## 800       spending Personal consumption expenditures 10:51:04 10 Aug 2020
## 801  manufacturing             Industrial production 10:51:04 10 Aug 2020
## 802           jobs                  Nonfarm payrolls 10:51:04 10 Aug 2020
## 803      inflation              Consumer price index 10:51:04 10 Aug 2020
## 804         income   Real disposable personal income 10:51:04 10 Aug 2020
## 805       combined     Average of all six indicators 10:51:04 10 Aug 2020
## 806   stock market                           S&P 500 10:52:57 10 Aug 2020
## 807       spending Personal consumption expenditures 10:52:57 10 Aug 2020
## 808  manufacturing             Industrial production 10:52:57 10 Aug 2020
## 809           jobs                  Nonfarm payrolls 10:52:57 10 Aug 2020
## 810      inflation              Consumer price index 10:52:57 10 Aug 2020
## 811         income   Real disposable personal income 10:52:57 10 Aug 2020
## 812       combined     Average of all six indicators 10:52:57 10 Aug 2020
## 813   stock market                           S&P 500 10:55:24 10 Aug 2020
## 814       spending Personal consumption expenditures 10:55:24 10 Aug 2020
## 815  manufacturing             Industrial production 10:55:24 10 Aug 2020
## 816           jobs                  Nonfarm payrolls 10:55:24 10 Aug 2020
## 817      inflation              Consumer price index 10:55:24 10 Aug 2020
## 818         income   Real disposable personal income 10:55:24 10 Aug 2020
## 819       combined     Average of all six indicators 10:55:24 10 Aug 2020
## 820   stock market                           S&P 500 10:57:25 10 Aug 2020
## 821       spending Personal consumption expenditures 10:57:25 10 Aug 2020
## 822  manufacturing             Industrial production 10:57:25 10 Aug 2020
## 823           jobs                  Nonfarm payrolls 10:57:25 10 Aug 2020
## 824      inflation              Consumer price index 10:57:25 10 Aug 2020
## 825         income   Real disposable personal income 10:57:25 10 Aug 2020
## 826       combined     Average of all six indicators 10:57:25 10 Aug 2020
## 827   stock market                           S&P 500 10:57:48 10 Aug 2020
## 828       spending Personal consumption expenditures 10:57:48 10 Aug 2020
## 829  manufacturing             Industrial production 10:57:48 10 Aug 2020
## 830           jobs                  Nonfarm payrolls 10:57:48 10 Aug 2020
## 831      inflation              Consumer price index 10:57:48 10 Aug 2020
## 832         income   Real disposable personal income 10:57:48 10 Aug 2020
## 833       combined     Average of all six indicators 10:57:48 10 Aug 2020
## 834   stock market                           S&P 500 10:57:16 10 Aug 2020
## 835       spending Personal consumption expenditures 10:57:16 10 Aug 2020
## 836  manufacturing             Industrial production 10:57:16 10 Aug 2020
## 837           jobs                  Nonfarm payrolls 10:57:16 10 Aug 2020
## 838      inflation              Consumer price index 10:57:16 10 Aug 2020
## 839         income   Real disposable personal income 10:57:16 10 Aug 2020
## 840       combined     Average of all six indicators 10:57:16 10 Aug 2020
## 841   stock market                           S&P 500 10:59:26 10 Aug 2020
## 842       spending Personal consumption expenditures 10:59:26 10 Aug 2020
## 843  manufacturing             Industrial production 10:59:26 10 Aug 2020
## 844           jobs                  Nonfarm payrolls 10:59:26 10 Aug 2020
## 845      inflation              Consumer price index 10:59:26 10 Aug 2020
## 846         income   Real disposable personal income 10:59:26 10 Aug 2020
## 847       combined     Average of all six indicators 10:59:26 10 Aug 2020
## 848   stock market                           S&P 500 11:01:55 10 Aug 2020
## 849       spending Personal consumption expenditures 11:01:55 10 Aug 2020
## 850  manufacturing             Industrial production 11:01:55 10 Aug 2020
## 851           jobs                  Nonfarm payrolls 11:01:55 10 Aug 2020
## 852      inflation              Consumer price index 11:01:55 10 Aug 2020
## 853         income   Real disposable personal income 11:01:55 10 Aug 2020
## 854       combined     Average of all six indicators 11:01:55 10 Aug 2020
## 855   stock market                           S&P 500 11:03:40 10 Aug 2020
## 856       spending Personal consumption expenditures 11:03:40 10 Aug 2020
## 857  manufacturing             Industrial production 11:03:40 10 Aug 2020
## 858           jobs                  Nonfarm payrolls 11:03:40 10 Aug 2020
## 859      inflation              Consumer price index 11:03:40 10 Aug 2020
## 860         income   Real disposable personal income 11:03:40 10 Aug 2020
## 861       combined     Average of all six indicators 11:03:40 10 Aug 2020
## 862   stock market                           S&P 500 11:04:06 10 Aug 2020
## 863       spending Personal consumption expenditures 11:04:06 10 Aug 2020
## 864  manufacturing             Industrial production 11:04:06 10 Aug 2020
## 865           jobs                  Nonfarm payrolls 11:04:06 10 Aug 2020
## 866      inflation              Consumer price index 11:04:06 10 Aug 2020
## 867         income   Real disposable personal income 11:04:06 10 Aug 2020
## 868       combined     Average of all six indicators 11:04:06 10 Aug 2020
## 869   stock market                           S&P 500 11:03:27 10 Aug 2020
## 870       spending Personal consumption expenditures 11:03:27 10 Aug 2020
## 871  manufacturing             Industrial production 11:03:27 10 Aug 2020
## 872           jobs                  Nonfarm payrolls 11:03:27 10 Aug 2020
## 873      inflation              Consumer price index 11:03:27 10 Aug 2020
## 874         income   Real disposable personal income 11:03:27 10 Aug 2020
## 875       combined     Average of all six indicators 11:03:27 10 Aug 2020
## 876   stock market                           S&P 500 11:05:57 10 Aug 2020
## 877       spending Personal consumption expenditures 11:05:57 10 Aug 2020
## 878  manufacturing             Industrial production 11:05:57 10 Aug 2020
## 879           jobs                  Nonfarm payrolls 11:05:57 10 Aug 2020
## 880      inflation              Consumer price index 11:05:57 10 Aug 2020
## 881         income   Real disposable personal income 11:05:57 10 Aug 2020
## 882       combined     Average of all six indicators 11:05:57 10 Aug 2020
## 883   stock market                           S&P 500 11:08:25 10 Aug 2020
## 884       spending Personal consumption expenditures 11:08:25 10 Aug 2020
## 885  manufacturing             Industrial production 11:08:25 10 Aug 2020
## 886           jobs                  Nonfarm payrolls 11:08:25 10 Aug 2020
## 887      inflation              Consumer price index 11:08:25 10 Aug 2020
## 888         income   Real disposable personal income 11:08:25 10 Aug 2020
## 889       combined     Average of all six indicators 11:08:25 10 Aug 2020
## 890   stock market                           S&P 500 11:09:55 10 Aug 2020
## 891       spending Personal consumption expenditures 11:09:55 10 Aug 2020
## 892  manufacturing             Industrial production 11:09:55 10 Aug 2020
## 893           jobs                  Nonfarm payrolls 11:09:55 10 Aug 2020
## 894      inflation              Consumer price index 11:09:55 10 Aug 2020
## 895         income   Real disposable personal income 11:09:55 10 Aug 2020
## 896       combined     Average of all six indicators 11:09:55 10 Aug 2020
## 897   stock market                           S&P 500 11:10:24 10 Aug 2020
## 898       spending Personal consumption expenditures 11:10:24 10 Aug 2020
## 899  manufacturing             Industrial production 11:10:24 10 Aug 2020
## 900           jobs                  Nonfarm payrolls 11:10:24 10 Aug 2020
## 901      inflation              Consumer price index 11:10:24 10 Aug 2020
## 902         income   Real disposable personal income 11:10:24 10 Aug 2020
## 903       combined     Average of all six indicators 11:10:24 10 Aug 2020
## 904   stock market                           S&P 500 11:09:37 10 Aug 2020
## 905       spending Personal consumption expenditures 11:09:37 10 Aug 2020
## 906  manufacturing             Industrial production 11:09:37 10 Aug 2020
## 907           jobs                  Nonfarm payrolls 11:09:37 10 Aug 2020
## 908      inflation              Consumer price index 11:09:37 10 Aug 2020
## 909         income   Real disposable personal income 11:09:37 10 Aug 2020
## 910       combined     Average of all six indicators 11:09:37 10 Aug 2020
## 911   stock market                           S&P 500 11:12:25 10 Aug 2020
## 912       spending Personal consumption expenditures 11:12:25 10 Aug 2020
## 913  manufacturing             Industrial production 11:12:25 10 Aug 2020
## 914           jobs                  Nonfarm payrolls 11:12:25 10 Aug 2020
## 915      inflation              Consumer price index 11:12:25 10 Aug 2020
## 916         income   Real disposable personal income 11:12:25 10 Aug 2020
## 917       combined     Average of all six indicators 11:12:25 10 Aug 2020
## 918   stock market                           S&P 500 11:14:55 10 Aug 2020
## 919       spending Personal consumption expenditures 11:14:55 10 Aug 2020
## 920  manufacturing             Industrial production 11:14:55 10 Aug 2020
## 921           jobs                  Nonfarm payrolls 11:14:55 10 Aug 2020
## 922      inflation              Consumer price index 11:14:55 10 Aug 2020
## 923         income   Real disposable personal income 11:14:55 10 Aug 2020
## 924       combined     Average of all six indicators 11:14:55 10 Aug 2020
## 925   stock market                           S&P 500 11:16:09 10 Aug 2020
## 926       spending Personal consumption expenditures 11:16:09 10 Aug 2020
## 927  manufacturing             Industrial production 11:16:09 10 Aug 2020
## 928           jobs                  Nonfarm payrolls 11:16:09 10 Aug 2020
## 929      inflation              Consumer price index 11:16:09 10 Aug 2020
## 930         income   Real disposable personal income 11:16:09 10 Aug 2020
## 931       combined     Average of all six indicators 11:16:09 10 Aug 2020
## 932   stock market                           S&P 500 11:16:41 10 Aug 2020
## 933       spending Personal consumption expenditures 11:16:41 10 Aug 2020
## 934  manufacturing             Industrial production 11:16:41 10 Aug 2020
## 935           jobs                  Nonfarm payrolls 11:16:41 10 Aug 2020
## 936      inflation              Consumer price index 11:16:41 10 Aug 2020
## 937         income   Real disposable personal income 11:16:41 10 Aug 2020
## 938       combined     Average of all six indicators 11:16:41 10 Aug 2020
## 939   stock market                           S&P 500 11:15:47 10 Aug 2020
## 940       spending Personal consumption expenditures 11:15:47 10 Aug 2020
## 941  manufacturing             Industrial production 11:15:47 10 Aug 2020
## 942           jobs                  Nonfarm payrolls 11:15:47 10 Aug 2020
## 943      inflation              Consumer price index 11:15:47 10 Aug 2020
## 944         income   Real disposable personal income 11:15:47 10 Aug 2020
## 945       combined     Average of all six indicators 11:15:47 10 Aug 2020
## 946   stock market                           S&P 500 11:18:56 10 Aug 2020
## 947       spending Personal consumption expenditures 11:18:56 10 Aug 2020
## 948  manufacturing             Industrial production 11:18:56 10 Aug 2020
## 949           jobs                  Nonfarm payrolls 11:18:56 10 Aug 2020
## 950      inflation              Consumer price index 11:18:56 10 Aug 2020
## 951         income   Real disposable personal income 11:18:56 10 Aug 2020
## 952       combined     Average of all six indicators 11:18:56 10 Aug 2020
## 953   stock market                           S&P 500 11:21:24 10 Aug 2020
## 954       spending Personal consumption expenditures 11:21:24 10 Aug 2020
## 955  manufacturing             Industrial production 11:21:24 10 Aug 2020
## 956           jobs                  Nonfarm payrolls 11:21:24 10 Aug 2020
## 957      inflation              Consumer price index 11:21:24 10 Aug 2020
## 958         income   Real disposable personal income 11:21:24 10 Aug 2020
## 959       combined     Average of all six indicators 11:21:24 10 Aug 2020
## 960   stock market                           S&P 500 11:45:11 10 Aug 2020
## 961       spending Personal consumption expenditures 11:45:11 10 Aug 2020
## 962  manufacturing             Industrial production 11:45:11 10 Aug 2020
## 963           jobs                  Nonfarm payrolls 11:45:11 10 Aug 2020
## 964      inflation              Consumer price index 11:45:11 10 Aug 2020
## 965         income   Real disposable personal income 11:45:11 10 Aug 2020
## 966       combined     Average of all six indicators 11:45:11 10 Aug 2020
## 967   stock market                           S&P 500 11:46:38 10 Aug 2020
## 968       spending Personal consumption expenditures 11:46:38 10 Aug 2020
## 969  manufacturing             Industrial production 11:46:38 10 Aug 2020
## 970           jobs                  Nonfarm payrolls 11:46:38 10 Aug 2020
## 971      inflation              Consumer price index 11:46:38 10 Aug 2020
## 972         income   Real disposable personal income 11:46:38 10 Aug 2020
## 973       combined     Average of all six indicators 11:46:38 10 Aug 2020
## 974   stock market                           S&P 500 11:47:02 10 Aug 2020
## 975       spending Personal consumption expenditures 11:47:02 10 Aug 2020
## 976  manufacturing             Industrial production 11:47:02 10 Aug 2020
## 977           jobs                  Nonfarm payrolls 11:47:02 10 Aug 2020
## 978      inflation              Consumer price index 11:47:02 10 Aug 2020
## 979         income   Real disposable personal income 11:47:02 10 Aug 2020
## 980       combined     Average of all six indicators 11:47:02 10 Aug 2020
## 981   stock market                           S&P 500 11:25:22 10 Aug 2020
## 982       spending Personal consumption expenditures 11:25:22 10 Aug 2020
## 983  manufacturing             Industrial production 11:25:22 10 Aug 2020
## 984           jobs                  Nonfarm payrolls 11:25:22 10 Aug 2020
## 985      inflation              Consumer price index 11:25:22 10 Aug 2020
## 986         income   Real disposable personal income 11:25:22 10 Aug 2020
## 987       combined     Average of all six indicators 11:25:22 10 Aug 2020
## 988   stock market                           S&P 500 11:27:55 10 Aug 2020
## 989       spending Personal consumption expenditures 11:27:55 10 Aug 2020
## 990  manufacturing             Industrial production 11:27:55 10 Aug 2020
## 991           jobs                  Nonfarm payrolls 11:27:55 10 Aug 2020
## 992      inflation              Consumer price index 11:27:55 10 Aug 2020
## 993         income   Real disposable personal income 11:27:55 10 Aug 2020
## 994       combined     Average of all six indicators 11:27:55 10 Aug 2020
## 995   stock market                           S&P 500 11:51:25 10 Aug 2020
## 996       spending Personal consumption expenditures 11:51:25 10 Aug 2020
## 997  manufacturing             Industrial production 11:51:25 10 Aug 2020
## 998           jobs                  Nonfarm payrolls 11:51:25 10 Aug 2020
## 999      inflation              Consumer price index 11:51:25 10 Aug 2020
## 1000        income   Real disposable personal income 11:51:25 10 Aug 2020
## 1001      combined     Average of all six indicators 11:51:25 10 Aug 2020
## 1002  stock market                           S&P 500 11:52:52 10 Aug 2020
## 1003      spending Personal consumption expenditures 11:52:52 10 Aug 2020
## 1004 manufacturing             Industrial production 11:52:52 10 Aug 2020
## 1005          jobs                  Nonfarm payrolls 11:52:52 10 Aug 2020
## 1006     inflation              Consumer price index 11:52:52 10 Aug 2020
## 1007        income   Real disposable personal income 11:52:52 10 Aug 2020
## 1008      combined     Average of all six indicators 11:52:52 10 Aug 2020
## 1009  stock market                           S&P 500 11:22:22 10 Aug 2020
## 1010      spending Personal consumption expenditures 11:22:22 10 Aug 2020
## 1011 manufacturing             Industrial production 11:22:22 10 Aug 2020
## 1012          jobs                  Nonfarm payrolls 11:22:22 10 Aug 2020
## 1013     inflation              Consumer price index 11:22:22 10 Aug 2020
## 1014        income   Real disposable personal income 11:22:22 10 Aug 2020
## 1015      combined     Average of all six indicators 11:22:22 10 Aug 2020
## 1016  stock market                           S&P 500 11:31:50 10 Aug 2020
## 1017      spending Personal consumption expenditures 11:31:50 10 Aug 2020
## 1018 manufacturing             Industrial production 11:31:50 10 Aug 2020
## 1019          jobs                  Nonfarm payrolls 11:31:50 10 Aug 2020
## 1020     inflation              Consumer price index 11:31:50 10 Aug 2020
## 1021        income   Real disposable personal income 11:31:50 10 Aug 2020
## 1022      combined     Average of all six indicators 11:31:50 10 Aug 2020
## 1023  stock market                           S&P 500 11:34:24 10 Aug 2020
## 1024      spending Personal consumption expenditures 11:34:24 10 Aug 2020
## 1025 manufacturing             Industrial production 11:34:24 10 Aug 2020
## 1026          jobs                  Nonfarm payrolls 11:34:24 10 Aug 2020
## 1027     inflation              Consumer price index 11:34:24 10 Aug 2020
## 1028        income   Real disposable personal income 11:34:24 10 Aug 2020
## 1029      combined     Average of all six indicators 11:34:24 10 Aug 2020
## 1030  stock market                           S&P 500 11:57:35 10 Aug 2020
## 1031      spending Personal consumption expenditures 11:57:35 10 Aug 2020
## 1032 manufacturing             Industrial production 11:57:35 10 Aug 2020
## 1033          jobs                  Nonfarm payrolls 11:57:35 10 Aug 2020
## 1034     inflation              Consumer price index 11:57:35 10 Aug 2020
## 1035        income   Real disposable personal income 11:57:35 10 Aug 2020
## 1036      combined     Average of all six indicators 11:57:35 10 Aug 2020
## 1037  stock market                           S&P 500 11:59:04 10 Aug 2020
## 1038      spending Personal consumption expenditures 11:59:04 10 Aug 2020
## 1039 manufacturing             Industrial production 11:59:04 10 Aug 2020
## 1040          jobs                  Nonfarm payrolls 11:59:04 10 Aug 2020
## 1041     inflation              Consumer price index 11:59:04 10 Aug 2020
## 1042        income   Real disposable personal income 11:59:04 10 Aug 2020
## 1043      combined     Average of all six indicators 11:59:04 10 Aug 2020
## 1044  stock market                           S&P 500 11:28:26 10 Aug 2020
## 1045      spending Personal consumption expenditures 11:28:26 10 Aug 2020
## 1046 manufacturing             Industrial production 11:28:26 10 Aug 2020
## 1047          jobs                  Nonfarm payrolls 11:28:26 10 Aug 2020
## 1048     inflation              Consumer price index 11:28:26 10 Aug 2020
## 1049        income   Real disposable personal income 11:28:26 10 Aug 2020
## 1050      combined     Average of all six indicators 11:28:26 10 Aug 2020
## 1051  stock market                           S&P 500 11:47:23 10 Aug 2020
## 1052      spending Personal consumption expenditures 11:47:23 10 Aug 2020
## 1053 manufacturing             Industrial production 11:47:23 10 Aug 2020
## 1054          jobs                  Nonfarm payrolls 11:47:23 10 Aug 2020
## 1055     inflation              Consumer price index 11:47:23 10 Aug 2020
## 1056        income   Real disposable personal income 11:47:23 10 Aug 2020
## 1057      combined     Average of all six indicators 11:47:23 10 Aug 2020
## 1058  stock market                           S&P 500 11:40:55 10 Aug 2020
## 1059      spending Personal consumption expenditures 11:40:55 10 Aug 2020
## 1060 manufacturing             Industrial production 11:40:55 10 Aug 2020
## 1061          jobs                  Nonfarm payrolls 11:40:55 10 Aug 2020
## 1062     inflation              Consumer price index 11:40:55 10 Aug 2020
## 1063        income   Real disposable personal income 11:40:55 10 Aug 2020
## 1064      combined     Average of all six indicators 11:40:55 10 Aug 2020
## 1065  stock market                           S&P 500 12:03:40 10 Aug 2020
## 1066      spending Personal consumption expenditures 12:03:40 10 Aug 2020
## 1067 manufacturing             Industrial production 12:03:40 10 Aug 2020
## 1068          jobs                  Nonfarm payrolls 12:03:40 10 Aug 2020
## 1069     inflation              Consumer price index 12:03:40 10 Aug 2020
## 1070        income   Real disposable personal income 12:03:40 10 Aug 2020
## 1071      combined     Average of all six indicators 12:03:40 10 Aug 2020
## 1072  stock market                           S&P 500 11:24:29 10 Aug 2020
## 1073      spending Personal consumption expenditures 11:24:29 10 Aug 2020
## 1074 manufacturing             Industrial production 11:24:29 10 Aug 2020
## 1075          jobs                  Nonfarm payrolls 11:24:29 10 Aug 2020
## 1076     inflation              Consumer price index 11:24:29 10 Aug 2020
## 1077        income   Real disposable personal income 11:24:29 10 Aug 2020
## 1078      combined     Average of all six indicators 11:24:29 10 Aug 2020
## 1079  stock market                           S&P 500 11:34:32 10 Aug 2020
## 1080      spending Personal consumption expenditures 11:34:32 10 Aug 2020
## 1081 manufacturing             Industrial production 11:34:32 10 Aug 2020
## 1082          jobs                  Nonfarm payrolls 11:34:32 10 Aug 2020
## 1083     inflation              Consumer price index 11:34:32 10 Aug 2020
## 1084        income   Real disposable personal income 11:34:32 10 Aug 2020
## 1085      combined     Average of all six indicators 11:34:32 10 Aug 2020
## 1086  stock market                           S&P 500 11:53:49 10 Aug 2020
## 1087      spending Personal consumption expenditures 11:53:49 10 Aug 2020
## 1088 manufacturing             Industrial production 11:53:49 10 Aug 2020
## 1089          jobs                  Nonfarm payrolls 11:53:49 10 Aug 2020
## 1090     inflation              Consumer price index 11:53:49 10 Aug 2020
## 1091        income   Real disposable personal income 11:53:49 10 Aug 2020
## 1092      combined     Average of all six indicators 11:53:49 10 Aug 2020
##      simulations
## 1          40000
## 2          40000
## 3          40000
## 4          40000
## 5          40000
## 6          40000
## 7          40000
## 8          40000
## 9          40000
## 10         40000
## 11         40000
## 12         40000
## 13         40000
## 14         40000
## 15         40000
## 16         40000
## 17         40000
## 18         40000
## 19         40000
## 20         40000
## 21         40000
## 22         40000
## 23         40000
## 24         40000
## 25         40000
## 26         40000
## 27         40000
## 28         40000
## 29         40000
## 30         40000
## 31         40000
## 32         40000
## 33         40000
## 34         40000
## 35         40000
## 36         40000
## 37         40000
## 38         40000
## 39         40000
## 40         40000
## 41         40000
## 42         40000
## 43         40000
## 44         40000
## 45         40000
## 46         40000
## 47         40000
## 48         40000
## 49         40000
## 50         40000
## 51         40000
## 52         40000
## 53         40000
## 54         40000
## 55         40000
## 56         40000
## 57         40000
## 58         40000
## 59         40000
## 60         40000
## 61         40000
## 62         40000
## 63         40000
## 64         40000
## 65         40000
## 66         40000
## 67         40000
## 68         40000
## 69         40000
## 70         40000
## 71         40000
## 72         40000
## 73         40000
## 74         40000
## 75         40000
## 76         40000
## 77         40000
## 78         40000
## 79         40000
## 80         40000
## 81         40000
## 82         40000
## 83         40000
## 84         40000
## 85         40000
## 86         40000
## 87         40000
## 88         40000
## 89         40000
## 90         40000
## 91         40000
## 92         40000
## 93         40000
## 94         40000
## 95         40000
## 96         40000
## 97         40000
## 98         40000
## 99         40000
## 100        40000
## 101        40000
## 102        40000
## 103        40000
## 104        40000
## 105        40000
## 106        40000
## 107        40000
## 108        40000
## 109        40000
## 110        40000
## 111        40000
## 112        40000
## 113        40000
## 114        40000
## 115        40000
## 116        40000
## 117        40000
## 118        40000
## 119        40000
## 120        40000
## 121        40000
## 122        40000
## 123        40000
## 124        40000
## 125        40000
## 126        40000
## 127        40000
## 128        40000
## 129        40000
## 130        40000
## 131        40000
## 132        40000
## 133        40000
## 134        40000
## 135        40000
## 136        40000
## 137        40000
## 138        40000
## 139        40000
## 140        40000
## 141        40000
## 142        40000
## 143        40000
## 144        40000
## 145        40000
## 146        40000
## 147        40000
## 148        40000
## 149        40000
## 150        40000
## 151        40000
## 152        40000
## 153        40000
## 154        40000
## 155        40000
## 156        40000
## 157        40000
## 158        40000
## 159        40000
## 160        40000
## 161        40000
## 162        40000
## 163        40000
## 164        40000
## 165        40000
## 166        40000
## 167        40000
## 168        40000
## 169        40000
## 170        40000
## 171        40000
## 172        40000
## 173        40000
## 174        40000
## 175        40000
## 176        40000
## 177        40000
## 178        40000
## 179        40000
## 180        40000
## 181        40000
## 182        40000
## 183        40000
## 184        40000
## 185        40000
## 186        40000
## 187        40000
## 188        40000
## 189        40000
## 190        40000
## 191        40000
## 192        40000
## 193        40000
## 194        40000
## 195        40000
## 196        40000
## 197        40000
## 198        40000
## 199        40000
## 200        40000
## 201        40000
## 202        40000
## 203        40000
## 204        40000
## 205        40000
## 206        40000
## 207        40000
## 208        40000
## 209        40000
## 210        40000
## 211        40000
## 212        40000
## 213        40000
## 214        40000
## 215        40000
## 216        40000
## 217        40000
## 218        40000
## 219        40000
## 220        40000
## 221        40000
## 222        40000
## 223        40000
## 224        40000
## 225        40000
## 226        40000
## 227        40000
## 228        40000
## 229        40000
## 230        40000
## 231        40000
## 232        40000
## 233        40000
## 234        40000
## 235        40000
## 236        40000
## 237        40000
## 238        40000
## 239        40000
## 240        40000
## 241        40000
## 242        40000
## 243        40000
## 244        40000
## 245        40000
## 246        40000
## 247        40000
## 248        40000
## 249        40000
## 250        40000
## 251        40000
## 252        40000
## 253        40000
## 254        40000
## 255        40000
## 256        40000
## 257        40000
## 258        40000
## 259        40000
## 260        40000
## 261        40000
## 262        40000
## 263        40000
## 264        40000
## 265        40000
## 266        40000
## 267        40000
## 268        40000
## 269        40000
## 270        40000
## 271        40000
## 272        40000
## 273        40000
## 274        40000
## 275        40000
## 276        40000
## 277        40000
## 278        40000
## 279        40000
## 280        40000
## 281        40000
## 282        40000
## 283        40000
## 284        40000
## 285        40000
## 286        40000
## 287        40000
## 288        40000
## 289        40000
## 290        40000
## 291        40000
## 292        40000
## 293        40000
## 294        40000
## 295        40000
## 296        40000
## 297        40000
## 298        40000
## 299        40000
## 300        40000
## 301        40000
## 302        40000
## 303        40000
## 304        40000
## 305        40000
## 306        40000
## 307        40000
## 308        40000
## 309        40000
## 310        40000
## 311        40000
## 312        40000
## 313        40000
## 314        40000
## 315        40000
## 316        40000
## 317        40000
## 318        40000
## 319        40000
## 320        40000
## 321        40000
## 322        40000
## 323        40000
## 324        40000
## 325        40000
## 326        40000
## 327        40000
## 328        40000
## 329        40000
## 330        40000
## 331        40000
## 332        40000
## 333        40000
## 334        40000
## 335        40000
## 336        40000
## 337        40000
## 338        40000
## 339        40000
## 340        40000
## 341        40000
## 342        40000
## 343        40000
## 344        40000
## 345        40000
## 346        40000
## 347        40000
## 348        40000
## 349        40000
## 350        40000
## 351        40000
## 352        40000
## 353        40000
## 354        40000
## 355        40000
## 356        40000
## 357        40000
## 358        40000
## 359        40000
## 360        40000
## 361        40000
## 362        40000
## 363        40000
## 364        40000
## 365        40000
## 366        40000
## 367        40000
## 368        40000
## 369        40000
## 370        40000
## 371        40000
## 372        40000
## 373        40000
## 374        40000
## 375        40000
## 376        40000
## 377        40000
## 378        40000
## 379        40000
## 380        40000
## 381        40000
## 382        40000
## 383        40000
## 384        40000
## 385        40000
## 386        40000
## 387        40000
## 388        40000
## 389        40000
## 390        40000
## 391        40000
## 392        40000
## 393        40000
## 394        40000
## 395        40000
## 396        40000
## 397        40000
## 398        40000
## 399        40000
## 400        40000
## 401        40000
## 402        40000
## 403        40000
## 404        40000
## 405        40000
## 406        40000
## 407        40000
## 408        40000
## 409        40000
## 410        40000
## 411        40000
## 412        40000
## 413        40000
## 414        40000
## 415        40000
## 416        40000
## 417        40000
## 418        40000
## 419        40000
## 420        40000
## 421        40000
## 422        40000
## 423        40000
## 424        40000
## 425        40000
## 426        40000
## 427        40000
## 428        40000
## 429        40000
## 430        40000
## 431        40000
## 432        40000
## 433        40000
## 434        40000
## 435        40000
## 436        40000
## 437        40000
## 438        40000
## 439        40000
## 440        40000
## 441        40000
## 442        40000
## 443        40000
## 444        40000
## 445        40000
## 446        40000
## 447        40000
## 448        40000
## 449        40000
## 450        40000
## 451        40000
## 452        40000
## 453        40000
## 454        40000
## 455        40000
## 456        40000
## 457        40000
## 458        40000
## 459        40000
## 460        40000
## 461        40000
## 462        40000
## 463        40000
## 464        40000
## 465        40000
## 466        40000
## 467        40000
## 468        40000
## 469        40000
## 470        40000
## 471        40000
## 472        40000
## 473        40000
## 474        40000
## 475        40000
## 476        40000
## 477        40000
## 478        40000
## 479        40000
## 480        40000
## 481        40000
## 482        40000
## 483        40000
## 484        40000
## 485        40000
## 486        40000
## 487        40000
## 488        40000
## 489        40000
## 490        40000
## 491        40000
## 492        40000
## 493        40000
## 494        40000
## 495        40000
## 496        40000
## 497        40000
## 498        40000
## 499        40000
## 500        40000
## 501        40000
## 502        40000
## 503        40000
## 504        40000
## 505        40000
## 506        40000
## 507        40000
## 508        40000
## 509        40000
## 510        40000
## 511        40000
## 512        40000
## 513        40000
## 514        40000
## 515        40000
## 516        40000
## 517        40000
## 518        40000
## 519        40000
## 520        40000
## 521        40000
## 522        40000
## 523        40000
## 524        40000
## 525        40000
## 526        40000
## 527        40000
## 528        40000
## 529        40000
## 530        40000
## 531        40000
## 532        40000
## 533        40000
## 534        40000
## 535        40000
## 536        40000
## 537        40000
## 538        40000
## 539        40000
## 540        40000
## 541        40000
## 542        40000
## 543        40000
## 544        40000
## 545        40000
## 546        40000
## 547        40000
## 548        40000
## 549        40000
## 550        40000
## 551        40000
## 552        40000
## 553        40000
## 554        40000
## 555        40000
## 556        40000
## 557        40000
## 558        40000
## 559        40000
## 560        40000
## 561        40000
## 562        40000
## 563        40000
## 564        40000
## 565        40000
## 566        40000
## 567        40000
## 568        40000
## 569        40000
## 570        40000
## 571        40000
## 572        40000
## 573        40000
## 574        40000
## 575        40000
## 576        40000
## 577        40000
## 578        40000
## 579        40000
## 580        40000
## 581        40000
## 582        40000
## 583        40000
## 584        40000
## 585        40000
## 586        40000
## 587        40000
## 588        40000
## 589        40000
## 590        40000
## 591        40000
## 592        40000
## 593        40000
## 594        40000
## 595        40000
## 596        40000
## 597        40000
## 598        40000
## 599        40000
## 600        40000
## 601        40000
## 602        40000
## 603        40000
## 604        40000
## 605        40000
## 606        40000
## 607        40000
## 608        40000
## 609        40000
## 610        40000
## 611        40000
## 612        40000
## 613        40000
## 614        40000
## 615        40000
## 616        40000
## 617        40000
## 618        40000
## 619        40000
## 620        40000
## 621        40000
## 622        40000
## 623        40000
## 624        40000
## 625        40000
## 626        40000
## 627        40000
## 628        40000
## 629        40000
## 630        40000
## 631        40000
## 632        40000
## 633        40000
## 634        40000
## 635        40000
## 636        40000
## 637        40000
## 638        40000
## 639        40000
## 640        40000
## 641        40000
## 642        40000
## 643        40000
## 644        40000
## 645        40000
## 646        40000
## 647        40000
## 648        40000
## 649        40000
## 650        40000
## 651        40000
## 652        40000
## 653        40000
## 654        40000
## 655        40000
## 656        40000
## 657        40000
## 658        40000
## 659        40000
## 660        40000
## 661        40000
## 662        40000
## 663        40000
## 664        40000
## 665        40000
## 666        40000
## 667        40000
## 668        40000
## 669        40000
## 670        40000
## 671        40000
## 672        40000
## 673        40000
## 674        40000
## 675        40000
## 676        40000
## 677        40000
## 678        40000
## 679        40000
## 680        40000
## 681        40000
## 682        40000
## 683        40000
## 684        40000
## 685        40000
## 686        40000
## 687        40000
## 688        40000
## 689        40000
## 690        40000
## 691        40000
## 692        40000
## 693        40000
## 694        40000
## 695        40000
## 696        40000
## 697        40000
## 698        40000
## 699        40000
## 700        40000
## 701        40000
## 702        40000
## 703        40000
## 704        40000
## 705        40000
## 706        40000
## 707        40000
## 708        40000
## 709        40000
## 710        40000
## 711        40000
## 712        40000
## 713        40000
## 714        40000
## 715        40000
## 716        40000
## 717        40000
## 718        40000
## 719        40000
## 720        40000
## 721        40000
## 722        40000
## 723        40000
## 724        40000
## 725        40000
## 726        40000
## 727        40000
## 728        40000
## 729        40000
## 730        40000
## 731        40000
## 732        40000
## 733        40000
## 734        40000
## 735        40000
## 736        40000
## 737        40000
## 738        40000
## 739        40000
## 740        40000
## 741        40000
## 742        40000
## 743        40000
## 744        40000
## 745        40000
## 746        40000
## 747        40000
## 748        40000
## 749        40000
## 750        40000
## 751        40000
## 752        40000
## 753        40000
## 754        40000
## 755        40000
## 756        40000
## 757        40000
## 758        40000
## 759        40000
## 760        40000
## 761        40000
## 762        40000
## 763        40000
## 764        40000
## 765        40000
## 766        40000
## 767        40000
## 768        40000
## 769        40000
## 770        40000
## 771        40000
## 772        40000
## 773        40000
## 774        40000
## 775        40000
## 776        40000
## 777        40000
## 778        40000
## 779        40000
## 780        40000
## 781        40000
## 782        40000
## 783        40000
## 784        40000
## 785        40000
## 786        40000
## 787        40000
## 788        40000
## 789        40000
## 790        40000
## 791        40000
## 792        40000
## 793        40000
## 794        40000
## 795        40000
## 796        40000
## 797        40000
## 798        40000
## 799        40000
## 800        40000
## 801        40000
## 802        40000
## 803        40000
## 804        40000
## 805        40000
## 806        40000
## 807        40000
## 808        40000
## 809        40000
## 810        40000
## 811        40000
## 812        40000
## 813        40000
## 814        40000
## 815        40000
## 816        40000
## 817        40000
## 818        40000
## 819        40000
## 820        40000
## 821        40000
## 822        40000
## 823        40000
## 824        40000
## 825        40000
## 826        40000
## 827        40000
## 828        40000
## 829        40000
## 830        40000
## 831        40000
## 832        40000
## 833        40000
## 834        40000
## 835        40000
## 836        40000
## 837        40000
## 838        40000
## 839        40000
## 840        40000
## 841        40000
## 842        40000
## 843        40000
## 844        40000
## 845        40000
## 846        40000
## 847        40000
## 848        40000
## 849        40000
## 850        40000
## 851        40000
## 852        40000
## 853        40000
## 854        40000
## 855        40000
## 856        40000
## 857        40000
## 858        40000
## 859        40000
## 860        40000
## 861        40000
## 862        40000
## 863        40000
## 864        40000
## 865        40000
## 866        40000
## 867        40000
## 868        40000
## 869        40000
## 870        40000
## 871        40000
## 872        40000
## 873        40000
## 874        40000
## 875        40000
## 876        40000
## 877        40000
## 878        40000
## 879        40000
## 880        40000
## 881        40000
## 882        40000
## 883        40000
## 884        40000
## 885        40000
## 886        40000
## 887        40000
## 888        40000
## 889        40000
## 890        40000
## 891        40000
## 892        40000
## 893        40000
## 894        40000
## 895        40000
## 896        40000
## 897        40000
## 898        40000
## 899        40000
## 900        40000
## 901        40000
## 902        40000
## 903        40000
## 904        40000
## 905        40000
## 906        40000
## 907        40000
## 908        40000
## 909        40000
## 910        40000
## 911        40000
## 912        40000
## 913        40000
## 914        40000
## 915        40000
## 916        40000
## 917        40000
## 918        40000
## 919        40000
## 920        40000
## 921        40000
## 922        40000
## 923        40000
## 924        40000
## 925        40000
## 926        40000
## 927        40000
## 928        40000
## 929        40000
## 930        40000
## 931        40000
## 932        40000
## 933        40000
## 934        40000
## 935        40000
## 936        40000
## 937        40000
## 938        40000
## 939        40000
## 940        40000
## 941        40000
## 942        40000
## 943        40000
## 944        40000
## 945        40000
## 946        40000
## 947        40000
## 948        40000
## 949        40000
## 950        40000
## 951        40000
## 952        40000
## 953        40000
## 954        40000
## 955        40000
## 956        40000
## 957        40000
## 958        40000
## 959        40000
## 960        40000
## 961        40000
## 962        40000
## 963        40000
## 964        40000
## 965        40000
## 966        40000
## 967        40000
## 968        40000
## 969        40000
## 970        40000
## 971        40000
## 972        40000
## 973        40000
## 974        40000
## 975        40000
## 976        40000
## 977        40000
## 978        40000
## 979        40000
## 980        40000
## 981        40000
## 982        40000
## 983        40000
## 984        40000
## 985        40000
## 986        40000
## 987        40000
## 988        40000
## 989        40000
## 990        40000
## 991        40000
## 992        40000
## 993        40000
## 994        40000
## 995        40000
## 996        40000
## 997        40000
## 998        40000
## 999        40000
## 1000       40000
## 1001       40000
## 1002       40000
## 1003       40000
## 1004       40000
## 1005       40000
## 1006       40000
## 1007       40000
## 1008       40000
## 1009       40000
## 1010       40000
## 1011       40000
## 1012       40000
## 1013       40000
## 1014       40000
## 1015       40000
## 1016       40000
## 1017       40000
## 1018       40000
## 1019       40000
## 1020       40000
## 1021       40000
## 1022       40000
## 1023       40000
## 1024       40000
## 1025       40000
## 1026       40000
## 1027       40000
## 1028       40000
## 1029       40000
## 1030       40000
## 1031       40000
## 1032       40000
## 1033       40000
## 1034       40000
## 1035       40000
## 1036       40000
## 1037       40000
## 1038       40000
## 1039       40000
## 1040       40000
## 1041       40000
## 1042       40000
## 1043       40000
## 1044       40000
## 1045       40000
## 1046       40000
## 1047       40000
## 1048       40000
## 1049       40000
## 1050       40000
## 1051       40000
## 1052       40000
## 1053       40000
## 1054       40000
## 1055       40000
## 1056       40000
## 1057       40000
## 1058       40000
## 1059       40000
## 1060       40000
## 1061       40000
## 1062       40000
## 1063       40000
## 1064       40000
## 1065       40000
## 1066       40000
## 1067       40000
## 1068       40000
## 1069       40000
## 1070       40000
## 1071       40000
## 1072       40000
## 1073       40000
## 1074       40000
## 1075       40000
## 1076       40000
## 1077       40000
## 1078       40000
## 1079       40000
## 1080       40000
## 1081       40000
## 1082       40000
## 1083       40000
## 1084       40000
## 1085       40000
## 1086       40000
## 1087       40000
## 1088       40000
## 1089       40000
## 1090       40000
## 1091       40000
## 1092       40000
```

