class Task < ApplicationRecord
  belongs_to :user

  attribute :title, :string
  attribute :description, :string
  attribute :completed_at, :datetime
end
