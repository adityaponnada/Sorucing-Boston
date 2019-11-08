Sys.setenv('MAPBOX_TOKEN' = 'pk.eyJ1IjoiYWRpdHlhcG9ubmFkYSIsImEiOiJjam9jNjl2dnQwaWJpM2xqZDVxMWE4bjg3In0.n0PcD5dDILAMcekdbpIMHw')


pMap <- plot_mapbox(finalFile2, x = ~longitude, y = ~latitude) %>%
  add_paths(size = ~Pizza) %>%
  add_segments(x = -100, xend = -50, y = 50, 75) %>%
  layout(mapbox = list(zoom = 0,
                       center = list(latitude = ~median(latitude),
                                     longitude = ~median(longitude))
  ))


pMap2 <- finalFile2 %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(50, 500), size = ~Pizza, mode = 'scattermapbox', color = I("Red"), name = "Pizza stores",
                                    hoverinfo="text", text = ~paste(finalFile2$Pizza, " pizza stores at", finalFile2$zip))%>% layout( 
                                                                plot_bgcolor = 'white', paper_bgcolor = 'white',
                                                                mapbox = list(style = 'light'),
                                                                legend = list(orientation = 'h',
                                                                              font = list(size = 8)),
                                                                margin = list(l = 25, r = 25,
                                                                              b = 25, t = 25,
                                                                              pad = 2))

pMap_obesity <- finalFile2 %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(50, 500), size = ~Obesity, mode = 'scattermapbox', color = I("Blue"), name = "Obesity",
                                           hoverinfo='text', text = ~paste(finalFile2$Obesity, "% obese adults at", finalFile2$zip))%>% layout( 
                                                                       plot_bgcolor = 'white', paper_bgcolor = 'white',
                                                                       mapbox = list(style = 'light'),
                                                                       legend = list(orientation = 'h',
                                                                                     font = list(size = 8)),
                                                                       margin = list(l = 25, r = 25,
                                                                                     b = 25, t = 25,
                                                                                     pad = 2))

pMap_BP <- finalFile2 %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(50, 500), size = ~High.blood.pressure, mode = 'scattermapbox', color = I("Green"), name = "Blood pressure",
                                           hoverinfo='text', text = ~paste(finalFile2$High.blood.pressure, "% high B.P. adults at", finalFile2$zip))%>% layout( 
                                                                       plot_bgcolor = 'white', paper_bgcolor = 'white',
                                                                       mapbox = list(style = 'light'),
                                                                       legend = list(orientation = 'h',
                                                                                     font = list(size = 8)),
                                                                       margin = list(l = 25, r = 25,
                                                                                     b = 25, t = 25,
                                                                                     pad = 2))

pMap_PA <- finalFile2 %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(50, 500), size = ~Physical.inactivity, mode = 'scattermapbox', color = I("Purple"), name = "Physical inactivity",
                                      hoverinfo='text', text = ~paste(finalFile2$Physical.inactivity, "% of inactive adults at", finalFile2$zip))%>% layout( 
                                                                  plot_bgcolor = 'white', paper_bgcolor = 'white',
                                                                  mapbox = list(style = 'light'),
                                                                  legend = list(orientation = 'h',
                                                                                font = list(size = 8)),
                                                                  margin = list(l = 25, r = 25,
                                                                                b = 25, t = 25,
                                                                                pad = 2))


subplot(pMap2, pMap_obesity, pMap_BP, pMap_PA, nrows = 2)


finalRest_latlong <- read.csv("/Users/adityaponnada/Downloads/finalDraft_with_lat_long.csv", sep = ",", header = TRUE)

finalPizza <- subset(finalRest_latlong, finalRest_latlong$Category == "Pizza")
finalLACuisine <- subset(finalRest_latlong, finalRest_latlong$Category == "LACuisine")
finalSeaFood <- subset(finalRest_latlong, finalRest_latlong$Category == "Seafood")

library(plotly)
pPizzaBoston <- finalPizza %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(20, 30), mode = 'scattermapbox', color = I("Orange"), name = "Physical inactivity",
                                      hoverinfo='text', text = "Pizza parlor")%>% layout( 
                                        plot_bgcolor = 'white', paper_bgcolor = 'white',
                                        mapbox = list(style = 'light'),
                                        legend = list(orientation = 'h',
                                                      font = list(size = 8)),
                                        margin = list(l = 25, r = 25,
                                                      b = 25, t = 25,
                                                      pad = 2))


pLACuisine <- finalLACuisine %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(20, 30), mode = 'scattermapbox', color = I("Blue"), name = "Physical inactivity",
                                           hoverinfo='text', text = "Latin cousine")%>% layout( 
                                             plot_bgcolor = 'white', paper_bgcolor = 'white',
                                             mapbox = list(style = 'light'),
                                             legend = list(orientation = 'h',
                                                           font = list(size = 8)),
                                             margin = list(l = 25, r = 25,
                                                           b = 25, t = 25,
                                                           pad = 2))


pLASeafood <- finalSeaFood %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(20, 30), mode = 'scattermapbox', color = I("Purple"), name = "Physical inactivity",
                                             hoverinfo='text', text = "Sea food")%>% layout( 
                                               plot_bgcolor = 'white', paper_bgcolor = 'white',
                                               mapbox = list(style = 'light'),
                                               legend = list(orientation = 'h',
                                                             font = list(size = 8)),
                                               margin = list(l = 25, r = 25,
                                                             b = 25, t = 25,
                                                             pad = 2))


subplot(pPizzaBoston, pMap_obesity, pMap_BP, pMap_PA,  pLACuisine, pMap_obesity, pMap_BP, pMap_PA, nrows = 2)

pMapAll_rests <- finalRest_latlong %>% plot_mapbox(lat = ~latitude, lon = ~longitude, sizes = c(50, 60), mode = 'scattermapbox', color = ~Category, name = ~Category,
                                      hoverinfo='text', text = ~finalRest_latlong$Category)%>% layout( 
                                        plot_bgcolor = 'white', paper_bgcolor = 'white',
                                        mapbox = list(style = 'light'),
                                        legend = list(orientation = 'h',
                                                      font = list(size = 8)),
                                        margin = list(l = 25, r = 25,
                                                      b = 25, t = 25,
                                                      pad = 2))

