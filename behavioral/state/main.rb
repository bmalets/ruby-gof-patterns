class StateTest
  BaseState = Struct.new :owner
  class StateError < Exception; end

  class StateOn < BaseState
    attr_accessor :target
    def connect(target) raise StateError, "already connected" end
    def disconnect()
      return StateOff.new(owner), true
    end
    def description() [self, "We're connected to #{target}"] end
  end

  class StateOff < BaseState
    def connect(target)
      st = StateOn.new(owner)
      st.target=target
      return st, true
    end

    def disconnect() raise StateError, "already disconnected" end
    def description() [self, "We're disconnected"] end
  end

  def initialize
    @state = StateOff.new(self)
  end

  def method_missing(m,*a,&b)
    @state, result = @state.send(m,*a,&b)
    result
  end
end

t = StateTest.new
t.description
t.connect "foo"
t.description
t.disconnect
t.description
