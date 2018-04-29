class AddAppointmenttimeToPatients < ActiveRecord::Migration[5.1]
  def change
    add_column :patients, :appointmenttime, :time
  end
end
