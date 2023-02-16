library(tidyr)
library(ggplot2)
library(readr)
library(dplyr)

list.files()

school_tidy_data <- read.csv("school_enrollment_all_india.csv")
dim(school_tidy_data)
head(school_tidy_data)

summary(school_tidy_data)

education_data_tidy <- pivot_longer(school_tidy_data,
                                    cols = girls_0:boys_12,
                                    names_to = "gender_stand",
                                    values_to = "no_of_students",
                                    values_drop_na = TRUE)
View(education_data_tidy)


g1 <- ggplot(education_data_tidy, aes(x = gender_stand, y = no_of_students ))
g1 + geom_jitter(alpha=0.25)

g1+ geom_boxplot()

g1+ geom_line()

g1 + geom_point()

g1+ geom_path()


education_tidy_2 <- separate(education_data_tidy,
         col = gender_stand,
         into = c("gender", "stand"),
         sep = ("_"))
