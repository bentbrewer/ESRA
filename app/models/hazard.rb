class Hazard < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  belongs_to :hira
  has_many :consequences, :dependent => :destroy, :accessible => true

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.signed_up?
  end

  def view_permitted?(field)
    true
  end

end
