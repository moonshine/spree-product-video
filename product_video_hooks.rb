class ProductVideoHooks < Spree::ThemeSupport::HookListener

  # Add menu tab for videos when editing a product
  insert_after :admin_product_tabs, :partial => 'admin/shared/video_product_tab'

  # Include JS file from here
  # http://flowplayer.org/tools/index.html that provides
  # methods for displaying embeded flash files
  insert_after :admin_inside_head do
    "<%= javascript_include_tag 'toolbox.flashembed.min.js' %>"
  end

end
