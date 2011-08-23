# all generators

rails generate

    controller
    generator
    helper
    integration_test
    mailer
    migration
    model
    observer
    performance_test
    plugin
    resource
    scaffold
    scaffold_controller
    session_migration
    stylesheets

# scaffolds

creates model/view/controller/test

    rails g scaffold User id:integer token:string
    rake db:migrate

# models

    rails g model User id:integer token:string

# controllers

creates controller/views/helpers

    rails g controller CreditCard open debit credit close 
    
# migrations

    rails g migration AddPartNumberToProducts part_number:string
    
    