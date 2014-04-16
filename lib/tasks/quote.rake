namespace :quote do
  colors = ["9e9ac8",
  "756bb1",
  "c6dbef",
  "9ecae1",
  "c7e9c0",
  "a1d99b",
  "fdd0a2",
  "fdae6b",
  "fcbba1",
  "fc9272"]
  
  
  desc "Assign random colors"
  task :color => :environment do
    quote = Quote.all
    quote.each do |q|
      q.color = colors[rand(10)]
      q.save
    end
  end
end