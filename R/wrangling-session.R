source(here::here("R/package-loading.R"))

glimpse(NHANES)

NHANES <- NHANES
view(NHANES)

usethis::use_r("exercises-wrangling")

#use pipe operator
#these two are the same
colnames(NHANES)

NHANES %>% colnames()

#standard R way of "chaining" functions together
glimpse(head(NHANES))

NHANES %>%
  head() %>%
  glimpse()

# muysyr<() function

NHANES_changed <- NHANES %>%
  mutate(Height=Height/100)
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive = if_else(PhysActiveDays >= 5, "yes", "no"))

NHANES_changed <- NHANES_changed %>%
  mutate(new_column = "only one value",
         Height = Height / 100)

# select(): Select specific data by the variables -------------------------

NHANES_characteristics <-NHANES %>%
  select(Age, Gender, BMI)
# To *not* select a variable, us minus (-)
NHANES %>%
  select(-HeadCirc)

# When you have many variables with similar names, use "matching" functions
NHANES %>%
  select(starts_with("BP"), contains("Vol"))

?select_helpers


# rename(): Rename specific columns ---------------------------------------

# rename using the form "newname = oldname"
NHANES %>%
  rename(NumberBabies = nBabies)

# filter(): Filtering/subsetting the data by row --------------------------

# when gender is equal to
NHANES %>%
  filter(Gender == "female")

# when BMI is 25 *and* Gender is female
NHANES %>%
  filter(BMI == 25 & Gender == "female")

# when BMI is 25 *or* gender is female
NHANES %>%
  filter(BMI == 25 | Gender == "female")

# arrange(): Sorting/(re)arranging your data by column --------------------

# ascending order by age
NHANES %>%
  arrange(Age) %>%
  select(Age)
# Other arrange (for reference)
# descending order by rate
NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)
# ascending order by Age and Gender
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)

# group_by(), summarise(): Create a summary of the data, alone or  --------


NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))
# Grouped by gender
NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))
# Grouped by gender and diabetes
NHANES %>%
  group_by(Gender, Diabetes) %>%
  summarise(MeanAge = mean(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))

# gather(): Converting from wide to long form -----------------------------
# Convert to long form by stacking population by each year
# Use minue to exclude a variable (country) from being "gathered"
table4b %>%
  gather(year, population, -country)

# This does the same:
table4b %>%
  gather(key=year, value=population, -country)

# This does the same:
table4b %>%
  gather(year, population, `1999`, `2000`)

# Keep only variables of interest
nhanes_chars <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)
nhanes_chars
# Convert to long form, excluding year and gender
nhanes_long <- nhanes_chars %>%
  gather(Measure, Value, -SurveyYr, -Gender)
nhanes_long

# Using a small dataset:
table2

# Convert to wide form
table2 %>%
  spread(key = type, value = count)
