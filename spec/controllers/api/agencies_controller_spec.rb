require 'rails_helper'

RSpec.describe Api::AgenciesController, type: :controller do

  let(:valid_attributes) {
    {
      name: 'Valid Name',
      description: 'Valid Description',
      grade: 'padawan',
      tag_list: ['one', 'two']
    }
  }

  let(:invalid_attributes) {
    {
      name: '',
      grade: ''
    }
  }

  let(:valid_params) { { agency: valid_attributes } }
  let(:invalid_params) { { agency: invalid_attributes } }
  let(:valid_session) { { } }

  describe "GET #index" do
    it "assigns all agencies as @agencies" do
      agency = Agency.create! valid_attributes
      get :index, {format: :json}, valid_session
      expect(assigns(:agencies)).to eq([agency])
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Agency" do
        expect {
          post :create, valid_params, valid_session
        }.to change(Agency, :count).by(1)
      end

      it "assigns a newly created agency as @agency" do
        post :create, valid_params, valid_session
        expect(assigns(:agency)).to be_a(Agency)
        expect(assigns(:agency)).to be_persisted
      end

      it "responds with the created agency" do
        post :create, valid_params, valid_session
        expect(response.body).to eq(Agency.last.to_json)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved agency as @agency" do
        post :create, invalid_params, valid_session
        expect(assigns(:agency)).to be_a_new(Agency)
      end

      it "responds with an error" do
        post :create, invalid_params, valid_session
        expect(response.status).to eq(422)
        errors = JSON.parse(response.body)
        expect(errors["name"]).to eq(["can't be blank"])
        expect(errors["grade"]).to eq(["can't be blank", " is not a valid grade"])
      end
    end
  end
end
