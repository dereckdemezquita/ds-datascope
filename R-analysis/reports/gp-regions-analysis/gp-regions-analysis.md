---
title: "Gapminder: regions analysis"
author: "Dereck de Mézquita"
date: "19 March, 2021"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), "./reports/", "/gp-regions-analysis/gp-regions-analysis.html")) })
output:
  html_document: 
    fig_caption: yes
    keep_md: yes
    number_sections: yes
    toc: yes
    toc_float: yes
    # code_folding: hide
params:
  rmd: gp-regions-analysis.Rmd
editor_options: 
  chunk_output_type: inline
---

<a download="gp-regions-analysis.Rmd" href="data:text/rmd;base64,LS0tCnRpdGxlOiAiR2FwbWluZGVyOiByZWdpb25zIGFuYWx5c2lzIgphdXRob3I6ICJEZXJlY2sgZGUgTcOpenF1aXRhIgpkYXRlOiAiYHIgZm9ybWF0KFN5cy50aW1lKCksICclZCAlQiwgJVknKWAiCmtuaXQ6IChmdW5jdGlvbihpbnB1dEZpbGUsIGVuY29kaW5nKSB7IAogICAgICBybWFya2Rvd246OnJlbmRlcihpbnB1dEZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgIGVuY29kaW5nPWVuY29kaW5nLCAKICAgICAgICAgICAgICAgICAgICAgICAgb3V0cHV0X2ZpbGU9ZmlsZS5wYXRoKGRpcm5hbWUoaW5wdXRGaWxlKSwgIi4vcmVwb3J0cy8iLCAiL2dwLXJlZ2lvbnMtYW5hbHlzaXMvZ3AtcmVnaW9ucy1hbmFseXNpcy5odG1sIikpIH0pCm91dHB1dDoKICBodG1sX2RvY3VtZW50OiAKICAgIGZpZ19jYXB0aW9uOiB5ZXMKICAgIGtlZXBfbWQ6IHllcwogICAgbnVtYmVyX3NlY3Rpb25zOiB5ZXMKICAgIHRvYzogeWVzCiAgICB0b2NfZmxvYXQ6IHllcwogICAgIyBjb2RlX2ZvbGRpbmc6IGhpZGUKcGFyYW1zOgogIHJtZDogZ3AtcmVnaW9ucy1hbmFseXNpcy5SbWQKZWRpdG9yX29wdGlvbnM6IAogIGNodW5rX291dHB1dF90eXBlOiBpbmxpbmUKLS0tCgo8YSBkb3dubG9hZD0iZ3AtcmVnaW9ucy1hbmFseXNpcy5SbWQiIGhyZWY9ImByIGJhc2U2NGVuYzo6ZGF0YVVSSShmaWxlID0gcGFyYW1zJHJtZCwgbWltZSA9ICd0ZXh0L3JtZCcsIGVuY29kaW5nID0gJ2Jhc2U2NCcpYCI+UiBNYXJrZG93biBzb3VyY2UgZmlsZSAodG8gcHJvZHVjZSB0aGlzIGRvY3VtZW50KTwvYT4KCmBgYHtyIHNldHVwLCBpbmNsdWRlPUZBTFNFfQprbml0cjo6b3B0c19jaHVuayRzZXQoZWNobyA9IFRSVUUsIGRwaSA9IDUwMCwgZmlnLndpZHRoID0gOCwgZmlnLmhlaWdodCA9IDgsIGZpZy5hbGlnbiA9ICJjZW50ZXIiKQpgYGAKCiMgTGlicmFyaWVzCgpgYGB7ciBsaWJyYXJpZXMsIHdhcm5pbmc9RkFMU0UsIG1lc3NhZ2U9RkFMU0V9CmxpYnJhcnkoInRpZHl2ZXJzZSIpCm9wdGlvbnMoZHBseXIuc3VtbWFyaXNlLmluZm9ybSA9IEZBTFNFKQojIHRoZW1lX3NldCh0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIpKQpsaWJyYXJ5KCJjb3VudHJ5Y29kZSIpCmxpYnJhcnkoInNjYWxlcyIpCgpsaWJyYXJ5KCJkZHBsb3QiKQpgYGAKCmBgYHtyIG1vZHVsZXMsIHdhcm5pbmc9RkFMU0UsIG1lc3NhZ2U9RkFMU0V9CnNvdXJjZSgiLi9tb2R1bGVzL2hlbHBlci1mdW5jdGlvbnMuUiIpCmBgYAoKIyBnZ3Bsb3QgdGhlbWUKCmBgYHtyIHNldC1nZ3Bsb3QtZGVmYXVsdHN9CnVwZGF0ZV9nZW9tX2RlZmF1bHRzKCJsaW5lIiwgbGlzdChhbHBoYSA9IDAuNjUsIHNpemUgPSAwLjY1KSkKCnRoZW1lX3NldCh0aGVtZV9kZXJlY2soKSkKYGBgCgojIExvYWQgZGF0YQoKYGBge3IgbG9hZC1kYXRhfQpkYXRhIDwtIHJlYWRSRFMoIi4vb3V0cHV0cy9nYXBtaW5kZXIvY2xlYW5fZGF0YS5SZHMiKQptZXRhIDwtIHJlYWQuY3N2KCIuL2RhdGEvZ2FwbWluZGVyL2RkZi0tZ2FwbWluZGVyLS1mYXN0dHJhY2svbWV0YS1kYXRhL2RkZi0tY29uY2VwdHMuY3N2IikKYGBgCgojIERhdGFzZXQgY29tcGxldGVuZXNzCgpgYGB7ciBmdW5jdGlvbi1pbnZlcnQtbmEtZGZ9CmlzLm5vdC5uYSA8LSBmdW5jdGlvbih4KSB7CglyZXR1cm4oIWlzLm5hKHgpKQp9CmBgYAoKVGhlIGRhdGFzZXRzIGNvbGxlY3RlZCBhbmQgY2xlYW5lZCBhcmUgb2YgdGhlIGZvbGxvd2luZyBkaW1lbnNpb25zIChyb3dzLCBjb2x1bW5zKToKCjEuIGBkYXRhJHBvcGA6IGByIGRpbShkYXRhJHBvcClgCjEuIGBkYXRhJGNvdW50cmllc2A6IGByIGRpbShkYXRhJGNvdW50cmllcylgCjEuIGBkYXRhJGdsb2JhbGA6IGByIGRpbShkYXRhJGdsb2JhbClgCjEuIGBkYXRhJHdvcmxkXzRyZWdpb25gOiBgciBkaW0oZGF0YSR3b3JsZF80cmVnaW9uKWAKCiMjIFRhYmxlcyBwcmV2aWV3IHsudGFic2V0fQoKYGBge3IgcHJldmlldy1kYXRhLWdsb2JhbCwgcmVzdWx0cz0iYXNpcyJ9CmNhdCgiIyMjICIsIkRhdGFzZXQgcHJldmlldzogZ2xvYmFsIiwgIlxuIikKZGF0YXRhYmxlKHJiaW5kKGhlYWQoZGF0YSRnbG9iYWwsIDUwKSwgdGFpbChkYXRhJGdsb2JhbCwgNTApKSkKY2F0KCJcblxuIikKYGBgCgpgYGB7ciBwcmV2aWV3LWRhdGEtd29ybGRfNHJlZ2lvbiwgcmVzdWx0cz0iYXNpcyJ9CmNhdCgiIyMjICIsIkRhdGFzZXQgcHJldmlldzogd29ybGRfNHJlZ2lvbiIsICJcbiIpCmRhdGF0YWJsZShyYmluZChoZWFkKGRhdGEkd29ybGRfNHJlZ2lvbiwgNTApLCB0YWlsKGRhdGEkd29ybGRfNHJlZ2lvbiwgNTApKSkKY2F0KCJcblxuIikKYGBgCgojIyBQbG90cyB7LnRhYnNldH0KCmBgYHtyIGJhcnBsb3QtY29tcGxldGlvbi13b3JsZF80cmVnaW9uLCByZXN1bHRzPSJhc2lzIn0KY2F0KCIjIyMgIiwiRGF0YXNldCBjb21wbGV0aW9uOiB3b3JsZF80cmVnaW9uIiwgIlxuIikKe2RhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCQlzZWxlY3QoLVJlZ2lvbiwgLVllYXIpICU+JQoJCWlzLm5vdC5uYSgpICU+JQoJCWFzLmRhdGEuZnJhbWUoKSAlPiUKCQljb2xTdW1zKCkgLyAzMDEgKiAxMDB9ICU+JQoJYXMubGlzdCgpICU+JQoJZGF0YS5mcmFtZSgpICU+JQoJdCgpICU+JQoJYXMuZGF0YS5mcmFtZSgpICU+JQoJcm93bmFtZXNfdG9fY29sdW1uKCkgJT4lCglnZ3Bsb3QoYWVzKHJlb3JkZXIocm93bmFtZSwgVjEpLCBWMSwgZmlsbCA9IFYxKSkgKwoJZ2VvbV9iYXIoc3RhdCA9ICJpZGVudGl0eSIpICsKCXNjYWxlX2ZpbGxfZ3JhZGllbnQobG93ID0gImJsdWUiLCBoaWdoID0gInJlZCIsIGxpbWl0cyA9IGMoMCwgMTAwKSwgYnJlYWtzID0gYygwLCAyNSwgNTAsIDc1LCAxMDApKSAgKwoJZ2VvbV90ZXh0KGFlcyhsYWJlbCA9IGdsdWU6OmdsdWUoIntyb3VuZChWMSl9JSIpKSwgaGp1c3QgPSAtMC4zNSwgY29sb3VyID0gImJsYWNrIikgKyAjICwgYW5nbGUgPSA5MAoJc2NhbGVfeV9jb250aW51b3VzKGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLCAuMikpLCBuLmJyZWFrcyA9IDE1KSArCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAiYm90dG9tIiwgYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA5MCwgdmp1c3QgPSAwLjUsIGhqdXN0ID0gMSkpICsKCWxhYnModGl0bGUgPSAiQ29tcGxldGVuZXNzIG9mIHZhcmlhYmxlcyIsIHN1YnRpdGxlID0gIlBlcmNlbnQgb2Ygbm9uIE5BIHZhbHVlcyBwZXIgdmFyaWFibGUiLCB4ID0gIlBlcmNlbnRhZ2UgY29tcGxldGVuZXNzIiwgeSA9ICJWYXJpYWJsZSIsIGZpbGwgPSAiQ29tcGxldGVuZXNzIikgKwoJY29vcmRfZmxpcCgpCmNhdCgiXG5cbiIpCmBgYAoKYGBge3IgYmFycGxvdC1jb21wbGV0aW9uLWdsb2JhbCwgcmVzdWx0cz0iYXNpcyJ9CmNhdCgiIyMjICIsIkRhdGFzZXQgY29tcGxldGlvbjogZ2xvYmFsIiwgIlxuIikKe2RhdGEkZ2xvYmFsICU+JQoJCXNlbGVjdCgtUmVnaW9uLCAtWWVhcikgJT4lCgkJaXMubm90Lm5hKCkgJT4lIAoJCWFzLmRhdGEuZnJhbWUoKSAlPiUKCQljb2xTdW1zKCkgLyAxMjQgKiAxMDB9ICU+JQoJYXMubGlzdCgpICU+JQoJZGF0YS5mcmFtZSgpICU+JQoJdCgpICU+JQoJYXMuZGF0YS5mcmFtZSgpICU+JQoJcm93bmFtZXNfdG9fY29sdW1uKCkgJT4lCglnZ3Bsb3QoYWVzKHJlb3JkZXIocm93bmFtZSwgVjEpLCBWMSwgZmlsbCA9IFYxKSkgKwoJZ2VvbV9iYXIoc3RhdCA9ICJpZGVudGl0eSIpICsKCXNjYWxlX2ZpbGxfZ3JhZGllbnQobG93ID0gImJsdWUiLCBoaWdoID0gInJlZCIsIGxpbWl0cyA9IGMoMCwgMTAwKSwgYnJlYWtzID0gYygwLCAyNSwgNTAsIDc1LCAxMDApKSAgKwoJZ2VvbV90ZXh0KGFlcyhsYWJlbCA9IGdsdWU6OmdsdWUoIntyb3VuZChWMSl9JSIpKSwgaGp1c3QgPSAtMC4zNSwgY29sb3VyID0gImJsYWNrIikgKyAjICwgYW5nbGUgPSA5MAoJc2NhbGVfeV9jb250aW51b3VzKGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLCAuMikpLCBuLmJyZWFrcyA9IDE1KSArCgl0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDkwLCB2anVzdCA9IDAuNSwgaGp1c3QgPSAxKSkgKwoJbGFicyh0aXRsZSA9ICJDb21wbGV0ZW5lc3Mgb2YgdmFyaWFibGVzIiwgc3VidGl0bGUgPSAiUGVyY2VudCBvZiBub24gTkEgdmFsdWVzIHBlciB2YXJpYWJsZSIsIHggPSAiUGVyY2VudGFnZSBjb21wbGV0ZW5lc3MiLCB5ID0gIlZhcmlhYmxlIiwgZmlsbCA9ICJDb21wbGV0ZW5lc3MiKSArCgljb29yZF9mbGlwKCkKY2F0KCJcblxuIikKYGBgCgojIHdvcmxkXzRyZWdpb24KCiMjIHduX2JvdGhob3VzZXNfYwoKUGVyY2VudGFnZSBvZiBwYXJsaWFtZW50YXJ5IHNlYXRzIGhlbGQgYnkgd29tZW4uCgp3bl9ib3RoaG91c2VzX2MJbWVhc3VyZQlodHRwOi8vZ2FwbS5pby9kd3BhcmwJdjIJRGVjZW1iZXIgMTUgMjAyMAlQZWNlbnRhZ2Ugb2Ygd29tZW4gaW4gcGFybGlhbWVudHMJUGVjZW50YWdlIG9mIHdvbWVuIGluIHBhcmxpYW1lbnRzCVBlY2VudGFnZSBvZiB3b21lbiBpbiBwYXJsaWFtZW50cwlQZXJjZW50YWdlIG9mIG5hdGlvbmFsIHBhcmxpYW1lbnRhcnkgc2VhdHMgaGVsZCBieSB3b21lbi4gTG93ZXIgYW5kIHVwcGVyIGhvdXNlcyBjb21iaW5lZAlwZXJjZW50CWdvdmVybmFuY2UKCmBgYHtyIHc0LXdvbWVuLWhlbGQtbGluZX0KZGF0YSR3b3JsZF80cmVnaW9uICU+JQoJcmVuYW1lKFZhbHVlID0gd25fYm90aGhvdXNlc19jKSAlPiUKCXNlbGVjdChSZWdpb24sIFllYXIsIFZhbHVlKSAlPiUKCWdncGxvdChhZXMoWWVhciwgVmFsdWUsIGNvbG91ciA9IFJlZ2lvbikpICsKCWdlb21fbGluZSgpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggKyAwLjIpLCAibGFzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IFJlZ2lvbiksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCAtIDAuMiksICJmaXJzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjE1LCAwLjE1KSkpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJcGFzdGUwKHgsICIlIikKCX0pICsgIyBBZGQgcGVyY2VudCBzaWduCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIsIGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gNDUsIHZqdXN0ID0gMSwgaGp1c3QgPSAxKSkgKwoJbGFicyh0aXRsZSA9ICJXb21lbiBoZWxkIHBhcmxpYW1lbnRhcnkgc2VhdHMgcGVyIHdvcmxkIHJlZ2lvbiIsIHggPSAiWWVhciIsIHkgPSAiV29tZW4gc2VhdHMgJSIpCmBgYAoKIyMgcmVmdWdlZV9pbl9wZXJjX3diCgpTaGFyZSByZWZ1Z2VlcwlSZWZ1Z2VlcyBhcyBzaGFyZSBvZiBwb3B1bGF0aW9uIGluIHRoZSBjb3VudHJ5IG9mIHJlc2lkZW5jZS4KCnJlZnVnZWVfaW5fcGVyY193YgltZWFzdXJlCWh0dHA6Ly9nYXBtLmlvL2RyZWZ1Z2VlX3diCXYyCUp1bHkgMjcgMjAyMAlTaGFyZSByZWZ1Z2VlcwlSZWZ1Z2VlcyBhcyBzaGFyZSBvZiBwb3B1bGF0aW9uIGluIHRoZSBjb3VudHJ5IG9mIHJlc2lkZW5jZS4JU2hhcmUgcmVmdWdlZXMJVGhpcyBpcyB0aGUgc2hhcmUgb2YgcmVmdWdlZXMgYXMgYSBwZXJjZW50YWdlIG9mIHRvdGFsIHBvcHVsYXRpb24gaW4gdGhlIGNvdW50cnkgb2YgcmVzaWRlbmNlLglwZXJjZW50CXJlZnVnZWVzCgpgYGB7ciB3NC1yZWZ1Z2VlLWxpbmV9CmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXJlbmFtZShWYWx1ZSA9IHJlZnVnZWVfaW5fcGVyY193YikgJT4lCglzZWxlY3QoUmVnaW9uLCBZZWFyLCBWYWx1ZSkgJT4lCglmaWx0ZXIoIWlzLm5hKFZhbHVlKSkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIFZhbHVlLCBjb2xvdXIgPSBSZWdpb24pKSArCglnZW9tX2xpbmUoKSArCglkaXJlY3RsYWJlbHM6Omdlb21fZGwoYWVzKGxhYmVsID0gUmVnaW9uKSwgbWV0aG9kID0gbGlzdChkaXJlY3RsYWJlbHM6OmRsLnRyYW5zKHggPSB4ICsgMC4yKSwgImxhc3QucG9pbnRzIiwgY2V4ID0gMC42NSkpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggLSAwLjIpLCAiZmlyc3QucG9pbnRzIiwgY2V4ID0gMC42NSkpICsKCXNjYWxlX3hfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBleHBhbmQgPSBleHBhbnNpb24obXVsdCA9IGMoMC4xNSwgMC4xNSkpKSArCglzY2FsZV95X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewoJCXBhc3RlMCh4LCAiJSIpCgl9KSArICMgQWRkIHBlcmNlbnQgc2lnbgoJdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiLCBheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDQ1LCB2anVzdCA9IDEsIGhqdXN0ID0gMSkpICsKCWxhYnModGl0bGUgPSAiUmVmdWdlZXMgcGVyIHdvcmxkIHJlZ2lvbiIsIHggPSAiWWVhciIsIHkgPSAiUmVmdWdlZXMgJSIpCmBgYAoKIyBpaG1lX2hpdl9kZWF0aAoKVGhpcyBpcyB0aGUgcHJvcG9ydGlvbiBvZiBkZWF0aHMgY2F1c2VkIGJ5IEhJVi9BSURTCgppaG1lX2hpdl9kZWF0aAltZWFzdXJlCWh0dHA6Ly9nYXBtLmlvL2RjYXVzZXNfZGVhdGhfaWhtZQl2MQlKdW5lIDE1IDIwMjAJSElWL0FJRFMgZGVhdGhzICglKQlISVYvQUlEUyBkZWF0aHMgKCUpCUhJVi9BSURTIGRlYXRocyAoJSkJVGhpcyBpcyB0aGUgcHJvcG9ydGlvbiBvZiBkZWF0aHMgY2F1c2VkIGJ5IEhJVi9BSURTIChJSE1FKQlwZXJjZW50CWhlYWx0aAoKYGBge3IgdzQtaGl2LWRlYXRocy1saW5lfQpkYXRhJHdvcmxkXzRyZWdpb24gJT4lCglyZW5hbWUoVmFsdWUgPSBpaG1lX2hpdl9kZWF0aCkgJT4lCglzZWxlY3QoUmVnaW9uLCBZZWFyLCBWYWx1ZSkgJT4lCglmaWx0ZXIoIWlzLm5hKFZhbHVlKSkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIFZhbHVlLCBjb2xvdXIgPSBSZWdpb24pKSArCglnZW9tX2xpbmUoKSArCglkaXJlY3RsYWJlbHM6Omdlb21fZGwoYWVzKGxhYmVsID0gUmVnaW9uKSwgbWV0aG9kID0gbGlzdChkaXJlY3RsYWJlbHM6OmRsLnRyYW5zKHggPSB4ICsgMC4yKSwgImxhc3QucG9pbnRzIiwgY2V4ID0gMC42NSkpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggLSAwLjIpLCAiZmlyc3QucG9pbnRzIiwgY2V4ID0gMC42NSkpICsKCXNjYWxlX3hfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBleHBhbmQgPSBleHBhbnNpb24obXVsdCA9IGMoMC4xNSwgMC4xNSkpKSArCglzY2FsZV95X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewoJCXBhc3RlMCh4LCAiJSIpCgl9KSArICMgQWRkIHBlcmNlbnQgc2lnbgoJdGhlbWUobGVnZW5kLnBvc2l0aW9uID0gIm5vbmUiLCBheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDQ1LCB2anVzdCA9IDEsIGhqdXN0ID0gMSkpICsKCWxhYnModGl0bGUgPSAiSElWL0FJRFMgZGVhdGhzIHBlciB3b3JsZCByZWdpb24iLCB4ID0gIlllYXIiLCB5ID0gIkhJVi9BSURTIGRlYXRocyAlIikKCmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXJlbmFtZShWYWx1ZSA9IGlobWVfaGl2X2RlYXRoKSAlPiUKCXNlbGVjdChSZWdpb24sIFllYXIsIFZhbHVlKSAlPiUKCWZpbHRlcighaXMubmEoVmFsdWUpKSAlPiUKCWdncGxvdChhZXMoWWVhciwgbG9nMihWYWx1ZSksIGNvbG91ciA9IFJlZ2lvbikpICsKCWdlb21fbGluZSgpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggKyAwLjIpLCAibGFzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IFJlZ2lvbiksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCAtIDAuMiksICJmaXJzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjE1LCAwLjE1KSkpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJcGFzdGUwKHJvdW5kKDIgXiB4LCBkaWdpdHMgPSAzKSwgIiUiKQoJfSkgKyAjIEFkZCBwZXJjZW50IHNpZ24KCXRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIiwgYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAxLCBoanVzdCA9IDEpKSArCglsYWJzKHRpdGxlID0gIkhJVi9BSURTIGRlYXRocyBwZXIgd29ybGQgcmVnaW9uIiwgeCA9ICJZZWFyIiwgeSA9ICJISVYvQUlEUyBkZWF0aHMgJSBsb2cyIikKYGBgCgoKIyMgaWhtZV9jb25mbGljdF9kZWF0aAoKVGhpcyBpcyB0aGUgcHJvcG9ydGlvbiBvZiBkZWF0aHMgY2F1c2VkIGJ5IGNvbmZsaWN0IGFuZCB0ZXJyb3Jpc20KCmlobWVfY29uZmxpY3RfZGVhdGgJbWVhc3VyZQlodHRwOi8vZ2FwbS5pby9kY2F1c2VzX2RlYXRoX2lobWUJdjEJSnVuZSAxNSAyMDIwCUNvbmZsaWN0IGFuZCB0ZXJyb3Jpc20gZGVhdGhzICglKQlDb25mbGljdCBhbmQgdGVycm9yaXNtIGRlYXRocyAoJSkJQ29uZmxpY3QgYW5kIHRlcnJvcmlzbSBkZWF0aHMgKCUpCVRoaXMgaXMgdGhlIHByb3BvcnRpb24gb2YgZGVhdGhzIGNhdXNlZCBieSBjb25mbGljdCBhbmQgdGVycm9yaXNtIChJSE1FKQlwZXJjZW50CWhlYWx0aAoKCmBgYHtyIHc0LWNvbmZsaWN0LWRlYXRoLWxpbmV9CmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXJlbmFtZShWYWx1ZSA9IGlobWVfY29uZmxpY3RfZGVhdGgpICU+JQoJc2VsZWN0KFJlZ2lvbiwgWWVhciwgVmFsdWUpICU+JQoJZmlsdGVyKCFpcy5uYShWYWx1ZSkpICU+JQoJZ2dwbG90KGFlcyhZZWFyLCBWYWx1ZSwgY29sb3VyID0gUmVnaW9uKSkgKwoJZ2VvbV9saW5lKCkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IFJlZ2lvbiksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCArIDAuMiksICJsYXN0LnFwIiwgY2V4ID0gMC42NSkpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggLSAwLjIpLCAiZmlyc3QucXAiLCBjZXggPSAwLjY1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjE1LCAwLjE1KSkpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJcGFzdGUwKHJvdW5kKDIgXiB4LCBkaWdpdHMgPSAzKSwgIiUiKQoJfSkgKyAjIEFkZCBwZXJjZW50IHNpZ24KCXRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIiwgYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAxLCBoanVzdCA9IDEpKSArCglsYWJzKHRpdGxlID0gIlByb3BvcnRpb24gb2YgY29uZmxpY3QvdGVycm9yaXNtIGRlYXRocyIsIHggPSAiWWVhciIsIHkgPSAiQ29uZmxpY3QvdGVycm9yaXNtIGRlYXRocyAlIikKCmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXJlbmFtZShWYWx1ZSA9IGlobWVfY29uZmxpY3RfZGVhdGgpICU+JQoJc2VsZWN0KFJlZ2lvbiwgWWVhciwgVmFsdWUpICU+JQoJZmlsdGVyKCFpcy5uYShWYWx1ZSkpICU+JQoJZ2dwbG90KGFlcyhZZWFyLCBsb2cyKFZhbHVlKSwgY29sb3VyID0gUmVnaW9uKSkgKwoJZ2VvbV9saW5lKCkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IFJlZ2lvbiksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCArIDAuMiksICJsYXN0LnFwIiwgY2V4ID0gMC42NSkpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggLSAwLjIpLCAiZmlyc3QucXAiLCBjZXggPSAwLjY1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjE1LCAwLjE1KSkpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJcGFzdGUwKHgsICIlIikKCX0pICsgIyBBZGQgcGVyY2VudCBzaWduCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIsIGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gNDUsIHZqdXN0ID0gMSwgaGp1c3QgPSAxKSkgKwoJbGFicyh0aXRsZSA9ICJDb25mbGljdCBhbmQgdGVycm9yaXNtIGRlYXRocyBwZXIgd29ybGQgcmVnaW9uIiwgeCA9ICJZZWFyIiwgeSA9ICJDb25mbGljdC90ZXJyb3Jpc20gZGVhdGhzICUgbG9nMiIpCmBgYAoKCiMjIGlobWVfY2FyZGlvX2RlYXRoCgpUaGlzIGlzIHRoZSBwcm9wb3J0aW9uIG9mIGRlYXRocyBjYXVzZWQgYnkgQ2FyZGlvdmFzY3VsYXIgZGlzZWFzZXMKCmlobWVfY2FyZGlvX2RlYXRoCW1lYXN1cmUJaHR0cDovL2dhcG0uaW8vZGNhdXNlc19kZWF0aF9paG1lCXYxCUp1bmUgMTUgMjAyMAlDYXJkaW92YXNjdWxhciBkaXNlYXNlcyBkZWF0aHMgKCUpCUNhcmRpb3Zhc2N1bGFyIGRpc2Vhc2VzIGRlYXRocyAoJSkJQ2FyZGlvdmFzY3VsYXIgZGlzZWFzZXMgZGVhdGhzICglKQlUaGlzIGlzIHRoZSBwcm9wb3J0aW9uIG9mIGRlYXRocyBjYXVzZWQgYnkgQ2FyZGlvdmFzY3VsYXIgZGlzZWFzZXMgKElITUUpCXBlcmNlbnQJaGVhbHRoCgpgYGB7ciB3NC1jYXJkaW8tZGVhdGhzLWxpbmV9CmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXJlbmFtZShWYWx1ZSA9IGlobWVfY2FyZGlvX2RlYXRoKSAlPiUKCXNlbGVjdChSZWdpb24sIFllYXIsIFZhbHVlKSAlPiUKCWZpbHRlcighaXMubmEoVmFsdWUpKSAlPiUKCWdncGxvdChhZXMoWWVhciwgVmFsdWUsIGNvbG91ciA9IFJlZ2lvbikpICsKCWdlb21fbGluZSgpICsKCWRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBSZWdpb24pLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggKyAwLjIpLCAibGFzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IFJlZ2lvbiksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCAtIDAuMiksICJmaXJzdC5wb2ludHMiLCBjZXggPSAwLjY1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjE1LCAwLjE1KSkpICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7CgkJcGFzdGUwKHgsICIlIikKCX0pICsgIyBBZGQgcGVyY2VudCBzaWduCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIsIGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gNDUsIHZqdXN0ID0gMSwgaGp1c3QgPSAxKSkgKwoJbGFicyh0aXRsZSA9ICJDYXJkaW92YXNjdWxhciBkaXNlYXNlIGRlYXRocyBwZXIgd29ybGQgcmVnaW9uIiwgeCA9ICJZZWFyIiwgeSA9ICJDYXJkaW92YXNjdWxhciBkaXNlYXNlIGRlYXRocyAlIikKYGBgCgojIGdsb2JhbAoKIyMgbmRpc2FzZF90b3QKCk5hdHVyYWwgZGlzYXN0ZXIgZGVhdGhzCU5hdHVyYWwgZGlzYXN0ZXIgZGVhdGhzIHBlciB5ZWFyCgpuZGlzYXNkX3RvdAltZWFzdXJlCWh0dHA6Ly9nYXBtLmlvL2RuYXRkaXNhc3RlcnMJdjMJTWFyY2ggMjQgMjAyMAlOYXR1cmFsIGRpc2FzdGVyIGRlYXRocwlOYXR1cmFsIGRpc2FzdGVyIGRlYXRocyBwZXIgeWVhcglOYXR1cmFsIGRpc2FzdGVyIGRlYXRocwlUaGlzIGlzIHRoZSBudW1iZXIgb2YgZGVhdGhzIGZyb20gYWxsIG5hdHVyYWwgZGlzYXN0ZXJzLiBUaGUgZGF0YSBpbmNsdWRlcyBhbGwgY2F0ZWdvcmllcyBjbGFzc2lmaWVkIGFzICJuYXR1cmFsIGRpc2FzdGVycyIgKGRpc3Rpbmd1aXNoZWQgZnJvbSB0ZWNobm9sb2dpY2FsIGRpc2FzdGVycywgc3VjaCBhcyB0cmFuc3BvcnQsIGluZHVzdHJpYWwgYWNjaWRlbnRzLGV0Yy4uIGFuZCBjb21wbGV4IGRpc2FzdGVycyB3aGljaCBpbmNsdWRlIHNvbWUgbWFqb3IgZmFtaW5lIHNpdHVhdGlvbiBmb3Igd2hpY2ggdGhlIGRyb3VnaHQgd2VyZSBub3QgdGhlIG1haW4gY2F1c2FsIGZhY3RvcikuIFRoaXMgaW5jbHVkZXMgdG90YWwgZGVhdGhzIGZyb20gYW5pbWFsIGFjY2lkZW50LCBkcm91Z2h0cywgZWFydGhxdWFrZSwgZXBpZGVtaWMsIGV4dHJlbWUgdGVtcGVyYXR1cmUsIEZsb29kLCBGb2csIEltcGFjdCwgSW5zZWN0IGluZmVzdGF0aW9uLCBMYW5kc2xpZGUsIE1hc3MgbW92ZW1lbnQgKGRyeSksIFN0b3JtLCBWb2xjYW5pYyBhY3Rpdml0eSBhbmQgV2lsZGZpcmUuCWRlYXRocwllbnZpcm9ubWVudAoKYGBge3IgZ2xvYmFsLW5kaXNhc3Rlci10b3QtYmFyfQpkYXRhJGdsb2JhbCAlPiUKCXNlbGVjdChZZWFyLCBSZWdpb24sIG5kaXNhc2RfdG90LCBuZGlzYXNkX3JhdGUpICU+JQoJcmVuYW1lKFZhbHVlID0gbmRpc2FzZF90b3QpICU+JQoJZmlsdGVyKCFpcy5uYShWYWx1ZSkpICU+JQoJZmlsdGVyKFllYXIgPD0gMjAyMCkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIFZhbHVlLCBmaWxsID0gVmFsdWUpKSArICMgLCBmaWxsID0gbmRpc2FzZF9yYXRlCglnZW9tX2JhcihzdGF0ID0gImlkZW50aXR5IikgKwoJc2NhbGVfZmlsbF9ncmFkaWVudChsb3cgPSAiYmx1ZSIsIGhpZ2ggPSAicmVkIiwgYnJlYWtzID0gYygwLCAyNSwgNTAsIDc1LCAxMDApKSArCglzY2FsZV94X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCkgKwoJc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMTAsIGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsKCQlzY2FsZXM6OmxhYmVsX251bWJlcl9zaShhY2N1cmFjeSA9IDAuMSkoeCkKCX0pICsKCSMgc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMTAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLCAuMikpLCBsYWJlbHMgPSBmdW5jdGlvbih4KSB7ICMgZXhwYW5zaW9uIGZ1bmN0aW9uIHVzZWQgdG8gZml0IGJhciB2YWx1ZSBsYWJlbHMgZHluYW1pY2FsbHkgaW50byBwbG90OyBhZGQgYmFyIHZhbHVlIGxhYmVscyBnZ3Bsb3QKCQkjIGZvcm1hdCh4LCBiaWcubWFyayA9ICIsIiwgc2NpZW50aWZpYyA9IEZBTFNFKQoJIyB9KSArCgkjIGdlb21fdGV4dChhZXMobGFiZWwgPSBWYWx1ZSksIGFuZ2xlID0gOTAsIGhqdXN0ID0gLTAuMjUsIHNpemUgPSA0KSArCglsYWJzKHRpdGxlID0gIkRlYXRocyByZWxhdGVkIHRvIG5hdHVyYWwgZGlzYXN0ZXJzIiwgeCA9ICJZZWFyIiwgeSA9ICJEZWF0aHMgcmVsYXRlZCB0byBuYXR1cmFsIGRpc2FzdGVyIikgKwoJdGhlbWUoYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAxLCBoanVzdCA9IDEpKQpgYGAKCiMjIG5kaXNhc2RfcmF0ZQoKVGhpcyBpcyB0aGUgbnVtYmVyIG9mIGRlYXRocyBmcm9tIGFsbCBuYXR1cmFsIGRpc2FzdGVycyBwZXIgbWlsbGlvbiBwZW9wbGUJZGVhdGhzCWVudmlyb25tZW50CgpuZGlzYXNkX3JhdGUJbWVhc3VyZQlodHRwOi8vZ2FwbS5pby9kbmF0ZGlzYXN0ZXJzCXYzCU1hcmNoIDI0IDIwMjAJTmF0dXJhbCBkaXNhc3RlcnMgZGVhdGggcmF0ZQlOYXR1cmFsIGRpc2FzdGVycyBkZWF0aCByYXRlIHBlciBtaWxsaW9uIHBlb3BsZSBwZXIgeWVhcglOYXR1cmFsIGRpc2FzdGVycyBkZWF0aCByYXRlCVRoaXMgaXMgdGhlIG51bWJlciBvZiBkZWF0aHMgZnJvbSBhbGwgbmF0dXJhbCBkaXNhc3RlcnMgcGVyIG1pbGxpb24gcGVvcGxlCWRlYXRocwllbnZpcm9ubWVudAoKYGBge3IgZ2xvYmFsLW5kaXNhc3Rlci1yYXRlLWJhcn0KZGF0YSRnbG9iYWwgJT4lCglzZWxlY3QoWWVhciwgUmVnaW9uLCBuZGlzYXNkX3RvdCwgbmRpc2FzZF9yYXRlKSAlPiUKCXJlbmFtZShWYWx1ZSA9IG5kaXNhc2RfcmF0ZSkgJT4lCglmaWx0ZXIoIWlzLm5hKFZhbHVlKSkgJT4lCglmaWx0ZXIoWWVhciA8PSAyMDIwKSAlPiUKCW11dGF0ZShWYWx1ZSA9IChWYWx1ZSAvIDEwMDAwMDApICogMTAwKSAlPiUKCWdncGxvdChhZXMoWWVhciwgIFZhbHVlLCBmaWxsID0gVmFsdWUpKSArICMgLCBmaWxsID0gbmRpc2FzZF9yYXRlCglnZW9tX2JhcihzdGF0ID0gImlkZW50aXR5IikgKwoJc2NhbGVfZmlsbF9ncmFkaWVudChsb3cgPSAiYmx1ZSIsIGhpZ2ggPSAicmVkIiwgYnJlYWtzID0gYygwLCAyNSwgNTAsIDc1LCAxMDApKSArCglzY2FsZV94X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCkgKwoJc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsKCQlwYXN0ZTAoeCwgIiUiKQoJfSkgKwoJbGFicyh0aXRsZSA9ICJEZWF0aCByYXRlIHJlbGF0ZWQgdG8gbmF0dXJhbCBkaXNhc3RlcnMiLCB4ID0gIlllYXIiLCB5ID0gIkRlYXRoIHJhdGUgcmVsYXRlZCB0byBuYXR1cmFsIGRpc2FzdGVycyIpICsKCXRoZW1lKGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gNDUsIHZqdXN0ID0gMSwgaGp1c3QgPSAxKSkKYGBgCgojIyBudW1fY291bnRyaWVzX2Zob3MKCkhvdyBtYW55IGNvdW50cmllcyBoYXZlIGhhZCBhIGZlbWFsZSBsZWFkZXIKCm51bV9jb3VudHJpZXNfZmhvcwltZWFzdXJlCWh0dHA6Ly9nYXBtLmlvL2RmZW1hbGVfaG9zX292ZXJfdGltZQl2MQlNYXkgMyAyMDIwCUZlbWFsZSBIZWFkIG9mIFN0YXRlCU51bWJlciBvZiBjb3VudHJpZXMgdGhhdCBoYXZlIGhhZCBGZW1hbGUgSGVhZCBvZiBTdGF0ZQlGZW1hbGUgSGVhZCBvZiBTdGF0ZQlUaGlzIGFuc3dlciB0aGUgcXVlc3Rpb246IEhvdyBtYW55IGNvdW50cmllcyBoYXZlIGhhZCBhIGZlbWFsZSBsZWFkZXI/IFRoaXMgbGlzdCBpbmNsdWRlcyB3b21lbiB3aG8gaGF2ZSBiZWVuIGVsZWN0ZWQgb3IgYXBwb2ludGVkIGhlYWQgb2Ygc3RhdGUgb3IgZ292ZXJubWVudCBvZiB0aGVpciByZXNwZWN0aXZlIGNvdW50cmllcyBzaW5jZSB0aGUgaW50ZXJ3YXIgcGVyaW9kLiBUaGUgbGlzdCBkb2VzIG5vdCBpbmNsdWRlIHdvbWVuIGNob3NlbiBieSBhIGhlcmVkaXRhcnkgbW9uYXJjaCBub3IgZmVtYWxlcyB3aG8gaGF2ZSBiZWVuIFByaW1lIE1pbmlzdGVyIGJ1dCBub3QgaGVhZCBvZiBzdGF0ZSBvciBnb3Zlcm5tZW50IChsaWtlIFBlcnUgd2hlcmUgb25seSBQcmVzaWRlbnQgaXMgaGVhZCBvZiBHb3Zlcm5tZW50KS4JY291bnRyaWVzCWdvdmVybmFuY2UKCgpgYGB7ciBnbG9iYWwtZmVtYWxlLWhlYWQtbGluZX0KZGF0YSRnbG9iYWwgJT4lCglzZWxlY3QoWWVhciwgbnVtX2NvdW50cmllc19maG9zKSAlPiUKCXJlbmFtZShWYWx1ZSA9IG51bV9jb3VudHJpZXNfZmhvcykgJT4lCglmaWx0ZXIoIWlzLm5hKFZhbHVlKSkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIFZhbHVlKSkgKwoJZ2VvbV9saW5lKCkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjApICsKCXNjYWxlX3lfY29udGludW91cyhuLmJyZWFrcyA9IDIwKSArCglsYWJzKHRpdGxlID0gIk51bWJlciBjb3VudHJpZXMgdGhhdCBoYXZlIGhhZCBhdCBsZWFzdCBvbmUgZmVtYWxlIGhlYWQgb2Ygc3RhdGUiLCB4ID0gIlllYXIiLCB5ID0gIk51bWJlciBjb3VudHJpZXMgdGhhdCBoYXZlIGhhZCBhdCBsZWFzdCBvbmUgZmVtYWxlIGhlYWQgb2Ygc3RhdGUiKSArCgl0aGVtZShheGlzLnRleHQueCA9IGVsZW1lbnRfdGV4dChhbmdsZSA9IDQ1LCB2anVzdCA9IDEsIGhqdXN0ID0gMSkpCmBgYAoKIyMgam91cm5ha2lsbGVkCgpqb3VybmFraWxsZWQJbWVhc3VyZQlodHRwOi8vZ2FwbS5pby9kam91cm5hbGlzdHNfc2lsZW5jZWQJdjEJSmFudWFyeSAyMiAyMDE5CUpvdXJuYWxpc3RzIGtpbGxlZAlOdW1iZXIgb2Ygam91cm5hbGlzdHMga2lsbGVkCgpgYGB7ciBnbG9iYWwtam91cm5hbGlzdC1raWxsZWQtbGluZX0KZGF0YSRnbG9iYWwgJT4lCglzZWxlY3QoWWVhciwgam91cm5ha2lsbGVkKSAlPiUKCXJlbmFtZShWYWx1ZSA9IGpvdXJuYWtpbGxlZCkgJT4lCglmaWx0ZXIoIWlzLm5hKFZhbHVlKSkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIFZhbHVlLCBmaWxsID0gVmFsdWUpKSArCgkjIGdlb21fbGluZSgpICsKCWdlb21fYmFyKHN0YXQgPSAiaWRlbnRpdHkiKSArCglzY2FsZV9maWxsX2dyYWRpZW50KGxvdyA9ICJibHVlIiwgaGlnaCA9ICJyZWQiLCBicmVha3MgPSBjKDAsIDI1LCA1MCwgNzUsIDEwMCkpICsKCXNjYWxlX3hfY29udGludW91cyhuLmJyZWFrcyA9IDIwKSArCglzY2FsZV95X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCwgZXhwYW5kID0gZXhwYW5zaW9uKG11bHQgPSBjKDAsIC4yKSksIGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsgIyBleHBhbnNpb24gZnVuY3Rpb24gdXNlZCB0byBmaXQgYmFyIHZhbHVlIGxhYmVscyBkeW5hbWljYWxseSBpbnRvIHBsb3Q7IGFkZCBiYXIgdmFsdWUgbGFiZWxzIGdncGxvdAoJZm9ybWF0KHgsIGJpZy5tYXJrID0gIiwiLCBzY2llbnRpZmljID0gRkFMU0UpCgl9KSArCglnZW9tX3RleHQoYWVzKGxhYmVsID0gVmFsdWUpLCBhbmdsZSA9IDkwLCBoanVzdCA9IC0wLjI1LCBzaXplID0gNCkgKwoJdGhlbWUoYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAxLCBoanVzdCA9IDEpKSArCglsYWJzKHRpdGxlID0gIlRvdGFsIG51bWJlciBvZiBqb3VybmFsaXN0IG11cmRlcmVkIGludGVybmF0aW9uYWxseSIsIHggPSAiWWVhciIsIHkgPSAiTnVtYmVyIG9mIG11cmRlcmVkIGpvdXJuYWxpc3QiLCBmaWxsID0gIk51bWJlciBvZiBqb3VybmFsaXN0IGtpbGxlZCIpCmBgYAoKIyMgcG9wY2l0IHBvcHVsYXRpb25zIHBlciBjaXR5IHR5cGVzIChzaXplcykKCnBvcGNpdF9tb3JlXzEwbQltZWFzdXJlCWh0dHA6Ly9nYXBtLmlvL2Rwb3BjaXRpZXMJdjEJSnVuZSAxOCAyMDIwCVBvcHVsYXRpb24gaW4gY2l0aWVzIHdpdGggbW9yZSB0aGFuIDEwbSBwZW9wbGUJUG9wdWxhdGlvbiBpbiBjaXRpZXMgd2l0aCBtb3JlIHRoYW4gMTBtIHBlb3BsZQlQb3B1bGF0aW9uIGluIGNpdGllcyB3aXRoIG1vcmUgdGhhbiAxMG0gcGVvcGxlCVRvdGFsIG51bWJlciBvZiBwZW9wbGUgbGl2aW5nIGluIGNpdGllcyB3aXRoIG1vcmUgdGhhbiAxMCBtaWxsaW9uIHBlb3BsZQlwZXJjZW50CXVyYmFuaXphdGlvbgkJCQkJCQoKYGBge3J9CmRhdGEkZ2xvYmFsICU+JQoJc2VsZWN0KFllYXIsIHBvcGNpdF9tb3JlXzEwbSwgcG9wY2l0XzVfMTBtLCBwb3BjaXRfMV81bSwgcG9wY2l0XzUwMGtfMW0sIHBvcGNpdF8zMDBfNTAwaywgcG9wY2l0X2xlc3NfMzAwaykgJT4lCglkcm9wX25hKCkgJT4lCglwaXZvdF9sb25nZXIoY29scyA9IHBvcGNpdF9tb3JlXzEwbTpwb3BjaXRfbGVzc18zMDBrLCBuYW1lc190byA9ICJDaXR5IikgJT4lCgltdXRhdGUoQ2l0eSA9IGNhc2Vfd2hlbihDaXR5ID09ICJwb3BjaXRfbW9yZV8xMG0iIH4gIlBvcHVsYXRpb24gPiAxMCBNIiwKCQkJCQkJCQkJQ2l0eSA9PSAicG9wY2l0XzVfMTBtIiB+ICJQb3B1bGF0aW9uIDUgLSAxMCBNIiwKCQkJCQkJCQkJQ2l0eSA9PSAicG9wY2l0XzFfNW0iIH4gIlBvcHVsYXRpb24gMSAtIDUgTSIsCgkJCQkJCQkJCUNpdHkgPT0gInBvcGNpdF81MDBrXzFtIiB+ICJQb3B1bGF0aW9uIDUwMCBrIC0gMSBNIiwKCQkJCQkJCQkJQ2l0eSA9PSAicG9wY2l0XzMwMF81MDBrIiB+ICJQb3B1bGF0aW9uIDMwMCAtIDUwMCBLIiwKCQkJCQkJCQkJQ2l0eSA9PSAicG9wY2l0X2xlc3NfMzAwayIgfiAiUG9wdWxhdGlvbiA8IDMwMCBLIikpICU+JQoJZ2dwbG90KGFlcyhZZWFyLCB2YWx1ZSwgZ3JvdXAgPSBDaXR5LCBjb2xvdXIgPSBDaXR5KSkgKwoJZ2VvbV9saW5lKCkgKwoJZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IENpdHkpLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggKyAwLjIpLCAibGFzdC5xcCIsIGNleCA9IDAuNzUpKSArCgkjIGRpcmVjdGxhYmVsczo6Z2VvbV9kbChhZXMobGFiZWwgPSBDaXR5KSwgbWV0aG9kID0gbGlzdChkaXJlY3RsYWJlbHM6OmRsLnRyYW5zKHggPSB4IC0gMC4yKSwgImZpcnN0LnFwIiwgY2V4ID0gMC43NSkpICsKCXNjYWxlX3hfY29udGludW91cyhuLmJyZWFrcyA9IDIwLCBleHBhbmQgPSBleHBhbnNpb24obXVsdCA9IGMoMC4wNzUsIDAuMzUpKSkgKwoJc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGxhYmVscyA9IGZ1bmN0aW9uKHgpIHsKCQlmb3JtYXQoeCwgYmlnLm1hcmsgPSAiLCIsIHNjaWVudGlmaWMgPSBGQUxTRSkKCX0pICsKCXRoZW1lKGxlZ2VuZC5wb3NpdGlvbiA9ICJub25lIiwgYXhpcy50ZXh0LnggPSBlbGVtZW50X3RleHQoYW5nbGUgPSA0NSwgdmp1c3QgPSAxLCBoanVzdCA9IDEpKSArICMsIGxlZ2VuZC50aXRsZSA9IGVsZW1lbnRfdGV4dCh2anVzdCA9IDAuNSkKCWxhYnModGl0bGUgPSAiTnVtYmVyIG9mIHBlb3BsZSBpbiBjaXRpZXMgb2YgdmFyeWluZyBzaXplcyIsIHggPSAiWWVhciIsIHkgPSAiTnVtYmVyIG9mIHBlb3BsZSIpCmBgYAoKIyMgcGVyY2l0IHJhdGUgb2YgZ3Jvd3RoIHBlciBjaXR5IHR5cGVzIChzaXplcykKCnBlcmNpdF9sZXNzXzMwMGsJbWVhc3VyZQlodHRwOi8vZ2FwbS5pby9kcG9wY2l0aWVzCXYxCUp1bmUgMTggMjAyMAlQb3B1bGF0aW9uIGluIGNpdGllcyB3aXRoIGxlc3MgdGhhbiAzMDBrIHBlb3BsZSAoJSkJUG9wdWxhdGlvbiBpbiBjaXRpZXMgd2l0aCBsZXNzIHRoYW4gMzAwayBwZW9wbGUgKCUpCVBvcHVsYXRpb24gaW4gY2l0aWVzIHdpdGggbGVzcyB0aGFuIDMwMGsgcGVvcGxlICglKQlUaGlzIGlzIHRoZSBwcm9wb3J0aW9uIG9mIHBlb3BsZSBpbiBjaXRpZXMgd2l0aCBsZXNzIHRoYW4gMzAwMDAwIHBlb3BsZQlwZXJjZW50CXVyYmFuaXphdGlvbgkJcGVyY2VudAkJCQkKCmBgYHtyfQpkYXRhJGdsb2JhbCAlPiUKCXNlbGVjdChZZWFyLCBwZXJjaXRfbW9yZV8xMG0sIHBlcmNpdF81XzEwbSwgcGVyY2l0XzFfNW0sIHBlcmNpdF81MDBrXzFtLCBwZXJjaXRfMzAwXzUwMGssIHBlcmNpdF9sZXNzXzMwMGspICU+JQoJZHJvcF9uYSgpICU+JQoJcGl2b3RfbG9uZ2VyKGNvbHMgPSBwZXJjaXRfbW9yZV8xMG06cGVyY2l0X2xlc3NfMzAwaywgbmFtZXNfdG8gPSAiQ2l0eSIpICU+JSAKCW11dGF0ZShDaXR5ID0gY2FzZV93aGVuKENpdHkgPT0gInBlcmNpdF9tb3JlXzEwbSIgfiAiUG9wdWxhdGlvbiA+IDEwIE0iLAoJCQkJCQkJCQlDaXR5ID09ICJwZXJjaXRfNV8xMG0iIH4gIlBvcHVsYXRpb24gNSAtIDEwIE0iLAoJCQkJCQkJCQlDaXR5ID09ICJwZXJjaXRfMV81bSIgfiAiUG9wdWxhdGlvbiAxIC0gNSBNIiwKCQkJCQkJCQkJQ2l0eSA9PSAicGVyY2l0XzUwMGtfMW0iIH4gIlBvcHVsYXRpb24gNTAwIGsgLSAxIE0iLAoJCQkJCQkJCQlDaXR5ID09ICJwZXJjaXRfMzAwXzUwMGsiIH4gIlBvcHVsYXRpb24gMzAwIC0gNTAwIEsiLAoJCQkJCQkJCQlDaXR5ID09ICJwZXJjaXRfbGVzc18zMDBrIiB+ICJQb3B1bGF0aW9uIDwgMzAwIEsiKSkgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIHZhbHVlLCBncm91cCA9IENpdHksIGNvbG91ciA9IENpdHkpKSArCglnZW9tX2xpbmUoKSArCglkaXJlY3RsYWJlbHM6Omdlb21fZGwoYWVzKGxhYmVsID0gQ2l0eSksIG1ldGhvZCA9IGxpc3QoZGlyZWN0bGFiZWxzOjpkbC50cmFucyh4ID0geCArIDAuMiksICJsYXN0LnFwIiwgY2V4ID0gMC43NSkpICsKCSMgZGlyZWN0bGFiZWxzOjpnZW9tX2RsKGFlcyhsYWJlbCA9IENpdHkpLCBtZXRob2QgPSBsaXN0KGRpcmVjdGxhYmVsczo6ZGwudHJhbnMoeCA9IHggLSAwLjIpLCAiZmlyc3QucXAiLCBjZXggPSAwLjc1KSkgKwoJc2NhbGVfeF9jb250aW51b3VzKG4uYnJlYWtzID0gMjAsIGV4cGFuZCA9IGV4cGFuc2lvbihtdWx0ID0gYygwLjA3NSwgMC4zNSkpKSArCglzY2FsZV95X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCwgbGFiZWxzID0gZnVuY3Rpb24oeCkgewoJCXBhc3RlMCh4LCAiJSIpCgl9KSArCgl0aGVtZShsZWdlbmQucG9zaXRpb24gPSAibm9uZSIsIGF4aXMudGV4dC54ID0gZWxlbWVudF90ZXh0KGFuZ2xlID0gNDUsIHZqdXN0ID0gMSwgaGp1c3QgPSAxKSkgKyAjLCBsZWdlbmQudGl0bGUgPSBlbGVtZW50X3RleHQodmp1c3QgPSAwLjUpCglsYWJzKHRpdGxlID0gIlByb3BvcnRpb24gb2YgcGVvcGxlIGluIGNpdGllcyBvZiB2YXJ5aW5nIHNpemVzIiwgeCA9ICJZZWFyIiwgeSA9ICJQcm9wb3J0aW9uIG9mIHBlb3BsZSBpbiBjaXR5IHR5cGUiKQpgYGAKCgojIyBpbW1pZ3JhbnRfcGMKCmBgYHtyfQpkYXRhJGdsb2JhbCAlPiUKCXNlbGVjdChZZWFyLCBpbW1pZ3JhbnRfcGMsIGVtaWdyYW50X3BjKSAlPiUKCXBpdm90X2xvbmdlcihjb2xzID0gaW1taWdyYW50X3BjOmVtaWdyYW50X3BjKSAlPiUKCWZpbHRlcighaXMubmEodmFsdWUpICYgbmFtZSAhPSAiaW1taWdyYW50X3BjIikgJT4lCglnZ3Bsb3QoYWVzKFllYXIsIHZhbHVlLCBncm91cCA9IG5hbWUsIGNvbG91ciA9IG5hbWUpKSArCglnZW9tX2xpbmUoKQpgYGAKCgojIENvcnJlbGF0aW5nIHZhcmlhYmxlcwoKYGBge3J9CmRhdGEkd29ybGRfNHJlZ2lvbiAlPiUKCXNlbGVjdChZZWFyLCBSZWdpb24sIHJlZnVnZWVfaW5fcGVyY193YiwgaWhtZV9jb25mbGljdF9kZWF0aCwgaWhtZV9oaXZfZGVhdGgpICU+JQoJcmVuYW1lKFZhbHVlMSA9IHJlZnVnZWVfaW5fcGVyY193YiwgVmFsdWUyID0gaWhtZV9jb25mbGljdF9kZWF0aCwgVmFsdWUzID0gaWhtZV9oaXZfZGVhdGgpICU+JQoJZHJvcF9uYSgpICU+JQoJZ2dwbG90KGFlcyhWYWx1ZTEsIFZhbHVlMiwgZ3JvdXAgPSBSZWdpb24sIGNvbG91ciA9IFJlZ2lvbiwgc2l6ZSA9IFZhbHVlMykpICsKCWdlb21fcG9pbnQoKSArCglzY2FsZV94X2NvbnRpbnVvdXMobi5icmVha3MgPSAyMCkgKwoJc2NhbGVfeV9jb250aW51b3VzKG4uYnJlYWtzID0gMjApCmBgYAoKYGBge3J9CmNvbG5hbWVzKGRhdGEkZ2xvYmFsKQpgYGAKCgoK">R Markdown source file (to produce this document)</a>



