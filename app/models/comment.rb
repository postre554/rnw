class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  attribute :contenido, :text
end
