require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "constraints" do
    it { is_expected.to validate_presence_of(:license_plate) }
    it { is_expected.to validate_presence_of(:make) }
    it { is_expected.to validate_presence_of(:model) }
    it { is_expected.to validate_presence_of(:color) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:vin) }
  end

  describe "table" do
    it { is_expected.to have_db_column(:license_plate).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:make).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:model).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:color).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:category).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:vin).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
