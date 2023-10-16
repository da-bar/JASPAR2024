#' JASPAR2024 object class
#'
#' @description The JASPAR2024 object class is a thin class for storing the path of
#' JASPAR2024 style SQLite file.
#' @aliases JASPAR2024
#' @slot db Object of class \code{"character"} a character string of the path
#'  of SQLite file.
#' @author Damir Baranasic
#' @keywords classes
#' @examples
#'
#' library(JASPAR2024)
#' JASPAR2024
#'
#' @import methods
#' @exportClass JASPAR2024
setClass("JASPAR2024", slots = c(db = "character")
         )

#' @name db
#'
#' @title Access database from JASPAR2024 object
#' @description The accessor function for retrieving the location of the
#' database location slot from the JASPAR2024 object
#' @author Damir Baranasic
#' @keywords function
#' @examples
#'
#' library(JASPAR2024)
#' db(JASPAR2024)
#'
#' @import methods
#' @export

setGeneric("db", function(object){
  standardGeneric("db")
})

setMethod("db", "JASPAR2024",
          function(object){
            object@db
          })
