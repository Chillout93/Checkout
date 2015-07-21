class Rule
    attr_accessor :name
    
    def initialize(&block)
        @block = block
    end
    
    def apply_to(obj)
        obj.instance_eval(&@block)
    end
    
end