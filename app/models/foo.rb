class Foo < ApplicationRecord
  has_many :bars 

  def export
    [id, name, foos.map(&:name).join(' ')]
  end
end
