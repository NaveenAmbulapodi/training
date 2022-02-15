class StudentMailer < ApplicationMailer
    def notify_student_creation(student_id)
        @student = Student.find(student_id)
        mail(to: 'ambulanaveen21@gmail.com', subject: "student #{@student.name} has been created!")
        end
end
