class Comment < ApplicationRecord
  include Visible

  belongs_to :article

  def ydob
    body.reverse
  end
end