# Libraries


```r
library("tidyverse")
options(dplyr.summarise.inform = FALSE)
# theme_set(theme(legend.position = "none"))
library("countrycode")
library("scales")

library("ddplot")
```


```r
source("./modules/helper-functions.R")
```

# ggplot theme


```r
update_geom_defaults("line", list(alpha = 0.65, size = 0.65))

theme_set(theme_dereck())
```

# Load data


```r
data <- readRDS("./outputs/gapminder/clean_data.Rds")
meta <- read.csv("./data/gapminder/ddf--gapminder--fasttrack/meta-data/ddf--concepts.csv")
```

# Dataset completeness


```r
is.not.na <- function(x) {
	return(!is.na(x))
}
```

The datasets collected and cleaned are of the following dimensions (rows, columns):

1. `data$pop`: 
1. `data$countries`: 58369, 93
1. `data$global`: 124, 26
1. `data$world_4region`: 301, 7

## Tables preview {.tabset}


```r
cat("### ","Dataset preview: global", "\n")
```

###  Dataset preview: global 

```r
datatable(rbind(head(data$global, 50), tail(data$global, 50)))
```

<!--html_preserve--><div id="htmlwidget-16bb2420e81b8153ecca" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-16bb2420e81b8153ecca">{"x":{"filter":"top","filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"disabled\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"1900\" data-max=\"2035\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"5327231041\" data-max=\"7713468205\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"2.81\" data-max=\"3.52\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"153011473\" data-max=\"271642105\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"2.81\" data-max=\"3.52\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"21\" data-max=\"76\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.01\" data-max=\"1753.52\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"18\" data-max=\"3719108\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.09\" data-max=\"1753.52\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"152\" data-max=\"3719108\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"6\" data-max=\"76\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"7.221\" data-max=\"14.21064\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"2.42269\" data-max=\"3.74132\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"2.63605\" data-max=\"5.54346\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"3.81216\" data-max=\"5.93263\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"19.90947\" data-max=\"23.43742\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"1.70431\" data-max=\"9.69991\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"294579163\" data-max=\"1262974000\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"98833399\" data-max=\"327830103\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"107966049\" data-max=\"492676623\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"155516426\" data-max=\"527264275\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"812202969\" data-max=\"2083006214\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"69526988\" data-max=\"862082262\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.19663\" data-max=\"0.37178\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"3.14\" data-max=\"25.1\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124"],["world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world","world"],[1900,1901,1902,1903,1904,1905,1906,1907,1908,1909,1910,1911,1912,1913,1914,1915,1916,1917,1918,1919,1920,1921,1922,1923,1924,1925,1926,1927,1928,1929,1930,1931,1932,1933,1934,1935,1936,1937,1938,1939,1940,1941,1942,1943,1944,1945,1946,1947,1948,1949,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2025,2030,2035],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,5327231041,null,null,null,null,5744212930,null,null,null,null,6143493806,null,null,null,null,6541906956,null,null,null,null,6956823588,null,null,null,null,7379796967,null,null,null,7713468205,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,2.87,null,null,null,null,2.81,null,null,null,null,2.83,null,null,null,null,2.93,null,null,null,null,3.17,null,null,null,null,3.37,null,null,null,3.52,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,153011473,null,null,null,null,161316895,null,null,null,null,173588441,null,null,null,null,191615574,null,null,null,null,220781909,null,null,null,null,248861296,null,null,null,271642105,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,2.87,null,null,null,null,2.81,null,null,null,null,2.83,null,null,null,null,2.93,null,null,null,null,3.17,null,null,null,null,3.37,null,null,null,3.52,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,44,56,66,51,26,26,24,36,24,37,21,42,61,50,57,70,42,76,44,49,74,73,61,73,50,47,54,null,null,null,null,null],[770.46,0.01,28.97,4.23,0.09,12.21,19.45,7.58,42.6,6.65,49.71,57.49,28.67,1.07,2.39,17.43,0.26,12.52,5.94,2.88,367.47,618.81,51.74,78.22,1.65,3.47,2.4,26.07,1457.67,4,5.28,1753.52,2.29,14.53,2.61,123.17,2.64,5.52,0.97,244.63,9.32,5.43,678.74,803.11,6.74,4.7,14.59,3,48.76,49.42,21.48,8.54,67.41,5.02,8.14,1.56,4.78,25.78,2.39,97.95,1.81,11.16,1.47,3.75,8.21,2.05,9.56,29.37,2.23,3.79,2.31,3.96,2.53,3.29,8.31,11.64,1.58,4.98,2,17.24,37.38,13.71,3.55,2.53,34.66,1.62,45.68,4.4,1.37,3.01,1.09,3.1,1.12,1.29,1.55,1.52,null,null,null,null],[1267470,18,48438,7136,152,20946,33657,13241,75033,11816,88993,103705,52093,1962,4408,32337,481,23561,11250,5500,706872,1200000,101175,154286,3279,6972,4852,53270,3004895,8330,11092,3719108,4901,31442,5711,272119,5886,12450,2208,563205,21650,12730,1604426,1912974,16172,11358,35563,7374,120828,123774,86004,34858,280073,21222,35036,6855,21317,116973,11024,460342,8657,54377,7303,18932,42238,10732,50926,159025,12238,21170,13085,22738,14708,19450,49741,70593,9680,30978,12580,110036,241527,89657,23491,16938,235332,11142,317757,30969,9732,21691,7958,22877,8352,9703,11820,11719,null,null,null,null],[770.47,120.63,28.97,4.23,0.09,12.21,19.45,752.24,42.6,851.27,83.23,57.49,28.67,1.07,2.39,17.43,0.26,1341.51,243.31,2.88,1667.1,618.81,51.74,128.92,152.42,3.47,211.28,26.07,1457.67,4,5.28,1753.52,2.3,14.53,2.61,124.07,2.64,5.52,0.97,244.63,9.96,5.43,678.74,803.11,6.74,4.7,14.59,7.18,48.76,49.42,21.86,8.54,67.51,5.3,8.85,1.68,5.16,26.33,3.02,98.21,3.28,12.37,2.09,4.26,11.17,2.41,9.97,35.04,3.44,3.91,2.75,4.73,5.42,5.1,10.47,12.68,2.71,6.35,3.39,17.8,37.88,14.3,4.51,3.34,35.68,2.33,47.42,4.85,1.63,3.08,2.86,3.3,1.43,1.57,1.96,3.1,null,null,null,null],[1267500,200018,48438,7136,152,20946,33657,1313241,75033,1511856,148993,103705,52093,1962,4408,32337,481,2523561,460950,5500,3206872,1200000,101175,254286,303279,6972,427852,53270,3004895,8330,11092,3719108,4917,31442,5711,274119,5886,12450,2208,563205,23150,12730,1604426,1912974,16172,11358,35563,17650,120828,123774,87504,34858,280469,22406,38096,7341,23002,119470,13936,461561,15673,60231,10349,21524,57454,12602,53133,189707,18913,21821,15590,27166,31595,30124,62672,76886,16660,39493,21342,113558,244772,93566,29893,22422,242236,16037,329900,34143,11619,22225,20869,24322,10706,11843,14966,23947,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,6,7,7,7,7,10,12,13,14,14,15,15,16,16,17,17,21,23,24,28,29,29,30,33,33,35,36,38,40,41,44,46,48,48,50,53,58,62,65,66,66,68,71,72,75,76,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,7.221,null,null,null,null,7.53556,null,null,null,null,8.05461,null,null,null,null,8.76741,null,null,null,null,9.35678,null,null,null,null,10.18731,null,null,null,null,10.33415,null,null,null,null,10.93003,null,null,null,null,11.7217,null,null,null,null,12.53125,13.48672,13.83682,14.21064],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,2.4227,null,null,null,null,2.55054,null,null,null,null,2.71492,null,null,null,null,2.98398,null,null,null,null,3.09487,null,null,null,null,3.24934,null,null,null,null,3.41847,null,null,null,null,3.5299,null,null,null,null,3.65527,null,null,null,null,3.57802,3.73297,3.74132,3.68865],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,2.64656,null,null,null,null,3.13157,null,null,null,null,2.63605,null,null,null,null,2.93158,null,null,null,null,2.83164,null,null,null,null,3.48001,null,null,null,null,3.78611,null,null,null,null,3.87257,null,null,null,null,4.20289,null,null,null,null,4.46621,4.93551,5.23853,5.54346],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,3.81216,null,null,null,null,3.81891,null,null,null,null,3.93891,null,null,null,null,3.89679,null,null,null,null,4.10513,null,null,null,null,4.37928,null,null,null,null,4.80933,null,null,null,null,5.09645,null,null,null,null,5.18171,null,null,null,null,5.53447,5.56231,5.77446,5.93263],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,19.90947,null,null,null,null,20.37717,null,null,null,null,21.15252,null,null,null,null,21.53352,null,null,null,null,21.8352,null,null,null,null,21.39836,null,null,null,null,22.11062,null,null,null,null,22.68088,null,null,null,null,22.91878,null,null,null,null,22.92561,22.85052,23.05922,23.43742],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,1.70431,null,null,null,null,1.93572,null,null,null,null,2.72597,null,null,null,null,2.87767,null,null,null,null,3.6129,null,null,null,null,3.99424,null,null,null,null,4.69987,null,null,null,null,5.56416,null,null,null,null,6.27097,null,null,null,null,7.14285,7.77009,8.7961,9.69991],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,294579163,null,null,null,null,335935742,null,null,null,null,392333506,null,null,null,null,467060399,null,null,null,null,537473606,null,null,null,null,625856752,null,null,null,null,676050552,null,null,null,null,760382723,null,null,null,null,865037379,null,null,null,null,976785970,1103811784,1182838823,1262974000],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,98833399,null,null,null,null,113703073,null,null,null,null,132241646,null,null,null,null,158963698,null,null,null,null,177776014,null,null,null,null,199622942,null,null,null,null,223632838,null,null,null,null,245568889,null,null,null,null,269751309,null,null,null,null,278899723,305522641,319826656,327830103],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,107966049,null,null,null,null,139605527,null,null,null,null,128399796,null,null,null,null,156171978,null,null,null,null,162655412,null,null,null,null,213794333,null,null,null,null,247683468,null,null,null,null,269408067,null,null,null,null,310164526,null,null,null,null,348132322,403943544,447814675,492676623],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,155516426,null,null,null,null,170247252,null,null,null,null,191861165,null,null,null,null,207591193,null,null,null,null,235807580,null,null,null,null,269040878,null,null,null,null,314621784,null,null,null,null,354550859,null,null,null,null,382399631,null,null,null,null,431400571,455243989,493629104,527264275],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,812202969,null,null,null,null,908414901,null,null,null,null,1030322896,null,null,null,null,1147140458,null,null,null,null,1254260207,null,null,null,null,1314606972,null,null,null,null,1446456210,null,null,null,null,1577869042,null,null,null,null,1691359603,null,null,null,null,1787004906,1870186392,1971214678,2083006214],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,69526988,null,null,null,null,86294534,null,null,null,null,132780054,null,null,null,null,153300370,null,null,null,null,207532416,null,null,null,null,245385636,null,null,null,null,307461011,null,null,null,null,387088566,null,null,null,null,462785215,null,null,null,null,556770452,635937953,751933610,862082262],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.37178,0.35859,0.36414,0.33537,0.32359,0.30323,0.27643,0.25291,0.24315,0.24511,0.25151,0.25139,0.22637,0.21059,0.20942,0.19663,0.21629,0.2379,0.22332,0.22063,0.22304,0.21591,0.21637,0.23201,0.26778,0.28968,0.30182,0.33621,0.3394,0.33811,null,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,3.35,6.26,3.14,4.28,4.93,9.82,12.04,12.57,6.25,6.48,10.86,9.03,14.14,9.23,6.24,12.64,11.66,12.64,9.23,8.59,9.61,8.24,10.45,7.51,10.15,13.11,9.63,9.48,11.3,12.7,13.1,13.8,14,15,15.1,15.7,16.2,16.8,17.7,18.3,18.8,19,19.5,20.4,21.4,21.9,22.7,23,23.5,24.1,24.6,25.1,null,null,null]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Region<\/th>\n      <th>Year<\/th>\n      <th>emigrant_n<\/th>\n      <th>emigrant_pc<\/th>\n      <th>immigrant_n<\/th>\n      <th>immigrant_pc<\/th>\n      <th>journakilled<\/th>\n      <th>ndisasd_noep_rate<\/th>\n      <th>ndisasd_noep_tot<\/th>\n      <th>ndisasd_rate<\/th>\n      <th>ndisasd_tot<\/th>\n      <th>num_countries_fhos<\/th>\n      <th>percit_1_5m<\/th>\n      <th>percit_300_500k<\/th>\n      <th>percit_5_10m<\/th>\n      <th>percit_500k_1m<\/th>\n      <th>percit_less_300k<\/th>\n      <th>percit_more_10m<\/th>\n      <th>popcit_1_5m<\/th>\n      <th>popcit_300_500k<\/th>\n      <th>popcit_5_10m<\/th>\n      <th>popcit_500k_1m<\/th>\n      <th>popcit_less_300k<\/th>\n      <th>popcit_more_10m<\/th>\n      <th>refugee_in_perc_wb<\/th>\n      <th>wn_bothhouses_c<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":10,"scrollX":"400px","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
cat("\n\n")
```


```r
cat("### ","Dataset preview: world_4region", "\n")
```

###  Dataset preview: world_4region 

```r
datatable(rbind(head(data$world_4region, 50), tail(data$world_4region, 50)))
```

<!--html_preserve--><div id="htmlwidget-8a9d6a9d807330c879c0" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-8a9d6a9d807330c879c0">{"x":{"filter":"top","filterHTML":"<tr>\n  <td><\/td>\n  <td data-type=\"character\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"1948\" data-max=\"2020\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"10.8544\" data-max=\"47.58227\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.00938\" data-max=\"5.95194\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.1935\" data-max=\"10.41253\" data-scale=\"5\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.1818\" data-max=\"0.9668\" data-scale=\"4\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n  <td data-type=\"number\" style=\"vertical-align: top;\">\n    <div class=\"form-group has-feedback\" style=\"margin-bottom: auto;\">\n      <input type=\"search\" placeholder=\"All\" class=\"form-control\" style=\"width: 100%;\"/>\n      <span class=\"glyphicon glyphicon-remove-circle form-control-feedback\"><\/span>\n    <\/div>\n    <div style=\"display: none; position: absolute; width: 200px;\">\n      <div data-min=\"0.4\" data-max=\"30.05\" data-scale=\"2\"><\/div>\n      <span style=\"float: left;\"><\/span>\n      <span style=\"float: right;\"><\/span>\n    <\/div>\n  <\/td>\n<\/tr>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301"],["Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Africa","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe","Europe"],[1948,1949,1950,1951,1952,1953,1954,1955,1956,1957,1958,1959,1960,1961,1962,1963,1964,1965,1966,1967,1968,1969,1970,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1971,1972,1973,1974,1975,1976,1977,1978,1979,1980,1981,1982,1983,1984,1985,1986,1987,1988,1989,1990,1991,1992,1993,1994,1995,1996,1997,1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,11.29866,11.36117,11.41066,11.4692,10.8544,11.4737,11.50164,11.53455,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,47.46821,47.3911,47.24656,47.51565,47.58227,47.4619,47.43407,47.33019,47.14889,47.06991,47.18185,47.11549,47.16245,46.97982,46.65765,46.5273,45.96753,45.57257,45.30623,44.85654,44.32776,44.08945,43.76909,43.47666,43.18444,43.19636,43.18005,43.29681,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.9201,0.41033,0.17444,0.25168,5.95194,0.34636,0.6858,1.09655,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.01789,0.06356,0.23235,0.1642,0.15036,0.18088,0.07464,0.05416,0.04591,0.20572,0.07971,0.02847,0.03297,0.01697,0.03657,0.01834,0.00938,0.01117,0.02138,0.01423,0.01413,0.01511,0.02296,0.02385,0.08865,0.05215,0.04324,0.0408,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,3.56309,4.4775,5.44845,6.44878,7.04002,8.49125,9.46571,10.41253,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.1935,0.23064,0.26527,0.29924,0.3326,0.35939,0.34748,0.26145,0.21841,0.23645,0.24366,0.23534,0.23257,0.24197,0.24938,0.27794,0.28166,0.29736,0.3068,0.307,0.3097,0.33203,0.32909,0.30903,0.33333,0.34239,0.37899,0.33438,null,null,null],[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.9359,0.8164,0.827,0.9425,0.9668,0.834,0.594,0.4636,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,0.1818,0.1874,0.3752,0.3912,0.3784,0.3621,0.3941,0.3541,0.3258,0.3263,0.2711,0.2714,0.277,0.2672,0.2527,0.2246,0.2125,0.1938,0.199,0.2002,0.1946,0.1881,0.2163,0.2138,0.3722,0.5229,0.6178,0.7241,0.7648,0.7744,null],[1.31,1.43,0.51,0.6,0.6,0.68,0.5,0.4,0.48,0.63,0.75,0.9,1.17,1.3,1.7,1.85,1.88,1.9,1.92,1.97,2.12,2.4,2.87,3.41,3.93,4.25,4.56,4.94,4.86,5.17,5.45,5.85,5.84,5.9,5.98,6.02,6.1,6.15,6.18,6.26,6.47,6.57,6.87,7.32,7.07,7.45,8.04,8.47,8.81,9.32,8.17,8.68,8.93,9.61,10.25,10.67,11.07,12.09,13.2,13.77,13.78,13.77,13.82,13.98,14.04,13.55,13.34,13.1,12.44,10.85,11.08,11.9,12.55,13.36,13.4,13.7,13.98,15.87,15.8,16.98,17.72,18.08,18.31,19.34,19.87,20.73,20.53,21.53,22.34,23.2,23.65,25.35,25.91,25.96,26.53,25.77,28.09,29.12,29.62,30.05]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Region<\/th>\n      <th>Year<\/th>\n      <th>ihme_cardio_death<\/th>\n      <th>ihme_conflict_death<\/th>\n      <th>ihme_hiv_death<\/th>\n      <th>refugee_in_perc_wb<\/th>\n      <th>wn_bothhouses_c<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":10,"scrollX":"400px","columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6,7]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"orderCellsTop":true}},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
cat("\n\n")
```

