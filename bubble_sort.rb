unsorted = [37,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78]
def bubble_sort array
  for i in (0..array.length)
      flag = false
      for j in (0..array.length-2)
        if(array[j] > array[j+1])
            temp = array[j+1]
            array[j+1] = array[j]
            array[j] = temp
            flag = true
        end
      end
      if flag == false
      return  puts array
      end
  end
end

bubble_sort unsorted

unsorted = [37,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78,21,14,88,21,69,621,216,11,0,-25,6891,256162, 11, 21, 62,62,78]
def bubble_sort_by array
  for i in (0..array.length)
      flag = false
      for j in (0..array.length-2)
        if yield(array[j], array[j+1]) > 0
            array[j+1], array[j] = array[j], array[j+1]
            flag = true
        end
      end
      if flag == false
      return  puts array
      end
  end
end

 bubble_sort_by(["hi","hello","hey"]) do |left,right|
   left.length - right.length
 end
