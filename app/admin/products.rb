ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :stock_quantity, :category_id, :description, :image
  
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock_quantity
    column :category
    column :description
    actions
  end
  
  filter :name
  filter :price
  filter :stock_quantity 
  filter :category
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end


  show do
    attributes_table do
      row :name
      row :price
      row :stock_quantity
      row :category
      row :description
      row :image do |product|
        image_tag url_for(product.image) if product.image.attached?
      end
    end
    active_admin_comments
  end
end
