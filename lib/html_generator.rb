require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(layout = nil)
    @layout = layout
  end


  def section(string)
   template = "<section><%=some_text%></section>"

      options_hash = {:locals => {:some_text => string}, :layout => @layout}
      erb template, options_hash

  end

  def unordered_list(items)
      template = <<-TEMPLATE


  <ul>

    <% html_items.each do |item| %>
      <li><%= item %></li>
    <% end %>

  </ul>

      TEMPLATE

    options_hash = {:locals => {:html_items => items}, :layout => @layout}
    erb(template, options_hash)

  end

  def button(text, options = nil)

    if options == nil
      x = "<button><%=button_text%></button>"
      y = {:locals => {:button_text => text}, :layout => @layout}
    else
      x = "<button class='<%=button_class%>'><%=button_text%></button>"
      y = {:locals => {:button_text => text, :button_class => options[:class]}, :layout => @layout}
    end

    template = x
    options_hash = y
    erb template, options_hash

  end



end