## Plots {.tabset}


```r
cat("### ","Dataset completion: world_4region", "\n")
```

###  Dataset completion: world_4region 

```r
{data$world_4region %>%
		select(-Region, -Year) %>%
		is.not.na() %>%
		as.data.frame() %>%
		colSums() / 301 * 100} %>%
	as.list() %>%
	data.frame() %>%
	t() %>%
	as.data.frame() %>%
	rownames_to_column() %>%
	ggplot(aes(reorder(rowname, V1), V1, fill = V1)) +
	geom_bar(stat = "identity") +
	scale_fill_gradient(low = "blue", high = "red", limits = c(0, 100), breaks = c(0, 25, 50, 75, 100))  +
	geom_text(aes(label = glue::glue("{round(V1)}%")), hjust = -0.35, colour = "black") + # , angle = 90
	scale_y_continuous(expand = expansion(mult = c(0, .2)), n.breaks = 15) +
	theme(legend.position = "bottom", axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
	labs(title = "Completeness of variables", subtitle = "Percent of non NA values per variable", x = "Percentage completeness", y = "Variable", fill = "Completeness") +
	coord_flip()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/barplot-completion-world_4region-1.png" style="display: block; margin: auto;" />

```r
cat("\n\n")
```


```r
cat("### ","Dataset completion: global", "\n")
```

###  Dataset completion: global 

```r
{data$global %>%
		select(-Region, -Year) %>%
		is.not.na() %>% 
		as.data.frame() %>%
		colSums() / 124 * 100} %>%
	as.list() %>%
	data.frame() %>%
	t() %>%
	as.data.frame() %>%
	rownames_to_column() %>%
	ggplot(aes(reorder(rowname, V1), V1, fill = V1)) +
	geom_bar(stat = "identity") +
	scale_fill_gradient(low = "blue", high = "red", limits = c(0, 100), breaks = c(0, 25, 50, 75, 100))  +
	geom_text(aes(label = glue::glue("{round(V1)}%")), hjust = -0.35, colour = "black") + # , angle = 90
	scale_y_continuous(expand = expansion(mult = c(0, .2)), n.breaks = 15) +
	theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
	labs(title = "Completeness of variables", subtitle = "Percent of non NA values per variable", x = "Percentage completeness", y = "Variable", fill = "Completeness") +
	coord_flip()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/barplot-completion-global-1.png" style="display: block; margin: auto;" />

