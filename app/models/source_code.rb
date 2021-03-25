class SourceCode < ApplicationRecord
  validates :name, :url,     presence: true
  validates :name, :url,     uniqueness: true
end
