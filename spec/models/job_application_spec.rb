require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:company_name) }
  it { should validate_presence_of(:applied_on) }
end
