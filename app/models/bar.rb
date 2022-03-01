class Bar < ApplicationRecord
  belongs_to :foo

  # def export
  #   [id, name, foos.map(&:name).join(' ')]
  # end
end
