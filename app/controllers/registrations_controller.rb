class RegistrationsController < Devise::RegistrationsController
  # Inherited from Devise::RegistrationsController.
  # For overwriting the respond format from html to json through ajax.

  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)

        respond_to do |format|
          format.json { render json: {}, status: :ok }
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
        end
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!

        respond_to do |format|
          format.json { render json: {}, status: :ok }
          format.html { respond_with resource, location: after_sign_up_path_for(resource) }
        end
      end
    else
      clean_up_passwords resource

      respond_to do |format|
        format.json { render json: resource.errors.full_messages, status: :unprocessable_entity }
        format.html { respond_with resource }
      end
    end
  end
  
end
