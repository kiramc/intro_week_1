a = [1,2,3,4,5,6,7]

a.each do |i|
  a[i].delete if i > 5
end