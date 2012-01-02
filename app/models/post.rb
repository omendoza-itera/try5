class Post < ActiveRecord::Base
	validates :name,  :presence => true
	validates :title, :presence => true,
						:length => { :minimum => 5 }
	has_many :comments, :dependent => :destroy
	has_many :tags
	
	#validates_associated :comments
	#validates_presence_of :commenter, :message => "enter a company name"
	
	accepts_nested_attributes_for :tags, :allow_destroy => true,
		:reject_if => proc{|attrs| attrs.all?{|k,v| v.blank?}}
	
	
end
