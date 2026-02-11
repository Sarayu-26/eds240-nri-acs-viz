# # --------------------------------------------
# # Plots that didn't make it, but have code for 
# # --------------------------------------------
# # Race Track Plot 
# # --------------------------------------------
# library(tidyverse)
# 
# # -----------------------------
# # 1️⃣ Aggregate by race/ethnicity
# # -----------------------------
# nri_race_summary <- nri_ca_race_tidy |>
#   group_by(race_ethnicity) |>
#   summarize(total_weighted_nri = sum(weighted_nri)) |>
#   arrange((total_weighted_nri))|>
#   mutate(race_ethnicity = factor(race_ethnicity, levels = race_ethnicity))
# 
# # Custom color palette
# race_colors <- c(
#   "White" = "#1b9e77",
#   "Black or African American" = "#d95f02",
#   "American Indian / Alaska Native" = "#7570b3",
#   "Asian" = "#e7298a",
#   "Native Hawaiian / Pacific Islander" = "#66a61e",
#   "Some Other Race" = "#e6ab02",
#   "Two or More Races" = "#a6761d",
#   "Hispanic or Latino" = "#666666"
# )
# 
# # -----------------------------
# # 2️⃣ Race Track Plot
# # -----------------------------
# ggplot(nri_race_summary, aes(x = race_ethnicity, y = total_weighted_nri, 
#                               fill = race_ethnicity)) + 
#   geom_bar(width = 0.9, stat = "identity") + 
#   coord_polar(theta = "y") +
#   scale_y_sqrt()+
#   scale_fill_manual(values = race_colors) +
#   xlab("") + ylab("") +
#   #ylim(c(0, max(nri_race_summary$total_weighted_nri) * 1.1)) +
#   ggtitle("Climate Hazard Exposure by Race/Ethnicity in California") +
#   geom_text(data = nri_race_summary, hjust = 1, size = 2,
#             aes(x = race_ethnicity, y = 0, label = race_ethnicity)) +
#   theme_minimal() +
#   theme(
#     legend.position = "none",
#     panel.grid.major = element_blank(),
#     panel.grid.minor = element_blank(),
#     axis.line = element_blank(),
#     axis.text.y = element_blank(),
#     axis.text.x = element_blank(),
#     axis.ticks = element_blank(),
#     plot.title = element_text(face = "bold", size = 12, hjust = 0.5),
#     plot.margin = unit(c(1, 1, 1, 1), "cm")
#   )
# --------------------------------------------
# # Lollipop Chart 
# --------------------------------------------

