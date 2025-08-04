#' Print a meme image
#'
#' This function displays meme images in R. Currently supports "eigenvalued" and "identified" memes.
#' Automatically installs the magick package if it's not already installed.
#'
#' @param which_meme Character string specifying which meme to print.
#'   Options: "eigenvalued" (default) or "identified".
#' @return Invisibly returns the magick image object
#' @export
#' @examples
#' \dontrun{
#' print_meme()
#' print_meme("eigenvalued")
#' print_meme("identified")
#' }
print_meme <- function(which_meme = "eigenvalued") {
  # Check if magick is installed, install if not
  if (!require(magick, quietly = TRUE)) {
    cat("Installing magick package...\n")
    install.packages("magick")
    library(magick)
  }

  if (which_meme == "eigenvalued") {
    # Try to find image in package first, then current directory
    img_path <- system.file("extdata", "eigenvalued.png", package = "printmeme")
    if (img_path == "" || !file.exists(img_path)) {
      img_path <- "eigenvalued.png"
    }

    if (file.exists(img_path)) {
      img <- image_read(img_path)
      plot(img)
      return(invisible(img))
    } else {
      cat("Image file not found: eigenvalued.png\n")
      return(invisible(NULL))
    }
  }

  if (which_meme == "identified") {
    # Try to find image in package first, then current directory
    img_path <- system.file("extdata", "identified.png", package = "printmeme")
    if (img_path == "" || !file.exists(img_path)) {
      img_path <- "identified.png"
    }

    if (file.exists(img_path)) {
      img <- image_read(img_path)
      plot(img)
      return(invisible(img))
    } else {
      cat("Image file not found: identified.png\n")
      return(invisible(NULL))
    }
  }

  if (!which_meme %in% c("eigenvalued", "identified")) {
    cat("Unknown meme:", which_meme, "\n")
    cat("Available memes: 'eigenvalued', 'identified'\n")
    return(invisible(NULL))
  }
}
