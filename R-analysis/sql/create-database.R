library("RSQLite")

# Create a connection to our new database
# you can check that the .db file has been created on your working directory
conn <- dbConnect(RSQLite::SQLite(), "gapminder_database.db")

dbWriteTable(conn, "full_gapminder", data$merged)
dbWriteTable(conn, "countries", data$countries)
dbWriteTable(conn, "manual_download", data$manual)
dbWriteTable(conn, "global", data$global)
dbWriteTable(conn, "world_4region", data$world_4region)

dbListTables(conn)
