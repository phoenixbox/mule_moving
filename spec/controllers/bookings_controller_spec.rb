require "rails_helper"

describe BookingsController do
  describe "POST #create" do
    let(:post_params) { { booking: { mover_id: 1, email: "me@example.com", from: "Boulder", to: "Denver", move_date: "31/Dec/2015" } } }

    it "creates the booking and redirects to confirmation" do
      mover = MoverEntity.new
      mover.name = "Mafia Movers"
      expect_any_instance_of(MoverFinder).to receive(:find_by_id).with("1").and_return(mover)

      post :create, post_params

      record = BookingRecord.last
      expect(record.mover_id).to eq 1
      expect(record.email).to eq "me@example.com"
      expect(record.from).to eq "Boulder"
      expect(record.to).to eq "Denver"
      expect(record.move_date).to eq Date.parse("31/12/2015")

      expect(response).to redirect_to confirmation_path
    end

    it "sends a confirmation email" do
      mover = MoverEntity.new
      mover.name = "Mafia Movers"
      expect_any_instance_of(MoverFinder).to receive(:find_by_id).with("1").and_return(mover)
      expect_any_instance_of(MailSender).to receive(:confirmation).with("me@example.com", "Boulder", "Denver", Date.parse("31/12/2015"), "Mafia Movers")

      post :create, post_params
    end
  end

  describe "GET #new" do
    it "assigns from, to, and mover" do
      session[:from] = "Boulder"
      session[:to] = "Denver"
      mover = MoverDetail.new
      expect_any_instance_of(MoverDetailFinder).to receive(:for_id).with("1").and_return(mover)

      get :new, id: 1

      expect(assigns(:mover)).to eq mover
      expect(assigns(:from)).to eq "Boulder"
      expect(assigns(:to)).to eq "Denver"
    end
  end
end