# ggplot(nri_race_summary, aes(x = reorder(race_ethnicity, total_weighted_nri), 
#                               y = total_weighted_nri, color = race_ethnicity)) + 
#   geom_segment(aes(xend = race_ethnicity, yend = 0), linewidth = 1.5) +
#   geom_point(size = 5) +
#   scale_color_manual(values = race_colors) +
#   coord_flip() +
#   scale_y_continuous(labels = scales::comma) +
#   labs(
#     title = "Climate Hazard Exposure by Race/Ethnicity in California",
#     x = "",
#     y = "Total Weighted NRI"
#   ) +
#   theme_minimal() +
#   theme(
#     legend.position = "none",
#     plot.title = element_text(face = "bold", size = 14),
#     axis.text = element_text(size = 11)
#   )
# --------------------------------------------
# Circular plot with all the counties 
# # --------------------------------------------
# library(tidyverse)
# 
# # -----------------------------
# # 1️⃣ Prepare the dataset
# # -----------------------------
# nri_ca_race_tidy <- nri_ca_race_tidy |>
#   arrange(county_name) |>
#   mutate(id = row_number())
# 
# # Custom color palette
# race_colors <- c(
#   "White" = "#1b9e77",
#   "Black or African American" = "#d95f02",
#   "American Indian / Alaska Native" = "#7570b3",
#   "Asian" = "#e7298a",
#   "Native Hawaiian / Pacific Islander" = "#66a61e",
#   "Some Other Race" = "#e6ab02",
#   "Two or More Races" = "#a6761d",
#   "Hispanic or Latino" = "#666666"
# )
# 
# # -----------------------------
# # 2️⃣ Plot
# # -----------------------------
# ggplot(nri_ca_race_tidy, aes(x = as.factor(id), y = weighted_nri, fill = race_ethnicity)) +
#   geom_bar(stat = "identity", width = 0.9) +
#   scale_fill_manual(values = race_colors) +
#   coord_polar(start = 0) +
#   ylim(-max(nri_ca_race_tidy$weighted_nri) * 0.3,
#        max(nri_ca_race_tidy$weighted_nri) * 1.1) +
#   theme_void() +
#   theme(legend.position = "bottom",
#         legend.title = element_text(face = "bold"),
#         legend.text = element_text(size = 8),
#         guides(color = guide_legend(nrow = 1))
#         )+
#   labs(fill = "Race / Ethnicity")
# # --------------------------------------------
# # Another Circular plot 
# # --------------------------------------------
# 
# # -----------------------------
# # 1️⃣ Prepare the dataset
# # -----------------------------
# nri_ca_race_tidy <- nri_ca_race_tidy |>
#   arrange(county_name) |>
#   mutate(id = row_number())
# 
# # Get ONE row per county with total stacked bar height
# county_totals <- nri_ca_race_tidy |>
#   group_by(county_name) |>
#   summarize(
#     total_value = sum(weighted_nri),
#     id = first(id)
#   ) |>
#   ungroup()
# 
# # ----- This section prepares dataframe for labels ---- #
# label_data <- county_totals
# 
# # Calculate the ANGLE of the labels
# number_of_bar <- nrow(label_data)
# angle <- 90 - 360 * (label_data$id - 0.5) / number_of_bar
# 
# # Calculate the alignment of labels: right or left
# label_data$hjust <- ifelse(angle < -90, 1, 0)
# 
# # Flip angle to make them readable
# label_data$angle <- ifelse(angle < -90, angle + 180, angle)
# # ----- ------------------------------------------- ---- #
# 
# # Custom color palette
# race_colors <- c(
#   "White" = "#1b9e77",
#   "Black or African American" = "#d95f02",
#   "American Indian / Alaska Native" = "#7570b3",
#   "Asian" = "#e7298a",
#   "Native Hawaiian / Pacific Islander" = "#66a61e",
#   "Some Other Race" = "#e6ab02",
#   "Two or More Races" = "#a6761d",
#   "Hispanic or Latino" = "#666666"
# )
# 
# # -----------------------------
# # 2️⃣ Plot
# # -----------------------------
# p2 <- ggplot(nri_ca_race_tidy, aes(x = as.factor(id), y = weighted_nri, fill = race_ethnicity)) +
#   
#   # Stacked bars
#   geom_bar(stat = "identity", fill = race_colors[nri_ca_race_tidy$race_ethnicity]) +
#   scale_fill_manual(values = race_colors) +
#   
#   # Limits: negative value = inner circle size, positive = space for labels
#   ylim(-max(county_totals$total_value) * 0.5, 
#        max(county_totals$total_value) * 1.3) +
#   
#   # Custom theme
#   theme_minimal() +
#   theme(
#     axis.text = element_blank(),
#     axis.title = element_blank(),
#     panel.grid = element_blank(),
#     plot.margin = unit(rep(-1, 4), "cm"),
#     legend.position = "right"
#   ) +
#   
#   # Polar coordinates
#   coord_polar(start = 0) +
#   
#   # Add labels using the prepared label_data
#   geom_text(
#     data = label_data,
#     aes(x = id, y = total_value + max(county_totals$total_value) * 0.1, 
#         label = county_name, hjust = hjust),
#     color = "black",
#     fontface = "bold",
#     alpha = 0.7,
#     size = 2.5,
#     angle = label_data$angle,
#     inherit.aes = FALSE
#   )
# 
# p2