module ProfileHelper

  def list_web_safe_fonts
    @available_fonts = [ 'Arial', 'Helvetica', 'Arial Black', 'Comic Sans MS', 'Courier New', 'Georgia',
      'Impact', 'Lucida Console', 'Monaco', 'Lucida Sans Unicode', 'Lucida Grande', 'Palatino Linotype',
      'Book Antiqua', 'Palatino', 'Tahoma', 'Geneva', 'Times New Roman', 'Times', 'Trebuchet MS', 'Verdana' ]
  end

end
