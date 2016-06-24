# for our own ease of use
class Faker::Date
  def self.ingram_date_range(start_date=Date.today, end_date=Date.today + 2000)
    Faker::Date.between(start_date, end_date).strftime.gsub("-","")
  end
end

class Faker::Time
  def self.ingram_timestamp
    Faker::Time.between(DateTime.now - 1, DateTime.now).strftime('%Y%m%d%H%M%S')
  end
end
