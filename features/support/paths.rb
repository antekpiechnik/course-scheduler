module NavigationHelpers
  def path_to(page_name)
    case page_name
    when "home"
      "/"
    when "dashboard"
      url(:controller => "dashboard")
    when "universities"
      url(:controller => "universities")
    when "new university"
      url(:controller => "universities", :action => "add")
    when "university"
      url(:controller => "degrees", :action => "index", :id => @university.id)
    when "degree"
      url(:controller => "lectures", :action => "index", :id => @degree.id)
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers, Webrat::Methods)
