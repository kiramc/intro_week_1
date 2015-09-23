dictionary = {
  nouns: ["dog", "car", "clown", "hat"],
  verbs: ["juggle", "spin", "run", "eat"],
  adjectives: ["huge", "blue", "tired", "advanced"]
}

def say(msg)
  puts "---> #{msg}"
end

def exit_with(msg)
  say(msg)
  exit
end

exit_with("No input file.") if ARGV.empty?
exit_with("File doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], "r") do |f|
  f.read
end

contents.gsub!("NOUN").each do |noun|
  dictionary[:nouns].sample
end

contents.gsub!("VERB", dictionary[:verbs].sample)
contents.gsub!("ADJECTIVE", dictionary[:adjectives].sample)

p contents

