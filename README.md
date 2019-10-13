# GRAPHQL-RUBY Training Ground

Simply working code, real examples 

Wishlist

-[x] Standard Rails setup (followed https://github.com/rubynor/rails-setup)

-[x] Simple queries

-[x] Complex relation with *habtm* models

-[x] Example Data Leak
-[ ] Example No Leak
-[ ] Example DB-Optimized nested queries

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
    
THE LEAK. "companyId": "2" entry shouldn't be there, we are fetching data in context of company 1.
   
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