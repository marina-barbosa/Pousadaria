require "rails_helper"

describe "Inn API" do
  context "GET api/v1/inns/1" do
    it "com sucesso, retorna detalhes" do
      # Arrange
      inn_owner = InnOwner.create!(first_name: "Hortencia", last_name: "Flores", document: "53783222001", email: "flores@email.com", password: "123456")
      inn = inn_owner.create_inn!(name: "Pousada das Flores", registration_number: "30638898000199", description: "Um bom lugar....",
                                  address_attributes: { address: "Rua X", number: "166", city: "Manaus", state: "AM", postal_code: "69067-080", neighborhood: "Centro" })
      inn.inn_rooms.create!(name: "Quarto com Varanda", size: 35, guest_limit: 3)
      inn.inn_rooms.create!(name: "Quarto Térreo", size: 30, guest_limit: 3)

      # Act
      get "/api/v1/inns/1"
      # Assert
      expect(response.status).to eq 200
      expect(response.content_type).to include("application/json")
      inn_response = JSON.parse(response.body)
      expect(inn_response["name"]).to eq("Pousada das Flores")
      expect(inn_response["registration_number"]).to eq("30638898000199")
      expect(inn_response["description"]).to eq("Um bom lugar....")

      expect(inn_response["qtdd_rooms"]).to eq("2")
    end
    # it "retorna array vazio" do
    # end
  end
end
