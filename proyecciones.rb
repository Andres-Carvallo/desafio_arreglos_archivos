
new_dat = open('ventas_base.db').read.chomp.split(',')


def proyections(new_array)
    projection1 = []
    projection2 = []
    n = new_array.count
    n.times do |i|
        if i <= 5
            projection1.push new_array[i]
        elsif i > 5
            projection2.push new_array[i]
        end
    end    
    final_numb = projection1.inject(0) {|init, projection1| init + projection1.to_f}
    final_numb2 = projection2.inject(0) {|init, projection2| init + projection2.to_f}
    final_projection = (final_numb*1.1) + final_numb2
    final_projection2 = final_numb + (final_numb2*1.2)
    final_data = []
    final_data.push final_projection, final_projection2.truncate(2)

    require 'csv'
    CSV.open("resultados.data","w") do |csv|
        final_data.each do |final_result|
            csv << [final_result]
        end
    end
end

proyections(new_dat)
