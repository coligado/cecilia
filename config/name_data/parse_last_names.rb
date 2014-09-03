surnames = File.open( "surnames.txt", "w" )

File.open("raw_surnames.txt").each do |line|
  name = line.split[0...1].join(' ')
  if name == name.upcase
	surnames << name << "\n"
  end
end

surnames.close