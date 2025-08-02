print_meme <- function(which_meme = "eigenvalued") {
  # Check if magick is installed, install if not
  if (!require(magick, quietly = TRUE)) {
    cat("Installing magick package...\n")
    install.packages("magick")
    library(magick)
  }

  if (which_meme == "eigenvalued") {
    img <- image_read("eigenvalued.PNG")
    plot(img)
  }
  if (which_meme == "identified") {
    img <- image_read("identified.png")
    plot(img)
  }
}

print_meme()
