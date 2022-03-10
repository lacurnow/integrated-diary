require_relative "diary_entry.rb"

class Diary
  def initialize
    @entries = {}
    @count_words = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries[entry.title] = entry.contents
  end

  def all
    @entries
  end

  def count_words
    @entries.each_value {|value| @count_words << value}
    words_array = @count_words.join(" ").split(" ")
    words_array.length
  end

  def reading_time(wpm) 
    total_diary_words = count_words
    total_time = total_diary_words / wpm
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    longest_entry = ""
    longest_entry_length = 0
    total_words_readable = wpm * minutes
    @entries.each_value { |entry|
      entry_length = entry.split(" ").length 
      if (entry_length > longest_entry_length) && (entry_length <= total_words_readable)
        longest_entry = entry
      end
    }
    longest_entry
  end
end

