class Api::V1::InnsController < ActionController::API
  def show
    inn = Inn.find(1)
    #qtt_rooms = InnRoom.where(inn_id: inn_id)
    render status: 200, json: Inn
    # 'address_attributes', 'qtdd_rooms'
  end
end
