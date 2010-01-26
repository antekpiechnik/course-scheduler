class Universities < Application
  def index
    render
  end

  def add
    @university = University.new(params[:university] || {})
    self.title = "Dodaj nowe studia"
    return render if request.get?
    @university.save
    redirect(url(:controller => "universities", :action => "index"),
             :message => {:notice => "Dodano uniwersytet"})
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
