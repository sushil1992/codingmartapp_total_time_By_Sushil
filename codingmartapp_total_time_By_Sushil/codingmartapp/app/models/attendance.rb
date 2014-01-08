class Attendance < ActiveRecord::Base
	belongs_to :user


	def self.count_hours_lastmonth
		get
		time_range = (1.month.ago.beginning_of_month .. 1.month.ago.end_of_month)
		puts "#{time_range}"
		@intime=gettimedetails(time_range,"intime")
		@outtime=gettimedetails(time_range,"outtime")
		show
	end

	def self.count_hours_currentmonth
		get
		date=Date.today
		time_range = (date.beginning_of_month..date.end_of_month)
		puts "#{time_range}"
		@intime=gettimedetails(time_range,"intime")
		@outtime=gettimedetails(time_range,"outtime")
		show
	end

	def self.show
		@intime.zip(@outtime).each do |intime,outtime|
			@intm= intime.intime
			@out= outtime.outtime
			@cal=@out-@intm
			@total_hours+=@cal
			end
		puts "Total Hours #{@total_hours/100}"
	end

	def self.get
		puts "Enter Name"
		@total_hours=0
		@name=STDIN.gets.chomp
		@getid=User.select("id").where(:name=>@name).first!
		@id=@getid.id
		puts "#{@id}"
	end

	def self.gettimedetails(time_range,time_type)
		result=Attendance.select("#{time_type}").where(["user_id = ?",@id]).where(:date_attend => time_range)
		return result
	end
end