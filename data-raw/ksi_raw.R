## code to prepare `ksi_raw` dataset

ksi_raw <- rio::import("data-raw/cyclist serious or fatal collisionin TO_2006-2019.xlsx", sheet="Cyclists")

ksi_raw <- ksi_raw %>%
  janitor::clean_names()


usethis::use_data(ksi_raw, overwrite = TRUE)
