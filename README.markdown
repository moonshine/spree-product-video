# Product Video

This Spree extension allows embedded flash videos to be added to products and variants and
works the same way as images.

The extension uses Javascript from here: http://flowplayer.org/tools/index.html

## Usage

### Adding videos to products and variants

A new menu item "Videos" have been added when editing a product. When this item is
selected you are able to add videos to the product or it's variants.

### Displaying the video in a view

To display the video in your views you can use a couple of new methods defined as helpers
in the extension, i.e.

First you need to obtain the video dimenstion so that it can be correctly formatted
when displayed:

<% width, height = flash_dimensions(@video.attachment.path) %>

The to display the video:

<%= flashembed(:product_video, @video.attachment.url, width, height) %>

The parameters for flashembed are:

flashembed(div id, url, width, height)

## TODO

Tests
