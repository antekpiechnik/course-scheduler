class Reports < Application
  TYPES = [
    [1, "Raport dla prowadzącego wg grup zajęciowych"],
    [2, "Raport dla wykładowcy"],
    [3, "Raport dla przedmiotu wg grup zajęciowych"],
    [4, "Raport po prowadzących wg grup zajęciowych"],
    [5, "Raport po przedmiotach wg grup zajęciowych"],
  ]

  provides :pdf

  def index
    render
  end

  def generate
    @title = TYPES.assoc(params[:report_id].to_i)[1]
    src = RTeX::Document.new(render "Testowy tekst", :layout => "report.pdf")
    render src.to_pdf, :format => :pdf, :layout => false
  end

  def title
    "Raporty"
  end
end
