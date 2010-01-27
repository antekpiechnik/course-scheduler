class LectureTypes < Application
  def index
    @lecture_types = [LectureType, LectureType.dataset, "lecture_types", [[:name, "Nazwa"], [:multiplier, "Przelicznik"]]]
    render
  end

  def submenu_items
    [
      ["pokaż typy", url(:controller => "lecture_types", :action => "index")],
      ["dodaj typ", url(:controller => "lecture_types", :action => "add")],
    ]
  end
end
