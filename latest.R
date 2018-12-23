#!/usr/bin/Rscript

pg <- httr::content(httr::GET("https://dailies.rstudio.com/rstudioserver/oss/ubuntu/x86_64/"), as = "parsed")
deb <- xml2::xml_attr(xml2::xml_find_all(pg, "//tr//td//a"), "href")[1]
download.file(deb, method="wget", dest="rstudio-server-daily-amd64.deb")

