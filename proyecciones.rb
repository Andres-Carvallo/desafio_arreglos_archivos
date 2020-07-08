
new_dat = open('ventas_base.db').read.chomp.split(',')


def proyections(new_array)
    proyection1 = []
    proyection2 = []
    n = new_array.count
    n.times do |i|
        if i <= 5
            proyection1.push new_array[i]
        elsif i > 5
            proyection2.push new_array[i]
        end
    end    
    final_numb = proyection1.inject(0) {|init, proyection1| init + proyection1.to_f}
    final_numb2 = proyection2.inject(0) {|init, proyection2| init + proyection2.to_f}
    final_proyection = (final_numb*1.1) + final_numb2
    final_proyection2 = final_numb + (final_numb2*1.2)
    final_data = []
    final_data.push final_proyection, final_proyection2.truncate(2)
    require 'csv'
    CSV.open("resultados.data","w") do |csv|
        final_data.each do |final_result|
            csv << [final_result]
        end
    end
end

proyections(new_dat)
