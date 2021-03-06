% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ksi.R
\docType{data}
\name{ksi}
\alias{ksi}
\title{Killed or Seriously Injured Data that involved a cyclist}
\format{A tibble with 1,681 rows and 53 variables:
\describe{
\item{event_id}{index of incident from ACCNUM}
\item{year}{year of incident (2006-2019)}
\item{date}{date of incident}
\item{hour, minute}{time, but the minute data have too many rounded time, suggest data quality issue}
\item{street1, street2}{location data}
\item{road_class}{Road Classification}
\item{district}{city district, contain 2 NAs}
\item{ward_num}{ward number, contain 221 NAs}
\item{division}{division num, no NAs}
\item{latitude, longitude}{location coordinates, no NAs}
\item{intersection}{intersection or mid-block, many NAs}
\item{loc_to_inter}{incident location relative to intersection}
\item{traffic_control}{Traffic Control Type}
\item{visibility}{ "Clear","Rain","Other","Snow","Drifting Snow"}
\item{light}{ "Clear","Rain","Other","Snow","Drifting Snow"}
\item{road_cond}{"Dry", "Wet", "Loose Snow", "Other" }
\item{acclass}{accident class "Injury" or "fatal"}
\item{impactype}{initial impact type}
\item{invtype}{involvement nature of the injuried or dead}
\item{age}{age of involved}
\item{injury}{severity of injuries, with NAs}
\item{initdir}{initial direction of travel}
\item{vehtype}{type of vehicle with NAs}
\item{manoeuver}{Vehicle manouever}
\item{automobile}{Driver involved in collison with only Yes and NAs}
\item{hood_id}{ID of neighbourhood}
\item{neighbourhood}{name of neighbourhood, trailing numbers probably needs cleaning}

}}
\usage{
ksi
}
\description{
Data set doesn't contain all traffic events.
}
\keyword{datasets}
