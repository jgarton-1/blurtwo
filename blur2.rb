class Image
attr_accessor :image
  def initialize()
       @image = ([
          [0, 0, 0, 0],
          [0, 1, 0, 0],
          [0, 0, 0, 1],
          [0, 0, 0, 0]
                     ])
        newimage = @image.collect { |row| row.collect {0}}
        (@image.length).times do |row|
          (@image[row].length).times do |col|
            if @image[row][col] == 1 then
              [-1,0,1].each do |offset|
                #varoffset = offset * distance
                newimage[row + offset][col] = 1 if row + offset >= 0 and row + offset < newimage.length
                newimage[row][col + offset] = 1 if col + offset >= 0 and col + offset < newimage[row].length
                end
              end
            end
          end
  end
     def output_image
        image.each { |x| puts x.join("")}
      end
      # def output_newimage
      #   newimage.each { |x| puts x.join("")}
      # end
 image = Image.new()
 image.output_image
 #image.output_newimage
end