module Api
  module V1
    class ChatsController < Api::V1::ApiController
      def index
        Chat.where(users: current_user)
      end

      def show
        chat = Chat.find(params[:chat_id])
        return render json: { messages: {} }, status: :ok unless chat
        chat.mark_user_seen(current_user)
        get_messages(chat, params[:page])
      end

      def create
        conversation = chat_name
        chat = Chat.new(name: conversation)
        chat.users << params[:users].each { |user| User.find(user) }
        chat.save!
      end

      def visit
        chat = Chat.find(params[:chat_id])
        participant = Participant.find_by(user: current_user, chat: chat)
        participant.touch(:last_connection)
      end

      private

      def get_messages(chat, page)
        @messages = chat.messages.order(created_at: :desc).page(page)
        @messages = @messages.sort_by(&:created_at)
      end

      def chat_name
        Chat.find_or_create_by_name(infer_chat_type)
      end

      def infer_chat_type
        room = params[:room]
        room.present ? room : personal_chat
      end

      def personal_chat
        username = params[:user]
        current_user_name = current_user.username
        if (current_user_name <=> username).negative?
          "#{current_user_name}_#{username}"
        else
          "#{username}_#{current_user_name}"
        end
      end
    end
  end
end
