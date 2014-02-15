class ApiController < ApplicationController
  before_filter :load_game
  before_filter :bootstrap, :only => [:screen]
  
  skip_before_action :verify_authenticity_token

  def enter
    load_ship
    
    @game.add_ship @ship
    
    save_and_render_status @ship
  end
  
  def exit
    load_ship
    
    @game.remove_ship @ship
    
    save_and_render_status @ship
  end

  def refresh
    @game.simulate_step
    
    save_and_render_status @game
  end
  
  def fetch
    
  end

  def update
    load_ship
    
    @ship.velocity_x = params[:ship][:main_acceleration]
    @ship.velocity_y = params[:ship][:side_acceleration]
    @ship.turn_rate = params[:ship][:turn_rate]
    
    save_and_render_status @ship
  end

  def screen
    load_ship if params[:ship_id].present?
  end

private
  def load_game
    @game = Game.find_by_api_key params[:game_id]
  end

  def load_ship
    @ship = SpaceShip.find_by_api_key params[:ship_id]
  end
  
  def bootstrap
    Game.create api_key:1, step_count:0 if Game.count == 0
    
    if Meteorit.count == 0
      10.times do |i|
        Meteorit.create!(api_key:-1, game_id:1, name:"Meteorit #{i}",
          position_x:random.rand(0..10),
          position_y:random.rand(0..10),
          velocity_x:random.rand(0..10),
          velocity_y:random.rand(0..10),
          turn_velocity:random.rand(0..10),
          rotation:random.rand(0..360)
        )
      end
    end
    
    if SpaceShip.count == 0
      SpaceShip.create!(api_key:1, game_id:0, name:"SpaceShip #{1}",
        position_x:random.rand(0..10),
        position_y:random.rand(0..10),
        velocity_x:0,
        velocity_y:0,
        turn_velocity:0,
        rotation:0
      )
    end
  end
  
  def save_and_render_status record
    if record.save
      respond_to do |format|
         format.html { render "OK" }
         format.xml  { render xml: "OK"}
         format.json { render json: "OK"}
      end
    else
      respond_to do |format|
         format.html { render "Error: #{record.errors}" }
         format.xml  { render xml: record.errors}
         format.json { render json: record.errors}
      end
    end
  end
  
  def random
    @random ||= Random.new
  end

end
