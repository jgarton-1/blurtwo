class Image
  attr_accessor :image
  def initialize(data)
   @data = data
 end
 def can?(x,y)
  return true if y >= 0 and y < @data.length and x >= 0 and x < @data[y].length
 end
 def blur(dist=1)
  ni = @data.collect { |row| row.collect { 0 } }
   (@data.length).times do |row|
    (@data[row].length).times do |col|
      if @data[row][col] == 1 then
        [-1,0,1].each do |dir|
          ni[row + dir][col] = 1 if can?(row+dir,col)
          ni[row][col + dir] = 1 if can?(row,col+dir)
        end
      end
    end
  end
  @data = ni
end
def get_image
  return @data.collect { |row| row.join }.join("\n")
end
def output_image
  puts get_image
end
end

i = Image.new([
      [0, 0, 0, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 1],
      [0, 0, 0, 0]
              ]);
i.blur
i.output_image
