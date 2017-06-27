class ContactsController < ApplicationController
  # GET request to /contacts
  # Show new contact form
  def new
    @contact = Contact.new
  end
  
  # POST request /contacts
  def create
    #Mass assignment of form fields into contact table  
    @contact = Contact.new(contact_params)
    # Save the Contact object into the database
      if @contact.save
        name = params[:contact][:name]
        email = params[:contact][:email]
        body = params[:contact][:comments]
        ContactMailer.contact_email(name,email,body).deliver_now
        flash[:success] = "Message sent."
        redirect_to new_contact_path
      else 
        flash[:danger] = @contact.errors.full_messages.join(", ")
        redirect_to new_contact_path
      end
  end
  
  private
  # To collect data from form, we need to use strong parameters
  # and whitelist form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
end