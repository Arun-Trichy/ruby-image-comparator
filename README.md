# ruby-image-comparator
Ruby based image comparator that compares 2 given Images with a bounding box figure.
It only works for 2 PNG Images with similar Dimensions.

# Pre-requisites
1. Install Ruby https://www.ruby-lang.org/en/documentation/installation/
2. Install ChunkyPNG "gem install chunky_png"

# Run Command
ruby image_comparator.rb source_image.png target_image.png output.txt output.png

# Test results
<b>source_image.png <br>
![alt text](https://github.com/Arun-Trichy/ruby-image-comparator/blob/master/room_with_person.png)

<b>target_image.png <br>
![alt text](https://github.com/Arun-Trichy/ruby-image-comparator/blob/master/room_without_person.png)

<b>output.txt <br>
pixels (total):     103200 <br>
pixels changed:     6816 <br>
pixels changed (%): 6.604651162790698% <br>

<b>output.png <br>
![alt text](https://github.com/Arun-Trichy/ruby-image-comparator/blob/master/output.png)
