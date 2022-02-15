class Api::V1::StudentsController < ActionController::API
    def index
        students = Student.all
        render json: {message: 'OK', students: students.as_json(only: [:id, :name, :subject, :marks, :grade, :created_at])}.to_json, status: 200
        end
        def show
            student = Student.find(params[:id])
            if student
                render json: {message: 'OK', student: student}.to_json, status: 200
            else
                render json: {message: 'Error', error: 'Student not found with the given id'}.to_json, status: 404
            end
            rescue => e
                render json: {message: 'Error', error: e.message }.to_json, status: 500
            end
    def create
        student = Student.new(student_params)
        if student.save
            render json: {message: 'OK', student: student}.to_json, status: :created  
        else
            render json: {message: 'Error', error: 'stuent couldnt create'}.to_json, status: 404   
    end
end
private
        def student_params
        params.require(:student).permit(:name, :subject, :marks, :grade)
        end
end