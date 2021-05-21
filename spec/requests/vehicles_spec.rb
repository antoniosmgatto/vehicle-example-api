# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/vehicles", type: :request do
  let(:valid_attributes) { attributes_for(:vehicle) }
  let(:invalid_attributes) { { license_plate: "" } }
  let(:json) { response.parsed_body }

  describe "GET /index" do
    before do
      create_list(:vehicle, 2)

      get vehicles_url
    end

    it { expect(response.content_type).to eq("application/json; charset=utf-8") }

    it { expect(response).to have_http_status(:success) }

    it "returns the expected number of records" do
      expect(json.size).to eq 2
    end
  end

  describe "GET /show" do
    let(:vehicle) { create(:vehicle) }

    before { get vehicle_url(vehicle) }

    it { expect(response.content_type).to eq("application/json; charset=utf-8") }

    it { expect(response).to have_http_status(:success) }
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new vehicle" do
        expect {
          post vehicles_url, params: valid_attributes, headers: { content_type: "application/json" }
        }.to change(Vehicle, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new vehicle" do
        expect {
          post vehicles_url, params: invalid_attributes
        }.to change(Vehicle, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:vehicle) { create(:vehicle) }
      let(:new_attributes) { attributes_for(:vehicle) }

      before do
        patch vehicle_url(vehicle), params: new_attributes

        vehicle.reload
      end

      it "updates the requested vehicle" do
        expect(vehicle).to have_attributes(new_attributes)
      end

      it { expect(response.content_type).to eq("application/json; charset=utf-8") }

      it { expect(response).to have_http_status(:success) }
    end
  end

  describe "DELETE /destroy" do
    let!(:vehicle) { create(:vehicle) }

    it "deletes a vehicle" do
      expect {
        delete vehicle_url(vehicle)
      }.to change(Vehicle, :count).by(-1)
    end
  end
end
