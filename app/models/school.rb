class School < ApplicationRecord
    def self.disable_all
        #    all.each do |cat|
        #   cat.update(disabled_at: Time.now)
        #    end
        update_all(name:nil)
      end
end
