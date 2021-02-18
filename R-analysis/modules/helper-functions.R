library("DT")

datatable <- function(x, rownames = TRUE) {
	DT::datatable(x, options = list(pageLength = 10, scrollX = "400px"), filter = "top", rownames = rownames)	
}

largeTable <- function(df, targs = c(1, 2, 3), rownames = TRUE) {
	DT::datatable(
		df,
		escape = FALSE,
		options = list(columnDefs = list(list(
			targets = targs,
			render = JS(
				"function(data, type, row, meta) {",
				"return type === 'display' && data.length > 30 ?",
				"'<span title=\"' + data + '\">' + data.substr(0, 30) + '...</span>' : data;",
				"}"
			)
		)),
		pageLength = 10,
		scrollX = "400px"),
		filter = "top",
		rownames = rownames,
		callback = JS('table.page(0).draw(false);')
	)
}