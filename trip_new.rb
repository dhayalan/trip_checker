#Question:
# 3. A friend of yours is planning a trip across the country via train, but they can't read the train information! They've asked you to help and they want you to check if they can get from place to place on the rail network. You hit a snag while trying to help when you've found that the trains don't always return to a station they've departed from! That is to say that a train route might go from Station X to Station Y, but it might not go from Station Y to Station X.

# They love train trips so they don't care how many trains it takes as long as it's possible to reach their target destination.

# You've decided to write a program to help you with the job and the format you've decide to use is as follows:

#check_trip( start, target, stations, station_links )
# You want the method to return "Trip is Possible" if the trip is possible and "Trip is impossible" if otherwise

# Example usages:

#stations = ["ADL", "BRI", "MEL", "SYD"]

#links = {"ADL" => ["MEL"], "MEL" => ["ADL", "SYD"],  "SYD" => ["BRI"]}

#check_trip( "ADL", "BRI", stations, links ) # => "Trip is Possible"
#check_trip( "MEL", "BRI", stations, links ) # => "Trip is Possible"
#check_trip( "SYD", "ADL", stations, links ) # => "Trip is impossible"

# Note: The Hash provided for the 'links' argument will always have default = []


#Ans:
stations = ["ADL", "MEL", "SYD", "BRI"]

station_links = {"ADL" => ["MEL"], "MEL" => ["ADL", "SYD"],  "SYD" => ["BRI"]}

def possible_route( start, target, stations, station_links, last_stations={} )
	if start == target
		return true
	else
		res = false
		if station_links[start]
			station_links[start].each do |station|
				if !last_stations[station]
					last_stations[start] = 1
					res = possible_route(station, target, stations, station_links, last_stations)
				end
			end
		end
	end
	return res
end
def check_trip( start, target, stations, station_links )
	if possible_route( start, target, stations, station_links )
		return "Trip is Possible"
	else
		return "Trip is Impossible"
	end
end 

p check_trip( "ADL", "BRI", stations, station_links )
p check_trip( "MEL", "BRI", stations, station_links )
p check_trip( "SYD", "ADL", stations, station_links )
p check_trip( "BRI", "MEL", stations, station_links )

