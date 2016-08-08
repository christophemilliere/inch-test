module ApplicationHelper

  # return extension for file name
  def file_extension(file)
    file_name_array= file.original_filename.split(".")
    return false if file_name_array[1] != 'csv' 
    true
  end
end
