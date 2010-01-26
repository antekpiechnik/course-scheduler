class Exceptions < Application
  def exception
    render request.exceptions.first.message
  end

  def title
    "Błąd"
  end
end
