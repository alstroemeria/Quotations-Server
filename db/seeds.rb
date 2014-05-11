path = "#{Rails.root}/public/seed.json"
seed = JSON.parse(File.read(path))

puts "Seeding Authors: "
seed["authors"].each do |author|
  puts "  #{author}"
  Author.create({name:author});
end

puts "Seeding Categories: "
seed["categories"].each do |category|
  puts "  #{category}"
  Category.create({name:category});
end

puts "Seeding Quotes: "
seed["quotes"].each do |quote|
  puts "  #{quote["text"]}"
  Quote.create({author_id:quote["author_id"], category_id:quote["category_id"], text:quote["text"]});
end