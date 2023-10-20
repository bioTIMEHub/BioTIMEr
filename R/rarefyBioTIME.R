#' rarefy BioTIME
#'
#' @export
#' @param Year Integer representing year of record
#' @param SampleID Description of unique sampling event, this is used to resample
#' @param Species Highest resolution of taxonomic description available
#' @param currency - set to either Numerical abundance or biomass
#' @param resamps Number of repetitions
#' @returns A data.frame with rarefied abundances/biomasses
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
rarefysamples <- function(Year, SampleID, Species, currency, resamps) {
  # Checking arguments
  checkmate::assertSetEqual(length(Year), c(length(SampleID), length(Species), length(currency)))

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
      tcurrency <- currency[selected_indices]

      raref <- stats::aggregate(x = tcurrency, by = list(tYear, tSpecies), FUN = sum)
      raref <- data.frame(i, raref)
      return(raref)

    }) # end of loop on repetitions

  rareftab <- do.call(rbind, rareftab_list)
  return(stats::setNames(rareftab, c("repeats", "Year", "Species", "currency")))

} # end of function

#' runResampling BioTIME
#'
#' @export
#' @param df dataframe to be resampled (in the format of the output of the gridding() function
#' @param ab set to "A" for abundance and "B" for biomass
#' @returns dataframe containing rarefied studies
#'

runResampling <- function(df, ab) {

  if (ab == "A") {
    TSrf <- list()
    rfIDs <- unique(df$rarefyID)

    for (i in seq_len(length(rfIDs))) {
      data <- df[df$rarefyID == rfIDs[i],]
      TSrf[[i]] <- rarefysamples(data$YEAR, data$SAMPLE_DESC, data$Species, data$ABUNDANCE, 1)
    }
    names(TSrf) <- rfIDs

    rf <- do.call(rbind, TSrf)
    rf <- data.frame(rf, rfID = rep(names(TSrf), times = unlist(lapply(TSrf, nrow))))
    rf <- rf[!is.na(rf$Year), -1]
    rownames(rf) <- NULL

    rf1 <- rf %>%
      tidyr::separate(rfID, into =  c("STUDY_ID", "cell"), sep = "_", remove = FALSE) %>%
      dplyr::select(Year, Species, currency, rfID, STUDY_ID)
      colnames(rf1) <- c("Year", "Species", "Abundance", "rarefyID", "StudyID")
  }
  if (ab == "B") {
    TSrf <- list()
    rfIDs <- unique(df$rarefyID)

    for (i in 1:length(rfIDs)) {
      data <- df[df$rarefyID == rfIDs[i],]
      TSrf[[i]] <- rarefysamples(data$YEAR, data$SAMPLE_DESC, data$Species, data$BIOMASS, 1)
    }
    names(TSrf) <- rfIDs

    rf <- do.call(rbind, TSrf)
    rf <- data.frame(rf, rfID = rep(names(TSrf), times = unlist(lapply(TSrf, nrow))))
    rf <- rf[!is.na(rf$Year),-1]
    rownames(rf) <- NULL

    rf1 <- rf %>%
      tidyr::separate(rfID, into =  c("STUDY_ID", "cell"), sep = "_", remove = FALSE) %>%
      dplyr::select(Year, Species, currency, rfID, STUDY_ID)
    colnames(rf1) <- c("Year", "Species", "Biomass", "rarefyID", "StudyID")
  }
  return(rf1)
}
