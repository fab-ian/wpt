# frozen_string_literal: true

module Spec
  module Support
    def self.manage_db
      puts 'remove database if exist'
      `rm spec/fixtures/db/wpt.db`
      puts 'create database'
      `sqlite3 spec/fixtures/db/wpt.db ".read spec/fixtures/db/create_tables_and_import_data.sql"`
    end
  end
end
