require 'time'

Object.const_set('Flight', Class.new)
flight_class = Object.const_get('Flight')

flight_class.class_eval do
  attr_reader :arrival, :departure

  def initialize(arrival, departure)
    @arrival = arrival
    @departure = departure
  end
end


Object.const_set('Airport', Class.new)
airport_class = Object.const_get('Airport')


airport_class.instance_eval do

  @@flights = Array.new
  @@time_line = Array.new(1440 + 1, 0)

  def read_timings

    puts "Input number of flights: "
    flight_count = gets.chomp.to_i

    b = Proc.new do |flight_count|
      puts "\nFor flight##{flight_count}: "
      print "\tArrival: "
      arrival = Time.parse(gets.chomp)
      print "\tDeparture: "
      departure = Time.parse(gets.chomp)
      @@flights[flight_count] = Flight.new(arrival, departure)
    end
    flight_count.public_send(:times, &b)

  end

  def populate_timeline
    @@flights.each do |flight|
      (minute_mark(flight.arrival)..minute_mark(flight.departure)).each do |minute|
        @@time_line[minute] += 1
      end
    end
  end

  private
    def self.minute_mark(time)
      time.min + (time.hour * 60)
    end

end


Airport.define_singleton_method("minimum_platforms") do
  puts "\n\nThe maximum number of overlaps of flights is: #{@@time_line.max}\n\n"
end

Airport.define_singleton_method("minute_mark") { |time| time.min + (time.hour * 60) }


Airport.send(:read_timings)
Airport.send(:populate_timeline)
Airport.send(:minimum_platforms)
