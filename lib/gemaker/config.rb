module Gemaker
  class Config
    attr_accessor :gem_name, :summary, :homepage, :gem_type
    attr_reader :description, :authors, :emails

    def initialize
      self.gem_type = :normal
    end

    def description=(value)
      @description = value.blank? ? summary : value
    end

    def authors=(value)
      @authors = string_to_array(value)
    end

    def emails=(value)
      @emails = string_to_array(value)
    end

    private

    def string_to_array(value)
      value.split(",").map(&:strip).reject(&:blank?)
    end
  end
end
