grDevices::X11.options(
  width = 4.5,
  height = 4,
  ypos = 0,
  xpos = 1000,
  pointsize = 10
)

options(repos = c(CRAN = "https://ftp.rrze.uni-erlangen.de/cran/")
,  browser = Sys.getenv("BROWSER")
,  pager = Sys.getenv("PAGER")
,  editor = Sys.getenv("EDITOR")
,  pdfviewer = Sys.getenv("READER")
,  stringsAsFactors = FALSE
,  datatable.prettyprint.char = 15L
,  datatable.print.topn = 10L
,  datatable.print.class = TRUE
,  max.print = 500L

,  usethis.protocol  = "ssh"
,  usethis.full_name = "Alexander Rauhut"
,  usethis.description = list(
    `Authors@R` = 'person(
      "Alexander", "Rauhut",
      email = "alexraw@mailbox.com",
      role = c("aut", "cre")
      )'
,    License = "GPL (>= 3)"
,    Version = "0.0.0.9000"
  )

, formatR.indent = 2
# , radian.editing_mode = "vi"
, radian.auto_match = FALSE # for nvim terminal
)

suppressMessages({
  require(devtools)
  require(usethis)
  # require(testthat)
  require(tinytest)
  require(parallel)
  require(data.table)
  # try(devtools::load_all(), silent = TRUE)
})

# setHook(
#   packageEvent("languageserver", "onLoad"),
#   \(...) {
#     try(devtools::load_all(), silent = TRUE)
#   }
# )

q <- \(save = "no", ...) quit(save = save, ...)
