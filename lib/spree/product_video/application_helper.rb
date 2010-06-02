module Spree::ProductVideo::ApplicationHelper

  def self.included(target)
    target.class_eval do
      # This method adds the required div and script code to display
      # embeded flash files using JS code from here
      # http://flowplayer.org/tools/index.html
      def flashembed(id, url, width, height, flashvars = '')
        vars = 'wmode: "opaque"'
        vars += ',' + flashvars unless flashvars.blank?
        content_tag('div', '', {:id => id, :style => "width:#{width}px;height:#{height}px"}) +
          content_tag('script', %Q{flashembed("#{id}", "#{url}", { #{vars} });})
      end

      # Calculate the width & height of a flash video file
      # using plugin from here http://github.com/GMFlash/ruby-imagespec
      def flash_dimensions(path)
        instance = ImageSpec.new(@video.attachment.path)
        width = instance.width
        height = instance.height
        return width, height
      end
    end
  end

end
