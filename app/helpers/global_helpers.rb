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
      order = params[:order]
      fields = columns.map { |f, _| f }
      objects = klass.tabular(params[:order], fields)
      headers = header_links(params[:order], controller, columns)
      partial "shared/tabular", :objects => objects, :fields => fields, :headers => headers, :controller_name => controller
    end

    protected
    def li_class(name)
      self.class.name.downcase == name ? "active" : ""
    end

    def header_links(order, controller, columns)
      f, o = order.split(".") rescue nil
      columns.map! do |field, name|
        if field.to_s == f
          if o == "asc"
            order = "%s.desc" % field.to_s
          else
            order = "%s.asc" % field.to_s
          end
        else
          order = "%s.asc" % field.to_s
        end
        [order, name]
      end
      columns.map! { |order, name| link_to(name, url(:controller => controller, :order => order)) }
      columns
    end
  end
end
