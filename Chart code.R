

ggplot(executives_earnings, aes(year, number, color = gender)) + geom_line(size = 2) +
  theme_tufte() +
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  theme(legend.position = "bottom") +
  theme(legend.title = element_blank()) +
  ylim(95000, 145000) + 
  scale_color_manual(values = c("red", "blue"),
                     labels = c("Females", "Males")) +
  ggtitle(label = "The gap between salaries of male and female chief executives 
          increased from 30K to almost 40K in 2013-2016") +
  theme(plot.title = element_text(size = 15, hjust = 0.5, face = "bold"))