class PatientController < ApplicationController
layout 'standard'

    def index
        @search = Patient.search(params[:q])
        @patients = @search.result
    end

    def list
        @patients = Patient.all
    end

    def show
        @patient = Patient.find(params[:id])
    end

    def new
        @patient = Patient.new
    end

    def create
        @patient = Patient.new(patient_params)

        if @patient.save
            redirect_to :action => 'list'
        end
    end

    def patient_params
       params.require(:patients).permit(:name, :dateofbirth, :address, :phonenumber, :injury, :requestscan, :typeofscan)
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
        params.require(:patient).permit(:name, :dateofbirth, :address, :phonenumber, :injury, :requestscan, :typeofscan)
    end

    def delete
        Patient.find(params[:id]).destroy
        redirect_to :action => 'list'
    end
end
