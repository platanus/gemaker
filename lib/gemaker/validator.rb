module Gemaker
  class Validator
    attr_reader :config

    def initialize(config)
      @config = config
    end

    def authors_match_emails?
      config.authors.count == config.emails.count
    end

    def defined_gem_name?
      !config.gem_name.blank?
    end
  end
end
