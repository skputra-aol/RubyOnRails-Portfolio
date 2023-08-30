require 'date'

module Formula

MemberReward =
  Struct.new(:dob) do
    def category
      year =Date.today.year - age(dob)
      case year
      when 0
        "new"
      when 1..2
        "premium"
      when 3..5
        "silver"
      when >5
        "gold"
      else
        "invalid value (#{capacity})"
      end
    end

    def age
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end
  end

end

##  ## Use in code for get age and category of member
## MemberReward.new(date).age
## MemberReward.new(date).category
end