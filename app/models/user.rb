class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:admin, :editor, :company, :creative], multiple: false)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :company, optional: true
  has_many :proposals
  has_many :portfolios
  has_many :proposal_requests
  has_one :schedule
  has_and_belongs_to_many :tags
  mount_uploader :profile_image, ProfileImageUploader
  has_many :messages
  has_many :chat_rooms, through: :messages

  def skills
    self.tags.where(tag_type: 'skill')
  end

  def scenes
    self.tags.where(tag_type: 'scene')
  end
end
