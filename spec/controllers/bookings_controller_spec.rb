require 'spec_helper'

describe BookingsController do
  describe 'POST #create' do
    let(:post_params) { { booking: { mover_id: 1, email: 'me@example.com', from: 'Boulder', to: 'Denver', move_date: '31/Dec/2015' } } }

    it 'creates the booking and redirects to confirmation' do
      post :create, post_params

      record = BookingRecord.last
      expect(record.mover_id).to eq 1
      expect(record.email).to eq 'me@example.com'
      expect(record.from).to eq 'Boulder'
      expect(record.to).to eq 'Denver'
      expect(record.move_date).to eq Date.parse('31/12/2015')

      expect(response).to redirect_to confirmation_path
    end
  end
end