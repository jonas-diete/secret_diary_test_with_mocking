require "diary"

RSpec.describe Diary do
  it "read method returns contents" do
    diary = Diary.new("Today was a great day.")
    expect(diary.read).to eq "Today was a great day."
  end
end