class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        if self.freebies.where("item_name == ?" , item_name).empty?
            false
        else
            true
        end
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id) unless freebie.dev_id != self.id
    end

end
