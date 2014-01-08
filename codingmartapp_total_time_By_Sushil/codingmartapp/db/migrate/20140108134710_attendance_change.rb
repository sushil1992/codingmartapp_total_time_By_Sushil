class AttendanceChange < ActiveRecord::Migration
  def self.up
  		change_column(:attendances,:intime,:integer)
  		change_column(:attendances,:outtime,:integer)
  end
  def self.down
  		change_column(:attendances,:outtime,:string)
  		change_column(:attendances,:intime,:string)
  end
end
