module PropertiesHelper
    def property_thumbnail(property)
      # imgUrl=property.photo.url.nil? ? "" : property.photo.url
      # urlDefault = "/img/"+File.basename(imgUrl).to_s
      # urlFromTools =  property.photo.thumb.url  
      # img = property.photo.present? ?  urlDefault : "/img/no-image.jpg"
      # image_tag img, class: "property-thumb"
      ""
    end

    def property_photo_url(property)
      # imgUrl=property.photo.url.nil? ? "" : property.photo.url
      # urlDefault = "/img/"+File.basename(imgUrl).to_s
      # urlFromTools =  property.photo.url  
      # property.photo.present? ?  urlDefault : asset_url("/img/no-image-full.jpg")
      ""
    end

  end