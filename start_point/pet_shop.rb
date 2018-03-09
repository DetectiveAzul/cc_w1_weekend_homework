#Returns the :name value for a petshop. Input is a pet_shop hash.
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

#Return the total cash the admin of a petshop has. Input is a pet_shop hash.
def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

#We create a method that takes a Hash, and a change to the total amount of
# the money as arguments. Then it adds or remove this amount of money.

def add_or_remove_cash(pet_shop, amount_change)
  pet_shop[:admin][:total_cash] += amount_change
  pet_shop[:admin][:total_cash] = 0 if pet_shop[:admin][:total_cash] <= 0
end

# This method would check how many pets the petshop has sold. Argument: pet_shop hash.

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# This method takes two arguments, the petshop hash and the amount of pets sold
# we want to add to the pets_sold key

def increase_pets_sold(pet_shop, pet_sold_increase)
  pet_shop[:admin][:pets_sold] += pet_sold_increase
  #This line is to check that if the variable pet_sold_increase is negative
  #the amount will not go under 0.
  pet_shop[:admin][:pets_sold] = 0 if pet_shop[:admin][:pets_sold] <= 0
end

#This method checks how many pets we have inside the pet array form the
#pet_shop hash.
def stock_count(pet_shop)
  return pet_shop[:pets].length
end

#This method would return an array of pets found by breed. Arguments are
#a pet_shop hash and a string with the breed of the peet.

def pets_by_breed(pet_shop, breed)
  pets_found = []
  for pet in pet_shop[:pets]
    pets_found.push(pet) if pet[:breed] == breed
  end
  return pets_found
end

#This method takes two arguments: the pet_shop hash and a string with
#the name of a pet. It will return the pet if it is found inside the array.
#If not, returns nil.

def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

#This methods takes two arguments. The Pet_shop hash and the name of
#a pet to remove. If he finds the pet, he remove it from the array.
#It does not return.

def remove_pet_by_name(pet_shop, pet_name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop,pet_name))
end

#This method takes two arguments, the pet_shop hash and a new pet hash,
#It will add the new pet to the pets array inside of pet_shop hash.
#It does not return.

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

#This method takes one argument, a customer hash, and returns the count
#of pets

def customer_pet_count(customer)
  return customer[:pets].length
end

#This method takes two arguments, a customer hash, and a pet hash. It will
#add the pet to the pets array of the customer. Do not returns.

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

  #################### OPTIONAL #############################

# This method takes two arguments, a customer hash and a pet hash.
#It will return true or false depending if the customer
# can afford the desired pet or not.

def customer_can_afford_pet(customer, new_pet)
  return true if customer[:cash] >= new_pet[:price]
  return false
end

def add_or_remove_customer_cash(customer, amount_change)
  customer[:cash] += amount_change
  pet_shop[:cash] = 0 if customer[:cash] <= 0
end
#This methods takes three arguments, the pet_shop hash, a pet_hash, and the
#customer that want to buy the customer. It need to take in consideration:
# a) The pet must be found
# b) The customer need to have enough money
# c) It needs to: add the pet to the customer pets array, update the
# =>  count of pets sold, and update the cash inside of the shop

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet)
    add_or_remove_customer_cash(customer, -(pet[:price]))
    add_pet_to_customer(customer, pet)
    add_or_remove_cash(pet_shop, pet[:price])
    increase_pets_sold(pet_shop, 1)
    remove_pet_by_name(pet_shop,pet[:name])
  end
end
