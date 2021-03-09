require 'yaml'
require 'pry'

def load_library(file_path)
  emoticon_library = YAML.load_file(file_path)
  new_hash = {}
  emoticon_library.map{ |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
    }
    new_hash
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
    library.each do |key, value|
      if value[:japanese] == emoticon
      return key
    end
  end
return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
    library.each do |key, value|
      if value[:english] == emoticon
      return value[:japanese]
    end
  end
return "Sorry, that emoticon was not found"
end