# PlusOrMinus

**PlusOrMinus** is a simple Ruby gem that extends `Time`, `DateTime`, `Date` and `Numeric` with convenient range methods for adding and subtracting values.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plus_or_minus'
```

And then execute `bundle install`

Or, install it manually with `gem install plus_or_minus`

## Usage

```ruby
require "plus_or_minus"

# Numeric
5.plus_or_minus(2) # => (3..7)
5.plus_upto(2) # (5..7)
5.minus_upto(2) # (3..5)

# Time
time = Time.now
time.plus_or_minus(3600) # => (time - 1.hour)..(time + 1.hour)
time.plus_upto(86400) # => time..(time + 1.day)
time.minus_upto(86400) # => (time - 1.day)..time

# DateTime
date = DateTime.now
date.plus_or_minus(1) # => (date - 1.day)..(date + 1.day)
date.plus_upto(3) # => date..(date + 3.days)
date.minus_upto(3) # => (date - 3.days)..date
```

## Rails

If you're using Rails, PlusOrMinus works beautifully with ActiveRecord queries and Rails' time helpers:

```ruby
# Fetch users created within the last hour
User.where(created_at: Time.current.minus_upto(1.hour))

# Fetch events happening within ±3 days from today
Event.where(start_time: Date.today.plus_or_minus(3.days))

# Find orders with a deadline in the next 2 weeks
Order.where(due_date: Date.today.plus_upto(2.weeks))

# Fetch logs recorded within 5 minutes of a specific timestamp
Log.where(timestamp: some_time.plus_or_minus(5.minutes))
```

## License

This gem is available as open-source under the MIT License.

