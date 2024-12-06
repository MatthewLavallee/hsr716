#' Create project directory + folder system.
#' @description
#' \code{create_project_folder()} creates a .Rproj object in a new folder given a specified directory. After, it creates a set of dropdown folders.
create_project_folder <- function(project_name, base_path = ".") {
  # Full path for the project
  project_path <- file.path(base_path, project_name)
  folders = c("homeworks", "projects", "examples")

  # Create the main project folder
  if (!dir.exists(project_path)) {
    dir.create(project_path)
    message("Project folder created: ", project_path)
  } else {
    message("Project folder already exists: ", project_path)
  }

  # Create subfolders
  for (folder in folders) {
    subfolder_path <- file.path(project_path, folder)
    if (!dir.exists(subfolder_path)) {
      dir.create(subfolder_path)
      message("Subfolder created: ", subfolder_path)
    } else {
      message("Subfolder already exists: ", subfolder_path)
    }
  }

  # Return the project path
  return(project_path)
}
