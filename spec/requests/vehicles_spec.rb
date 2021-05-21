# frozen_string_literal: true

require "swagger_helper"

# rubocop:disable RSpec/EmptyExampleGroup
RSpec.describe "Vehicle API", swagger_doc: "v1/swagger.yaml", type: :request do
  path "/vehicles" do
    get("list vehicles") do
      tags "Vehicles"
      description "List all vehicles"
      produces "application/json"
      response(200, :success) do
        let(:vehicles) { create_list(:vehicle, 3) }

        run_test!
      end
    end

    post("create vehicle") do
      tags "Vehicles"
      consumes "application/json"
      produces "application/json"
      parameter name: :vehicle, in: :body, schema: { "$ref" => "#/components/schemas/vehicle_new" }

      response(201, :created) do
        schema "$ref" => "#/components/schemas/vehicle"

        let(:vehicle) { attributes_for(:vehicle) }

        run_test!
      end

      response(422, :unprocessable_entity) do
        schema "$ref" => "#/components/schemas/errors_object"
        let(:vehicle) { {} }

        run_test!
      end
    end
  end

  path "/vehicles/{id}" do
    parameter name: "id", in: :path, type: :integer

    get("show vehicle") do
      tags "Vehicles"
      consumes "application/json"
      produces "application/json"

      response(200, :success) do
        let(:id) { create(:vehicle).id }

        run_test!
      end

      response(404, :not_found) do
        let(:id) { "1" }

        run_test!
      end
    end

    patch("update vehicle") do
      tags "Vehicles"
      consumes "application/json"
      produces "application/json"
      parameter name: :vehicle, in: :body, schema: { "$ref" => "#/components/schemas/vehicle_edit" }

      response(200, :success) do
        let(:id) { create(:vehicle).id }
        let(:vehicle) { attributes_for(:vehicle) }

        run_test!
      end

      response(404, :not_found) do
        let(:id) { "1" }
        let(:vehicle) { {} }

        run_test!
      end

      response(422, :unprocessable_entity) do
        schema "$ref" => "#/components/schemas/errors_object"

        let(:id) { create(:vehicle).id }
        let(:vehicle) { { license_plate: nil } }

        run_test!
      end
    end

    put("update vehicle") do
      tags "Vehicles"
      consumes "application/json"
      produces "application/json"
      parameter name: :vehicle, in: :body, schema: { "$ref" => "#/components/schemas/vehicle_edit" }

      response(200, :success) do
        let(:id) { create(:vehicle).id }
        let(:vehicle) { attributes_for(:vehicle) }

        run_test!
      end

      response(404, :not_found) do
        let(:id) { "1" }
        let(:vehicle) { {} }

        run_test!
      end

      response(422, :unprocessable_entity) do
        schema "$ref" => "#/components/schemas/errors_object"

        let(:id) { create(:vehicle).id }
        let(:vehicle) { { license_plate: nil } }

        run_test!
      end
    end

    delete("delete vehicle") do
      tags "Vehicles"

      response(204, :no_content) do
        let(:id) { create(:vehicle).id }

        run_test!
      end

      response(404, :not_found) do
        let(:id) { "1" }

        run_test!
      end
    end
  end
end
# rubocop:enable RSpec/EmptyExampleGroup
