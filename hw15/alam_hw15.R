# Afreen Alam
# HW 15: Analysis of COVID-19 data


# Load libraries ----------------------------------------------------------

library(tidyverse)
library(here)
library(lubridate)
library(sf)
library(patchwork)
library(gghighlight)
library(ggthemes)


# Define constants --------------------------------------------------------

first_us_case <- "19 Jan 2020"

first_mo_case <- "08 Mar 2020"

lower_48 <- c("Alabama", "Arizona",
              "Arkansas", "California",
              "Colorado", "Connecticut",
              "Delaware", "Florida",
              "Georgia", "Idaho",
              "Illinois", "Indiana",
              "Iowa", "Kansas",
              "Kentucky", "Louisiana",
              "Maine", "Maryland",
              "Massachusetts", "Michigan",
              "Minnesota", "Mississippi",
              "Missouri", "Montana",
              "Nebraska", "Nevada",
              "New Hampshire", "New Jersey",
              "New Mexico", "New York",
              "North Carolina", "North Dakota",
              "Ohio", "Oklahoma",
              "Oregon", "Pennsylvania",
              "Rhode Island", "South Carolina",
              "South Dakota", "Tennessee",
              "Texas", "Utah", "Vermont",
              "Virginia", "Washington",
              "West Virginia",
              "Wisconsin", "Wyoming")


# Functions ---------------------------------------------------------------

### Write a function ..............



# Initial import and wrangling --------------------------------------------

### Use ISO8601 YYYY-MM-DD format.

covid_confirmed_raw <- read_csv(here("data",
                                     "covid_confirmed_usafacts.csv"))
covid_confirmed <- covid_confirmed_raw %>%
  filter(countyFIPS != 0 & stateFIPS != 0) %>%
  pivot_longer(c(`1/22/20`:`7/31/20`),
               names_to = "date",
               values_to = "cases") %>%
  mutate(date = mdy(date)) %>%
  filter(date >= dmy(first_us_case))
  


covid_deaths_raw <- read_csv(here("data",
                                  "covid_deaths_usafacts.csv"))
covid_deaths <- covid_deaths_raw %>%
  filter(countyFIPS != 0 & stateFIPS != 0) %>%
  pivot_longer(c(`1/22/20`:`7/31/20`),
               names_to = "date",
               values_to = "deaths") %>%
  mutate(date = mdy(date)) %>%
  filter(date >= dmy(first_us_case))



county_polulation_raw <- read_csv(here("data",
                                       "covid_county_population_usafacts.csv"))



semo_county_raw <- read_csv(here("data",
                                 "semo_county_enrollment.csv"),
                            skip = 1)
semo_county <- semo_county_raw %>%
  rename("County Name" = X1)







# Plots -------------------------------------------------------------------

## Plot 1

plot_1_data <- covid_confirmed %>%
  left_join(covid_deaths) %>%
  mutate(Region = case_when(
    stateFIPS %in% c(9, 23, 25, 33, 44, 50,
                     34, 36, 42) ~ "Northeast",
    stateFIPS %in% c(18, 17, 26, 39, 55,
                     19, 20, 27, 29,
                     31, 38, 46) ~ "Midwest",
    stateFIPS %in% c(10, 11, 12, 13, 24,
                     37, 45, 51, 54,
                     1, 21, 28, 47,
                     5, 22, 40, 48) ~ "South",
    stateFIPS %in% c(4, 8, 16, 35,
                     30, 49, 32, 56,
                     2, 6, 15, 41, 53) ~ "West")) %>%
      filter(date >= dmy(first_mo_case)) %>%
      group_by(Region, date) %>%
      summarise(total_cases = sum(cases, na.rm = TRUE),
                total_deaths = sum(deaths, na.rm = TRUE))
    
p_cases <- ggplot(plot_1_data) +
  geom_line(aes(x = date,
                y = total_cases,
                color = Region), size = 1) +
  labs(x = NULL,
       y = "Total Cases") +
  theme_classic() +
  theme(legend.position = "bottom")

p_deaths <- ggplot(plot_1_data) +
  geom_line(aes(x = date,
                y = total_deaths,
                color = Region), size = 1) +
  labs(x = NULL,
       y = "Total Deaths") +
  theme_classic() +
  theme(legend.position = "none")

  
  
p_cases + p_deaths +
  plot_layout(nrow = 1)

###### The box around the plot is not present rather just 2 axes.

