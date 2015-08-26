require "logstash/devutils/rspec/spec_helper"
require "logstash/codecs/serial"
require "logstash/event"
require "insist"

describe LogStash::Codecs::SERIAL do
  subject do
    next LogStash::Codecs::SERIAL.new
  end

  
  context "#decode" do
    it "should decode", :performance => true do
      serial = 'a:1:{s:3:"foo";s:3:"bar";}'
      iterations = 1000
      count = 0

      start = Time.now
      iterations.times do
        subject.decode(serial) do |event|
          count += 1
        end
      end
      duration = Time.now - start
      insist { count } == iterations 
      puts "codecs/serial rate: #{"%02.0f/sec" % (iterations / duration)}, elapsed: #{duration}s"
    end
  end
end
