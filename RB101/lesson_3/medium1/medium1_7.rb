munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
p munsters

=begin
Did the data get ruined, yes or no and why?
I vote that it did get messed with because assignment done in this way is definitely mutating.
However, I'm not 100% certain on the execution of the .values iteration here. I find the family_member
placeholder syntax a little confusing.

Result: it worked, as in it did mutate the original hash
=end