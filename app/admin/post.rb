ActiveAdmin.register Post do
  
  permit_params :title, :body, :photo, :country_id

  show do |t|
    attributes_table do
      row :title
      row :body
      row :country_id
      row :photo
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :country_id
      f.input :photo
    end
    f.actions
  end

end
