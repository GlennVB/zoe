# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  sizex      :integer
#  sizey      :integer
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many :users, through: :players
  has_many :players
  
  def create_map
    map = generate_map([self.sizex,self.sizey])
    store_map(map)
  end
  
  def next_step

    self.players.each do |p|
      p.next_step
    end
  end
  
  def map_for(player)
    @res = []
    @map = load_map
    @map.each_with_index do |r, i|
      r.each_with_index do |c, j|
        if @map[i][j] == player.player_id
          @res << eval("[#{i},#{j}]")
        end
      end
    end
    
    store_map(@map)
    return @res
  end
  
  def load_map
    File.open("public/data/map#{id.to_s}.data") do |f|  
      @map = Marshal.load(f)  
    end
    return @map
  end
  
  def store_map(map)
    File.open("public/data/map#{id.to_s}.data", 'w+') do |f|  
      Marshal.dump(map, f)  
    end  
  end
  
  def generate_map(size)
    @x = size.first
    @y = size.last
    # Create empty field
    @field = Array.new(@x) {Array.new(@y," ")}
    2.times do |i|
      5.times do
        x = Random.rand(@x)
        y = Random.rand(@y)
        @field[x][y] = i
      end
    end
    return @field
  end
end
