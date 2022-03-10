require "diary"
require "diary_entry"

RSpec.describe "integration" do
  describe "#add" do
    it "adds an entry to the diary" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my_contents")
      new_entry = diary.add(diary_entry)
      result = diary.all
      expect(result).to eq "my_title"=>"my_contents" 
    end
  end

  describe "#all" do
    it "returns all the entries in the diary" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my_contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my_contents_2")
      new_entry = diary.add(diary_entry)
      new_entry = diary.add(diary_entry_2)
      result = diary.all
      expect(result).to eq "my_title"=>"my_contents", "my_title_2"=>"my_contents_2"
    end
  end

  describe "#count_words" do
    it "counts all the words of all entries in the diary" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my contents 2")
      new_entry = diary.add(diary_entry)
      new_entry = diary.add(diary_entry_2)
      expect(diary.count_words).to eq 5
    end
  end

  describe "#reading_time" do
    it "returns an integer representing an estimated reading time of the diary based on wpm" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my contents 2")
      new_entry = diary.add(diary_entry)
      new_entry = diary.add(diary_entry_2)
      expect(diary.reading_time(1)).to eq 5
    end
  end

  describe "#find_best_entry_for_reading_time" do
    it "returns the longest diary entrance readable in the given time based on the user's reading speed" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my contents 2")
      diary_entry_3 = DiaryEntry.new("my_title_3", "my contents 2 again")
      new_entry = diary.add(diary_entry)
      new_entry = diary.add(diary_entry_2)
      new_entry = diary.add(diary_entry_3)
      result = diary.find_best_entry_for_reading_time(1, 4)
      expect(result).to eq "my contents 2 again"
    end
  end
end