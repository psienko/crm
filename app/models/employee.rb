class Employee < ActiveRecord::Base
  #belongs_to :message, as: :sender
  #has_one :message, as: :recipient
  belongs_to :team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader
  
  default_scope { order('lastname ASC', 'firstname ASC') }

  def avatar_path(option = nil)
    return avatar.url(option) if avatar.present?
    return '/uploads/user/avatar/default_avatar_thumb.gif' if option == :thumb
    '/uploads/user/avatar/default_avatar.gif'

  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
