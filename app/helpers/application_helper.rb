module ApplicationHelper

  module ApplicationHelper
    def sortable(object)
      title ||= column.titleize
      direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
      link_to title, :sort => column, :direction => direction
    end
  end

end
