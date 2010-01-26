class Application < Merb::Controller
  def display_title
    @_title || self.title
  end

  def title
    "Course Scheduler"
  end

  def title=(title)
    @_title = title
  end
end
