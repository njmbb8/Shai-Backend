class OrderController < ApplicationController
    def show
        @order = Order.find(params[:id])
        if @order
            render json: @order, status: :ok
        else
            render json: { error: "order not found" }, status: :not_found
        end
    end
end