```r
cat("\n\n")
```

# world_4region

## wn_bothhouses_c

Percentage of parliamentary seats held by women.

wn_bothhouses_c	measure	http://gapm.io/dwparl	v2	December 15 2020	Pecentage of women in parliaments	Pecentage of women in parliaments	Pecentage of women in parliaments	Percentage of national parliamentary seats held by women. Lower and upper houses combined	percent	governance


```r
data$world_4region %>%
	rename(Value = wn_bothhouses_c) %>%
	select(Region, Year, Value) %>%
	ggplot(aes(Year, Value, colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.points", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.points", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Women held parliamentary seats per world region", x = "Year", y = "Women seats %")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-women-held-line-1.png" style="display: block; margin: auto;" />

## refugee_in_perc_wb

Share refugees	Refugees as share of population in the country of residence.

refugee_in_perc_wb	measure	http://gapm.io/drefugee_wb	v2	July 27 2020	Share refugees	Refugees as share of population in the country of residence.	Share refugees	This is the share of refugees as a percentage of total population in the country of residence.	percent	refugees


```r
data$world_4region %>%
	rename(Value = refugee_in_perc_wb) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value, colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.points", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.points", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Refugees per world region", x = "Year", y = "Refugees %")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-refugee-line-1.png" style="display: block; margin: auto;" />

