class Application < Merb::Controller
  before :ensure_authenticated

  def display_title
    @_title || self.title
  end

  def title
    "Course Scheduler"
  end

  def title=(title)
    @_title = title
  end

  def submenu_items
    []
  end
end
