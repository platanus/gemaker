module Gemaker
  class Config
    attr_accessor :gem_name, :summary, :homepage, :gem_type
    attr_reader :human_gem_name, :authors, :emails
    attr_writer :human_gem_name, :description

    def initialize
      self.gem_type = :normal
    end

    def human_gem_name
      @human_gem_name || gem_name.titleize
    end

    def description
      @description || summary
    end

    def authors=(value)
      @authors = ["Platanus"] + string_to_array(value)
    end

    def emails=(value)
      @emails = ["rubygems@platan.us"] + string_to_array(value)
    end

    def engine?
      gem_type == :engine
    end

    private

    def string_to_array(value)
      value.split(",").map(&:strip).reject(&:blank?)
    end
  end
end
