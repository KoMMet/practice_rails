class CreateStaffMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :staff_members do |t|
      t.string  :email, null: false                     #email address
      t.string  :family_name, null: false               #sei
      t.string  :given_name, null: false                #mei
      t.string  :family_name_kana, null: false          #sei kana
      t.string  :given_name_kana, null: false           #mei kana
      t.string  :hashed_password                        #pass word
      t.date    :start_date, null: false                #start date
      t.date    :end_date                              #end date
      t.boolean :suspended, null: false, default:false  #unallow flag

      t.timestamps
    end

    add_index:staff_members,"LOWER(email)", unique:true
    add_index:staff_members,[:family_name_kana, :given_name_kana]
  end
end
