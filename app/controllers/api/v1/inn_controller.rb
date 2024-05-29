class Api::V1::InnController < ActionController::API


  def show 
    inn = Inn.find(params[:registration_number])
    qtt_rooms = InnRoom.where(inn_id: inn_id)
    render status: 200, json: inn.attributes.except('name', 'registration_number', 'description')
    # 'address_attributes', 'qtdd_rooms'
  end

end