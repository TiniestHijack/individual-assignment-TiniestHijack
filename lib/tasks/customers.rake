namespace :customers do
  desc "create customers using faker that will be attached to movies"
  task seed_customers: :environment do
  

    #drop the old table to avoid problems in importing new values
    Payment.destroy_all
    CreditCard.destroy_all
    Address.destroy_all
    Purchase.destroy_all
    Customer.destroy_all

    p "tables emptied"

    #create customers, edit number here for increased or decreased random customers
    500.times do |index |
      Customer.create!(
        first_name:Faker::Name.first_name,
        last_name:Faker::Name.last_name,
      )
    end

    #give each customer an address and credit card
    customers = Customer.all
    customers.each do | customer |
      Address.create!(
        street:Faker::Address.street_address,
        city:Faker::Address.city,
        postcode:Faker::Address.postcode,
        customer_id: customer.id
      )
      year = [2020, 2021, 2022, 2023]
      organisations = ["American Express","Visa","MasterCard"]
      CreditCard.create!(
        customer_id: customer.id,
        number:Faker::Number.number(digits: 12),
        exp_date:year.sample.to_s + "/" + Faker::Number.between(from: 1, to: 12).to_s,
        name_on_card: customer.first_name + " " + customer.last_name,
        organisation: organisations.sample.to_s
      )
    end

    p "customers created"

    #give random customers purchases of movies, either rented or bought
    #increase number here to change how many total random purchases are made
    movies = Movie.all
    900.times do |index|
      type_choices = ["Rent","Buy"]
      Purchase.create!(
        ownership: type_choices.sample.to_s,
        movie_id: movies.sample.id,
        customer_id: customers.sample.id
      )
    end

    purchases = Purchase.all
    purchases.each do | pur |
      if pur.ownership == "Rent"
        price = 2.00
      else
        price = 10.00
      end
      this_customer = Customer.find(pur.customer.id)
      credit_cards = this_customer.credit_cards
      Payment.create!(
        amount: price,
        credit_card_id: credit_cards.sample.id,
        customer_id: pur.customer_id,
        purchase_id: pur.id
      )
    end

    p "purchases created without payments attached"

  end
end