# ihme_hiv_death

This is the proportion of deaths caused by HIV/AIDS

ihme_hiv_death	measure	http://gapm.io/dcauses_death_ihme	v1	June 15 2020	HIV/AIDS deaths (%)	HIV/AIDS deaths (%)	HIV/AIDS deaths (%)	This is the proportion of deaths caused by HIV/AIDS (IHME)	percent	health


```r
data$world_4region %>%
	rename(Value = ihme_hiv_death) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value, colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.points", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.points", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "HIV/AIDS deaths per world region", x = "Year", y = "HIV/AIDS deaths %")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-hiv-deaths-line-1.png" style="display: block; margin: auto;" />

```r
data$world_4region %>%
	rename(Value = ihme_hiv_death) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, log2(Value), colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.points", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.points", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(round(2 ^ x, digits = 3), "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "HIV/AIDS deaths per world region", x = "Year", y = "HIV/AIDS deaths % log2")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-hiv-deaths-line-2.png" style="display: block; margin: auto;" />


## ihme_conflict_death

This is the proportion of deaths caused by conflict and terrorism

ihme_conflict_death	measure	http://gapm.io/dcauses_death_ihme	v1	June 15 2020	Conflict and terrorism deaths (%)	Conflict and terrorism deaths (%)	Conflict and terrorism deaths (%)	This is the proportion of deaths caused by conflict and terrorism (IHME)	percent	health



```r
data$world_4region %>%
	rename(Value = ihme_conflict_death) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value, colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.qp", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.qp", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(round(2 ^ x, digits = 3), "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Proportion of conflict/terrorism deaths", x = "Year", y = "Conflict/terrorism deaths %")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-conflict-death-line-1.png" style="display: block; margin: auto;" />

```r
data$world_4region %>%
	rename(Value = ihme_conflict_death) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, log2(Value), colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.qp", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.qp", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Conflict and terrorism deaths per world region", x = "Year", y = "Conflict/terrorism deaths % log2")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-conflict-death-line-2.png" style="display: block; margin: auto;" />


## ihme_cardio_death

This is the proportion of deaths caused by Cardiovascular diseases

ihme_cardio_death	measure	http://gapm.io/dcauses_death_ihme	v1	June 15 2020	Cardiovascular diseases deaths (%)	Cardiovascular diseases deaths (%)	Cardiovascular diseases deaths (%)	This is the proportion of deaths caused by Cardiovascular diseases (IHME)	percent	health


```r
data$world_4region %>%
	rename(Value = ihme_cardio_death) %>%
	select(Region, Year, Value) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value, colour = Region)) +
	geom_line() +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x + 0.2), "last.points", cex = 0.65)) +
	directlabels::geom_dl(aes(label = Region), method = list(directlabels::dl.trans(x = x - 0.2), "first.points", cex = 0.65)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.15, 0.15))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) + # Add percent sign
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Cardiovascular disease deaths per world region", x = "Year", y = "Cardiovascular disease deaths %")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/w4-cardio-deaths-line-1.png" style="display: block; margin: auto;" />

# global

## ndisasd_tot

Natural disaster deaths	Natural disaster deaths per year

ndisasd_tot	measure	http://gapm.io/dnatdisasters	v3	March 24 2020	Natural disaster deaths	Natural disaster deaths per year	Natural disaster deaths	This is the number of deaths from all natural disasters. The data includes all categories classified as "natural disasters" (distinguished from technological disasters, such as transport, industrial accidents,etc.. and complex disasters which include some major famine situation for which the drought were not the main causal factor). This includes total deaths from animal accident, droughts, earthquake, epidemic, extreme temperature, Flood, Fog, Impact, Insect infestation, Landslide, Mass movement (dry), Storm, Volcanic activity and Wildfire.	deaths	environment


```r
data$global %>%
	select(Year, Region, ndisasd_tot, ndisasd_rate) %>%
	rename(Value = ndisasd_tot) %>%
	filter(!is.na(Value)) %>%
	filter(Year <= 2020) %>%
	ggplot(aes(Year, Value, fill = Value)) + # , fill = ndisasd_rate
	geom_bar(stat = "identity") +
	scale_fill_gradient(low = "blue", high = "red", breaks = c(0, 25, 50, 75, 100)) +
	scale_x_continuous(n.breaks = 20) +
	scale_y_continuous(n.breaks = 10, labels = function(x) {
		scales::label_number_si(accuracy = 0.1)(x)
	}) +
	# scale_y_continuous(n.breaks = 10, expand = expansion(mult = c(0, .2)), labels = function(x) { # expansion function used to fit bar value labels dynamically into plot; add bar value labels ggplot
		# format(x, big.mark = ",", scientific = FALSE)
	# }) +
	# geom_text(aes(label = Value), angle = 90, hjust = -0.25, size = 4) +
	labs(title = "Deaths related to natural disasters", x = "Year", y = "Deaths related to natural disaster") +
	theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/global-ndisaster-tot-bar-1.png" style="display: block; margin: auto;" />

## ndisasd_rate

This is the number of deaths from all natural disasters per million people	deaths	environment

ndisasd_rate	measure	http://gapm.io/dnatdisasters	v3	March 24 2020	Natural disasters death rate	Natural disasters death rate per million people per year	Natural disasters death rate	This is the number of deaths from all natural disasters per million people	deaths	environment


```r
data$global %>%
	select(Year, Region, ndisasd_tot, ndisasd_rate) %>%
	rename(Value = ndisasd_rate) %>%
	filter(!is.na(Value)) %>%
	filter(Year <= 2020) %>%
	mutate(Value = (Value / 1000000) * 100) %>%
	ggplot(aes(Year,  Value, fill = Value)) + # , fill = ndisasd_rate
	geom_bar(stat = "identity") +
	scale_fill_gradient(low = "blue", high = "red", breaks = c(0, 25, 50, 75, 100)) +
	scale_x_continuous(n.breaks = 20) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) +
	labs(title = "Death rate related to natural disasters", x = "Year", y = "Death rate related to natural disasters") +
	theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/global-ndisaster-rate-bar-1.png" style="display: block; margin: auto;" />

## num_countries_fhos

How many countries have had a female leader

num_countries_fhos	measure	http://gapm.io/dfemale_hos_over_time	v1	May 3 2020	Female Head of State	Number of countries that have had Female Head of State	Female Head of State	This answer the question: How many countries have had a female leader? This list includes women who have been elected or appointed head of state or government of their respective countries since the interwar period. The list does not include women chosen by a hereditary monarch nor females who have been Prime Minister but not head of state or government (like Peru where only President is head of Government).	countries	governance



```r
data$global %>%
	select(Year, num_countries_fhos) %>%
	rename(Value = num_countries_fhos) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value)) +
	geom_line() +
	scale_x_continuous(n.breaks = 20) +
	scale_y_continuous(n.breaks = 20) +
	labs(title = "Number countries that have had at least one female head of state", x = "Year", y = "Number countries that have had at least one female head of state") +
	theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/global-female-head-line-1.png" style="display: block; margin: auto;" />

