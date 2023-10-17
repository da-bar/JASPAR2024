#' JASPAR2024 object class
#'
#' @description The JASPAR2024 object class is a thin class for storing the
#' path of JASPAR2024 style SQLite file.
#' @aliases JASPAR2024
#' @slot db Object of class \code{"character"} a character string of the path
#' of SQLite file.
#' @returns JASPAR2024-class
#' @author Damir Baranasic
#' @keywords classes
#' @examples
#'
#' library(JASPAR2024)
#' library(RSQLite)
#'
#' JASPAR2024 <- JASPAR2024()
#' JASPARConnect <- RSQLite::dbConnect(RSQLite::SQLite(), db(JASPAR2024))
#' RSQLite::dbGetQuery(JASPARConnect, 'SELECT * FROM MATRIX LIMIT 5')
#' dbDisconnect(JASPARConnect)
#'
#' @rdname JASPAR2024
#' @import methods
#' @import BiocFileCache
#' @exportClass JASPAR2024
#' @exportMethod initialize

setClass("JASPAR2024", slots = c(db = "character")
         )

#' rdname JASPAR2024
#' @export

setMethod("initialize", "JASPAR2024",
          function(.Object, package = "JASPAR2024") {

            metaData <- system.file("extdata", "metadata.csv", package=package)
            if (!file.exists(metaData)) {
              stop("metadata.csv not found in the specified package.")
            }

            metaDataDF <- read.csv(metaData)

            if (!"SourceUrl" %in% colnames(metaDataDF)) {
              stop("SourceUrl column not found in metadata.csv.")
            }

            url <- metaDataDF$SourceUrl
            files <- bfcrpath(BiocFileCache(), url)

            if (length(files) == 0) {
              stop("No files found based on SourceUrl from metadata.csv.")
            }

            # This package should have only one file
            .Object@db <- files[1]

            return(.Object)
          })

#' @rdname JASPAR2024
#' @export

JASPAR2024 <- function() {
  new("JASPAR2024")
}

#' @name db
#'
#' @title Access database from JASPAR2024 object
#' @description The accessor function for retrieving the location of the
#' database location slot from the JASPAR2024 object
#' @author Damir Baranasic
#' @param object JASPAR2024 class object
#' @returns Returns the location of the JASPAR2024.sqlite file
#' @keywords function
#' @examples
#'
#' library(JASPAR2024)
#' db(JASPAR2024)
#'
#' @import methods
#' @export

setGeneric("db", function(object)
  standardGeneric("db")
)

#' @rdname db

setMethod("db", "JASPAR2024",
          function(object){
            object@db
          })
