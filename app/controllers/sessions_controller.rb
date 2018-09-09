class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    github = GithubService.new()
    session[:token] = github.authenticate!(ENV["GITHUB_CLIENT"], ENV["GITHUB_SECRET"], params[:code])
    #raise github.inspect
    #username = github.get_username
    #raise username.inspect
    redirect_to '/'
  end
end

### LEARN ABOUT :CODE IN OAUTH FLOW ###