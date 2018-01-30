require 'chunky_png'

file1, file2, file3, file4 = ARGV

images = [
  ChunkyPNG::Image.from_file(file1),
  ChunkyPNG::Image.from_file(file2)
]

diff = []
difference = []
ctrl = ''

images.first.height.times do |y|
  images.first.row(y).each_with_index do |pixel, x|
    if pixel == images.last[x,y]
		if ctrl == 1
			difference << [x,y] 
		end	
	ctrl = 0
	else
		if ctrl == 0
			difference << [x,y] 
		end	
	diff << [x,y] 
	ctrl = 1
	end
  end
end

File.open("#{file3}", 'w') {
|file| file.write("pixels (total):     #{images.first.pixels.length}") 
file.puts " "
file.write("pixels changed:     #{diff.length}") 
file.puts " "
file.write("pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%") 
}

puts "pixels (total):     #{images.first.pixels.length}"
puts "pixels changed:     #{diff.length}"
puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"

x, y = diff.map{ |xy| xy[0] }, diff.map{ |xy| xy[1] }
x1, y1 = difference.map{ |xy| xy[0] }, difference.map{ |xy| xy[1] }

images.last.rect(x.min,y.min,x.max,y.max, ChunkyPNG::Color.rgb(0,255,0))

$i = 0
$num = difference.length
while $i < $num  do
   images.last.compose_pixel(x1[$i],y1[$i], ChunkyPNG::Color.rgb(255,0,0))
   $i +=1
end
images.last.save("#{file4}")
