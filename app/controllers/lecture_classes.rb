class LectureClasses < Application
  def index
    @lecture = Lecture[params[:id]]
    @lecture_classes = [LectureClass, LectureClass.filter(:lecture_id => @lecture.id), "lecture_classes",
      [[:billing_hours, "Godziny rozl."], [:class_hours, "Godziny zajęć"], [:total_hours, "Ogółem godzin"], [:semester, "Semestr"]]]
    render
  end

  def add
    @lecture = Lecture[params[:id]]
    @lecture_class = LectureClass.new(params[:lecture_class] || {})
    self.title = "Dodaj nowa klase"
    return render if request.get?
    @lecture_class.save
    redirect(url(:controller => "lecture_classes", :action => "index", :id => @lecture.id),
             :message => {:notice => "Dodano klasy"})
  rescue Sequel::ValidationFailed
    self.message[:error] = error_messages(@lecture_class)
    render
  end

  def delete
    @lecture_class = LectureClass[params[:id]]
    @lecture = Lecture[@lecture_class.lecture_id]
    self.title = "Czy na pewno usunąć?"
    return render if request.get?
    @lecture_class.destroy
    redirect(url(:controller => "lecture_classes", :action => "index", :id => @lecture.id), :message => {:notice => "Klasa usunięta"})
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
