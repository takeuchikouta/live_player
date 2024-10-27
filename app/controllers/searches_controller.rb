class SearchesController < ApplicationController
   def search
       @events = Event.where('name LIKE ?', "%#{params[:word]}%")
       @applicants = Applicant.where('name LIKE ?', "%#{params[:word]}%")
       @organizers = Organizer.where('name LIKE ?', "%#{params[:word]}%")
   end
end
