# frozen_string_literal: true

module Slack
  module BlockKit
    module Element
      # An element to insert an image - this element can be used in section and
      # context blocks only. If you want a block with only an image in it,
      # you're looking for the image block. (Slack::BlockKit::Layout::Image)
      #
      # https://api.slack.com/reference/messaging/block-elements#image
      class Image
        TYPE = 'image'

        def initialize(options)
          @image_url = options[:image_url] || raise('missing argument :image_url')
          @alt_text = options[:alt_text] || raise('missing argument :alt_text')
          @title = options[:title]
        end

        def as_json(*)
          json = {
            type: TYPE,
            image_url: @image_url,
            alt_text: @alt_text
          }
          unless @title.nil?
            json[:title] = {
              type: 'plain_text',
              text: @title
            }
          end
          json
        end
      end
    end
  end
end
