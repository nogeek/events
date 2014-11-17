#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'event_packet'
require_relative 'connection'

class Event

  def initialize(event_type, event)
    @event_type, @event = event_type, event
  end

  def start
    Connection.with_open(nil,nil) {|ch, ex| publish_event(ch, ex)}
  end

  private

  def publish_event(channel, exchange)
    exchange.publish EventPacket.new(@event_type, @event).to_json
  end

end
  
Event.new(ARGV.shift, ARGV.shift).start

