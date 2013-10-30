CrapCrud::Application.routes.draw do
  resources :persons  #does the exact same as all below
  # if using a GET it will usually return a HTML, nulipotent, doens't change!
  # if POST PUT PATCH DELETE, it will usually redirect to a get; itempotent makes changes! 

  ##### FOR JSON API
  # resources :persons, except: [:new, :edit]


 root 'persons#index'
 #  get 'persons' => 'persons#index'  # list all person # gets are nulipotent, doesn't change anything, safe, only gets
 #  get 'persons/new' => 'persons#new' #form to add a new person
 # # new needs to be before :id, it thinks new is the id!
 #  get 'persons/:id' =>  'persons#show' #name of collection passing in an id  #show one person

  
 #  get 'persons/:id/edit' => 'persons#edit' #form to edit person

 #  post 'persons' => 'persons#create' #create a new person, ust like p = Person.new?
 #  put 'persons/:id' => 'persons#update' #update a person
 #  patch 'persons/:id' => 'persons#update' #update an attribute of a person
 #  delete 'persons/:id' => 'persons#destroy' #delete a person, delete from a db, objects get destroyed
end


# the prefix in rake routes are the url paths! root_url, persons_url