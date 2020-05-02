tictoc::tic("{{purrr}}")

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

tictoc::toc() ## 38.753 sec elapsed

#########################

tictoc::tic("{{doParallel}}")

source(here::here("get_acled.R"))

require(doParallel)

doParallel::registerDoParallel(cores = 4)

test <- crossing(
  country = c("Nigeria", "Niger", "Sudan", "Burkina Faso"),
  year = c(2015:2018)
) %>% 
  map2_df(
    .x = .$country,
    .y = .$year,
    .f = ~get_acled_dat(.country = .x, .year = .y)
  )

tictoc::toc() ## 38.473 sec elapsed (probably didn't do parallel)