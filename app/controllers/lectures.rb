class Lectures < Application
  def index
    @degree = Degree[params[:id]]
    self.title = "Wykłady: %s" % [@degree.name]
    @lectures = [Lecture, Lecture.filter(:degree_id => @degree.id), "lectures", [[:name, "Nazwa"], [:year, "Rok"], [:note, "Notatki"]]]
    render
  end

  def title
    "Wykłady"
  end

  def submenu_items
    [
      ["pokaż wykłady", url(:controller => "lectures", :action => "index", :id => @degree.id)],
      ["dodaj wykład", url(:controller => "lectures", :action => "add", :id => @degree.id)],
    ]
  end
end
