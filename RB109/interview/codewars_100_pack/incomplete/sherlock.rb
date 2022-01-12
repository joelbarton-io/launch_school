=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few 
things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
Write method which helps Sherlock to find suspects. If no suspect is found or there are 
no pockets (pockets == nil), the method should return nil.

'pockets' -> hash representing the contents of respective people's pockets -> first argument
'allowed items' -> second argument []

'Suspect':  has a not_allowed item in their pocket

find_suspects(pockets, [1, 2]) # => [:tom, :jane]     -> 5 and 7
find_suspects(pockets, [1, 7, 5, 2]) # => nil         -> noone has an item that is not included in the allowed items list
find_suspects(pockets, []) # => [:bob, :tom, :jane]   -> no allowed items given
find_suspects(pockets, [7]) # => [:bob, :tom]         -> have unallowed items

everyone is a suspect if [] empty?
if the items in people's pockets are included in the allowed items arr, return nil
  if all the pockets are empty -> return nil

i: hash, arr       o: arr or nil

algo =>
INIT a suspects list []
RETURN arr if all keys if allowed_nums is empty
RETURN nil if pockets_hash is empty

=end
def find_suspects(pockets_hash, allowed_nums)
  suspects = []
  return nil if pockets_hash.all? {|k, v| v.nil? || v.empty?}
  return pockets_hash.keys if allowed_nums.empty?
  

  pockets_hash.each do |key, value|
    if value.any? {|num| !allowed_nums.include?(num)}
      suspects << key
    end
  end
  suspects.empty? ? nil : suspects
end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) == [:tom, :jane]     #-> 5 and 7
p find_suspects(pockets, [1, 7, 5, 2]) == nil         #-> noone has an item that is not included in the allowed items list
p find_suspects(pockets, []) == [:bob, :tom, :jane]   #-> no allowed items given
p find_suspects(pockets, [7]) == [:bob, :tom]
