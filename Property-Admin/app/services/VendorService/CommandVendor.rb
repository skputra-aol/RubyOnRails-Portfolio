module VendorService 

class CommandVendor < ApplicationService

  attr_accessor :paramsData


    def initialize(paramsData)
      @refno= paramsData[:refno]
      @name= paramsData[:name]
      @person= paramsData[:person]
      @address= paramsData[:address]
      @phone= paramsData[:phone]
      @status= paramsData[:status]
      @category= paramsData[:category]

    end
   
  
    def call(*args)
      create_vendor
    end
  
    private
  
    def create_vendor
      validation

      Vendor.create!(
      refno: @refno,
      name: @name,
      person: @person,
      address: @address,
      phone: @phone,
      status: @status,
      category: @category
      )
      # rescue ActiveRecord::RecordNotUnique => e
      #  return
      # end
    end

    def validation
      prev_vendor = Vendor.find_by name: @name
      raise StandardError, 'Vendor Name already exists' if prev_vendor.present?

      prev_vendor = Vendor.find_by name: @refno
      raise StandardError, 'Vendor Reference Number already exists' if prev_vendor.present?

    end

  end

end