## code to prepare `ksi_raw` dataset

ksi_raw <- rio::import("data-raw/cyclist serious or fatal collisionin TO_2006-2019.xlsx", sheet="Cyclists")

ksi_raw <- ksi_raw %>%
  janitor::clean_names() %>%
  janitor::remove_empty(which = "cols") %>% # drop cols that are all NAs
  purrr::discard(~sum(is.na(.x))/length(.x)* 100 >=40) # drop cols that are 40% or above NAs

categoricals <- c("road_class", "district",
                  "ward_num","division",
                  "loccoord","accloc","traffctl",
                  "visibility", "rdsfcond", "acclass",
                  "impactype","invage", "injury", "initdir",
                  "vehtype", "manoeuver","hood_id","neighbourhood",
                  )

# deselect columns that is not useful
ksi_semi <- ksi_raw %>%
  as_tibble() %>%
  select(-x,-y,-index, -cyclist, -object_id) %>% # cyclist is all "Yes", filtering flag from bigger database, object_id is just 1 to row number
  rename(event_id = accnum) %>%
  mutate(date = lubridate::date(date)) %>%  # original data contains hms
  mutate(minute = time %% 100, .keep="unused") %>%
  mutate(across(all_of(categoricals), as_factor)) %>%
  rename(intersection=loccoord,
         loc_to_inter = accloc,
         traffic_control = traffctl,
         road_cond = rdsfcond,
         age = invage
         )

glimpse(ksi_semi)

ksi_semi %>%
  count(minute, sort = T) # so many incidents happened at round hours, suggest quality issues

ksi_semi %>%
  count(is.na(light))

ksi_semi %>%
  count(object_id, sort = T) %>% view

ksi_semi %>%
  count(fatal_no, sort = T) %>%.[[1]] %>%levels()

ksi <- ksi_semi

library(mice)

md.pattern(ksi_semi)

DataExplorer::create_report(ksi_semi)

usethis::use_data(ksi, overwrite = TRUE)

