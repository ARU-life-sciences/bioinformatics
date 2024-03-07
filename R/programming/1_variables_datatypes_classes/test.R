
s <- seq(-3, 5, by = 0.001)


n1 <- dnorm(s)
n2 <- dnorm(s, mean = 2, sd = 1)
n3 <- dnorm(s, mean = 4, sd = 0.4)

ridge <- function(l) {
  structure(l, class = "ridge")
}

test_ridge <- ridge(l = list(n1 = n1, n2 = n2, n3 = n3))

plot.ridge <- function(r, overlap = 0.75, ...) {
  # how many breaks on the y
  ylen <- length(r)
  # total height
  total_h <- sum(sapply(r, max))
  cat("total height:", total_h, "\n")
  
  # minimum height of lowest ridge
  minimum <- min(sapply(r, min))
  cat("min:", minimum, "\n")
  
  # the ... args
  args <- list(...)
  
  subplot_heights <- sapply(r, max) * overlap
  
  if("ylim" %in% names(args)) {
  plot(x = s,
       y = rep(0, length(s)),
       type = "n", ...)
  } else {
    plot(x = s,
         y = rep(h, length(s)),
         type = "n", ylim = c(minimum, total_h), ...)
  }
  
  
  cat("subplot heights:", subplot_heights, "\n")
  subplot_heights_index <- ylen
  curr_plot_height <- total_h
  
  for (line in rev(r)) {
    curr_plot_height <- (curr_plot_height - subplot_heights[subplot_heights_index])
    print(curr_plot_height)
    lines(x = s, y = line + curr_plot_height)
    polygon(c(
      min(s), s, max(s)
    ),
    c(
      min(line + curr_plot_height),
      line + curr_plot_height,
      min(line + curr_plot_height)
    ),
    col = alpha("tomato", 0.8))
    
    
    subplot_heights_index <- subplot_heights_index - 1
  }
}

plot(test_ridge, overlap = 1)

