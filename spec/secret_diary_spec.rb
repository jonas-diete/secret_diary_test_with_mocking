require "secret_diary.rb"

RSpec.describe SecretDiary do
  it "read method raises an error if diary is locked" do
    fake_diary = double :fake_diary 
    secret_diary = SecretDiary.new(fake_diary)
    expect{ secret_diary.read }.to raise_error "Go away!"
  end
  
  it "read method returns diary contens if diary is unlocked" do
    fake_diary = double :fake_diary, read: "Today I learned lots."
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Today I learned lots."
  end

  it "read method raises an error if diary is locked" do
    fake_diary = double(:fake_diary)
    secret_diary = SecretDiary.new(fake_diary)
    secret_diary.unlock
    secret_diary.lock
    expect{ secret_diary.read }.to raise_error "Go away!"
  end
end