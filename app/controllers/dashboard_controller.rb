class DashboardController < ApplicationController
  def show
    @chores = Chore.incomplete
    @children = Child.all
  end
end