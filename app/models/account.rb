class Account < ActiveRecord::Base
  
  require "ftools"

  validates_format_of :domain_name, :with => /^[A-Za-z0-9-]+$/, :message => 'The subdomain can only contain alphanumeric characters and dashes.', :allow_blank => true
  validates_uniqueness_of :domain_name, :case_sensitive => false
  validates_exclusion_of :domain_name, :in => %w( support blog www billing help api admin dashboard administrator manage service payment app application customer), :message => "The subdomain <strong>{{value}}</strong> is reserved and unavailable."

  before_validation :downcase_subdomain_name

  before_save :create_dir_if_missing
  before_save :copy_public_files
  
  before_save :make_address

  has_one :address, :as => :addressable
  has_one :service_plan

  has_one :account
  has_many :registrations
  has_many :users, :through => :registrations
  has_many :portfolios
  has_many :projects
  has_many :posts, :order => "updated_at DESC"
  has_many :metadata, :class_name => "account_metadatum", :foreign_key => "account_id"
  has_many :orders     

  has_many :pictures, :order => "created_at DESC"
  has_many :videos
  
  has_many :media_sets
  
  has_attached_file :logo
  acts_as_taggable

#has_attached_file :logo :styles => { :small => "150>150 "},
#                    :url => "/domains/#{account_subdomain}/stylesheets/frontend.css"
#                    :path => ":rails/root/public/#{account_subdomain}"




  def owner
    self.registrations.role_name_equals('account_owner').first.user
  rescue
    nil
  end

  def members
    self.registrations.role_name_equals('account_member').all.collect {user}
  end
  
  def meta(key)
    self.metadata.meta_key_equals(key)
  end
  
  def make_address
    @address = Address.new(:addressable_type => self.type.name, :addressable_id => self.id) 
    @address.save!
  end



	def create_dir_if_missing 
		Dir.mkdir("#{RAILS_ROOT}/public/domains") unless File.directory?("#{RAILS_ROOT}/public/domains")
		Dir.mkdir("#{RAILS_ROOT}/public/domains/#{self.domain_name}") unless File.directory?("#{RAILS_ROOT}/public/domains/#{self.domain_name}")
    Dir.mkdir("#{RAILS_ROOT}/public/domains/#{self.domain_name}/images") unless File.directory?("#{RAILS_ROOT}/public/domains/#{self.domain_name}/images")
    Dir.mkdir("#{RAILS_ROOT}/public/domains/#{self.domain_name}/stylesheets") unless File.directory?("#{RAILS_ROOT}/public/domains/#{self.domain_name}/stylesheets")
	end

  def copy_public_files
    copy("#{RAILS_ROOT}/public/stylesheets/frontend.css", "#{RAILS_ROOT}/public/domains/#{self.domain_name}/stylesheets/frontend.css") unless File.exists?("#{RAILS_ROOT}/public/domains/#{self.domain_name}/stylesheets/frontend.css")
    copy("#{RAILS_ROOT}/public/images/rails.png", "#{RAILS_ROOT}/public/domains/#{self.domain_name}/images/rails.png") unless File.exists?("#{RAILS_ROOT}/public/domains/#{self.domain_name}/images/rails.png")
	end

  def featured_pictures
    self.pictures.featured_equals(1)
  end

protected

  def downcase_subdomain_name
    self.domain_name.downcase! if attribute_present?('domain_name')
  end
  
end
