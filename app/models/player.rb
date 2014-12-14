# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  
  def positions
    @res = []
    @map = game.load_map
    @map.each_with_index do |r, i|
      r.each_with_index do |c, j|
        if @map[i][j] == self.player_id
          @res << eval("[#{i},#{j}]")
        end
      end
    end
    return @res
  end
  
  def move_ant(x,y, nextx, nexty,char)
    if check_rules(x,y, nextx, nexty)
      @map[x][y] == " "
      @map[nextx][nexty] == char
    end
  end
  
  def next_step
    data = self.load_step
    @map = game.load_map
    if data != nil && data != ""
      # Process the next step of this user
      data.each do |ant|
        if @map[ant["x"]][ant["y"]] == self.player_id
          # if x and next don't have to much difference'
          @map[ant["x"]][ant["y"]]=" "
          @map[ant["nextx"]][ant["nexty"]] = self.player_id
          # end
        end
        # reset his buffer
        self.reset_step
      end
    end
    game.store_map(@map)
  end
  
  def los
    @map = self.game.load_map
    return @map
    positions = self.positions
    sizex = positions.count
    sizey = positions[0].count
    fieldje = Array.new(self.game.sizex) {Array.new(self.game.sizey,"?")}
    positions.each do |pos|
      
      counter=pos.first - 2
      5.times do
        counter2=pos.last - 2
        5.times do 
          # fieldje[counter % self.game.sizex][counter % self.game.sizex] = @map[counter % self.game.sizey][counter % self.game.sizey]
          fieldje[counter % self.game.sizex][counter % self.game.sizex] = "#"
          counter2 += 1
        end
        counter += 1
      end
    end
    # return positions << fieldje
  end
  
  def reset_step
    file = "public/data/map#{self.game.id.to_s}-user#{self.user.id.to_s}.data"
    File.open(file, 'w+') do |f|  
      Marshal.dump("", f)  
    end
  end
  
  def load_step
    file = "public/data/map#{self.game.id.to_s}-user#{self.user.id.to_s}.data"
    File.open(file) do |f|  
      @data = Marshal.load(f)  
    end
    return @data
  end
  
  def store_step(data)
    file = "public/data/map#{id.to_s}-user#{user.id.to_s}.data"
    File.open(file) do |f|  
      @next = Marshal.load(f)  
    end
    if @next == nil || @next == ""
      File.open(file, 'w+') do |f|  
        Marshal.dump(data, f)  
      end
    end
  end
end
