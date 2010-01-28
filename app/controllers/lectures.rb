class Lectures < Application
  def index
    @degree = Degree[params[:id]]
    self.title = "Zajęcia: %s" % [@degree.name]
    @lectures = [Lecture, Lecture.filter(:degree_id => @degree.id), "lectures", [[:name, "Nazwa"], [:year, "Rok"], [:note, "Notatki"]]]
    render
  end

  def add
    @degree = Degree[params[:id]]
    @lecture = Lecture.new(params[:lecture] || {})
    self.title = "Dodaj nowe zajęcia"
    return render if request.get?
    @lecture.save
    redirect(url(:controller => "lectures", :action => "index", :id => @degree.id),
             :message => {:notice => "Dodano zajęcia"})
  rescue Sequel::ValidationFailed
    self.message[:error] = error_messages(@lecture)
    render
  end

  def delete
    @lecture = Lecture[params[:id]]
    @degree = @lecture.degree
    self.title = "Czy na pewno usunąć?"
    return render if request.get?
    @lecture.destroy
    redirect(url(:controller => "lectures", :action => "index", :id => @degree.id), :message => {:notice => "Zajęcia usunięte"})
  end

  def title
    "Zajęcia"
  end

  def submenu_items
    [
      ["pokaż zajęcia", url(:controller => "lectures", :action => "index", :id => @degree.id)],
      ["dodaj zajęcia", url(:controller => "lectures", :action => "add", :id => @degree.id)],
    ]
  end
end
