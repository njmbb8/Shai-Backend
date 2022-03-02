class ConfirmationsController < ApplicationController
    def create
        user = User.find_by(email: params[:email].downcase)

        if user.present? && !user.confirmed?
            user.send_confirmation_email!
            head :ok
        else
            render json: { error: "E-mail not found or already confirmed"}, status: :unauthorized
        end
    end

    def update
        user = User.find_signed(params[:confirmation_token], purpose: 'account_confirmation')
    end
end