# This script takes in a file of names and sorts them
# by first letter.

if !File.file?(ARGV[0])
  puts "There is no file associated with that name."
end

sorted_file = File.open( "sorted_" + ARGV[0], "w" )
direct_translations = File.open( "direct_translations.yml", "w" )

cur_letter = ''
File.open(ARGV[0]).each do |name|
  first_letter = name[0]
	if first_letter != cur_letter
	  cur_letter = first_letter
    sorted_file << "\n" << first_letter << ":\n"
  end
  sorted_file << "\t- " << name
end

sorted_file.close