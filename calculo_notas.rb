require 'csv'
CSV.open('notas.data').readlines
grades = CSV.open('notas.data').readlines

def best_grade(grades)
    only_grades = grades.map { |x| x.to_i }
    only_grades.max
end


puts best_grade(grades[0])