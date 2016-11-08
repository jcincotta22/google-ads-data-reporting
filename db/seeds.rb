# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
accounts = ['paint-night', 'apple', 'google', 'IBM']
campaigns = ['first', 'second', 'third', 'fourth', 'fifth']
ad_groups = ['paint-night1', 'apple1', 'google1', 'IBM1']
paint_night_keywords = ['drink', 'paint', 'eat', 'fun']
apple_keywords = ['iphone', 'tech', 'mac', 'computers']
google_keywords = ['search', 'big company', 'data']
ibm_keywords = ['computers', 'large company', 'technology']
match_type = ['blah', 'other', 'whatever']
device = ['mobile', 'tablet', 'desktop']
click_type = ['blach', 'other', 'whatever']
oct_date = ['10-30-2016', '10-31-2016', '10-1-2016', '10-2-2016', '10-4-2016',
            '10-5-2016', '10-6-2016', '10-7-2016', '10-8-2016', '10-9-2016',
            '10-10-2016', '10-11-2016', '10-12-2016', '10-13-2016', '10-14-2016','10-1-2016',
            '10-15-2016', '10-16-2016', '10-17-2016', '10-18-2016', '10-19-2016', '10-20-2016',
            '10-21-2016', '10-22-2016', '10-23-2016','10-24-2016','10-25-2016']
week = ['week 1', 'week 2', 'week 3', 'week 4']

n = 0
while n < 26 do
  GoogleData.create(
    account: accounts.first,
    campaign: campaigns.first,
    ad_group: ad_groups.first,
    keyword: paint_night_keywords.sample,
    match_type: match_type.sample,
    click_type: click_type.sample,
    date: oct_date[n],
    week: week.sample,
    month: '10-1-2016',
    device: device.sample,
    impressions: rand(5_000),
    clicks: rand(2_000) + 1,
    conversions: rand(100),
    average_position: rand(50),
    cost: rand(5_000) + 10,
    search_impression_share: rand(50)
  )
  n+=1
end

n = 0
while n < 26 do
  GoogleData.create(
    account: accounts[1],
    campaign: campaigns[1],
    ad_group: ad_groups[1],
    keyword: apple_keywords.sample,
    match_type: match_type.sample,
    click_type: click_type.sample,
    date: oct_date[n],
    week: week.sample,
    month: '10-1-2016',
    device: device.sample,
    impressions: rand(5_000),
    clicks: rand(2_000) + 1,
    conversions: rand(100),
    average_position: rand(50),
    cost: rand(5_000) + 10,
    search_impression_share: rand(50)
  )
  n+=1
end

n = 0
while n < 26 do
  GoogleData.create(
    account: accounts[2],
    campaign: campaigns[2],
    ad_group: ad_groups[2],
    keyword: google_keywords.sample,
    match_type: match_type.sample,
    click_type: click_type.sample,
    date: oct_date[n],
    week: week.sample,
    month: '10-1-2016',
    device: device.sample,
    impressions: rand(5_000),
    clicks: rand(2_000) + 1,
    conversions: rand(100),
    average_position: rand(50),
    cost: rand(5_000) + 10,
    search_impression_share: rand(50)
  )
  n+=1
end

n = 0
while n < 26 do
  GoogleData.create(
    account: accounts[3],
    campaign: campaigns[3],
    ad_group: ad_groups[3],
    keyword: ibm_keywords.sample,
    match_type: match_type.sample,
    click_type: click_type.sample,
    date: oct_date[n],
    week: week.sample,
    month: '10-1-2016',
    device: device.sample,
    impressions: rand(5_000),
    clicks: rand(2_000) + 1,
    conversions: rand(100),
    average_position: rand(50),
    cost: rand(5_000) + 10,
    search_impression_share: rand(50)
  )
  n+=1
end
