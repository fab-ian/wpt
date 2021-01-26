# frozen_string_literal: true

module Spec
  module Support
    def self.clean_db
      WPT::DB_HANDLER.execute('DELETE FROM my_stops')
      WPT::DB_HANDLER.execute('DELETE FROM distances')
    end
  end
end
