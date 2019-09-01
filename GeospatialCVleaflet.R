library(leaflet)

CV %>% #Dataframe for leaflet
	leaflet() %>% #Activate leaflet
 addTiles() %>% #Add basemap
 addMarkers(lng = ~ CV$Longitude, #Longitude data 
 	lat = ~CV$Latitude, #Latitude points
 	popup = ~paste("Organization:", Organization,
 		"<br/>",
 		"Sector:", Sector),
 	icon = icons( #Add images of icons based on sector
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
 		iconWidth = 20, iconHeight = 20), #Icon width and height
 	) 



