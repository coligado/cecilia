surnames = File.open( "italian_surnames.txt", "w" )

File.open("italian_surnames.txt").each do |line|
  name = line.split[0...1].join(' ')
  line.split("").each do |c|
    surnames << c
    if /[[:upper:]]/.match(c)
      surnames << " : " << c
    end
  end
  surnames << "\n"
end

surnames.close