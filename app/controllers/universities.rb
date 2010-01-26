class Universities < Application
  def index
    render
  end

  def title
    "Studia"
  end

  def submenu_items
    [
      ["dodaj nowe", url(:controller => "universities", :action => "add")],
    ]
  end
end
