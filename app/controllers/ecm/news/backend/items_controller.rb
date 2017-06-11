class Ecm::News::Backend::ItemsController < Itsf::Backend::Resource::BaseController
  include Controller::FriendlyIdConcern
  include Controller::ActsAsPublishedConcern

  def self.resource_class
    Ecm::News::Item
  end

  private

  def permitted_params
    params
      .require(:item)
      .permit(:title, :locale, :body, :link_to_more, :published, pictures_attributes: [ :image, :_destroy, :id ])
  end
end
