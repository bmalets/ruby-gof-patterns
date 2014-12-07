module Originator
    def saves
        @saves ||= {}
    end

    def save key
        puts "saving key #{key}"
        saves[key] = Marshal.dump self
    end

    def restore key
        puts "restoring key #{key}"
        include_state Marshal.load(saves[key])
    end

    def include_state other
        other.instance_variables.each {|var|
            instance_variable_set(var, other.instance_variable_get(var)) \
                if var != "@saves"
        }
    end
end