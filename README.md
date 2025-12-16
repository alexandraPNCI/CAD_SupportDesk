# README
Alexandra Phelan - x20245823
SupportDesk – Ticket Management System

SupportDesk is a simple support ticket management application built with Ruby on Rails.
Users can create and track support tickets, comment on them, and manage their workflow.
Admins have full control, including access to a custom analytics dashboard.

This project was created for my CAD module and includes authentication, authorisation, analytics, and RSpec testing.

# Features

# User Accounts (Devise)

Register, log in, log out

Normal users can create/manage their own tickets

Admins can manage all tickets

# Ticket Management

Create, edit, delete tickets

Each ticket includes:

Title

Description

Priority

Status

# Comments

Users can comment on tickets

Users can delete their own comments

Admins can delete any comment

# Admin Analytics Dashboard

A custom analytics module showing:

Total number of tickets

Tickets by priority

Tickets by status

Tickets created per day

Average ticket age

Built as a reusable library inside /lib/ticket_analytics.rb.

# Tech Stack

Ruby on Rails 8

SQLite3 (development)

Devise (authentication)

Pundit (authorisation)

Bootstrap 5

RSpec (testing)

Render (deployment)

# Installation

Clone the repository:

git clone https://github.com/alexandraPNCI/CAD_SupportDesk.git
cd support_desk


Install dependencies:

bundle install


Set up the database:

rails db:create
rails db:migrate


Run the server:

rails s


Visit:

http://localhost:3000

# User Roles

Normal User

Can create tickets

Can comment

Can edit/delete their own tickets

Cannot access analytics

Admin

Can edit/delete any ticket

Can delete any comment

Can view Analytics Dashboard

# Analytics Library

A custom analytics module located at:

/lib/ticket_analytics.rb


It provides methods such as:

TicketAnalytics.total_tickets
TicketAnalytics.tickets_by_priority
TicketAnalytics.tickets_by_status
TicketAnalytics.tickets_per_day
TicketAnalytics.average_ticket_age


Used in:

/app/controllers/analytics_controller.rb


Displayed in:

/app/views/analytics/show.html.erb

# Testing

RSpec tests included for:

TicketPolicy

CommentPolicy

Run tests:

bundle exec rspec


All current tests pass 

# Deployment

Deployed using Render, following the setup:

Rails build steps

Post-deploy migrations

Correct Ruby version

Environment variables

The deployed version was used for the required demo video.

Notes

This project includes everything required for the CAD brief:

Authentication

Authorisation

CRUD functionality

A custom library

Automated tests

Cloud deployment

What I Learned

How to build and deploy a Rails application

How authentication + authorization work together

Structuring a Rails library under /lib

Writing RSpec tests

Debugging (A LOT of debugging)

Using GitHub for version control and documentation