female_names = File.open( "female_names.txt", "w" )
male_names = File.open( "male_names.txt", "w" )

File.open("name_translations.txt").each do |line|
  name = line.split[0...1].join(' ')
  last_letter = name[-1,1]
  if last_letter == 'A'
  	female_names << line
  else
  	male_names << line
  end
end

female_names.close
male_names.close