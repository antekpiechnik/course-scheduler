class LectureClasses < Application
  def index
    @lecture = Lecture[params[:id]]
    @lecture_classes = [LectureClass, LectureClass.filter(:lecture_id => @lecture.id), "lecture_classes",
      [[:billing_hours, "Godziny rozl."], [:class_hours, "Godziny zajęć"], [:total_hours, "Ogółem godzin"], [:semester, "Semestr"]]]
    render
  end

  def title
    "Klasy: zajęcia %s" % [@lecture.name]
  end

  def submenu_items
    [
      ["pokaż klasy", url(:controller => "lecture_classes", :action => "index", :id => @lecture.id)],
      ["dodaj klasy", url(:controller => "lecture_classes", :action => "add", :id => @lecture.id)],
    ]
  end
end
