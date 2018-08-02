iiif_image <- function(
  scheme = "https",
  server,
  prefix = NULL,
  identifier,
  region = "full",
  size = "max",
  rotation = 0,
  quality = "default",
  format = c("jpg", "tif", "ong", "gif", "jp2", "pdf", "webp"),
  ...
) {

  api_path <- paste(prefix, identifier, region, size, rotation, quality, sep = "/")

  format <- match.arg(format)

  l <- structure(
    list(scheme = scheme,
         hostname = server,
         path = paste(api_path, format, sep = ".")
         ),
    class = "url")
  httr::build_url(l)
}

iiif_image(server = "data.getty.edu", prefix = "museum/api/iiif", identifier = "144")

