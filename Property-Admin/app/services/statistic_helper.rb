module StatisticHelper

    def self.getPercentTotal(totalData , availableData , available)
        availablePercent= (availableData.to_f / totalData.to_f) *100
        notAvailablePercent= 100 - availablePercent.to_f
        
        if available
            availablePercent
        else
            notAvailablePercent
        end   
        
    end
end