
data = open('ventas_base.db').read.chomp.split(',')
new_array = []
n = data.count
n.times do |i|
    new_array.push data[i].to_f
end

def proyections(new_array)
    proyection1 = []
    proyection2 = []
    final_numb = 0
    final_numb2 = 0
    n = new_array.count
    n.times do |i|
        if i <= 5
            proyection1.push new_array[i]
        elsif i > 5
            proyection2.push new_array[i]
        end

    end    
    proyection1.each do |i|
    final_numb += i.to_f
    end
    proyection2.each do |i|
        final_numb2 += i.to_f
    end
    final_proyection = (final_numb*1.1) + final_numb2
    final_proyection2 = final_numb + (final_numb2*1.2)
    final_data = []
    final_data.push final_proyection, final_proyection2.truncate(2)
    

    require 'csv'
    CSV.open("resultados.data","w") do |csv|
        final_data.each do |i|
            csv << [i]
        end
    end
end

proyections(new_array)
