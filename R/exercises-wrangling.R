# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


# Excercise 2 Piping, transforming, and adding ----------------------------


# Create a new variable called “UrineVolAverage” by calculating the average urine volumne (from “UrineVol1” and “UrineVol2”).
# Modify/replace the “Pulse” variable to beats per second (currently is beats per minute).
# Create a new variable called “YoungChild” when age is less than 6 years.

NHANES_changed <- NHANES_changed %>%
  mutate(UrineVolAverage = (UrineVol1+UrineVol2)/2,
         Pulse = Pulse/60,
         YoungChild=if_else(Age<6, TRUE, FALSE))


# Exercise: Filtering and logic, arranging, and selecting -----------------
#
# Filter so only those with BMI more than 20 and less than 40 and keep only those with diabetes.
# Filter to keep those who are working (“Work”) or those who are renting (“HomeOwn”) and those who do not have diabetes. Select the variables age, gender, work status, home ownership, and diabetes status.
# Using sorting and selecting, find out who has had the most number of babies and how old they are.

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter(BMI >= 20 & BMI <= 40 & Diabetes == "Yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter(Work == "Working" | HomeOwn == "rent" & Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(Age, nBabies)


