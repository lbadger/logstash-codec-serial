# encoding: utf-8
require "logstash/codecs/base"
require "logstash/util/charset"
require "php_serialize"

class LogStash::Codecs::SERIAL < LogStash::Codecs::Base
  config_name "serial"
  config :charset, :validate => ::Encoding.name_list, :default => "UTF-8"

  public
  def register
    @converter = LogStash::Util::Charset.new(@charset)
    @converter.logger = @logger
  end

  public
  def decode(data)
    data = @converter.convert(data)
    begin
      decoded = PHP.unserialize(data)
      yield LogStash::Event.new(decoded)
    end
  end # def decode
end # class LogStash::Codecs::Serial
