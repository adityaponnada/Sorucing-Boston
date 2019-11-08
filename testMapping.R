library(zipcode)
library(dplyr)

data(zipcode)

testClubbed <- clubbedData

testClubbed$zip_numeric <- as.numeric(testClubbed$zip_code)

zipcode$zip_numeric <- as.numeric(zipcode$zip)

common_zip <- intersect(testClubbed$zip_code, zipcode$zip) 

testClubbed <- testClubbed[testClubbed$zip_code %in% common, ]
zipcode2 <- zipcode[zipcode$zip %in% common, ]

finalFile2 <- cbind(testClubbed, zipcode2)

#Geocoded_clubbed <- merge(x = testClubbed, y = zipcode, by = "zip_numeric", all = TRUE)

library(plotly)
library(ggmap)
g <- list(
  
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray85"),
  subunitwidth = 1,
  countrywidth = 1,
  subunitcolor = toRGB("white"),
  countrycolor = toRGB("white")
)

p <- plot_geo(finalFile2,  sizes = c(50, 500)) %>%
  add_markers(
    x = ~longitude, y = ~latitude, size = ~Pizza, color = ~Obesity, hoverinfo = "text",
    text = ~paste(finalFile2$Pizza, " stores at", ",", finalFile2$zip)
  ) %>%
  layout(title = 'Pizzas all over the place', geo = g)



p2 <- plot_ly(
  finalFile2, x = ~longitude, y = ~latitude, 
  type = "scatter", mode = "markers",color = ~Obesity, size = ~Pizza
)

