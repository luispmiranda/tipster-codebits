module ApplicationHelper
  def button_with_icon (text, destiny, imgname)
    img = image_tag imgname, :class => 'icon'
    link_to destiny do
      "<button class=\"btn\">#{img} <span class=\"icon\">#{text}</span></button>".html_safe
    end
  end
end
