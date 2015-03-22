class EmployeeDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  
  def fullname
    "#{object.firstname.capitalize} #{object.lastname.capitalize}"
  end

  def avatar_thumb
     image_tag url_to_avatar(:thumb), alt: 'avatar', class: 'img-responsive img-thumbnail img-circle'
  end

  def url_to_avatar(option = nil)
    object.avatar_path(option)
  end
end
