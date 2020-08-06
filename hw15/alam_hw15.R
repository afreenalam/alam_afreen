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

### First US case
first_us_case <- "19 Jan 2020"

### First MO case
first_mo_case <- "08 Mar 2020"

### The lower 48 states
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

### CDC regions assigned respective state FIPS.
northeast_fips <-  c(9, 23, 25, 33, 44, 50,
                     34, 36, 42)
midwest_fips <- c(18, 17, 26, 39, 55,
                    19, 20, 27, 29,
                    31, 38, 46)
south_fips <-  c(10, 11, 12, 13, 24,
                 37, 45, 51, 54,
                 1, 21, 28, 47,
                 5, 22, 40, 48)
west_fips <-  c(4, 8, 16, 35,
                 30, 49, 32, 56,
                 2, 6, 15, 41, 53)


# Functions ---------------------------------------------------------------

### Write a function ..............



# Initial import and wrangling --------------------------------------------

### Use ISO8601 YYYY-MM-DD format

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



county_population_raw <- read_csv(here("data",
                                       "covid_county_population_usafacts.csv"))
state_population <- county_population_raw %>%
  filter(countyFIPS != 0)


semo_county_raw <- read_csv(here("data",
                                 "semo_county_enrollment.csv"),
                            skip = 1)
semo_county <- semo_county_raw %>%
  rename("County Name" = X1)








# Plots 


# Plot 1 -------------------------------------------------------------------

plot_1_data <- covid_confirmed %>%
  left_join(covid_deaths) %>%
  mutate(Region = case_when(
    stateFIPS %in%  northeast_fips ~ "Northeast",
    stateFIPS %in%  midwest_fips ~ "Midwest",
    stateFIPS %in%  south_fips ~ "South",
    stateFIPS %in%  west_fips ~ "West")) %>%
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


### The box around the plot is not present rather just 2 axes.
### ??


  

# Plot 2 -------------------------------------------------------------------
## Plot 2: Highlight Missouri Counties with 200+ students at SEMO

plot_2_data <- covid_confirmed %>%
  filter(State == "MO",
         date >= dmy(first_mo_case)) %>%
  mutate(`County Name` = str_replace(`County Name`, " County$", ""),
         `County Name` = str_replace(`County Name`, "^Jackson.*", "Jackson"))


semo_data <- semo_county %>%
  select(-c(`2015`:`2018`)) %>%
  mutate(`County Name` =
           str_replace_all(`County Name`,
                           c("De Kalb" = "DeKalb",
                             "Sainte" = "Ste\\.",
                             "Saint" = "St\\.",
                             "St\\. Louis City" = "City of St\\. Louis")))


plot_2_final <- plot_2_data %>%
  group_by(`County Name`, date) %>%
  summarise(total_confirmed = sum(cases,
                                  na.rm = TRUE)) %>%
  left_join(semo_data)
  

  
  ggplot(plot_2_final) +
  geom_line(aes(x = date,
                y = total_confirmed,
                color = `County Name`),
            size = 0.7) +
  labs(x = NULL,
       y = "Total Confirmed Cases",
       color = "County") +
    gghighlight(`2019` >= 200,
                use_direct_label = FALSE) +
    theme_classic() +
    scale_x_date(date_labels = "%d %b")
  


### The box around the plot is not present rather just 2 axes.
### ??




# Plot 3 -------------------------------------------------------------------

## Plot 3: Cleveland plot comparing number of cases in April and July

plot_3_final <- covid_confirmed %>%
    filter(date %in% c(ymd("2020-04-01"):ymd("2020-04-30"),
                       ymd("2020-07-01"):ymd("2020-07-30"))) %>%
    mutate(month = month(date)) %>%
    group_by(State,`County Name`, month) %>%
    summarise(total_cases_county = sum(cases,
                                       na.rm = TRUE)) %>%
    left_join(state_population) %>%
    mutate(rate_county = (total_cases_county / population)
           * 100000)
  
a <- plot_3_final %>%
  group_by(State, month) %>%
  summarise(avg_rate = sum(total_cases_county) / sum(population) * 100000)
    
    
    group_by(State,`County Name`, month) %>%
    
    
    
    
    summarise(pop_state = sum(population,
                              na.rm = TRUE),
              cases_per_state = sum(cases,
                                    na.rm = TRUE),
              rate = (cases_per_state / pop_state)
              * 100000)
  
  
ggplot(plot_3_final,
       aes(x = reorder(State, rate),
           y = rate),
       group = State) +
  geom_line(color = "gray30") +
  geom_point(aes(color = month),
             size = 2) +
  coord_flip()
  
  
    group_by(`State`, `County Name`, month) %>%
    summarise(case_total = sum(cases,na.rm = TRUE),
           case_rate_county = (case_total / population) * 100000)
   
  
  
  
  
  
   group_by(`State`, month) %>%
    summarise(total_confirmed = sum(cases,
                                    na.rm = TRUE),
              case_rate = (total_confirmed / population) * 100000)
    
    
  
