csv_file <- "application.csv"
output_file <- "mimemap-fy.R"

if (!file.exists(csv_file)) {
  stop(paste("File not found:", csv_file))
}

data <- read.csv(csv_file, header = TRUE, stringsAsFactors = FALSE)
first_two_columns <- data[ 2]

mimemap_content <- "mimemap = c(\n"
for (i in 1:nrow(data)) {
  ext <- data[i, "Name"]
  mime_type <- data[i, "Template"]
  mimemap_content <- paste0(mimemap_content, "  ", ext, ' = "', mime_type, '",\n')
}

mimemap_content <- substr(mimemap_content, 1, nchar(mimemap_content) - 2)
mimemap_content <- paste0(mimemap_content, "\n)")

write(mimemap_content, file = output_file)
