def averages(arr)
  if arr != nil && arr.empty? == false
    arr.each_slice(2) do |i|
      return i.inject(:+) / 2
    end
  else
    return []
  end
end
averages([2, 2, 2, 2, 2])
averages([2, -2, 2, -2, 2])
averages([2, -2, 2, -2, 2])
averages([1, 3, 5, 1, -10])
averages([])
averages(nil)