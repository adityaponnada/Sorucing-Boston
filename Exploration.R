# library(rgdal)
# library(raster)
# library(leaflet)

# shape <- readOGR(dsn = "/Users/arushisingh/Downloads/ZIP_Codes/", layer = "Zip_Code")
# 
# llanos <- shapefile("/Users/arushisingh/Downloads/ZIP_Codes/Zip_Codes.shp")
# 
# leaflet(data = llanos) %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap) %>% 
#   addPolygons(fill = FALSE, stroke = TRUE, color = "#03F") %>% addLegend("bottomright", colors = "#03F", labels = "Llanos ecoregion")
# 

obesityFile <- read.csv("/Users/adityaponnada/Downloads/boston_obesity.csv", sep = ",", header = TRUE)


head(obesityFile)


restPlots <- read.csv("/Users/adityaponnada/Downloads/updatedLic.csv", sep = ",", header = TRUE)

decodedFile <- read.csv("/Users/adityaponnada/Downloads/finalDraft.csv", sep = ",", header = TRUE)

decodedFile$ZIP <- as.factor(decodedFile$ZIP)
decodedFile$ZIP <- paste0("0", decodedFile$ZIP)

decodedFile1 <- read.csv("/Users/adityaponnada/Downloads/restaurant_category_counts.csv", sep = ",", header = TRUE)
decodedFile1$ZIP <- as.factor(decodedFile1$ZIP)
decodedFile1$ZIP <- paste0("0", decodedFile1$ZIP)


cityHealth <- read.csv("/Users/adityaponnada/Downloads/city_health_wide_data.csv", sep = ",", header = TRUE)

cityHealth$zip_code <- as.factor(cityHealth$zip_code)
cityHealth$zip_code <- paste0("0", cityHealth$zip_code)
colnames(cityHealth[1]) <- "ZIP"

#sample <- as.data.frame()



common <- intersect(cityHealth$zip_code, decodedFile1$ZIP) 

cityHealth <- cityHealth[cityHealth$zip_code %in% common, ]

restFile <- decodedFile1[decodedFile1$ZIP %in% common, ]



finalFile <- cbind(cityHealth, restFile)

##fit1 <- lm(Obesity ~ Pizza + Limited.access.to.healthy.foods + , data=finalFile)

library(plotly)

clubbedData <- finalFile

#clubbedData$NONPizza <- clubbedData$Asian + clubbedData$BBQ + clubbedData$Cafe + clubbedData$Caribean + clubbedData$Diner + clubbedData$Fastfood + clubbedData$Fast.food + clubbedData$Grill + clubbedData$FrenchCuisine + clubbedData$Ice.Cream + clubbedData$Icecream
remove <- c("AfricanCuisine", "BBQ", "Caribean", "Diner","Fast.food", "FrenchCuisine", "ICE.Cream", "Stand", "MediterraneanCuisine")

reducedData <- finalFile[, !(names(finalFile) %in% remove)]

clubbedData <- reducedData

clubbedData$NoPizza <- clubbedData$Asian + clubbedData$Cafe + clubbedData$Fastfood + clubbedData$Grill + clubbedData$Icecream + clubbedData$Italian + clubbedData$LACuisine

