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
#' rf <- do.call(rbind, TSrf)
#' rf <- data.frame(rf, rfID = rep(names(TSrf), times = unlist(lapply(TSrf, nrow))))
#' rf <- rf[!is.na(rf$Year),-1]
#' rownames(rf) <- NULL
#' rf1 <- rf %>%
#'   tidyr::separate(., rfID, into = c("STUDY_ID", "cell"),
#'                   sep = "_", remove = FALSE) %>%
#'   as.data.frame() %>%
#'   dplyr:::select(rf1, Year, Species, Abundance, rfID, STUDY_ID)
#' stats::setNames(rf1, c("Year", "Species", "Abundance", "rarefyID", "StudyID"))
#'
#' ## save file
#' #saveRDS(rf1, "savedRarefyv1.rds")
#' }

rarefysamples <- function(Year, SampleID, Species, Abundance, resamps) {

  rareftab <- as.data.frame(array(NA, dim = c(0,3)))
  nsamples <- c()
  for (y in unique(Year)) {
    nsamples <- c(nsamples, length(unique(SampleID[Year == y])))
  }
  t <- 1
  minsample <- min(nsamples)
  for (repeats in 1:resamps) {
    raref <- as.data.frame(array(data = NA, dim = c(1, 3),
                                 dimnames = list(c(), c("Year", "Species", "Abundance"))))
    for (y in unique(Year)) {
      samps <- unique(SampleID[Year == y])
      sam <- as.character(sample(samps, minsample, replace = TRUE))
      rarefyear <- data.frame(
        SampleID =  SampleID[which(SampleID %in% sam & Year == y)],
        Species = Species[which(SampleID %in% sam & Year == y)],
        Abundance = Abundance[which(SampleID %in% sam & Year == y)])

      spabun <- tapply(X = as.numeric(rarefyear[,3]),
                       INDEX = as.character(rarefyear[,2]),
                       FUN = sum)
      spar <- data.frame(
        Year = rep(y, length(spabun)),
        Species = names(spabun),
        Abundance = spabun, row.names = NULL)
      raref <- rbind(raref,spar)
    }
    rareftab <- rbind(rareftab, cbind(rep(repeats, dim(raref)[1]), raref))
  }
  return(rareftab)
}

