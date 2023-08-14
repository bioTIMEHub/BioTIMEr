#' rarefy BioTIME
#'
#' @export
#' @param Year (character) string with latitude and longitude, one or more in a vector.
#' @param SampleID A definition of SampleID
#' @param Species A definition of Species
#' @param Abundance A definition of Abundance. All the same length?
#' @param resamps Number of repetition
#' @return A data.frame with rarefied abundances
#' @examples
#' \dontrun{
#' library(dplyr)
#'
#' ## select chosen rds file
#' dfr <- readRDS("savedFinalStage.rds")
#' ## do any filtering required here
#' ## for example:
#' ## by length of study
#' rf <- subset(dfr, Abundance != 0)
#' yrf2 <- rf %>%
#'                         dplyr::group_by(rarefyID) %>%
#'                         dplyr::summarise(yr = dplyr::n_distinct(YEAR))
#' getYrs2 <- subset(yrf2, yr > 19)
#' rf2 <- subset(rf, rarefyID %in% getYrs2$rarefyID)
#' srf2 <- rf2 %>%
#'                         dplyr::group_by(rarefyID) %>%
#'                         dplyr::summarise(sp = dplyr::n_distinct(Species)) %>%
#'                         as.data.frame()
#' getSp2 <- subset(srf2, sp > 9)
#' ## by taxa
#' ## by realm
#' ## by number of species
#' df <- dplyr::select(dfr, YEAR, Species, ABUNDANCE, rarefyID, SAMPLE_DESC)
#' stats::setNames(df, c("Year", "Species", "Abundance", "rarefyID", "Samp"))
#'
#' TS <- df
#'
#' TSrf <- list()
#' rfIDs <- unique(TS$rarefyID)
#' set.seed(123)
#' for (i in 1:length(rfIDs)) {
#'   data <- TS[TS$rarefyID == rfIDs[i],]
#'   TSrf[[i]] <- rarefysamples(Year = data$Year, SampleID = data$Samp,
#'                              Species = data$Species,
#'                              Abundance = data$Abundance, resamps = 1)
#' }
#' names(TSrf) <- rfIDs
#'

rarefysamples <- function(Year, SampleID, Species, Abundance, resamps) {
  # Checking arguments
  checkmate::assertSetEqual(length(Year), c(length(SampleID), length(Species), length(Abundance)))

  minsample <- min(tapply(SampleID, Year, function(x) length(unique(x))))

  rareftab_list <- lapply( # beginning loop on repetitions
    X = seq_len(resamps),
    FUN = function(i) {
      selected_indices <- unlist(lapply( # beginning sub loop on years
        X = unique(Year),
        FUN = function(y) {
          samps <- unique(SampleID[Year == y])
          sam <- sample(samps, minsample, replace = TRUE)
          return(which(SampleID %in% sam & Year == y))
        })) # end of loop on years

      tYear      <- Year[selected_indices]
      tSpecies   <- Species[selected_indices]
      tAbundance <- Abundance[selected_indices]

      raref <- stats::aggregate(x = tAbundance, by = list(tYear, tSpecies), FUN = sum)
      raref <- data.frame(i, raref)
      return(raref)

    }) # end of loop on repetitions

  rareftab <- do.call(rbind, rareftab_list)
  return(stats::setNames(rareftab, c("repeats", "Year", "Species", "Abundance")))

} # end of function
