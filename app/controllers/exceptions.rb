class Exceptions < Application
  skip_before :ensure_authenticated

  def exception
    request.exceptions.first.message
  end

  def title
    "Błąd"
  end
end
