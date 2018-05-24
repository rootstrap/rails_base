module Api
  module V1
    class MessagesController < Api::V1::ApiController
      include Concerns::ActAsApiRequest
      protect_from_forgery with: :null_session
      before_action :chat, only: :create

      def create
        @message = ChatService.create_message(chat, message_params[:content], current_user)
      end

      private

      def message_params
        params.require(:message).permit(:content)
      end

      def chat
        @chat ||= current_user.chats.find(params[:chat_id])
      end
    end
  end
end
