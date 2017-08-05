require "pry"
class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
  	self.joins(boats: :classifications).where('classifications.name' => "Catamaran")
  end

  def self.sailors
  	self.joins(boats: :classifications).where('classifications.name' => "Sailboat").distinct
  end

  #NOT WORKING
  def self.talented_seamen
  	self.joins(boats: :classifications).where(classifications: {name: "Sailboat"}).where(id: self.joins(boats: :classifications).where(classifications: {name: "Motorboat"}).ids).distinct
  end

  def self.non_sailors
   self.where.not(id: self.joins(:boats => :classifications).where('classifications.name' => "Sailboat").ids)
  end



end
