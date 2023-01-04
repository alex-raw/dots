local ls = require("luasnip")
local s = ls.parser.parse_snippet

ls.snippets = {
    r = {
        s("tryCatch",
            "${1:result} <- tryCatch({\n  ${2:expr}\n}, ${3:param} = function(${4:param}) {\n  ${5:expr}\n})"
        ),
        s("test",
            'test_that("${1:label}", {\n  ${2:expr}\n})'
        ),
        s("microbenchmark",
            "microbenchmark::microbenchmark(name = {\n  ${2:expr}\n}, name = {\n  ${5:expr}\n}, times = 100L)"
        ),
        s("roxygen",
            "#' ${1:Title}\n#'\n#' ${2:Description}\n#'\n#' @param $3\n#' @return $4\n#' @export\n"
        ),
        s("fucolors",
            'fu_blue <- #003366\nfu_lightblue <- "#0066cc"\nfu_green <- "#99cc00"\nfu_darkgreen <- "#6b9e1e"\nfu_orange <- "#ff9900"\nfu_red <- "#cc0000"\n'
        ),
        s("NSE",
            "# due to NSE notes in R CMD check\n$0 <- NULL"
        ),
    },
    rmd = {
        s("footnote",
            "[^${1:Footnote}]$0\n\n[^$1]:${2:Text}"
        ),
        s("header1",
            "# ${1:Heading} {#$1}"
        ),
        s("header2",
            "## ${1:Heading} {#$1}"
        ),
        s("header3",
            "### ${1:Heading} {#$1}"
        ),
        s("header4",
            "#### ${1:Heading} {#$1}"
        ),
        s("header5",
            "##### ${1:Heading} {#$1}"
        ),
        s("header6",
            "###### ${1:Heading} {#$1}"
        ),
        s("ref",
            "\\@ref($1)")
    },
}
