# Project Introduction

Jungle is mini e-commerce application for selling products online. It allows visitor to visit the site to see all products, view indivdual product details and add them to a cart. User is able to view the cart contents before checking out using credit card through Stripe Payment API. User is also able to view the Order Summary after order is placed. Copy of the order reciept is emailed directly to the user using MailGun mailer api. User can also register & login to save order history.

Administrators are able to login and create new products, categories etc along with option to view dashboard etc.

Screenshots

## Home Page

![Home Page](https://raw.githubusercontent.com/letsandeepio/jungle-rails/master/screenshots/homepage.png)

## User Cart

![User Cart](https://raw.githubusercontent.com/letsandeepio/jungle-rails/master/screenshots/cart.png)

## Admin Page

![Admin Page](https://raw.githubusercontent.com/letsandeepio/jungle-rails/master/screenshots/admin-product.png)

## Signup page

![Signup page](https://raw.githubusercontent.com/letsandeepio/jungle-rails/master/screenshots/signup-page.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Sign up for a mailgun account
9. Put Mailgun keys into appropriate .env vars
10. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- Mailgun
