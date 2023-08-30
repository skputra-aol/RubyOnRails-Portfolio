module Statistic

Dahboard =
  Struct.new(:value) do
    def property
      return 1
    end

    def promotion
      return 1
    end

    def pin
      return 1
    end

    def vendor(:status)
      if status
        return 1
      else
        return 0
      end    
    end

    def registration(:status)
      if status
        return 1
      else
        return 0
      end    
    end

  end

end

##  ## Use in code for get age and category of member
## Dashboard.new(date).age
## Dashboard.new(date).category
end