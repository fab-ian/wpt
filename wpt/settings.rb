# frozen_string_literal: true

module WPT
  CONFIG = TTY::Config.new
  CONFIG.filename = 'config/config'
  CONFIG.append_path Dir.pwd
  CONFIG.read
  CURRENT_ENV = ENV['WPT_ENV'].nil? ? :development : ENV['WPT_ENV']
  DB_NAME = CONFIG.fetch(:general, :db_name)
  DB_HANDLER = SQLite3::Database.new "#{CONFIG.fetch(CURRENT_ENV, :db_path)}#{DB_NAME}"
end
