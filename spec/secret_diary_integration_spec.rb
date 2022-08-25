require "diary"
require "secret_diary"

RSpec.describe "integration" do
  it "read method raises an error if diary is locked" do
    diary = Diary.new("Today I learned lots.")
    secret_diary = SecretDiary.new(diary)
    expect{ secret_diary.read }.to raise_error "Go away!"
  end

  it "read method returns diary contens if diary is unlocked" do
    diary = Diary.new("Today I learned lots.")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Today I learned lots."
  end

  it "read method raises an error if diary is locked" do
    diary = Diary.new("Today I learned lots.")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect{ secret_diary.read }.to raise_error "Go away!"
  end
end