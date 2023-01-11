class Browse < ApplicationRecord
    self.inheritance_column = nil
    has_many_attached :files
    belongs_to :admin
end
