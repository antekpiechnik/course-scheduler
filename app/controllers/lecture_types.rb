class LectureTypes < Application
  def index
    @lecture_types = [LectureType, LectureType.dataset, "lecture_types", [[:name, "Nazwa"], [:multiplier, "Przelicznik"]]]
    render
  end

  def add
    @lecture_type = LectureType.new(params[:lecture_type] || {})
    self.title = "Dodaj nowy typ zajęć"
    return render if request.get?
    @lecture_type.save
    redirect(url(:controller => "lecture_types"),
             :message => {:notice => "Dodano typ"})
  rescue Sequel::ValidationFailed
    self.message[:error] = error_messages(@lecture_type)
    render
  end

  def submenu_items
    [
      ["pokaż typy", url(:controller => "lecture_types", :action => "index")],
      ["dodaj typ", url(:controller => "lecture_types", :action => "add")],
    ]
  end

  def title
    "Typy zajęć"
  end
end
