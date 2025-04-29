# load libraries
library(lubridate)
library(ggplot2)

##################
# model snow depth
depth <- read.csv("C:/Users/alexe/Dropbox/Documents/Publication/Published Papers/Snow-Forest Paper/Github/depth.csv", stringsAsFactors = TRUE)

# turn date from character to date
depth$date <- mdy(depth$date)

# turn date to factor
depth$date_f <- as.factor(depth$date)

depth_mod <- lm(depth ~ canopy_density * date_f + elevation_s, data = depth)

# evaluate GOF
library(DHARMa)

simDep <- simulateResiduals(depth_mod, n = 1000, plot = TRUE)
testDispersion(simDep)

# predict by date and forest cover type
pred_fram <- expand.grid(canopy_density = levels(depth$canopy_density),
                         elevation_s = 0,
                         date_f = levels(as.factor(depth$date)))

depth_pred <- cbind(pred_fram, (predict(object = depth_mod, newdata = pred_fram, se.fit = TRUE, type = "response")))

depth_pred$lower <- depth_pred$fit - depth_pred$se.fit
depth_pred$upper <- depth_pred$fit + depth_pred$se.fit

# create date class
depth_pred$date <- lubridate::ymd(depth_pred$date_f)

# change levels from open to high density
depth_pred$canopy_density <- factor(depth_pred$canopy_density, levels = c("Open", "Low", "Medium", "High"))

# plot snow depth
depth_plot <- ggplot(depth_pred) +
  aes(x = date_f, y = fit, group = canopy_density) + 
  geom_errorbar(aes(ymin = lower, ymax = upper, color = canopy_density), 
                width = 0.75, linewidth = 0.75, position = position_dodge(0.75)) + 
  geom_point(aes(fill = canopy_density), shape = 21, size = 4, color = "black", stroke = 1, position = position_dodge(width = 0.75)) +
  labs(title = "Snow Depth Over the Snow Season", x = "Date", y = "Snow depth (cm)",
       color = "DSCC", fill = "DSCC") + #add titles
  theme_bw() + 
  scale_color_manual(values = c('black', '#ff9900', '#4e79a7', '#6ba84f')) + #set colours for lines
  scale_fill_manual(values = c('darkgray', '#FFB74D', '#4FC3F7', '#8BC34A')) + #set colours for points
  theme( #setting text size/face preferences for graph
    plot.title = element_text(size = 14, face = "bold"), 
    axis.title.x = element_text(size = 12), 
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )



##########################
# model snow penetrability

penetrability <- read.csv("C:/Users/alexe/Dropbox/Documents/Publication/Published Papers/Snow-Forest Paper/Github/penetrability.csv", stringsAsFactors = TRUE)

# turn date from character to date
penetrability$date <- mdy(penetrability$date)

# turn date to factor
penetrability$date_f <- as.factor(penetrability$date)

penetrability_mod <- lm(depth ~ canopy_density * date_f + elevation_s, data = penetrability)

# evaluate GOF
library(DHARMa)

simDep <- simulateResiduals(penetrability_mod, n = 1000, plot = TRUE)
testDispersion(simDep)

# predict by date and forest cover type
pred_fram <- expand.grid(canopy_density = levels(penetrability$canopy_density),
                         elevation_s = 0,
                         date_f = levels(as.factor(penetrability$date)))

penetrability_pred <- cbind(pred_fram, (predict(object = penetrability_mod, newdata = pred_fram, se.fit = TRUE, type = "response")))

penetrability_pred$lower <- penetrability_pred$fit - penetrability_pred$se.fit
penetrability_pred$upper <- penetrability_pred$fit + penetrability_pred$se.fit

# create date class
penetrability_pred$date <- lubridate::ymd(penetrability_pred$date_f)

# change levels from open to high density
penetrability_pred$canopy_density <- factor(penetrability_pred$canopy_density, levels = c("Open", "Low", "Medium", "High"))

# plot snow penetrability
penetrability_plot <- ggplot(penetrability_pred) +
  aes(x = date_f, y = fit, group = canopy_density) + 
  geom_errorbar(aes(ymin = lower, ymax = upper, color = canopy_density), 
                width = 0.75, linewidth = 0.75, position = position_dodge(0.75)) + 
  geom_point(aes(fill = canopy_density), shape = 21, size = 4, color = "black", stroke = 1, position = position_dodge(width = 0.75)) +
  labs(title = "Snow Penetrability over the Snow Season", x = "Date", y = "Snow penetrability (cm)",
       color = "DSCC", fill = "DSCC") + #add titles
  theme_bw() + 
  scale_color_manual(values = c('black', '#ff9900', '#4e79a7', '#6ba84f')) + #set colours for lines
  scale_fill_manual(values = c('darkgray', '#FFB74D', '#4FC3F7', '#8BC34A')) + #set colours for points
  theme( #setting text size/face preferences for graph
    plot.title = element_text(size = 14, face = "bold"), 
    axis.title.x = element_text(size = 12), 
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )
