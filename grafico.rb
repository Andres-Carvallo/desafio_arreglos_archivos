numbers = [5, 3, 2, 5, 10]

def chart(ele)
    new_array = []
    ele.each {|x| new_array << (x * 2)}
    new_array.each do |dot|
        print "|"+"*"*dot
        print "\n"
    end
    print ">"+"-"*(new_array.max)
    print "\n"
end



chart(numbers)