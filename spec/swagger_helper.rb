# frozen_string_literal: true

require "rails_helper"

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join("swagger").to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    "v1/swagger.yaml" => {
      openapi: "3.0.1",
      info: {
        title: "Vehicle API V1",
        version: "v1",
        description: "This is the first version of my API"
      },
      components: {
        schemas: {
          errors_object: {
            type: "object",
            properties: {
              errors: { "$ref" => "#/components/schemas/errors_map" }
            }
          },
          errors_map: {
            type: "object",
            additionalProperties: {
              type: "array",
              items: { type: "string" }
            }
          },
          vehicles: {
            type: "array",
            additionalProperties: {
              type: "array",
              items: {
                "$ref" => "#/components/schemas/vehicle"
              }
            }
          },
          vehicle: {
            type: "object",
            properties: {
              id: { type: :integer, example: 1 },
              license_plate: { type: :string, example: "AAA9999" },
              make: { type: :string, example: "Mercedes-Benz" },
              model: { type: :string, example: "1113" },
              color: { type: :string, example: "Azul" },
              category: { type: :string, example: "Caminhão" },
              vin: { type: "string", example: "3TW HZXRAU W3 AA2893" },
              created_at: { type: :string, format: "date-time" },
              updated_at: { type: :string, format: "date-time" }
            },
            required: %w(id license_plate make model color category vin)
          },
          vehicle_new: {
            type: "object",
            properties: {
              license_plate: { type: :string, example: "ABC9999" },
              make: { type: :string, example: "Mercedes-Benz" },
              model: { type: :string, example: "1113" },
              color: { type: :string, example: "Azul" },
              category: { type: :string, example: "Caminhão" },
              vin: { type: "string", example: "3TW HZXRAU W3 AA2893" }
            },
            required: %w(license_plate make model color category vin)
          },
          vehicle_edit: {
            type: "object",
            properties: {
              license_plate: { type: :string, example: "AAA9999" },
              make: { type: :string, example: "Mercedes-Benz" },
              model: { type: :string, example: "1113" },
              color: { type: :string, example: "Azul" },
              category: { type: :string, example: "Caminhão" },
              vin: { type: "3TW HZXRAU W3 AA2893" }
            }
          }
        }
      },
      paths: {},
      servers: [
        {
          url: "http://{defaultHost}",
          variables: {
            defaultHost: {
              default: "localhost:3000"
            }
          }
        }
      ]
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml

  config.after(:each, type: :request) do |example|
    if respond_to?(:response) && response.body.present?
      example.metadata[:response][:content] = {
        "application/json" => {
          example: response.parsed_body
        }
      }
    end
  end
end
