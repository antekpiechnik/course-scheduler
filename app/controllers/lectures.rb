class Lectures < Application
  def index
    @degree = Degree[params[:id]]
    @university = @degree.university
    @lectures = [Lecture, Lecture.filter(:degree_id => @degree.id), "lectures", [[:name, "Nazwa"], [:year, "Rok"], [:note, "Notatki"]]]
    render
  end

  def show
    redirect(url(:controller => "lecture_classes", :action => "index", :id => params[:id]))
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

  def edit
    @lecture = Lecture[params[:id]]
    @degree = @lecture.degree
    @university = @degree.university

    return render if request.get?
    @lecture.update(params[:lecture])
    redirect(url(:controller => "lectures", :action => "index", :id => @degree.id),
             :message => {:notice => "Zaktualizowano!"})
  rescue Sequel::ValidationFailed
    self.message[:notice] = error_messages(@lecture)
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
    university_link = link_to(@university.name, url(:controller => "degrees", :action => "index", :id => @university.id))
    "Zajęcia: kierunek %s na %s" % [@degree.name, university_link]
  end

  def submenu_items
    [
      ["pokaż zajęcia", url(:controller => "lectures", :action => "index", :id => @degree.id)],
      ["dodaj zajęcia", url(:controller => "lectures", :action => "add", :id => @degree.id)],
    ]
  end
end
