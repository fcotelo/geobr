#' Download official data of disaster risk areas as an sf object.
#'
#' This function reads the the official data of disaster risk areas in Brazil. It specifically focuses
#' on geodynamic and hydro-meteorological disasters capable of triggering landslides and floods. The
#' data set covers the whole country. Each risk area polygon (known as 'BATER') has unique code id (column 'geo_bater').
#' The data set brings information on the extent to which the risk area polygons overlap with census
#' tracts and block faces (column "acuracia") and number of ris areas within each risk area (column 'num').
#' Orignal data were generated by IBGE and CEMADEN. For more information about the methodology, see deails
#' at https://www.ibge.gov.br/geociencias/organizacao-do-territorio/tipologias-do-territorio/21538-populacao-em-areas-de-risco-no-brasil.html
#'
#' @param year A year number in YYYY format (defaults to 2010)
#' @param simplified Logic TRUE or FALSE, indicating whether the function returns the 'original' dataset with high resolution or a dataset with 'simplified' borders (Defaults to TRUE)
#' @param showProgress Logical. Defaults to (TRUE) display progress bar
#' @param tp Argument deprecated. Please use argument 'simplified'
#'
#' @export
#' @examples \donttest{
#'
#' library(geobr)
#'
#' # Read all disaster risk areas in an specific year
#'   d <- read_disaster_risk_area(year=2010)
#'
#' }
#'
#'

read_disaster_risk_area <- function(year=2010, simplified=TRUE, showProgress=TRUE, tp){

  # deprecated 'tp' argument
  if (!missing("tp")){stop(" 'tp' argument deprecated. Please use argument 'simplified' TRUE or FALSE")}

  # Get metadata with data url addresses
  temp_meta <- select_metadata(geography="disaster_risk_area", year=year, simplified=simplified)

  # list paths of files to download
  file_url <- as.character(temp_meta$download_path)

  # download files
  temp_sf <- download_gpkg(file_url, progress_bar = showProgress)
  return(temp_sf)
}
