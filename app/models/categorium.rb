class Categorium < ActiveRecord::Base
    has_and_belongs_to_many :produtos
    belongs_to :lojas
    validates :nome, presence: true, uniqueness: true
end
