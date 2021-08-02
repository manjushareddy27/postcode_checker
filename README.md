# postcode_checker
Your customer would like a simple web application to work out if a given postcode is within their
service area.
Create a form where the input is a UK postcode. When submitting the form, the response should
tell the user if the postcode is allowed or not. There’s no need to add any styling.

# Requirements
We are using the Postcodes.io REST API as our source for data. The service area is described by
the following rules:
1. Postcodes are grouped into larger blocks called LSOAs. This is returned from the API
when we query a postcode. We want to allow any postcode in an LSOA starting
"Southwark" or "Lambeth". Example postcodes for these LSOAs are SE1 7QD and SE1
7QA respectively.
2. Some postcodes are unknown by the API or may be served despite being outside of the
allowed LSOAs. We need to be able to allow these anyway, even though the API does not
recognise them. SH24 1AA and SH24 1AB are both examples of unknown postcodes that
we want to serve.
3. Any postcode not in the LSOA allowed list or the Postcode allowed list is not servable.
Please note that no guarantees about the format of the input can be given, and the allowed lists
will need to be changed from time to time.

Setup:

To run the script you must have

Ruby 3.0.1
Git
Sinatra

Running Script
Navigate to directory where the script is located

```$ cd ~/postcode_checker```


Ensure gems installed by running

```bundle install```

Run the script by using below command

```bundle exec rackup```

Open a web page using below URL

'https://server_IP/9292'  (server_IP: your local ip address)

You can enter your postcode on search field and click on validate button on web page to check whether the postcode within service area.

Running Tests
Navigate to directory where the script is located

```$ cd ~/postcode_checker```

Run tests by running

```$ bundle exec rspec spec```

Notes & Explanations
CODE:

* My approach was to take the simplest approach that could then be extended and improved upon.
* The first step was to decouple the code that does calling lib/postcode_checker.rb from Sinatra request methods, that calls after click on validate button on web page through the javascript fetchAPI. This allows the (lib/postcode_checker.rb) to be reusable. I have also attempted to DRY-up my code where possible.

TESTING:

* Regarding testing, the idea was to simply "black box" the public methods. By feeding data into a method and only testing the output, rather than how we get to the output, it allows us to completely refactor our code without having to change our tests.

EXTENDING:

The code can be extended to include more restrictions/test cases (i.e. It could allow user to pass custom lsoa Postcodes or upload custom yaml files instead of using static service_areas.yaml ).


Thank you for taking your time to review my code.
