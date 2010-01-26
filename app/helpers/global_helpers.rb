module Merb
  module GlobalHelpers
    def flash_message
      unless message.empty?
        message_type = message.keys.first
        message_text = message[message_type]
        partial("shared/flash", {:message_type => message_type, :message_text => message_text})
      end
    end

    def menu
      items = [
        ["home", "/", li_class("dashboard")],
        ["konta", url(:controller => "accounts"), li_class("accounts")],
        ["studia", url(:controller => "universities"), li_class("universities")],
        ["raporty", url(:controller => "reports"), li_class("reports")],
        ["wyloguj", url(:controller => "session", :action => "logout"), ""],
      ]
      partial "shared/menu", :menu_items => items
    end

    def submenu
      if submenu_items.empty?
        "Brak submenu"
      else
        partial "shared/submenu", :menu_items => submenu_items
      end
    end

    def error_messages(model)
      errors = model.errors.values.flatten
      partial "shared/error_messages", :errors => errors
    end

    def tabular(klass, controller, columns)
      objects = klass.all
      partial "shared/tabular", :objects => objects, :columns => columns, :controller_name => controller
    end

    protected
    def li_class(name)
      self.class.name.downcase == name ? "active" : ""
    end
  end
end
