library(leaflet)

leaflet() %>% 
 addTiles() %>%
 addMarkers(data = CV, lng = ~ CV$Longitude, lat = ~CV$Latitude, 
 	popup = Organization,icon = icons(
 		iconUrl = ifelse(CV$Sector == "Public Service",
 			"https://image.flaticon.com/icons/svg/1534/1534080.svg",
 			ifelse(CV$Sector == "Non Profit",
 			"https://image.flaticon.com/icons/svg/27/27538.svg",
 				ifelse(CV$Sector == "Academia",
 				"https://i.pinimg.com/originals/28/0a/
 					d8/280ad8e5ca2687896de356c20f41752b.jpg",
 					"https://www.pinclipart.com/picdir/middle/78-784074_
 					tech-time-advanced-technology-technology-icon-clipart.png"
 					))),
 		iconWidth = 20, iconHeight = 20))



