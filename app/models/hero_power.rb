class HeroPower < ApplicationRecord
    belongs_to :hero
    belongs_to :power

    @strenghtValue = ['Strong', 'Weak', 'Average']

    validates :strength, :inclusion => { :in => @strenghtValue }
end
