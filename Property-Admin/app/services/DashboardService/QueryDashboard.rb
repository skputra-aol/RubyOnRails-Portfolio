module DashboardService 

  class QueryDashboard < ApplicationService
    attr_accessor :query

    def initialize(q)
      @query= q
    end

    def call(*args)
        read_dashboard
    end


    private

    def read_dashboard
      dashboard =
      Struct.new(:value) do
         # Get property total 
        def self.property
          Property.where("LENGTH(name) > 2 and price>1 ").count
        end
    
         # Get promotion  total 
        def self.promotion
          Galeri.where.not(title: nil).count
        end
    
        # Get Pin details total 
        def self.pin
          Pin.where.not(title: nil).count
        end
    
        # Get vendor percentase (status:active or not active)
        def self.vendor(status)
          if status
            Vendor.where("LENGTH(refno) > 5 and status=1 ").count
          else
            Vendor.where("LENGTH(refno) > 5 and status=0 ").count
          end    
        end
    
        # Get registration percentase (status:available or not available)
        def self.registration(available)
          totalData = Registration.all.count
          availableData = Registration.where(available:true ).count
          
          StatisticHelper.getPercentTotal  totalData, availableData, available
        end       
      end
      
    return dashboard
    end

  end

end