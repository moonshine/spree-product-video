# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ProductVideoExtension < Spree::Extension
  version "1.0"
  description "Allows video files to be added for products & variants"
  url "http://yourwebsite.com/product_video"

  # Please use product_video/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # Add ability to store video for products & variants
    Product.send(:include, Spree::ProductVideo::Product)
    Variant.send(:include, Spree::ProductVideo::Variant)

    # Add helper method to display video
    ApplicationHelper.send(:include, Spree::ProductVideo::ApplicationHelper)
  end
end
