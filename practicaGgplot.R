############################################################################
#                                                                          #
#        Code for "A ggplot2 Tutorial for Beautiful Plotting in R"         #
#
#             https://www.cedricscherer.com/2019/08/05/                    #
#             a-ggplot2-tutorial-for-beautiful-plotting-in-r               #
#                                                                          #
#                        Practica: Jaime Espinoza                          #
#                        Last Update: 2022-09-16                           #
#                                                                          #
############################################################################

## install CRAN packages
## install.packages(c("tidyverse", "colorspace", "corrr",  "cowplot",
##                    "ggdark", "ggforce", "ggrepel", "ggridges", "ggsci",
##                    "ggtext", "ggthemes", "grid", "gridExtra", "patchwork",
##                    "rcartocolor", "scico", "showtext", "shiny",
##                    "plotly", "highcharter", "echarts4r"))
## 
## Install devtools from CRAN
## install.packages("devtools")

chic<- readr::read_csv("https://raw.githubusercontent.com/z3tt/ggplot-courses/main/data/chicago-nmmaps-custom.csv")
tibble::glimpse(chic)
head(chic)
library(ggplot2)
library(tidyverse)

g <- ggplot(chic, aes(x = date, y = temp))


g + geom_point()

g + geom_line()

g + geom_line() + geom_point()

g + geom_point(color = "firebrick", shape = "diamond", size = 2)

g + geom_point(color = "firebrick", shape = "diamond", size = 2) +
        geom_line(color = "firebrick", linetype = "dotted", size = .5)
theme_set(theme_bw())

g + geom_point(color = "firebrick")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        xlab("Year") +
        ylab("Temperature (°F)")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = expression(paste("Temperature (", degree ~ F, ")"
           ^"(Hey, why should we use metric units?!)")))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title.x = element_text(vjust = 0, size = 25),
              axis.title.y = element_text(vjust = 2, size = 25))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title.x = element_text(margin = margin(t = 10), size = 15),
              axis.title.y = element_text(margin = margin(r = 10), size = 15))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title = element_text(size = 15, color = "firebrick", 
                                        face = "italic"))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title.x = element_text(color = "sienna", size = 15),
              axis.title.y = element_text(color = "orangered", size = 15))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title = element_text(color = "sienna", size = 15),
              axis.title.y = element_text(color = "orangered", size = 15))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.title = element_text(color = "sienna", size = 15, face = "bold"),
              axis.title.y = element_text(face = "bold.italic"))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.text = element_text(color = "dodgerblue", size = 12),
              axis.text.x = element_text(face = "italic"))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1, size = 12))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.ticks.y = element_blank(),
              axis.text.y = element_blank())

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = NULL, y = "")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        ylim(c(0, 100))


library(tidyverse)

chic_high <- dplyr::filter(chic, temp > 25, o3 > 20)

ggplot(chic_high, aes(x = temp, y = o3)) +
        geom_point(color = "darkcyan") +
        labs(x = "Temperature higher than 25°F",
             y = "Ozone higher than 20 ppb") +
        expand_limits(x = 0, y = 0)

ggplot(chic_high, aes(x = temp, y = o3)) +
        geom_point(color = "darkcyan") +
        labs(x = "Temperature higher than 25°F",
             y = "Ozone higher than 20 ppb") +
        coord_cartesian(xlim = c(0, NA), ylim = c(0, NA))

ggplot(chic_high, aes(x = temp, y = o3)) +
        geom_point(color = "darkcyan") +
        labs(x = "Temperature higher than 25°F",
             y = "Ozone higher than 20 ppb") +
        expand_limits(x = 0, y = 0) +
        scale_x_continuous(expand = c(0, 0)) +
        scale_y_continuous(expand = c(0, 0)) +
        coord_cartesian(clip = "off")

ggplot(chic, aes(x = temp, y = temp + rnorm(nrow(chic), sd = 20))) +
        geom_point(color = "sienna") +
        labs(x = "Temperature (°F)", y = "Temperature (°F) + random noise") +
        xlim(c(0, 100)) + ylim(c(0, 150)) +
        coord_fixed()

