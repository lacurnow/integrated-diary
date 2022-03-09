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
end