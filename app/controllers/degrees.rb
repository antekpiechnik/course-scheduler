class Degrees < Application
  def index
    @university = University[params[:id]]
    self.title = "Kierunki: %s" % [@university.name]
    render
  end

  def title
    "Kierunki"
  end

  def submenu_items
    [
      ["pokaż kierunki", url(:controller => "degrees", :action => "index", :id => @university.id)],
      ["dodaj nowy", url(:controller => "deegrees", :action => "add", :id => @university.id)],
    ]
  end
end
