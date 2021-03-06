# ggplot2 convenience functions for internal use --------------------------
facet_wrap_parsed <- function(...) {
  facet_wrap(..., labeller = label_parsed)
}
dont_expand_y_axis <- function(expand = c(0,0)) {
  scale_y_continuous(expand = expand)
}
dont_expand_x_axis <- function(expand = c(0,0)) {
  scale_x_continuous(expand = expand)
}
dont_expand_axes <- function() {
  coord_cartesian(expand = FALSE)
}
force_axes_in_facets <- function() {
  thm <- ggplot2::theme_get()
  annotate("segment",
           x = c(-Inf, -Inf), xend = c(Inf,-Inf),
           y = c(-Inf,-Inf), yend = c(-Inf, Inf),
           color = thm$axis.line$colour %||% "black",
           size = thm$axis.line$size %||% 0.5)
}
no_legend_spacing <- function() {
  theme(legend.spacing.y = unit(0, "cm"))
}
reduce_legend_spacing <- function(cm) {
  theme(legend.spacing.y = unit(-cm, "cm"))
}
space_legend_keys <- function(relative_size = 2, color = "white") {
  theme(legend.key = element_rect(size = rel(relative_size), color = color))
}
