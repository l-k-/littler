#!/usr/bin/env r
#
# A simple example to install RStudio Desktop
#
# Copyright (C) 2014 - 2018  Carl Boettiger and Dirk Eddelbuettel
#
# Released under GPL (>= 2)
#
# based on earlier https://raw.githubusercontent.com/rocker-org/rstudio-daily/master/latest.R
#
# todo: cmdline options for different download options

suppressMessages(library(rvest))

setwd("/tmp")                           # go to /tmp

url <- "https://dailies.rstudio.com/rstudio/oss/xenial/amd64/"
pg <- read_html(url)
tb <- html_table(html_nodes(pg, "table"))[[1]]
file <- tb[1,1]
s3url <- "https://s3.amazonaws.com/rstudio-ide-build/desktop/xenial/amd64/"
fileurl <- paste0(s3url, file)
download.file(fileurl, file, method="wget")
