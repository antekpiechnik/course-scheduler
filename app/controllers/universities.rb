class Universities < Application
  def index
    @universities = University.all
    @universities = [University, "universities", [[:name, "Nazwa"], [:pensum, "Pensum?"]]]
    render
  end

  def show
    @university = University[params[:id]]
    self.title = "Uczelnia: %s" % [@university.name]
    render
  end

  def add
    @university = University.new(params[:university] || {})
    self.title = "Dodaj nowe studia"
    return render if request.get?
    @university.save
    redirect(url(:controller => "universities"),
             :message => {:notice => "Dodano uniwersytet"})
  rescue Sequel::ValidationFailed
    self.message[:error] = error_messages(@university)
    render
  end

  def delete
    @university = University[params[:id]]
    self.title = "Czy na pewno usunąć?"
    return render if request.get?
    @university.destroy
    self.message[:notice] = "Uczelnia usunięta"
    redirect(url(:controller => "universities"), :message => {:notice => "Uczelnia usunięta"})
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
