class ReportsController < ApplicationController
  def index
    if params[:report]
      values = params[:report].values.compact.delete_if{|x| x==""}
      if values.empty?
        render :text => "You do, however, have to fill in *something*" and return
      else
        @report = Report.calculate values
        render :action => "create"
      end
    else
      @characteristic_categories = Characteristic.find(:all, :group => "category", :select => "category")
      @characteristics = {}
      @characteristic_categories.each do |category|
        @characteristics[category.category] = Characteristic.find(:all, :conditions => ["category = ?", category.category])
      end
      render :action => "new"
    end
  end
end