ggplot(chic, aes(x = temp, y = temp + rnorm(nrow(chic), sd = 20))) +
        geom_point(color = "sienna") +
        labs(x = "Temperature (°F)", y = "Temperature (°F) + random noise") +
        xlim(c(0, 100)) + ylim(c(0, 150)) +
        coord_fixed(ratio = 1/5)

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = NULL) +
        scale_y_continuous(label = 
        function(x) {return(paste(x, "Degrees Fahrenheit"))})  

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        ggtitle("Temperatures in Chicago")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)",
             title = "Temperatures in Chicago",
             subtitle = "Seasonal pattern of daily temperatures from 1997 to 2001",
             caption = "Data: NMMAPS",
             tag = "Fig. 1")


ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)",
             title = "Temperatures in Chicago") +
        theme(plot.title = element_text(face = "bold",
                                        margin = margin(10, 0, 10, 0),
                                        size = 14))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +  
        labs(x = "Year", y = NULL,
             title = "Temperatures in Chicago",
             caption = "Data: NMMAPS") +
        theme(plot.title = element_text(hjust = 1, size = 16, face = "bold.italic"))

g <- ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +  
        scale_y_continuous(label = function(x) {return(paste(x, "Degrees Fahrenheit"))}) +
        labs(x = "Year", y = NULL,
             title = "Temperatures in Chicago between 1997 and 2001 in Degrees Fahrenheit",
             caption = "Data: NMMAPS") +
        theme(plot.title = element_text(size = 14, face = "bold.italic"),
              plot.caption = element_text(hjust = 0))

g + theme(plot.title.position = "plot",
          plot.caption.position = "plot")

library(showtext)
font_add_google("Playfair Display", ## name of Google font
                "Playfair")  ## name that will be used in R
font_add_google("Bangers", "Bangers")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)",
             title = "Temperatures in Chicago",
             subtitle = "Daily temperatures in °F from 1997 to 2001") +
        theme(plot.title = element_text(family = "Bangers", hjust = .5, size = 25),
              plot.subtitle = element_text(family = "Playfair", hjust = .5, size = 15))

font_add_google("Roboto Condensed", "Roboto Condensed")
theme_set(theme_bw(base_size = 12, base_family = "Roboto Condensed"))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        ggtitle("Temperatures in Chicago\nfrom 1997 to 2001") +
        theme(plot.title = element_text(lineheight = .8, size = 16))


ggplot(chic,
       aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)")


ggplot(chic,
       aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.position = "none")


ggplot(chic,
       aes(x = date, y = temp,
           color = season, shape = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        guides(color = "none")


ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.title = element_blank())


ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        scale_color_discrete(name = NULL)

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        labs(color = NULL)

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.position = "top")

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)",
             color = NULL) +
        theme(legend.position = c(.15, .15),
              legend.background = element_rect(fill = "transparent"))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.position = c(.5, .97),
              legend.background = element_rect(fill = "transparent")) +
        guides(color = guide_legend(direction = "horizontal"))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.title = element_text(family = "Playfair",
                                          color = "chocolate",
                                          size = 14, face = "bold"))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)",
             color = "Seasons\nindicated\nby colors:") +
        theme(legend.title = element_text(family = "Playfair",
                                          color = "chocolate",
                                          size = 14, face = "bold"))

ggplot(chic, aes(x = date, y = temp, color = season)) +
     geom_point() +
     labs(x = "Year", y = "Temperature (°F)") +
     theme(legend.title = element_text(family = "Playfair",
     color = "chocolate",
     size = 14, face = "bold")) +
     scale_color_discrete(name = "Seasons\nindicated\nby colors:")

chic$season <- 
        factor(chic$season, 
               levels = c("Winter", "Spring", "Summer", "Autumn"))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)")

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        scale_color_discrete("Seasons:", labels = c("Mar—May", "Jun—Aug",
                                                    "Sep—Nov", "Dec—Feb")) +
        theme(legend.title = element_text(family = "Playfair",
                                          color = "chocolate",
                                          size = 14, face = 2))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.key = element_rect(fill = "darkgoldenrod1"),
              legend.title = element_text(family = "Playfair",
                                          color = "chocolate",
                                          size = 14, face = 2)) +
        scale_color_discrete("Seasons:")

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(legend.key = element_rect(fill = NA),
              legend.title = element_text(color = "chocolate",
                                          size = 14, face = 2)) +
        scale_color_discrete("Seasons:") +
        guides(color = guide_legend(override.aes = list(size = 6)))

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        geom_rug()

