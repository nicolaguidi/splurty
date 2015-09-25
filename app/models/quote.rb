class Quote < ActiveRecord::Base
  validates :saying, :presence => true,
                     :length => { :minimum => 3,
                                  :maximum => 140 }
  validates :author, :presence => true,
                     :length => { :minimum => 3,
                                  :maximum => 50 }

  def unique_tag
    abbr = self.author.split(' ').collect do |sub_string|
      sub_string[0]
    end

    abbr.join + "#" + self.id.to_s
  end
end
