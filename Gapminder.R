# SACHAL L DENNEY
# Retrieving, arranging, and visualizing data from the gapminder data set


# Install packages

install.packages("tidyverse")
install.packages("dplyr")
install.packages("gapminder")
install.packages("ggplot2")


# Load libraries into session

library(tidyverse)
library(dplyr)
library(gapminder)
library(ggplot2)



# Gapminder filtered by the year 2007

GM_2007 <- gapminder %>% filter(year == 2007)

str(GM_2007)
print(GM_2007, n = Inf)



# Gapminder filtered by Japan

GM_Japan <- gapminder %>% filter(country == "Japan")

str(GM_Japan)
print(GM_Japan, n = Inf)



# Gapminder filtered by multiple countries

GM_Multi <- gapminder %>% filter(
    country == "Japan" |
    country == "United States" |
    country == "Zimbabwe" |
    country == "Mexico" |
    country == "Iraq" |
    country == "Canada")

str(GM_Multi)
print(GM_Multi, n = Inf)



# Sort updatedGM by population, return 50 rows

gmByPop <- GM_2007 %>% arrange(desc(pop))

print(gmByPop, n = 50)



# Sort by life expectancy, return 50 rows

gmByLifeExp <- GM_2007 %>% arrange(desc(lifeExp))

print(gmByLifeExp, n = 50)


# Visualizing continents with the highest and lowest life expectancy

ggplot(GM_2007, aes(x = continent, y = lifeExp, color = continent)) + 
  geom_point()



# Visualizing the history of life expectancy rates in Japan

ggplot(GM_Japan, aes(x = year, y = lifeExp)) +
  geom_line(color = "darkred", size = 2) +
  ggtitle("Japan's Life Expectancy 1950 - 2007") +
  theme(plot.title = element_text(hjust = 0.5)) # Centers the title


# Visualizing life expectancy in multiple countries

ggplot(GM_Multi, aes(x = year, y = lifeExp, color = country)) +
  geom_line(size = 1.5) +
  ggtitle("Analyzing Life Expectancy in Multiple Countries") +
  theme(plot.title = element_text(hjust = 0.5))

# GDP Per Capita and Life Expectancy Correlation + Trendline


ggplot(GM_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point() +
  geom_smooth(method=lm, color = "blueviolet")


# sachal.denney@vikings.berry.edu 
# www.linkedin.com/in/sldenney