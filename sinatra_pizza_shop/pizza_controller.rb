require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order.rb' )
also_reload( './models/*')

# INDEX
get('/pizza-orders') do
  @orders = PizzaOrder.all()
  erb( :index )
end

# NEW
get('/pizza-orders/new') do
  erb( :new )
end

# SHOW
get('/pizza-orders/:id') do
  @order = PizzaOrder.find(params[:id].to_i)
  erb( :show )
end

#CREATE
post('/pizza-orders') do
  @order = PizzaOrder.new(params)
  @order.save()
  erb ( :create )
end

# DELETE
post('/pizza-orders/:id/delete') do
  pizza = PizzaOrder.find(params[:id].to_i)
  pizza.delete()
  redirect('/pizza-orders')
end

# EDIT
get('/pizza-orders/:id/edit') do
  @order = PizzaOrder.find(params[:id].to_i)
  erb( :edit )
end

#UPDATE
post('/pizza-orders/:id') do
  @order = PizzaOrder.new(params)
  @order.update()
  erb( :update )
end
