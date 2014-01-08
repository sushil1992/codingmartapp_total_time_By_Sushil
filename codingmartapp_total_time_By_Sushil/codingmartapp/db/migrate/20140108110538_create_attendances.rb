class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
    	t.belongs_to :user
    	t.string "intime"
    	t.string "outtime"
    	t.date "date_attend"
      t.timestamps
    end
  end
  def self.down
  	drop_table :attendances
  end
  
end
