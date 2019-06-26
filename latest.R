#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

pg <- httr::content(
  httr::GET("https://dailies.rstudio.com/rstudio/oss/debian9/x86_64/"), 
  as = "parsed", 
  encoding = "UTF-8"
)
deb <- xml2::xml_attr(xml2::xml_find_all(pg, "//tr//td//a"), "href")[1]
vm <- regexec("rstudio-([0-9.]+)", deb)
v <- regmatches(deb, vm)[[1]][2]
if (!is.null(args) && grepl("--version", args, fixed = TRUE)) {
  cat(v)
} else {
  cat(v, file = "/rstudio-server.version")
  download.file(deb, method="wget", dest="rstudio-server-daily-amd64.deb", quiet=TRUE)
}
