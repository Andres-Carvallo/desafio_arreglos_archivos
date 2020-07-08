require 'csv'
CSV.open('notas.data').readlines
grades = CSV.open('notas.data').readlines

def best_grade(grades)
    best_grades = []
    grades.each do |array_int|
        all_grades = array_int.map { |ele| ele.to_i}
        best_grades << all_grades.max
    end 
    best_grades   
end


print best_grade(grades)