source("Health/dati.r")

df_gov_minmax <- df_gov %>% 
  rename(value = ObsValue,
         country = LOCATION) %>% 
  select(Time, value, country) %>% 
  filter(Time >= 2001 & Time <= 2019) %>% 
  group_by(Time) %>% 
  summarise(min_value = min(value), 
            max_value = max(value),
            med_value = median(value)) 

df_gov_Italy <- df_gov %>% 
  rename(value = ObsValue,
         country = LOCATION) %>% 
  select(Time, value, country) %>% 
  filter(Time >= 2001 & Time <= 2019,
         country == "ITA")

p2 <- plot_ly() %>% 
  add_trace(y = df_gov_minmax$min_value,
            x = df_gov_minmax$Time,
            name = "Valore minimo",
            type = 'scatter',
            mode = 'lines',
            line = list(color = "red")) %>% 
  add_trace(y = df_gov_minmax$max_value,
            x = df_gov_minmax$Time,
            name = "Valore massimo",
            type = 'scatter',
            mode = 'lines',
            line = list(color = "black")) %>% 
  add_trace(y = df_gov_minmax$med_value,
            x = df_gov_minmax$Time,
            name = "Valore mediano",
            type = 'scatter',
            mode = 'lines',
            line = list(color = "orange")) %>% 
  add_trace(y = df_gov_Italy$value,
            x = df_gov_Italy$Time,
            name = "Italia",
            type = 'scatter',
            mode = 'lines',
            line = list(color = "blue")) %>% 
  layout(xaxis = list(dtick = 1,
                      tickangle = 45,
                      tickfont = list(size = 10)),
         yaxis = list(dtick = 0.5,
                      tickfont = list(size = 10),
                      title = "%"),
         hovermode = "x",
         showlegend = TRUE) %>% 
  layout(legend = list(orientation = "h",   
                       xanchor = "center",  
                       x = 0.5,
                       y = -0.1,
                       font = list(size = 12))) %>%   
  config(displayModeBar = F)

p2

orca(
  p2,
  file = "Health/p2.svg"
)
