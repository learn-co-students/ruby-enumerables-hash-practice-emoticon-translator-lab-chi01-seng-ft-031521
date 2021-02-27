# require modules here
require "yaml" 
require 'pry'

def load_library(file_path)
  #load the data for the emoticons
  emoticon_data = YAML.load_file(file_path)
  
  #create a hash to sort the emoticons by name and value in english/japanese 
  emoticon_translations = {}
  emoticon_data.collect do |meaning, translations|
    translations_hash = {
      english: translations[0],
      japanese: translations[1]
    }
    emoticon_translations[meaning] = translations_hash
  end 
  emoticon_translations
end

def get_japanese_emoticon(file_path, english_emoticon)
  emoticon_translations = load_library(file_path)
  japanese_emoticon = "Sorry, that emoticon was not found" 
  emoticon_translations.each do |meaning, translations|
    if translations[:english].include? english_emoticon
      japanese_emoticon = translations[:japanese]
    end 
  end 
  japanese_emoticon
end


def get_english_meaning(file_path, japanese_emoticon)
  emoticon_translations = load_library(file_path)
  english_meaning = "Sorry, that emoticon was not found"
  emoticon_translations.each do |meaning, translations|
    if translations[:japanese].include? japanese_emoticon
      english_meaning = meaning
    end 
  end 
  english_meaning
end