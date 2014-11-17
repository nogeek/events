require 'json'

class EventPacket 
  def initialize(event_type=nil, event=nil)
    @event_type, @event = event_type, event
  end

  def to_json(*args)
    {
      'json_class' => self.class.name,
      'event_type' => @event_type,
      'solutions' => @event
    }.to_json
  end
end

