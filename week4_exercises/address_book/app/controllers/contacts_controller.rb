class ContactsController < ApplicationController
	def index
		@contacts = Contact.all.order('name ASC')
	end

	def search
       letter = params[:letter]
       @contacts = Contact.where("name like ?", "#{letter}%")
   end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(project_params)

		if @contact.valid?
			@contact.save
			redirect_to contacts_path, notice: 'Contact was successfully created' #action: "show", id: project.id, notice: 'Project was successfully created'
		else
			render :new
		end
	end

	def project_params
		params.require(:contact).permit(:name, :address, :phone1, :phone2, :email1, :email2) #security reasons
	end

	def mark_favorite
		@contact = Contact.find(params[:id])
		@contact.update_attribute(:favorite, true)
		render :show, notice: 'Contact marked as favorite'
	end

	def favorite
		@contacts = Contact.where(favorite: true)
	end
	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find_by(id: params[:id])

		if @contact.update_attributes(project_params)
			redirect_to contacts_path, notice: 'Contact was successfully updated' #action: "show", id: contact.id, notice: 'Project was successfully created'
		else
			render :edit
		end
			
	end

	def destroy

		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to contacts_path
	end

end


