module Ecm
  module News
    module Backend
      class Engine < ::Rails::Engine
        isolate_namespace Ecm::News::Backend

        initializer 'ecm_news_backend.asset_pipeline' do |app|
          app.config.assets.precompile << 'ecm_news_backend.js'
          app.config.assets.precompile << 'ecm_news_backend.css'
        end
      end
    end
  end
end
