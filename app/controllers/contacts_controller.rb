class ContactsController < ApplicationController
  before_action :authenticate_user!

  def index
    @event = Event.find(params[:id])
    @contacts = @event.contacts
  end

  def new
    @event = Event.find(params[:event_id])
    @contact = Contact.new
  end

  def create
    @event = Event.find(params[:contact][:event_id])
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to events_path, notice: "イベント：#{@contact.event.name}について問い合わせを行いました！"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:message, :event_id)
  end
end
