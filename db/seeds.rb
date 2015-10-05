# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Agent.create(name: "Sportsbet", url: "http://www.sportsbet.com.au/content/page/offers?MegaNav&Tabs", title_select: ".hdr a", info_select: ".content")
Agent.create(name: "Ladbrokes", url: "https://www.ladbrokes.com.au/promotions/", title_select: ".promotional-offer h2 a", info_select: ".promotional-offer p+ p")
Agent.create(name: "Ubet", url: "https://ubet.com/promotions", title_select: ".promotional-content h3", info_select: ".promotional-content p")
Agent.create(name: "Crownbet", url: "https://crownbet.com.au/promotions", title_select: ".promotion-item .title", info_select: "#middle-container .hidden-xs")
Agent.create(name: "William Hill", url: "https://www.williamhill.com.au/Home/GetPromoOffers", title_select: "h4 a", info_select: ".promo-content")
Agent.create(name: "Luxbet", url: "https://www.luxbet.com/staticcontent/promotions.html", title_select: ".boxHeader", info_select: ".boxContent")
Agent.create(name: "Unibet", url: "https://www.unibet.com.au/promotions", title_select: ".headline", info_select: ".article")