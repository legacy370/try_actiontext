module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter < AbstractAdapter
      def update_typemap_for_default_timezone
        if @default_timezone != ActiveRecord::Base.default_timezone && @timestamp_decoder
          decoder_class = ActiveRecord::Base.default_timezone == :utc ?
            PG::TextDecoder::TimestampUtc :
            PG::TextDecoder::TimestampWithoutTimeZone

          @timestamp_decoder = decoder_class.new(**@timestamp_decoder.to_h)
          @connection.type_map_for_results.add_coder(@timestamp_decoder)
          @default_timezone = ActiveRecord::Base.default_timezone
        end
      end
    end
  end
end
