class StudentsController < ApplicationController
    add_breadcrumb "home", :root_path
  
    before_action :load_filters, only: ['edit','update','show','destroy','download_pdf']
    def index
        add_breadcrumb 'index', students_path, title: "Back to the Index"
        @students = if params[:q] && !params[:q].blank?
        
        Student.where(name: params[:q])
        
        else
        
        Student.all
        
      end
        
    end 
        def show
            add_breadcrumb 'show', student_path, title: "Back to the Index"
        end
        def new
            add_breadcrumb 'New', student_path, title: "Back to the Index"
        @student=Student.new
        end
        def create
        @student = Student.new(student_params)
        if @student.save
            StudentMailer.notify_student_creation(@student.id).deliver_now
        redirect_to students_path
        else
        render :new
        end
        end
        def edit
            add_breadcrumb 'Edit', student_path, title: "Back to the Index"
    
        end
        def home
            add_breadcrumb 'Home', student_path, title: "Back to the Index"
        end

        def aboutus
            add_breadcrumb 'About Us', student_path, title: "Back to the Index"
        end
        def contact
            add_breadcrumb 'Contact', student_path, title: "Back to the Index"
        end

        def latest
        end
       

        def update
       
        if @student.update(student_params)
        redirect_to students_path
        else
        render :edit
        end
        end
            def download_pdf
                Rails.logger.debug"\n i am in dowload PDF action \n"
                send_file("#{Rails.root}/public/sample.pdf",
                filename: "#{@student.name}.pdf",
                type: "application/pdf")
                end
        
        def destroy
        @student.destroy
        redirect_to students_path
        end


        private
        def student_params
        params.require(:student).permit(:name, :subject, :marks, :grade, :main_image)
        end

        def load_filters
            Rails.logger.debug"\n i am in before action \n"
            @student = Student.find(params[:id])
        end
 end
