class TV
  class << self
    def available?
      Chore.incomplete_chore_count == 0 ? true : false
    end
  end
end