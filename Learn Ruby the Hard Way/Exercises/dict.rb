module Dict

	#This function makes a dict array(known as an initializer)
	#then num_buckets (256) arrays are put inside it
	#These buckets hold the contents of the Dict.
	#aDict.length is used to find out how many buckets are in there
	def Dict.new(num_buckets=256)
		# Initializes a Dict with the given number of buckets.
		aDict = []
		(0...num_buckets).each do |i|
			aDict.push([]) #this is pushing and empty array into the array!
		end
		return aDict
	end
	
	
	#This simple function is the core of how a hash works
	#built in ruby code "hash" converts a string to a number. Ruby uses it for its own hash objects
	#modular division (%) is used and .length to find a slot for where this key can go
	def Dict.hash_key(aDict, key)
		#Given a key this will create a number and then convert it to
		#an index for aDict's buckets
		return key.hash % aDict.length
	end
	
	
	#this uses the hash_key function to find the bucket that a key could be in
	#using bucket_id, you get the bucket where they key could be
	#the return then returns the location of where "bucket_id" is located
	def Dict.get_bucket(aDict, key)
		# Given a key, find the bucket where it would go.
		bucket_id = Dict.hash_key(aDict, key)
		return aDict[bucket_id]
	end
	
	
	#so you get the location ID from getbucket/gethash fucntion, and goes through every element
	#in dict until it finds it. i = index key is foudn in, k = key itself, v = value for that key
	def Dict.get_slot(aDict, key, default=nil)
		#returns the index, key, and value of a slot found in a bucket.
		bucket = Dict.get_bucket(aDict, key)
		
		bucket.each_with_index do |kv, i|
			k, v = kv
			if key == k
				return i, k, v
			end
		end
		
		return -1, key, default
	end
	
	
	#This just returs the value for a key	
	#read up more on how a default value works
	def Dict.get(aDict, key, default=nil)
		#gets the value in a bucket for the given key, or the default
		i, k, v = Dict.get_slot(aDict, key, default=default)
		return v
	end
	
	def Dict.set(aDict, key, value)
		#sets the key to the value, replacing existing value
		bucket = Dict.get_bucket(aDict, key)
		i, k, v = Dict.get_slot(aDict, key)
		
		if i>= 0
			buckets[i] = [key, value]
		else
			bucket.push([key, value])
		end
	end
	
	def Dict.delete(aDict, key)
		#Deletes the key given from the dict
		bucket = Dict.get_bucket(aDict, key)
		
		(0...bucket.length).each do |i|
			k, v = bucket[i]
			if key == k
				bucket.delete_at(i)
				break
			end
		end
	end
	
	def Dict.list(aDict)
		#Prints out what's in the dict.
		aDict.each do |bucket|
			if bucket
				bucket.each{|k, v| puts k, v}
			end
		end
	end
end