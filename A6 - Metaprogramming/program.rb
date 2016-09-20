require 'time'

class Flight
  attr_reader :arrival, :departure
  def initialize(arrival, departure)
    @arrival = arrival
    @departure = departure
  end
end


def minute_mark(time)
  time.min + (time.hour * 60)
end

puts "Input number of flight timings: "
flight_count = gets.chomp.to_i
flights = []
timestrip = Array.new(1440 + 1, 0)

flight_count.times do |flight_count|
  puts "\nFor flight##{flight_count}: "
  print "\tArrival: "
  arrival = Time.parse(gets.chomp)
  print "\tDeparture: "
  departure = Time.parse(gets.chomp)

  flights[flight_count] = Flight.new(arrival, departure)
end

flights.each do |flight|
  puts "\nFlight@#{flight.arrival} & #{flight.departure} "
  (minute_mark(flight.arrival)..minute_mark(flight.departure)).each { |minute| timestrip[minute] += 1 }
end

puts "The maximum number of overlaps of flights is: #{timestrip.max}"
