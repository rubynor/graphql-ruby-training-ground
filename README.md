<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [GRAPHQL-RUBY Training Ground](#graphql-ruby-training-ground)
  - [Test for yourself](#test-for-yourself)
  - [Examples](#examples)
    - [Data leak - Example](#data-leak---example)
    - [No Leak - Example](#no-leak---example)
    - [DB-Optimization](#db-optimization)
- [Contribution](#contribution)
- [License](#license)
- [About Rubynor](#about-rubynor)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# GRAPHQL-RUBY Training Ground

Simply working code, real examples 

Wishlist

 - [x] Standard Rails setup (followed https://github.com/rubynor/rails-setup)
 - [x] Simple queries
 - [x] Complex relation with *habtm* models
 - [x] Example Data Leak
 - [ ] Example No Leak
 - [ ] Example DB-Optimized nested queries

## Test for yourself

    bundle
    cp config/database.yml.sample config/database.yml
    rails db:setup
    foreman s
    #localhost:3000
    # sign in with ole@example.com pwd dummy123

## Examples

### Data leak - Example

Implementation with query leaking data

    query {
      companyLeak(id: "1") {
        id
        name
        transactionLogs {
          id
          companyId
          activityAt
        }
        accountants {
          id
          name
          transactionLogs {
            id
            companyId
            activityAt
          }
        }
      }
    }

response

    {
      "data": {
        "companyLeak": {
          "id": "1",
          "name": "AwesomeCo",
          "transactionLogs": [
            {
              "id": "1",
              "companyId": "1",
              "activityAt": "2019-10-12 14:44:21 UTC"
            }
          ],
          "accountants": [
            {
              "id": "1",
              "name": "Mr. Smith",
              "transactionLogs": [
                {
                  "id": "1",
                  "companyId": "1",
                  "activityAt": "2019-10-12 14:44:21 UTC"
                },
                {
                  "id": "2",
                  "companyId": "2",
                  "activityAt": "2019-10-11 14:44:21 UTC"
                }
              ]
            }
          ]
        }
      }
    }
    
THE LEAK. `"companyId": "2"`
 
Transaction log of company 2 shouldn't show in the item of company 1...

The problem is that it's not doing the db query with company_id = 1.
   
The same happens if you do `companies`, one company listed will show transaction_log of other company    
        
### No Leak - Example
    
TO DO. https://stackoverflow.com/questions/58363666/graphql-ruby-scoping-in-habtm-data-leak-in-nested-query

### DB-Optimization

TO DO. Need some good skillz here

# Contribution

Create PR :-)

# License

MIT license, not that you should be using this repo for anything beyond training :D 

# About Rubynor

We do startups. Ruby, Norway. http://rubynor.com Yep :-)
