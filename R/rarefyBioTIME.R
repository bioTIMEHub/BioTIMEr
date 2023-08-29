#' rarefy BioTIME
#'
#' @export
#' @param Year Integer representing year of record
#' @param SampleID Description of unique sampling event, this is used to resample
#' @param Species Highest resolution of taxonomic description available
#' @param Abundance Numerical abundance
#' @param resamps Number of repetitions
#' @return A data.frame with rarefied abundances
#' @examples
#' \dontrun{
#' library(dplyr)
#' 
#' dfr <- # output from gridding process
#' df <- dplyr::select(dfr, YEAR, Species, ABUNDANCE, rarefyID, SAMPLE_DESC)
#' stats::setNames(df, c("Year", "Species", "Abundance", "rarefyID", "Samp"))
#'}
#'
#'
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

#' runResampling BioTIME
#'
#' @export
#' @param df description of the df argument
#' @return description of the object returned by runResampling
#'

runResampling <- function(df) {
  TSrf <- list()
  rfIDs <- unique(df$rarefyID)

  for (i in 1:length(rfIDs)) {
    data <- df[df$rarefyID == rfIDs[i],]
    TSrf[[i]] <- rarefysamples(data$Year, data$Samp, data$Species, data$Abundance, 1)
  }
  names(TSrf) <- rfIDs

  rf <- do.call(rbind, TSrf)
  rf <- data.frame(rf, rfID = rep(names(TSrf), times = unlist(lapply(TSrf, nrow))))
  rf <- rf[!is.na(rf$Year),-1]
  rownames(rf) <- NULL
  rf1 <- rf %>%
    separate(., rfID, into =  c("STUDY_ID", "cell"),
                                     sep = "_", remove = F) %>%
    as.data.frame()

  rf1 <- select(rf1, Year, Species, Abundance, rfID, STUDY_ID)
  return(stats::setNames(rf1, c("Year", "Species", "Abundance", "rarefyID", "StudyID")))
}
