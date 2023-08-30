module VendorService 

  class QueryVendor < ApplicationService
    attr_accessor :query

    def initialize(q)
      @query= q
    end

    def call(*args)
      if (defined?(query[:id]) && query[:id]).nil?
        read_vendor
      else
        read_vendor_by_id
      end  
    end

    def default(refno:,name:, person:, address:, phone:, status:,category:, q:, page:)
      @refno= refno,
      @name= name,
      @person= person,
      @address= address,
      @phone= phone,
      @status= status,
      @category= category,
      @query=q,
      @paged=page
    end

    private

    def read_vendor
      ### Get search data from table
      Vendor.ransack(@query)
    end

    def read_vendor_by_id
      ### Get single data from table
      Vendor.find(query[:id])
    end
    


  end

end