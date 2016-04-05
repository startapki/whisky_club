module ApplicationHelper
  def nav_link(link_text, link_path, li_class: '', badge: nil)
    class_name = current_page?(link_path) ? 'active ' : ''

    content_tag(:li, class: class_name + li_class) do
      link_to link_path do
        concat link_text
        concat content_tag(:span, badge, class: 'badge pull-right') if badge
      end
    end
  end
end
