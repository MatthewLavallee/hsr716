#' Create project directory and folder system.
#'
#' @description
#' \code{create_project_folder()} creates a .Rproj object in a new folder at the specified directory, 
#' and then sets up a default directory structure.
create_project_folder <- function(project_name, base_path = ".") {
  # Full path for the project
  project_path <- file.path(base_path, project_name)
  folders <- c("homeworks", "projects", "examples")
  
  # Create the main project folder if it doesn't exist
  if (!dir.exists(project_path)) {
    dir.create(project_path, showWarnings = FALSE)
    message("Project folder created: ", project_path)
  } else {
    message("Project folder already exists: ", project_path)
  }
  
  # Create subfolders in a vectorized manner
  subfolder_paths <- file.path(project_path, folders)
  created <- lapply(subfolder_paths, function(path) {
    if (!dir.exists(path)) {
      dir.create(path, showWarnings = FALSE)
      message("Subfolder created: ", path)
    } else {
      message("Subfolder already exists: ", path)
    }
  })
  
  # Return the project path
  return(project_path)
}

#' Get homeworks.
#'
#' @description
#' \code{grab_homeworks()} downloads a set of homework RMarkdown files from a specified URL.
grab_homeworks <- function(variables) {
  hw_urls <- paste0("https://raw.githubusercontent.com/MatthewLavallee/hsr716/refs/heads/main/trunk/homeworks/hw", 1:1, ".Rmd")
  
  # Vectorized download using mapply
  mapply(function(url, i) {
    download.file(url, here("homeworks", paste0("hw", i, ".Rmd")))
  }, hw_urls, seq_along(hw_urls))
}