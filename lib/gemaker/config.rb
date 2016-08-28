module Gemaker
  class Config
    attr_accessor :gem_name, :summary, :gem_type
    attr_reader :authors, :emails
    attr_writer :human_gem_name, :description, :homepage

    def initialize
      self.gem_type = :normal
    end

    def human_gem_name
      return gem_name.titleize if @human_gem_name.blank?
      @human_gem_name
    end

    def gem_class
      gem_name.classify
    end

    def description
      return summary if @description.blank?
      @description
    end

    def homepage
      return "https://github.com/platanus/#{gem_name}/master" if @homepage.blank?
      @homepage
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
