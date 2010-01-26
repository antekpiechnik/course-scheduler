module Merb
  module GlobalHelpers
    def flash_message
      unless message.empty?
        message_type = message.keys.first
        message_text = h(message[message_type])
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

    protected
    def li_class(name)
      self.class.name.downcase == name ? "active" : ""
    end
  end
end