## journakilled

journakilled	measure	http://gapm.io/djournalists_silenced	v1	January 22 2019	Journalists killed	Number of journalists killed


```r
data$global %>%
	select(Year, journakilled) %>%
	rename(Value = journakilled) %>%
	filter(!is.na(Value)) %>%
	ggplot(aes(Year, Value, fill = Value)) +
	# geom_line() +
	geom_bar(stat = "identity") +
	scale_fill_gradient(low = "blue", high = "red", breaks = c(0, 25, 50, 75, 100)) +
	scale_x_continuous(n.breaks = 20) +
	scale_y_continuous(n.breaks = 20, expand = expansion(mult = c(0, .2)), labels = function(x) { # expansion function used to fit bar value labels dynamically into plot; add bar value labels ggplot
	format(x, big.mark = ",", scientific = FALSE)
	}) +
	geom_text(aes(label = Value), angle = 90, hjust = -0.25, size = 4) +
	theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
	labs(title = "Total number of journalist murdered internationally", x = "Year", y = "Number of murdered journalist", fill = "Number of journalist killed")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/global-journalist-killed-line-1.png" style="display: block; margin: auto;" />

## popcit populations per city types (sizes)

popcit_more_10m	measure	http://gapm.io/dpopcities	v1	June 18 2020	Population in cities with more than 10m people	Population in cities with more than 10m people	Population in cities with more than 10m people	Total number of people living in cities with more than 10 million people	percent	urbanization						


```r
data$global %>%
	select(Year, popcit_more_10m, popcit_5_10m, popcit_1_5m, popcit_500k_1m, popcit_300_500k, popcit_less_300k) %>%
	drop_na() %>%
	pivot_longer(cols = popcit_more_10m:popcit_less_300k, names_to = "City") %>%
	mutate(City = case_when(City == "popcit_more_10m" ~ "Population > 10 M",
									City == "popcit_5_10m" ~ "Population 5 - 10 M",
									City == "popcit_1_5m" ~ "Population 1 - 5 M",
									City == "popcit_500k_1m" ~ "Population 500 k - 1 M",
									City == "popcit_300_500k" ~ "Population 300 - 500 K",
									City == "popcit_less_300k" ~ "Population < 300 K")) %>%
	ggplot(aes(Year, value, group = City, colour = City)) +
	geom_line() +
	directlabels::geom_dl(aes(label = City), method = list(directlabels::dl.trans(x = x + 0.2), "last.qp", cex = 0.75)) +
	# directlabels::geom_dl(aes(label = City), method = list(directlabels::dl.trans(x = x - 0.2), "first.qp", cex = 0.75)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.075, 0.35))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		format(x, big.mark = ",", scientific = FALSE)
	}) +
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) + #, legend.title = element_text(vjust = 0.5)
	labs(title = "Number of people in cities of varying sizes", x = "Year", y = "Number of people")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/unnamed-chunk-1-1.png" style="display: block; margin: auto;" />

