library(pacman)


# Usethis? ----------------------------------------------------------------

# usethis::use_blank_slate("project")
# usethis::use_r("learning")
# usethis::use_git()


# Code section ------------------------------------------------------------
chooseCRANmirror(ind = 67)
pacman::p_load(installr, r3, styler, lintr, tidyverse, NHANES, snakecase)

glimpse(NHANES)

select(NHANES, Age, Weight, BMI)
select(NHANES, -HeadCirc)

# All columns starting with letters "BP" (blood pressure)
select(NHANES, starts_with("BP"))
# All columns ending in letters "Day"
select(NHANES, ends_with("Day"))
# All columns containing letters "Age"
select(NHANES, contains("Age"))

# Save the selected columns as a new data frame
# Recall the style guide for naming objects
nhanes_small <- select(
  NHANES, Age, Gender, BMI, Diabetes,
  PhysActive, BPSysAve, BPDiaAve, Education
)

# View the new data frame
nhanes_small

# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# Have a look at the data frame
nhanes_small

# Rename function
nhanes_small <- rename(nhanes_small, sex = gender)
nhanes_small

nhanes_small %>%
  colnames()

nhanes_small %>%
  select(phys_active) %>%
  rename(physically_active = phys_active)
nhanes_small$phys_active


nhanes_small %>%
  rename(
    bp_sys = bp_sys_ave,
    bp_dia = bp_dia_ave
  )

nhanes_small %>%
  select(
    bmi,
    contains("age")
  )
nhanes_small %>%
  rename(bp_systolic = bp_sys_ave)
