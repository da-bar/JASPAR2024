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
#' JASPAR2024@db
#'
#' @import methods
#' @exportClass JASPAR2024
setClass("JASPAR2024", slots = c(db = "character")
         )


