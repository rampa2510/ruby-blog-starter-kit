# frozen_string_literal: true

class PostViewComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end

  def render?
    @post.present?
  end
end