ggplot(chic, aes(x = date, y = temp, color = season)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)") +
        geom_rug(show.legend = FALSE)

ggplot(chic, aes(x = date, y = o3)) +
        geom_line(color = "gray") +
        geom_point(color = "darkorange2") +
        labs(x = "Year", y = "Ozone")

ggplot(chic, aes(x = date, y = o3)) +
        geom_line(aes(color = "line")) +
        geom_point(aes(color = "points")) +
        labs(x = "Year", y = "Ozone") +
        scale_color_discrete("Type:")

ggplot(chic, aes(x = date, y = o3)) +
        geom_line(aes(color = "line")) +  
        geom_point(aes(color = "points")) +
        labs(x = "Year", y = "Ozone") +
        scale_color_manual(name = NULL,
                           guide = "legend",
                           values = c("points" = "darkorange2",
                                      "line" = "gray")) +
        guides(color = guide_legend(override.aes = list(linetype = c(1, 0),
                                                        shape = c(NA, 16))))

ggplot(chic,
       aes(x = date, y = temp, color = temp)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)", color = "Temperature (°F)")

ggplot(chic,
       aes(x = date, y = temp, color = temp)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)", color = "Temperature (°F)") +
        guides(color = guide_legend())

ggplot(chic,
       aes(x = date, y = temp, color = temp)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)", color = "Temperature (°F)") +
        guides(color = guide_bins())

ggplot(chic,
       aes(x = date, y = temp, color = temp)) +
        geom_point() +
        labs(x = "Year", y = "Temperature (°F)", color = "Temperature (°F)") +
        guides(color = guide_colorsteps())

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.background = element_rect(fill = "gray90"),
              panel.grid.major = element_line(color = "gray10", size = .5),
              panel.grid.minor = element_line(color = "gray70", size = .25))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.background = element_rect(fill = "gray90"),
              panel.grid.major = element_line(size = .5, linetype = "dashed"),
              panel.grid.minor = element_line(size = .25, linetype = "dotted"),
              panel.grid.major.x = element_line(color = "red1"),
              panel.grid.major.y = element_line(color = "blue1"),
              panel.grid.minor.x = element_line(color = "red4"),
              panel.grid.minor.y = element_line(color = "blue4"))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.grid.minor = element_blank())

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.grid = element_blank())

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        scale_y_continuous(breaks = seq(0, 100, 10),
                           minor_breaks = seq(0, 100, 2.5))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "#1D8565", size = 2) +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.background = element_rect(fill = "#64D2AA",
                                              color = "#64D2AA", size = 2))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "#1D8565", size = 2) +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.border = element_rect(fill = "#64D2AA99",
                                          color = "#64D2AA", size = 2))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(plot.background = element_rect(fill = "gray60",
                                             color = "gray30", size = 2))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(panel.background = element_rect(fill = NA),
              plot.background = element_rect(fill = "gray60",
                                             color = "gray30", size = 2))

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "firebrick") +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(plot.background = element_rect(fill = "gray60"),
              plot.margin = unit(c(1, 3, 1, 8), "cm"))

g <- ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "chartreuse4", alpha = .3) +
        labs(x = "Year", y = "Temperature (°F)") +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))

g + facet_wrap(~ year, nrow = 1)

g + facet_wrap(~ year, nrow = 2)

g + facet_wrap(~ year, ncol = 3) + theme(axis.title.x = element_text(hjust = .15))

g + facet_wrap(~ year, nrow = 2, scales = "free")

ggplot(chic, aes(x = date, y = temp)) +
        geom_point(color = "orangered", alpha = .3) +
        theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
        labs(x = "Year", y = "Temperature (°F)") +
        facet_grid(year ~ season)

g + facet_wrap(year ~ season, nrow = 4, scales = "free_x")

g + facet_wrap(~ year, nrow = 1, scales = "free_x") +
        theme(strip.text = element_text(face = "bold", color = "chartreuse4",
                                        hjust = 0, size = 20),
              strip.background = element_rect(fill = "chartreuse3", linetype = "dotted"))


