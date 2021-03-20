---
title: "Choropleth; USA counties"
author: "Dereck de Mézquita"
date: "19 March, 2021"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "us-state-exploratory-analysis/us-state-exploratory-analysis.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    toc_float: yes
params:
  rmd: us-state-exploratory-analysis.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="us-state-exploratory-analysis.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiQ2hvcm9wbGV0aDsgVVNBIGNvdW50aWVzIgphdXRob3I6ICJEZXJlY2sgZGUgTcOpenF1aXRhIgpkYXRlOiAiYHIgZm9ybWF0KFN5cy50aW1lKCksICclZCAlQiwgJVknKWAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAidXMtc3RhdGUtZXhwbG9yYXRvcnktYW5hbHlzaXMvdXMtc3RhdGUtZXhwbG9yYXRvcnktYW5hbHlzaXMuaHRtbCIpKSB9KQpvdXRwdXQ6CiAgaHRtbF9kb2N1bWVudDogCiAgICBmaWdfY2FwdGlvbjogeWVzCiAgICBrZWVwX21kOiB5ZXMKICAgIG51bWJlcl9zZWN0aW9uczogeWVzCiAgICB0b2M6IHllcwogICAgdG9jX2Zsb2F0OiB5ZXMKcGFyYW1zOgogIHJtZDogdXMtc3RhdGUtZXhwbG9yYXRvcnktYW5hbHlzaXMuUm1kCmVkaXRvcl9vcHRpb25zOiAKICBjaHVua19vdXRwdXRfdHlwZTogaW5saW5lCi0tLQoKPGEgZG93bmxvYWQ9InVzLXN0YXRlLWV4cGxvcmF0b3J5LWFuYWx5c2lzLlJtZCIgaHJlZj0iYHIgYmFzZTY0ZW5jOjpkYXRhVVJJKGZpbGUgPSBwYXJhbXMkcm1kLCBtaW1lID0gJ3RleHQvcm1kJywgZW5jb2RpbmcgPSAnYmFzZTY0JylgIj5SIE1hcmtkb3duIHNvdXJjZSBmaWxlICh0byBwcm9kdWNlIHRoaXMgZG9jdW1lbnQpPC9hPgoKYGBge3Igc2V0dXAsIGluY2x1ZGU9RkFMU0V9CmtuaXRyOjpvcHRzX2NodW5rJHNldChlY2hvID0gVFJVRSwgZmlnLmFsaWduID0gImNlbnRlciIpCmBgYAoKIyBMaWJyYXJpZXMKCmBgYHtyIGxpYnJhcmllcywgd2FybmluZz1GQUxTRSwgbWVzc2FnZT1GQUxTRX0KbGlicmFyeSgidGlkeXZlcnNlIikKIyBTdXBwcmVzcyBzdW1tYXJpc2UgaW5mbwpvcHRpb25zKGRwbHlyLnN1bW1hcmlzZS5pbmZvcm0gPSBGQUxTRSkKCmxpYnJhcnkoInBsb3RseSIpCmxpYnJhcnkoImxlYWZsZXQiKQoKbGlicmFyeSgiZ2VvanNvbmlvIikKbGlicmFyeSgic3AiKQpsaWJyYXJ5KCJicm9vbSIpCgpsaWJyYXJ5KCJ2aXJpZGlzIikKYGBgCgojIExvYWQgZGF0YQoKYGBge3J9CiMgZGF0YSA8LSByZWFkLmNzdigiLi9vdXRwdXRzL3VuaXRlZC1zdGF0ZXMtb2YtYW1lcmljYS9wcm9jZXNzZWQtZGF0YS9hbGwtbWVyZ2VkLWRhdGEuY3N2Iiwgcm93Lm5hbWVzID0gMSkKZGF0YSA8LSBsYXBwbHkobGlzdC5maWxlcygiLi9vdXRwdXRzL3VuaXRlZC1zdGF0ZXMtb2YtYW1lcmljYS8iLCBwYXR0ZXJuID0gIlxcLmNzdiQiLCBmdWxsLm5hbWVzID0gVFJVRSksIHJlYWQuY3N2KQpuYW1lcyhkYXRhKSA8LSBnc3ViKCJcXC5jc3YkIiwgIiIsIGxpc3QuZmlsZXMoIi4vb3V0cHV0cy91bml0ZWQtc3RhdGVzLW9mLWFtZXJpY2EvIiwgcGF0dGVybiA9ICJcXC5jc3YkIikpCmBgYAoKYGBge3J9Cm5hbWVzKGRhdGEpCmBgYAoKYGBge3J9CmRhdGEgPC0gbGFwcGx5KGRhdGEsIGZ1bmN0aW9uKHgpIHsKICBSZWR1Y2UoZnVuY3Rpb24oLi4uKSB7CiAgICBtZXJnZSguLi4sIGFsbC54ID0gVFJVRSkKICB9LCBsaXN0KGRhdGEkZmlwX2NvZGVzLCB4KSkKfSkKYGBgCgojIENob3JvcGxldGg7IG1hcCBtYWtpbmcgd2l0aCBSCgotIFBlciBzdGF0ZTogImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9kZWxkZXJzdmVsZC90b3BvanNvbi9tYXN0ZXIvY291bnRyaWVzL3VuaXRlZC1zdGF0ZXMvdXMtYWxiZXJzLmpzb24iCi0gUGVyIGNvdW50eTogImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9kZWxkZXJzdmVsZC90b3BvanNvbi9tYXN0ZXIvY291bnRyaWVzL3VuaXRlZC1zdGF0ZXMvdXMtYWxiZXJzLWNvdW50aWVzLmpzb24iCgojIyBEb3dubG9hZCBjb3VudGllcyBnZW9KU09OIFVTQQoKYGBge3J9CmlmKCFmaWxlLmV4aXN0cygiLi9vdXRwdXRzL21hcHBpbmctZGF0YS91cy1hbGJlcnMtY291bnRpZXMuanNvbiIpKSB7CiAgZG93bmxvYWQuZmlsZSgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2RlbGRlcnN2ZWxkL3RvcG9qc29uL21hc3Rlci9jb3VudHJpZXMvdW5pdGVkLXN0YXRlcy91cy1hbGJlcnMtY291bnRpZXMuanNvbiIsICIuL291dHB1dHMvbWFwcGluZy1kYXRhL3VzLWFsYmVycy1jb3VudGllcy5qc29uIikKfQoKdXNhIDwtIGdlb2pzb25pbzo6Z2VvanNvbl9yZWFkKCIuL291dHB1dHMvbWFwcGluZy1kYXRhL3VzLWFsYmVycy1jb3VudGllcy5qc29uIiwgd2hhdCA9ICJzcCIpCgpwbG90KHVzYSkKYGBgCgpgYGB7ciB3YXJuaW5nPUZBTFNFLCBtZXNzYWdlPUZBTFNFfQp1c2FfdGR5IDwtIGJyb29tOjp0aWR5KHVzYSwgcmVnaW9uID0gImZpcHMiKQoKdXNhX3RkeSAlPiUKICBnZ3Bsb3QoKSArCiAgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCksIGZpbGwgPSAid2hpdGUiLCBjb2xvciA9ICJncmV5IikgKwogIHRoZW1lX3ZvaWQoKSArCiAgY29vcmRfbWFwKCkKYGBgCgpgYGB7cn0KY2hvcm9wbG90IDwtIGZ1bmN0aW9uKGRhdGEsIHZhbHVlID0gTlVMTCwgY29sb3VyID0gImJsYWNrIiwgc2l6ZSA9IDAuMDc1LCBhbHBoYSA9IDAuOSwgdHJhbnMgPSAibG9nMTAiLCBsZW5ndGgub3V0ID0gMywgdGl0bGUgPSAiIiwgZ3VpZGVfdGl0bGUgPSAiIiwgY2FwdGlvbiA9ICIiKSB7CiAgIyBpZighYW55KGNvbG5hbWVzKHVzYV9wb3ApID09ICJ2YWx1ZSIpKSB7c3RvcCgiTXVzdCBjb250YWluIGNvbHVtbiBuYW1lZCAndmFsdWVzJy4iKX0KICBkYXRhICU+JQogICAgZ2dwbG90KCkgKwogICAgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCwgZmlsbCA9IGRhdGFbLHZhbHVlXSksIGNvbG91ciA9IGNvbG91ciwgc2l6ZSA9IHNpemUsIGFscGhhID0gYWxwaGEpICsKICAgICMgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCksIHNpemUgPSAwLjA3NSwgY29sb3VyID0gImJsYWNrIiwgYWxwaGEgPSAwKSArCiAgICB0aGVtZV92b2lkKCkgKwogICAgc2NhbGVfZmlsbF92aXJpZGlzKHRyYW5zID0gdHJhbnMsCiAgICAgICAgICAgICAgICAgICAgICAgYnJlYWtzID0gc2VxKDAsIG1heChkYXRhWyx2YWx1ZV0pLCBsZW5ndGgub3V0ID0gbGVuZ3RoLm91dCksICMgc2VxKDAsIG1heCh1c2FfcG9wJHZhbHVlKSwgYnkgPSAxMDAwMDAwKQogICAgICAgICAgICAgICAgICAgICAgIG5hbWUgPSBndWlkZV90aXRsZSwKICAgICAgICAgICAgICAgICAgICAgICBndWlkZSA9IGd1aWRlX2xlZ2VuZChrZXloZWlnaHQgPSB1bml0KDIsIHVuaXRzID0gIm1tIiksIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtleXdpZHRoID0gdW5pdCg1LCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbC5wb3NpdGlvbiA9ICJib3R0b20iLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aXRsZS5wb3NpdGlvbiA9ICd0b3AnLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucm93ID0gMSksCiAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSBmdW5jdGlvbih4KSB7CiAgICAgICAgICAgICAgICAgICAgICAgICBmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKICAgICAgICAgICAgICAgICAgICAgICAgIH0pICsKICAgIGxhYnModGl0bGUgPSB0aXRsZSwKICAgICAgICAgIyBzdWJ0aXRsZSA9ICJQb3B1bGF0aW9uIHBlciBjb3VudHkiLAogICAgICAgICBjYXB0aW9uID0gY2FwdGlvbikgKwogICAgdGhlbWUoIyB0ZXh0ID0gZWxlbWVudF90ZXh0KGNvbG9yID0gIiMyMjIxMWQiKSwKICAgICAgICAgICMgcGxvdC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgICAgIyBwYW5lbC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgICAgIyBsZWdlbmQuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAgIHBsb3QudGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZSA9IDIyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoanVzdCA9IDAuMDEsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQsIGwgPSAyLCB1bml0ID0gImNtIikpLAogICAgICAgICAgcGxvdC5zdWJ0aXRsZSA9IGVsZW1lbnRfdGV4dChzaXplPSAxNywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhqdXN0PTAuMDEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgY29sb3IgPSAiIzRlNGQ0NyIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcmdpbiA9IG1hcmdpbihiID0gLTAuMSwgdCA9IDAuNDMsIGwgPSAyLCB1bml0ID0gImNtIikpLAogICAgICAgICAgcGxvdC5jYXB0aW9uID0gZWxlbWVudF90ZXh0KHNpemU9MTIsIGNvbG9yID0gIiM0ZTRkNDciLCBtYXJnaW4gPSBtYXJnaW4oYiA9IDAuMywgciA9IC05OSwgdW5pdCA9ICJjbSIpKSwKICAgICAgICAgIGxlZ2VuZC5wb3NpdGlvbiA9IGMoMC43LCAwLjA5KSkgKwogICAgY29vcmRfbWFwKCkKfQpgYGAKCiMgUG9wdWxhdGlvbiBjb3VudHMgcGVyIGNvdW50eQoKYGBge3J9CnBvcCA8LSBkYXRhJGNlbnN1c19wb3B1bGF0aW9uCnBvcCRwb3Blc3RpbWF0ZTIwMTAgPC0gTlVMTApjb2xuYW1lcyhwb3ApWzc6bmNvbChwb3ApXSA8LSBnc3ViKCJjZW5zdXN8cG9wfHBvcGVzdGltYXRlIiwgIiIsIGNvbG5hbWVzKHBvcClbNzpuY29sKHBvcCldKQoKcG9wICU+JQogIGRyb3BfbmEoKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IDc6bmNvbChwb3ApLCBuYW1lc190byA9ICJ5ZWFyIikgJT4lCiAgZ3JvdXBfYnkoZmlwcykgJT4lCiAgYXJyYW5nZSh5ZWFyLCAuYnlfZ3JvdXAgPSBUUlVFKSAlPiUKICBtdXRhdGUocGN0X2RpZiA9IHZhbHVlL2xhZyh2YWx1ZSkgKiAxMDApICU+JQogIGZpbHRlcighaXMubmEocGN0X2RpZikpICU+JQogIGdyb3VwX2J5KGZpcHMpICU+JQogIHN1bW1hcmlzZShmaXBzLCBhYmJydiwgc3RhdGUsIGNvdW50eSwgcmVnaW9uLCBkaXZpc2lvbiwgeWVhciwgcGN0X2F2ZyA9IHN1bShwY3RfZGlmKSAvIDkpICU+JQogICMgZmlsdGVyKHllYXIgPT0gMjAxOSkgJT4lCiAgZ2dwbG90KGFlcyhwY3RfYXZnKSkgKwogIGdlb21fZGVuc2l0eSgpICsKICBsYWJzKHRpdGxlID0gIkRpc3RyaWJ1dGlvbiIpIAogICMgc2NhbGVfeF9jb250aW51b3VzKHRyYW5zID0gImxvZzIiKQoKcG9wX3BjdF9kaWZmIDwtIHBvcCAlPiUgCiAgZHJvcF9uYSgpICU+JQogIHBpdm90X2xvbmdlcihjb2xzID0gNzpuY29sKHBvcCksIG5hbWVzX3RvID0gInllYXIiKSAlPiUKICBncm91cF9ieShmaXBzKSAlPiUKICBhcnJhbmdlKHllYXIsIC5ieV9ncm91cCA9IFRSVUUpICU+JQogIG11dGF0ZShwY3RfZGlmID0gdmFsdWUvbGFnKHZhbHVlKSAqIDEwMCkgJT4lCiAgZmlsdGVyKCFpcy5uYShwY3RfZGlmKSkgJT4lCiAgZ3JvdXBfYnkoZmlwcykgJT4lCiAgbXV0YXRlKHBjdF9hdmcgPSBzdW0ocGN0X2RpZikgLyA5KQoKdXNhX3BvcCA8LSB1c2FfdGR5ICU+JQogIG11dGF0ZShmaXBzID0gYXMubnVtZXJpYyhpZCkpICU+JQogIGxlZnRfam9pbihwb3BfcGN0X2RpZmYsIGJ5ID0gYygiZmlwcyIgPSAiZmlwcyIpKQoKdXNhX3BvcCRwY3RfYXZnW2lzLm5hKHVzYV9wb3AkcGN0X2F2ZyldIDwtIDAuMDAxCgojIHVzYV9wb3AgJT4lCiMgICBnZ3Bsb3QoKSArCiMgICBnZW9tX3BvbHlnb24oYWVzKGZpbGwgPSBwY3RfYXZnLCB4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCkpICsKIyAgIHRoZW1lX3ZvaWQoKSArCiMgICBjb29yZF9tYXAoKQpgYGAKCgpgYGB7cn0KdXNhX3BvcCAlPiUKICBnZ3Bsb3QoKSArCiAgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCwgZmlsbCA9IHBjdF9hdmcpLCBjb2xvdXIgPSAiYmxhY2siLCBzaXplID0gMC4wNzUsIGFscGhhID0gMC45KSArCiAgIyBnZW9tX3BvbHlnb24oYWVzKHggPSBsb25nLCB5ID0gbGF0LCBncm91cCA9IGdyb3VwKSwgc2l6ZSA9IDAuMDc1LCBjb2xvdXIgPSAiYmxhY2siLCBhbHBoYSA9IDApICsKICB0aGVtZV92b2lkKCkgKwogIHNjYWxlX2ZpbGxfdmlyaWRpcygjIHRyYW5zID0gImxvZzEwIiwKICAgICAgICAgICAgICAgICAgICAgYnJlYWtzID0gc2VxKDAsIG1heCh1c2FfcG9wJHBjdF9hdmcpLCBsZW5ndGgub3V0ID0gNiksCiAgICAgICAgICAgICAgICAgICAgIG5hbWUgPSAiQXZlcmFnZSBwb3AgY2hhbmdlIHBlciBjb3VudHkiLAogICAgICAgICAgICAgICAgICAgICBndWlkZSA9IGd1aWRlX2xlZ2VuZChrZXloZWlnaHQgPSB1bml0KDIsIHVuaXRzID0gIm1tIiksIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXl3aWR0aCA9IHVuaXQoMywgdW5pdHMgPSAibW0iKSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsLnBvc2l0aW9uID0gImJvdHRvbSIsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aXRsZS5wb3NpdGlvbiA9ICd0b3AnLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJvdyA9IDEpLAogICAgICAgICAgICAgICAgICAgICBsYWJlbCA9IGZ1bmN0aW9uKHgpIHsKICAgICAgICAgICAgICAgICAgICAgICBmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKICAgICAgICAgICAgICAgICAgICAgfSkgKwogIGxhYnModGl0bGUgPSAiQXZlcmFnZSBwb3AgY2hhbmdlIHBlciBjb3VudHkiLAogICAgICAgc3VidGl0bGUgPSAiQXZlcmFnZSBjaGFuZ2UgaW4gcG9wdWxhdGlvbiBwZXIgY291bnR5IDIwMTAgLSAyMDE5IiwKICAgICAgIGNhcHRpb24gPSAiRGF0YTogQ0VOU1VTIEJVUkVBVSB8IEJ5OiBEZXJlY2sgfCBkZXJlY2tzbm90ZXMuY29tIikgKwogIHRoZW1lKHRleHQgPSBlbGVtZW50X3RleHQoY29sb3IgPSAiIzIyMjExZCIpLAogICAgICAgICMgcGxvdC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgICMgcGFuZWwuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAjIGxlZ2VuZC5iYWNrZ3JvdW5kID0gZWxlbWVudF9yZWN0KGZpbGwgPSAiI2Y1ZjVmMiIsIGNvbG9yID0gTkEpLAogICAgICAgIHBsb3QudGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZSA9IDIyLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3QgPSAwLjAxLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgY29sb3IgPSAiIzRlNGQ0NyIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQsIGwgPSAyLCB1bml0ID0gImNtIikpLAogICAgICAgIHBsb3Quc3VidGl0bGUgPSBlbGVtZW50X3RleHQoc2l6ZT0gMTcsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGp1c3Q9MC4wMSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgY29sb3IgPSAiIzRlNGQ0NyIsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXJnaW4gPSBtYXJnaW4oYiA9IC0wLjEsIHQgPSAwLjQzLCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBwbG90LmNhcHRpb24gPSBlbGVtZW50X3RleHQoc2l6ZT0xMiwgY29sb3IgPSAiIzRlNGQ0NyIsIG1hcmdpbiA9IG1hcmdpbihiID0gMC4zLCByID0gLTk5LCB1bml0ID0gImNtIikpLAogICAgICAgIGxlZ2VuZC5wb3NpdGlvbiA9IGMoMC43LCAwLjA5KSkgKwogIGNvb3JkX21hcCgpCmBgYAoKYGBge3J9CmdkcCA8LSBkYXRhJGdkcF8yMDAxXzIwMTkKIyBjb2xuYW1lcyhnZHApWzU6bmNvbChnZHApXSA8LSBnc3ViKCJ4IiwgIiIsIGNvbG5hbWVzKGdkcClbNTpuY29sKGdkcCldKQoKZ2RwICU+JQogIGRyb3BfbmEoKSAlPiUKICBwaXZvdF9sb25nZXIoY29scyA9IDU6bmNvbChnZHApLCBuYW1lc190byA9ICJ5ZWFyIikgJT4lCiAgbXV0YXRlKHllYXIgPSBhcy5udW1lcmljKGdzdWIoIlgiLCAiIiwgeWVhcikpKSAlPiUKICBmaWx0ZXIoeWVhciA9PSAyMDE5KSAlPiUKICBnZ3Bsb3QoYWVzKHZhbHVlKSkgKwogIGdlb21faGlzdG9ncmFtKGJpbnMgPSAyMCkgKwogIHNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKCmdkcDIwMTkgPC0gZ2RwICU+JQogICMgZHJvcF9uYSgpICU+JQogIHBpdm90X2xvbmdlcihjb2xzID0gNTpuY29sKGdkcCksIG5hbWVzX3RvID0gInllYXIiKSAlPiUKICBtdXRhdGUoeWVhciA9IGFzLm51bWVyaWMoZ3N1YigiWCIsICIiLCB5ZWFyKSkpICU+JQogIGZpbHRlcih5ZWFyID09IDIwMDEpCiAgIyBtdXRhdGUoY2hhcl9maXBzID0gYXMuY2hhcmFjdGVyKGZpcHMpKQoKdXNhX2dkcCA8LSB1c2FfdGR5ICU+JQogIG11dGF0ZShmaXBzID0gYXMubnVtZXJpYyhpZCkpICU+JQogIGxlZnRfam9pbihnZHAyMDE5LCBieSA9IGMoImZpcHMiID0gImZpcHMiKSkKCnVzYV9nZHAkdmFsdWVbaXMubmEodXNhX2dkcCR2YWx1ZSldIDwtIDAuMDAxCgp1c2FfZ2RwICU+JQogIGdncGxvdCgpICsKICBnZW9tX3BvbHlnb24oYWVzKGZpbGwgPSB2YWx1ZSwgeCA9IGxvbmcsIHkgPSBsYXQsIGdyb3VwID0gZ3JvdXApKSArCiAgdGhlbWVfdm9pZCgpICsKICBjb29yZF9tYXAoKQoKdXNhX2dkcCAlPiUKICBnZ3Bsb3QoKSArCiAgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCwgZmlsbCA9IHZhbHVlKSwgY29sb3VyID0gImJsYWNrIiwgc2l6ZSA9IDAuMDc1LCBhbHBoYSA9IDAuOSkgKwogICMgZ2VvbV9wb2x5Z29uKGFlcyh4ID0gbG9uZywgeSA9IGxhdCwgZ3JvdXAgPSBncm91cCksIHNpemUgPSAwLjA3NSwgY29sb3VyID0gImJsYWNrIiwgYWxwaGEgPSAwKSArCiAgdGhlbWVfdm9pZCgpICsKICBzY2FsZV9maWxsX3ZpcmlkaXModHJhbnMgPSAibG9nMTAiLAogICAgICAgICAgICAgICAgICAgICBicmVha3MgPSBzZXEoMCwgbWF4KHVzYV9nZHAkdmFsdWUpLCBsZW5ndGgub3V0ID0gNSksICMgc2VxKDAsIG1heCh1c2FfcG9wJHZhbHVlKSwgYnkgPSAxMDAwMDAwKQogICAgICAgICAgICAgICAgICAgICBuYW1lID0gIlBvcHVsYXRpb24gcGVyIGNvdW50eSIsCiAgICAgICAgICAgICAgICAgICAgIGd1aWRlID0gZ3VpZGVfbGVnZW5kKGtleWhlaWdodCA9IHVuaXQoMiwgdW5pdHMgPSAibW0iKSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtleXdpZHRoID0gdW5pdCgzLCB1bml0cyA9ICJtbSIpLCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwucG9zaXRpb24gPSAiYm90dG9tIiwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpdGxlLnBvc2l0aW9uID0gJ3RvcCcsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucm93ID0gMSksCiAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gZnVuY3Rpb24oeCkgewogICAgICAgICAgICAgICAgICAgICAgIGZvcm1hdCh4LCBiaWcubWFyayA9ICIsIiwgc2NpZW50aWZpYyA9IEZBTFNFKQogICAgICAgICAgICAgICAgICAgICB9KSArCiAgbGFicyh0aXRsZSA9ICJHRFAgcGVyIGNvdW50eSIsCiAgICAgICAjIHN1YnRpdGxlID0gIlBvcHVsYXRpb24gcGVyIGNvdW50eSIsCiAgICAgICBjYXB0aW9uID0gIkRhdGE6IENFTlNVUyBCVVJFQVUgfCBCeTogRGVyZWNrIHwgZGVyZWNrc25vdGVzLmNvbSIpICsKICB0aGVtZSh0ZXh0ID0gZWxlbWVudF90ZXh0KGNvbG9yID0gIiMyMjIxMWQiKSwKICAgICAgICAjIHBsb3QuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICAjIHBhbmVsLmJhY2tncm91bmQgPSBlbGVtZW50X3JlY3QoZmlsbCA9ICIjZjVmNWYyIiwgY29sb3IgPSBOQSksCiAgICAgICAgIyBsZWdlbmQuYmFja2dyb3VuZCA9IGVsZW1lbnRfcmVjdChmaWxsID0gIiNmNWY1ZjIiLCBjb2xvciA9IE5BKSwKICAgICAgICBwbG90LnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemUgPSAyMiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhqdXN0ID0gMC4wMSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40LCBsID0gMiwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBwbG90LnN1YnRpdGxlID0gZWxlbWVudF90ZXh0KHNpemU9IDE3LCAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhqdXN0PTAuMDEsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIGNvbG9yID0gIiM0ZTRkNDciLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFyZ2luID0gbWFyZ2luKGIgPSAtMC4xLCB0ID0gMC40MywgbCA9IDIsIHVuaXQgPSAiY20iKSksCiAgICAgICAgcGxvdC5jYXB0aW9uID0gZWxlbWVudF90ZXh0KHNpemU9MTIsIGNvbG9yID0gIiM0ZTRkNDciLCBtYXJnaW4gPSBtYXJnaW4oYiA9IDAuMywgciA9IC05OSwgdW5pdCA9ICJjbSIpKSwKICAgICAgICBsZWdlbmQucG9zaXRpb24gPSBjKDAuNywgMC4wOSkpICsKICBjb29yZF9tYXAoKQpgYGAKCgpgYGB7ciBldmFsPUZBTFNFfQpwb3AyMDE5ICU+JQogIGNvdW50KHN0YXRlKSAlPiUKICBnZ3Bsb3QoYWVzKHN0YXRlLCBuLCBmaWxsID0gc3RhdGUpKSArCiAgZ2VvbV9iYXIoc3RhdCA9ICJpZGVudGl0eSIpICsKICBsYWJzKHRpdGxlID0gIk51bWJlciBvZiBjb3VudGllcyBwZXIgc3RhdGUiLCB4ID0gIlN0YXRlIiwgeSA9ICJOdW1iZXIgb2YgY291bnRpZXMiKSArCiAgdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiLAogICAgICAgIGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gOTAsIHZqdXN0ID0gMCwgaGp1c3QgPSAxKSkKICAjIHNjYWxlX3hfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKYGBgCgoKYGBge3J9CmxlYWZsZXQoKSAlPiUKICBhZGRUaWxlcygpICU+JSAgIyBBZGQgZGVmYXVsdCBPcGVuU3RyZWV0TWFwIG1hcCB0aWxlcwogIGFkZE1hcmtlcnMobG5nPTE3NC43NjgsIGxhdD0tMzYuODUyLCBwb3B1cD0iVGhlIGJpcnRocGxhY2Ugb2YgUiIpCmBgYAoKCgpgYGB7ciBldmFsPUZBTFNFfQpwb3AgJT4lCiAgZ2dwbG90KGFlcyh5ZWFyLCB2YWx1ZSkpICsKICBnZW9tX2xpbmUoYWVzKGdyb3VwID0gZmlwcykpCmBgYAoKCgojIEJpcnRoIGFuZCBkZWF0aCByYXRlCgpgYGB7ciBldmFsPUZBTFNFfQpyYmluZChkYXRhJGNlbnN1c19iaXJ0aHMsIGRhdGEkY2Vuc3VzX2RlYXRocykKYGBgCgpgYGB7ciBldmFsPUZBTFNFfQpwIDwtIGJpcnRoX2RlYXRoICU+JSAKICBkcm9wX25hKCkgJT4lCiAgIyBmaWx0ZXIoYWJicnYgPT0gIkxBIikgJT4lCiAgcGl2b3RfbG9uZ2VyKGNvbHMgPSBjKHN0YXJ0c193aXRoKCJkZWF0aHMiKSkpICU+JSAjICwgc3RhcnRzX3dpdGgoImRlYXRocyIpCiAgc2VwYXJhdGUobmFtZSwgYygidHlwZSIsICJ5ZWFyIiksICJzIikgJT4lCiAgZ2dwbG90KGFlcyh4ID0geWVhciwgeSA9IHZhbHVlKSkgKwogIGdlb21fbGluZShhZXMoZ3JvdXAgPSBmaXBzLCBjb2xvdXIgPSBmaXBzKSkgKwogIHRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIikKICAjIHNjYWxlX3lfY29udGludW91cyh0cmFucyA9ICJsb2cyIikKCmdncGxvdGx5KHApCmBgYAoKCgoKYGBge3IgZXZhbD1GQUxTRX0KZGF0YSRhbGxfbWVyZ2VkX2RhdGEgJT4lCiAgZmlsdGVyKGNvdW50eSA9PSAiU3RhbmlzbGF1cyIpCgpkYXRhJGFsbF9tZXJnZWRfZGF0YSRkZWF0aHMyMDE1ICU+JSAKICBkcm9wX25hKCkgJT4lCiAgc3VtKCkKYGBgCgo=">R Markdown source file (to produce this document)</a>



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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />


