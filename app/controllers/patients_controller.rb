class PatientsController < ApplicationController
before_action :authenticate_user!
layout 'standard'

    def index
    end

    def list
        @search = Patient.search(params[:q])
        @patients = @search.result
        if params[:q].blank?
            @patients = Patient.all
        end
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = current_user.patients.build
    end

    def create
        @patient = current_user.patients.build(patient_params)

        if @patient.save
            redirect_to :action => 'list'
        end
    end

    def patient_params
       params.require(:patients).permit(:name, :dateofbirth, :address, :phonenumber, :injury, :requestscan, :typeofscan, :appointmentdate, :appointmenttime)
    end

    def edit
        @patient = Patient.find(params[:id])
    end

    def update
        @patient = Patient.find(params[:id])

        if @patient.update_attributes(patient_param)
            redirect_to :action => 'show', :id => @patient
        else
            render :action => 'edit'
        end
    end

    def patient_param
        params.require(:patient).permit(:name, :dateofbirth, :address, :phonenumber, :injury, :requestscan, :typeofscan, :appointmentdate, :appointmenttime)
    end

    def delete
        Patient.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
end
