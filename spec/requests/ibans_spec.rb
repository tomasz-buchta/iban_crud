require 'rails_helper'

RSpec.describe "/ibans", type: :request do
  let(:valid_attributes) {
    attributes_for(:iban)
  }

  let(:invalid_attributes) {
    { iban: "", name: "" }
  }

  let(:valid_headers) {
    {}
  }

  let(:expected_response_headers) { "application/json; charset=utf-8" }

  let!(:iban) { create(:iban) }

  describe "GET /index" do
    it "renders a successful response" do
      get ibans_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    context "With query param" do
      let(:iban_name) { "test123" }
      let!(:iban) { create(:iban, name: iban_name) }
      it "Filters ibans by name" do
        get ibans_url(query: "test123"), headers: valid_headers, as: :json
        expect(response).to be_successful
        expect(response.parsed_body.first).to include({ "id" => iban.id, "name" => iban_name })
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get iban_url(iban), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Iban" do
        expect {
          post ibans_url,
               params: { iban: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Iban, :count).by(1)
      end

      it "renders a JSON response with the new iban" do
        post ibans_url,
             params: { iban: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Iban" do
        expect {
          post ibans_url,
               params: { iban: invalid_attributes }, as: :json
        }.to change(Iban, :count).by(0)
      end

      it "renders a JSON response with errors for the new iban" do
        post ibans_url,
             params: { iban: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq(expected_response_headers)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "The mighty eagle" }
      }

      it "updates the requested iban" do
        patch iban_url(iban),
              params: { iban: new_attributes }, headers: valid_headers, as: :json
        iban.reload
        expect(iban.name).to eq("The mighty eagle")
      end

      it "renders a JSON response with the iban" do
        iban = Iban.create! valid_attributes
        patch iban_url(iban),
              params: { iban: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the iban" do
        iban = Iban.create! valid_attributes
        patch iban_url(iban),
              params: { iban: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq(expected_response_headers)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested iban" do
      iban = Iban.create! valid_attributes
      expect {
        delete iban_url(iban), headers: valid_headers, as: :json
      }.to change(Iban, :count).by(-1)
    end
  end
end

