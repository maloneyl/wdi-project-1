class WelcomeController < ApplicationController

  def index # will need to accommodate users who are logged in too so it's not just 'sign up!!!oeoneoen'
    @latest_music = Music.last
  end

end