```r
usa_tdy <- broom::tidy(usa, region = "fips")

usa_tdy %>%
  ggplot() +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "white", color = "grey") +
  theme_void() +
  coord_map()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-5-1.png" style="display: block; margin: auto;" />


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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-7-1.png" style="display: block; margin: auto;" />

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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />


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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-9-2.png" style="display: block; margin: auto;" />

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

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports//us-state-exploratory-analysis/us-state-exploratory-analysis_files/figure-html/unnamed-chunk-9-3.png" style="display: block; margin: auto;" />



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

<!--html_preserve--><div id="htmlwidget-b2efd921d700bcfb234d" style="width:672px;height:480px;" class="leaflet html-widget"></div>
<script type="application/json" data-for="htmlwidget-b2efd921d700bcfb234d">{"x":{"options":{"crs":{"crsClass":"L.CRS.EPSG3857","code":null,"proj4def":null,"projectedBounds":null,"options":{}}},"calls":[{"method":"addTiles","args":["//{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",null,null,{"minZoom":0,"maxZoom":18,"tileSize":256,"subdomains":"abc","errorTileUrl":"","tms":false,"noWrap":false,"zoomOffset":0,"zoomReverse":false,"opacity":1,"zIndex":1,"detectRetina":false,"attribution":"&copy; <a href=\"http://openstreetmap.org\">OpenStreetMap<\/a> contributors, <a href=\"http://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA<\/a>"}]},{"method":"addMarkers","args":[-36.852,174.768,null,null,null,{"interactive":true,"draggable":false,"keyboard":true,"title":"","alt":"","zIndexOffset":0,"opacity":1,"riseOnHover":false,"riseOffset":250},"The birthplace of R",null,null,null,null,{"interactive":false,"permanent":false,"direction":"auto","opacity":1,"offset":[0,0],"textsize":"10px","textOnly":false,"className":"","sticky":true},null]}],"limits":{"lat":[-36.852,-36.852],"lng":[174.768,174.768]}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




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

