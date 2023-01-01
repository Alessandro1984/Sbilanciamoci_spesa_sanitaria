source("dati.r")

# Valori Italia 2001-2021
df_gov_ITA <- df_gov %>% 
  rename(value = ObsValue,
         country = LOCATION) %>% 
  select(Time, value, country) %>% 
  filter(Time >= 2001) %>% 
  filter(country == "ITA")

# Media Italia 2001-2019
media_ITA <- df_gov_ITA %>% 
  filter(Time <= 2019) %>% 
  summarise(media = mean(value))

NADEF <- c(7.0, 6.6, 6.2, 6.0)

p1 <- plot_ly() %>% 
  add_trace(x = 2022:2025,
            y = 7.7,
            fill = 'tonexty',
            hoverinfo = "none",
            type = "scatter",
            mode = "lines",
            showlegend = FALSE,
            fillcolor = 'rgba(148, 103, 189, 0.2)',
            line = list(color = 'rgba(148, 103, 189, 1)',
                        width = 0)) %>%
  add_trace(x = 2022:2025,
            y = NADEF,
            name = "Valori NADEF 2022",
            hoverlabel = list(namelength = -1),
            type = "scatter",
            line = list(color = "black",
                        dash = "dash"),
            mode = "lines") %>% 
  add_trace(x = c(df_gov_ITA$Time, 2022),
            y = c(df_gov_ITA$value, NADEF[1]),
            name = "Spesa sanitaria pubblica",
            hoverlabel = list(namelength = -1),
            type = "scatter",
            line = list(color = "black"),
            mode = "lines") %>% 
  add_trace(x = 2001:2025,
            y = as.numeric(media_ITA),
            name = "Media 2001-2019",
            type = "scatter",
            mode = "lines",
            hoverlabel = list(namelength = -1),
            line = list(color = "grey",
                        dash = "dot",
                        width = 1)) %>% 
  layout(xaxis = list(dtick = 1,
                      tickangle = 45,
                      tickfont = list(size = 10)),
         yaxis = list(dtick = 0.1,
                      tickfont = list(size = 10),
                      title = "%",
                      range = c(5.5, 7.7)),
         hovermode = "x",
         showlegend = TRUE) %>% 
  layout(legend = list(orientation = "h",   
                       xanchor = "center",  
                       x = 0.5,
                       y = -0.1,
                       font = list(size = 12))) %>%   
  config(displayModeBar = F)

p1

# orca(
#   p1,
#   file = "Immagini/p1.svg"
# )
