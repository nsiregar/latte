## Latte

Codementor data scraper

### Usage

You can use code directly from terminal with command

```sh
bin/latte https://www.codementor.io/@kristianskuhta
```

Which will return parsed json value

```json
{
  "first_name": "Kristians",
  "last_name": "Kuhta",
  "about": "Passionate full-stack Ruby on Rails developer with 5 years of experience.\nStrong background in the development of internal systems that allow businesses to orient their operations around digital documents rather than physical ones.\nI have 5 years of experience in Ruby on Rails, JavaScript, PostgreSQL.\nI specialise in enterprise-level Code Reviews and Integration testing.\nAs well as I have worked with technologies like:\n\nTest-driven development\nRSpec testing framework\nCapybara feature testing framework\nJest\nREST APIs\nRedis database\nDocker\njQuery\nStimulusJS\nTurbo.js, Hotwire\nReact\n\n",
  "languages": [
    "Latvian",
    "English"
  ],
  "timezone": "Riga (+03:00)",
  "expertises": [
    {
      "name": "Ruby on Rails"
    },
    {
      "name": "Ruby"
    },
    {
      "name": "JavaScript"
    },
    {
      "name": "Solidity"
    },
    {
      "name": "Ethereum"
    },
    {
      "name": "Web3js"
    },
    {
      "name": "RSpec"
    }
  ]
}
```

Or by call it via code with

```ruby
require 'latte'

# Initialize a scraper instance

profile = Latte::UserProfile.new("https://www.codementor.io/@kristianskuhta")

# With a http web-proxy:

profile = Latte::UserProfile.new("https://www.codementor.io/@kristianskuhta", { proxy_ip: '127.0.0.1', proxy_port: '3128', username: 'user', password: 'pass' })

# It's also possible to set number of seconds to wait for the connection to open.
# Scraper will throw exception after given timeout. E. g. to set two seconds long timeout
# pass `open_timeout: 2` in options. Defaults to 60 seconds.

profile = Latte::UserProfile.new("https://www.codementor.io/@kristianskuhta", {open_timeout: 2 })

# The returning object responds to the following methods


profile.first_name          # The first name of the contact

profile.last_name           # The last name of the contact

profile.about               # About me of the contact

profile.languages           # Languages of the contact

profile.timezone            # Timezone of the contact

profile.expertises          # Expertises of the contact
```

