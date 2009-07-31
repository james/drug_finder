class ReportsController < ApplicationController
  def new
    #dirty
    @characteristic_categories = Characteristic.find(:all, :group => "category", :select => "category")
    @characteristics = {}
    @characteristic_categories.each do |category|
      @characteristics[category.category] = Characteristic.find(:all, :conditions => ["category = ?", category.category])
    end
  end
  
  def create
    @report = Report.calculate params[:report].values.compact.delete_if{|x| x==""}
  end
end
