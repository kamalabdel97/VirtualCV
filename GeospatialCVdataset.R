library(zoo)
library(scales)
library(sf)
library(sp)

Organization <- c(
 rep("Groundswell Community Mural Project", 
  length(seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months"))),
 rep("Jewish Board of Family and Children's Services", 
  length(seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months"))),
 rep("Joan Mitchell Foundnation", 
  length(seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months"))),
 rep("CUNY Research Foundation", 
  length(seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months"))),
 rep("New York City Department of Correction\nCommissioner's Office", 
  length(seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months"))),
 rep("New York City Mayor's Office\nCenter of Innovation Through Data Intelligence", 
  length(seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months"))),
 rep("Suzy", 
  length(seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months")))
 )

TimePeriod <- c(
 (seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months") #Groundswell Community Mural Project
  ), 
 (seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months") #Jewish Board of Family and Children's Services
  ), 
 (seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months") #Joan Mitcehll Foundation
  ), 
 (seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months") #CUNY Research Foundation
  ), 
 (seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months") #Department of Correction
  ),
 (seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months") #CIDI
  ),
 (seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months") #Suzy
  )
 )
 
PositionType <- c(
 rep("Job", length(seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months") #Groundswell Community Mural Project
 )),
 rep("Volunteer", length(seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months") #Jewish Board of Family and Children's Services
 )),
 rep("Job", length(seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months") #Joan Mitchell Foundation
 )),
 rep("Job", length(seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months") #CUNY Research Foundation
 )),
 rep("Intern", length(seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months") #Department of Corrections
 )),
 rep("Intern", length(seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months") #CIDI
 )),
 rep("Intern", length(seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months") #CIDI
 ))
 )

Sector <- c(
 rep("Non Profit", length(seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months") #Groundswell Community Mural Project
)),
 rep("Non Profit", length(seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months") #Jewish Board of Family and Children's Services
)),
 rep("Non Profit", length(seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months") #Joan Mitchell Foundation
)),
 rep("Academia", length(seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months") #CUNY Research Foundation
 )),
 rep("Public Service", length(seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months") #Department of Corrections
)),
 rep("Public Service", length(seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months") #CIDI
 )),
 rep("Tech", length(seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months") #Suzy
 ))
 )

Latitude <- c(
 rep(40.67727, length(seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months") #Groundswell Community Mural Project
)),
 rep(40.7609433, length(seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months") #Jewish Board of Family and Children's Services
)),
 rep(40.7451021, length(seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months") #Joan Mitchell Foundation
)),
 rep(40.7557344, length(seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months") #CUNY Research Foundation
 )),
 rep(40.7644307, length(seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months") #Department of Corrections
)),
 rep(40.7102606, length(seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months") #CIDI
 )),
 rep(40.7260368, length(seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months") #Suzy
 ))
 )

Longitude <- c(
 rep(-73.9853289, length(seq(as.Date("2014-06-01"), as.Date("2017-06-01"), by="months") #Groundswell Community Mural Project
)),
 rep(-73.9823627, length(seq(as.Date("2017-07-01"), as.Date("2017-08-01"), by="months") #Jewish Board of Family and Children's Services
)),
 rep(-73.9933881, length(seq(as.Date("2017-10-01"), as.Date("2018-03-01"), by="months") #Joan Mitchell Foundation
)),
 rep(-73.9889584, length(seq(as.Date("2018-10-01"), as.Date(Sys.Date()), by="months") #CUNY Research Foundation
  )),
 rep(-73.8935434, length(seq(as.Date("2018-06-01"), as.Date("2018-08-01"), by="months") #Department of Corrections
)),
 rep(-74.0035348, length(seq(as.Date("2018-10-01"), as.Date("2019-05-01"), by="months") #CIDI
 )),
 rep(-73.9964783, length(seq(as.Date("2019-06-01"), as.Date("2019-08-01"), by="months") #Suzy
 ))
 )

CV <- data.frame(Organization, PositionType, Sector, TimePeriod, Latitude, Longitude)

options("scipen"=100, "digits"=7)

#Converts coordinates of Laundromats to spatial coordinates
CV <- SpatialPointsDataFrame(coords = CV[,c(5,6)], data = CV,
 proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

#Converts it to sf
CV <- sf::st_as_sf(CV, coords = c("Latitude","Longitude"))

#animation::ani.options(ani.width= 1000, ani.height=1000, ani.res = 50)

ggplot(CV, aes(TimePeriod, Organization, color = Sector, 
 group = CV$PositionType)
 ) +
 geom_line(size = 5,
 supp=CV$PositionType) + 
 #transition_reveal(CV$TimePeriod) +
 scale_x_date(date_breaks = "5 months",
  labels = date_format("%b %Y")) 
 



VCVdata$Longitude <- as.numeric(as.character((VCVdata$Longitude)))
VCVdata$Latitude <- as.numeric(as.character((VCVdata$Latitude)))









