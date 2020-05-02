source(here::here("get_acled.R"))

test <- crossing(
  country = c("Nigeria", "Niger", "Sudan", "Burkina Faso"),
  year = c(2015:2018)
) %>% 
  map2_df(
    .x = .$country,
    .y = .$year,
    .f = ~get_acled_dat(.country = .x, .year = .y)
  )


a <- get_acled_dat("Nigeria", 2018)

glimpse(a)
