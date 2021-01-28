# frozen_string_literal: true

module WPT
  module Setup
    class PrepareSqlScript
      def initialize(stops)
        @stops = stops
      end

      def call
        write_to_file('BEGIN TRANSACTION;')

        @stops[:result].each do |stop|
          parse_stop(stop[:values])
          write_to_file(create_sql_insert) if valid_rekord?
        end

        write_to_file('COMMIT;')
      end

      private

      def parse_stop(stop)
        @stop_name = correct_stop_name(stop[2][:value])
        @latitude = stop[4][:value]
        @longitude = stop[5][:value]
        @post = stop[1][:value]
      end

      def create_sql_insert
        'INSERT INTO stops (stop_name, latitude, longitude, post) ' \
        "VALUES('#{@stop_name}', #{@latitude}, #{@longitude}, '#{@post}');"
      end

      def write_to_file(sql)
        File.write(script_path, "#{sql}\n", mode: 'a')
      end

      def script_path
        CONFIG.fetch(CURRENT_ENV, :db_script)
      end

      def correct_stop_name(name)
        name.gsub("\'", "\'\'")
      end

      def valid_rekord?
        @stop_name != '' && @latitude != 'null' && @longitude != 'null' && @post != ''
      end
    end
  end
end
