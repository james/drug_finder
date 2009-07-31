class Report < ActiveRecord::Base
  AVERAGE = {"cocaine" => 3, "ecstacy" => 1.8, "hallucinogens" => 0.6, "amphetamines" => 1.2, "cannabis" => 7.9, "ketamine" => 0.6, "amyl_nitrate" => 1.4, "any_class_a" => 3.7, "any_stimulant_drug" => 4.4, "any_drug" => 10.1}
  
  def self.calculate(characteristic_ids)
    characteristics= Characteristic.find(characteristic_ids)
    drug_categories = ["cocaine", "ecstacy", "hallucinogens", "amphetamines", "cannabis", "ketamine", "any_class_a", "any_stimulant_drug", "any_drug"]
    where_to_find_drug = {}
    drug_categories.each do |drug_category|
      where_to_find_drug[drug_category] = Characteristic.find(:first, :conditions => ["id in (?)", characteristic_ids], :order => "#{drug_category} DESC").name    
    end
    
    average_percentage = {}
    drug_categories.each do |drug_category|
      x = characteristics.collect do |characteristic|
        characteristic.attributes[drug_category]
      end
      average_percentage[drug_category] = mean_array(x)
    end
    
    
    average_percentage
  end
  
  def self.which_drug?(average_percentage)
    highest = [nil, 0]
    average_percentage.each_pair do |drug, chance|
      this ||= [drug, ((chance / Report::AVERAGE[drug]) - 1) * 100]
      highest = this if this[1] > highest[1]
    end
    highest[0]
  end
  
  def self.mean_array(arr)
    sum = arr.inject( nil ) { |sum,x| sum ? sum+x : x }
    sum / arr.size
  end
end
