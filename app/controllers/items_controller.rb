class ItemsController < ApplicationController
  def index
    @items = if params[:attribute_kind_id].blank?
               Item.all
             else
               mixpanel.track('Filter Archive')
               filter_by_attribute(params[:attribute_kind_id], params[:value])
             end
    mixpanel.track('View Archive')
  end

  private

  def filter_by_attribute(attribute_kind_id, value)
    AttributeKind.find(attribute_kind_id).attribute_values.map do |a_value|
      a_value.item if a_value.searchable_value == value
    end.compact
  end
end
