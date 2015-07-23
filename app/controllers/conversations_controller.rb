class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]
 
  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end
 
  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def show
  end
 
  private

  def get_mailbox
    @mailbox ||= current_user.mailbox
  end
 
  def get_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end