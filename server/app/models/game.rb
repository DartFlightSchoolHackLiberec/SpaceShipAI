class Game < ActiveRecord::Base
	has_many :sprites
	
	def add_meteoroid meteoroid
		add_sprite meteoroid
	end
	
	def remove_meteoroid meteoroid
		remove_sprite remove_sprite
	end
	
	def add_ship ship
		add_sprite ship
	end
	
	def remove_ship ship
		remove_sprite ship
	end
	
	def simulate_step
		@step_count += 1
		
		sprites.each do |s|
			s.update_sprite
		end
	end
	
private
	def add_sprite sprite
		sprite.game = self
	end
	
	def remove_sprite sprite
		sprite.game = nil
	end

end
