# This script takes in a file of names and sorts them
# by first letter. It also extracts those names
# that have translations into their own file.

if !File.file?(ARGV[0])
  puts "There is no file associated with that name."
end

sorted_file = File.open( "sorted_" + ARGV[0], "w" )
direct_translations = File.open( "translated_" + ARGV[0], "w" )

cur_letter = ''
File.open(ARGV[0]).each do |line|
  first_letter = line[0]
  if first_letter != cur_letter
    cur_letter = first_letter
    sorted_file << "\n" << first_letter << ":\n"
  end

  italian_name = line
  if line.strip.include? " "
    names = line.split
    italian_name = names.first << "\n"
    american_names = names.drop(1)
    american_names.each do |name|
      direct_translations << name << ": " << italian_name
    end
  end
  sorted_file << "\t- " << italian_name
end

sorted_file.close
direct_translations.close