require 'rails_helper'

RSpec.describe Agency, type: :model do

  it "should require a name" do
    expect(Agency.new(name: '')).not_to be_valid
  end

  it "should require a grade of 'padawan', 'jedi', or 'master'" do
    expect(Agency.new(name: 'Valid', grade: '')).not_to be_valid
    expect(Agency.new(name: 'Valid', grade: 'invalid')).not_to be_valid
    expect(Agency.new(name: 'Valid', grade: 'padawan')).to be_valid
    expect(Agency.new(name: 'Valid', grade: 'jedi')).to be_valid
    expect(Agency.new(name: 'Valid', grade: 'master')).to be_valid
  end

end
