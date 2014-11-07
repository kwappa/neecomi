class BlogContent < ActiveRecord::Base
  def to_param
    slug
  end
end
