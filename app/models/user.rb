# == Schema Information
# Schema version: 20110523035205
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
require 'digest'

class User < ActiveRecord::Base
  #attr_accessor :password,:author,:admin  # set this on ,then attr_accessible failed
  #attr_accessible :name ,:email,:password ,:password_confirmation,:author,:admin
  attr_accessor :password_confirmation
  
  has_many :microposts ,:dependent => :destroy
  has_many :relationships , :foreign_key => "follower_id", :dependent => :destroy
  has_many :following , :through =>:relationships ,:source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id" , :class_name => "Relationship", :dependent => :destroy
  has_many :followers , :through => :reverse_relationships , :source => :follower
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
#  validates :name ,:presence =>true ,:length=>{:maximum=>50}
  #validates :email,:presence=>true,:format =>{:with=>email_regex} ,:uniqueness=>{:case_sensitive=>false}
  #validates :password,:presence=>true,:confirmation=>true,:length=>{:within=>6..40} 
  
  

  

  
  def self.authenticate(email,submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user# if user.password == submitted_password
  end
  

  
  def feed
    Micropost.where("user_id=?",id)
    Micropost.from_users_followed_by(self)
  end
  
  
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end
  
  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  
  
  def signed_in?
    !current_user.nil?
  end
  
  def update_name(id,name)
    
  end
  
  private ################################################################################

  
end
