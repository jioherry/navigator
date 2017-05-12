ActiveAdmin.register Response do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	permit_params :body, :article_id, :user_id

	show do |t|
	  attributes_table do
	    row :body
	    row :article_id
	    row :user_id
	  end
	end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :body
      f.input :article_id
      f.input :user_id
    end
    f.actions
  end

end
