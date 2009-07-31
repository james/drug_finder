desc "import csv data from guardian"
task :import => :environment do
  require 'fastercsv'
  FasterCSV.foreach(RAILS_ROOT+"/lib/tasks/data.csv", :headers => :first_row) do |row|
    c = Characteristic.new
    row.each_with_index do |cell, index|
      c.update_attribute cell[0], cell[1]
    end
    c.save!
  end
end