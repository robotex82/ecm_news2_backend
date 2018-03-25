module Ecm
  module News
    module Backend
      class ItemsController < Itsf::Backend::Resource::BaseController
        include ResourcesController::Sorting
        include ResourcesController::FriendlyIdConcern
        include ResourcesController::ActsAsPublishedConcern

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
    end
  end
end