## percit rate of growth per city types (sizes)

percit_less_300k	measure	http://gapm.io/dpopcities	v1	June 18 2020	Population in cities with less than 300k people (%)	Population in cities with less than 300k people (%)	Population in cities with less than 300k people (%)	This is the proportion of people in cities with less than 300000 people	percent	urbanization		percent				


```r
data$global %>%
	select(Year, percit_more_10m, percit_5_10m, percit_1_5m, percit_500k_1m, percit_300_500k, percit_less_300k) %>%
	drop_na() %>%
	pivot_longer(cols = percit_more_10m:percit_less_300k, names_to = "City") %>% 
	mutate(City = case_when(City == "percit_more_10m" ~ "Population > 10 M",
									City == "percit_5_10m" ~ "Population 5 - 10 M",
									City == "percit_1_5m" ~ "Population 1 - 5 M",
									City == "percit_500k_1m" ~ "Population 500 k - 1 M",
									City == "percit_300_500k" ~ "Population 300 - 500 K",
									City == "percit_less_300k" ~ "Population < 300 K")) %>%
	ggplot(aes(Year, value, group = City, colour = City)) +
	geom_line() +
	directlabels::geom_dl(aes(label = City), method = list(directlabels::dl.trans(x = x + 0.2), "last.qp", cex = 0.75)) +
	# directlabels::geom_dl(aes(label = City), method = list(directlabels::dl.trans(x = x - 0.2), "first.qp", cex = 0.75)) +
	scale_x_continuous(n.breaks = 20, expand = expansion(mult = c(0.075, 0.35))) +
	scale_y_continuous(n.breaks = 20, labels = function(x) {
		paste0(x, "%")
	}) +
	theme(legend.position = "none", axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) + #, legend.title = element_text(vjust = 0.5)
	labs(title = "Proportion of people in cities of varying sizes", x = "Year", y = "Proportion of people in city type")
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/unnamed-chunk-2-1.png" style="display: block; margin: auto;" />


## immigrant_pc


```r
data$global %>%
	select(Year, immigrant_pc, emigrant_pc) %>%
	pivot_longer(cols = immigrant_pc:emigrant_pc) %>%
	filter(!is.na(value) & name != "immigrant_pc") %>%
	ggplot(aes(Year, value, group = name, colour = name)) +
	geom_line()
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/unnamed-chunk-3-1.png" style="display: block; margin: auto;" />


