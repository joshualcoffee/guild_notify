ActiveAdmin.register Event do
  form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :guildy_ids,  :as => :select,      :collection => Guildy.all, :multiple => true
      end
      f.buttons
    end
end
