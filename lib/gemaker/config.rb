module Gemaker
  class Config
    RUBY_VERSION = 2.3

    attr_accessor :gem_name, :summary, :engine, :cli, :installable
    attr_reader :authors, :emails
    attr_writer :human_gem_name, :description, :homepage

    def initialize
      self.engine = :normal
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
      !!engine
    end

    def cli?
      !!cli
    end

    def installable?
      !!installable
    end

    private

    def string_to_array(value)
      value.split(",").map(&:strip).reject(&:blank?)
    end
  end
end
