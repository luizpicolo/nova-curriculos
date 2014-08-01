class RegistrationsController < Devise::RegistrationsController
  
  def new
    super # no customization, simply call the devise implementation
  end

  def create
    build_resource(sign_up_params)

    resource_saved = resource.save 
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      resource.errors.full_messages.each {|x| flash[x] = x} # Rails 4 simple way
      redirect_to request.referer || root_path
    end
  end

end
