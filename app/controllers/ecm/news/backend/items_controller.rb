class Ecm::News::Backend::ItemsController < Itsf::Backend::Resource::BaseController
  def self.resource_class
    Ecm::News::Item
  end

  def toggle_published
    @resource = resource_class.find(params[:id])
    @resource.toggle_published!
    action = @resource.published? ? :published : :unpublished
    respond_with(
      @resource,
      location: collection_path,
      notice: I18n.t("flash.actions.#{action_name}.#{action}.notice", inflections)
    )
  end

  private

  def permitted_params
    params
      .require(:ecm_news_item)
      .permit(:title, :locale, :body, :link_to_more, :published, pictures_attributes: [ :image, :_destroy, :id ])
  end
end