# Correlating variables


```r
data$world_4region %>%
	select(Year, Region, refugee_in_perc_wb, ihme_conflict_death, ihme_hiv_death) %>%
	rename(Value1 = refugee_in_perc_wb, Value2 = ihme_conflict_death, Value3 = ihme_hiv_death) %>%
	drop_na() %>%
	ggplot(aes(Value1, Value2, group = Region, colour = Region, size = Value3)) +
	geom_point() +
	scale_x_continuous(n.breaks = 20) +
	scale_y_continuous(n.breaks = 20)
```

<img src="/Users/work/Coding/projects/ds-gapminder/R-analysis/./reports///gp-regions-analysis/gp-regions-analysis_files/figure-html/unnamed-chunk-4-1.png" style="display: block; margin: auto;" />


```r
colnames(data$global)
```

```
##  [1] "Region"             "Year"               "emigrant_n"        
##  [4] "emigrant_pc"        "immigrant_n"        "immigrant_pc"      
##  [7] "journakilled"       "ndisasd_noep_rate"  "ndisasd_noep_tot"  
## [10] "ndisasd_rate"       "ndisasd_tot"        "num_countries_fhos"
## [13] "percit_1_5m"        "percit_300_500k"    "percit_5_10m"      
## [16] "percit_500k_1m"     "percit_less_300k"   "percit_more_10m"   
## [19] "popcit_1_5m"        "popcit_300_500k"    "popcit_5_10m"      
## [22] "popcit_500k_1m"     "popcit_less_300k"   "popcit_more_10m"   
## [25] "refugee_in_perc_wb" "wn_bothhouses_c"
```



