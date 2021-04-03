class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      Rails.logger.debug 'DEBUG: contact valid'
      # TODO: send message
      flash[:notice] = "Message sent from #{@contact.name}."
      redirect_to root_path
    else
      Rails.logger.debug 'DEBUG: contact invalid'
      Rails.logger.debug "#{params.inspect}"
      render :new
    end
  end

  private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end