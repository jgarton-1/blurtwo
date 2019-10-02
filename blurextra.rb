class Image
  attr_accessor :image
  def initialize(data)
      raise ArgumentError, "data must be an array" if not data.is_a? Array
      @data = data
  end
  def can?(x,y)
    return true if  y >= 0 and y < @data.length and x >= 0 and x < @data[y].length
    return false
  end
  def write_cross(ni,dist,row,col)
    [-1,0,1].each do |dir|
      (dist+1).times do |d|
        nx          = col + (d * dir)
        ny          = row + (d * dir)
        ni[ny][col] = 1 if can?(ny,col)
        ni[row][nx] = 1 if can?(row,nx)
      end
    end
    return ni
  end
  def write_x(ni,dist,row,col)
    [-1,0,1].each do |dir|
      (dist/2+1).times do |d|
        nx      = col + (d * dir)
        ny      = row + (d * dir)
        ni[ny][nx] = 1 if can?(ny,nx)
        nx      = col - (d * dir)
        ny      = row - (d * dir)
        ni[ny][nx] = 1 if can?(ny,nx)
        nx      = col + (d * dir)
        ny      = row - (d * dir)
        ni[ny][nx] = 1 if can?(ny,nx)
        nx      = col - (d * dir)
        ny      = row + (d * dir)
        ni[ny][nx] = 1 if can?(ny,nx)
      end
    end
    return ni
  end
  def blur(dist=1)
    ni = @data.collect { |row| row.collect { 0 } }
    (@data.length).times do |row|
      (@data[row].length).times do |col|
        if @data[row][col] == 1 then
          ni = write_cross(ni,dist,row,col)
          ni = write_x(ni,dist,row,col)
        end
      end
    end
    @data = ni
  end
  def get_image
    return @data.map { |row| row.map { |col| col == 1 ? "\u{25A1}" : '*' }}.collect { |row| row.join(" ") }.join("\n")
  end
  def output_image
    puts get_image
  end
end

i = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
]);
5.times do |x|
  i.blur(x)
  i.output_image
  sleep(1)
end