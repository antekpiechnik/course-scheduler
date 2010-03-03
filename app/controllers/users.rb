class Users < Application
  def index
    @users = [User, User.dataset, "users", [[:login, "Login"]]]
    render
  end

  def edit
    @user = User[params[:id]]
    return render if request.get?
    @user.update(params[:user])
    redirect(url(:controller => "users"),
             :message => {:notice => "Zaktualizowano!"})
  rescue Sequel::ValidationFailed
    self.message[:notice] = error_messages(@user)
    render
  end

  def add
    @user = User.new(params[:user] || {})
    self.title = "Dodaj nowego użytkownika"
    return render if request.get?
    @user.save
    redirect(url(:controller => "users"),
             :message => {:notice => "Dodano użytkownika"})
  rescue Sequel::ValidationFailed
    self.message[:error] = error_messages(@user)
    render
  end

  def delete
    @user = User[params[:id]]
    self.title = "Czy na pewno usunąć?"
    return render if request.get?
    @user.destroy
    redirect(url(:controller => "users"), :message => {:notice => "Użytkownik usunięty"})
  end

  def title
    "Użytkownicy"
  end

  def submenu_items
    [
      ["dodaj", url(:controller => "users", :action => "add")],
    ]
  end
end
