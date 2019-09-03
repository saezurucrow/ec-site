class OrdersController < ApplicationController
  before_action :authenticate_customer!
  #注文履歴
  def show
  end
end
