#objective: Youtube top players
#1a. top continent in the YT space: views, uploads, earnings, subscriptions 
-- SELECT 
-- 	Case
-- 		when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
--         "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
--         "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
--         "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
--         "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'
--         
-- 		when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
--          "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
--         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'
--         
-- 		when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
--          "Uruguay","Venezuela") then 'South_America'
--          
-- 		when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
--          "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania'
--     
-- 		when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
--           "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
--           "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
--           "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
--           "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
--          "Ukraine","United Kingdom","Vatican City") then 'Europe'
--     
-- 		when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
--           "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
--           "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
--           "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
--           "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
--           "South Sudan","Sudan","Tanzania","Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'
--     
-- 	end as Continents,

-- 	sum(uploads) as total_uploads,
-- 	sum(subscribers) as total_subscribers,
-- 	sum(`video views`) as total_views,
--     round(sum(highest_yearly_earnings),0) as total_earnings,
--     count(Youtuber) as num_of_youubers
--     
-- From yt_data.`global youtube statistics`
-- Group by Continents
-- order by 5 desc;

#1b. % of pay per continent 
-- with pct_earnings as (
-- SELECT 
-- 	Case
-- 		when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
--         "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
--         "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
--         "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
--         "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'
--         
-- 		when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
--          "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
--         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'
--         
-- 		when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
--          "Uruguay","Venezuela") then 'South_America'
--          
-- 		when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
--          "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania'
--     
-- 		when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
--           "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
--           "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
--           "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
--           "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
--          "Ukraine","United Kingdom","Vatican City") then 'Europe'
--     
-- 		when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
--           "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
--           "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
--           "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
--           "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
--           "South Sudan","Sudan","Tanzania","Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'
--     
-- 	end as Continents,
--     round(sum(highest_yearly_earnings),0) as total_earnings
--     
-- From yt_data.`global youtube statistics`
-- Group by Continents
-- order by total_earnings desc)

-- select 
-- 	sum(total_earnings) as all_continent_earnings,
--     round(1.0*sum(case when continents = 'Asia' then total_earnings else 0 end) / nullif (sum(total_earnings),0)*100,2) as pct_earnings_asia,
--     round(1.0*sum(case when continents = 'North_America' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_north_america,
-- 	round(1.0*sum(case when continents = 'South_America' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_south_america,
-- 	round(1.0*sum(case when continents = 'Europe' then total_earnings else 0 end) / nullif (sum(total_earnings),0)*100,2) as pct_earnings_europe,
--     round(1.0*sum(case when continents = 'Australia_and_Oceania' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_australia_and_oceania,
-- 	round(1.0*sum(case when continents = 'Africa' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_africa
--  
--  from pct_earnings
-- ;

# 1bb. add up the percentage value of all continent column
-- with pct_table as (
-- 	with pct_earnings as (
-- SELECT 
-- 	Case
-- 		when Country in ("Afghanistan","Armenia","Azerbaijan","Bahrain","Bangladesh", "Bhutan","Brunei","Cambodia","China","Cyprus",
--         "Georgia","India","Indonesia","Iran","Iraq","Israel","Japan","Jordan","Kazakhstan","Kuwait","Kyrgyzstan","Laos",
--         "Lebanon","Malaysia","Maldives","Mongolia","Myanmar","Nepal","North Korea","Oman","Pakistan","Palestine","Philippines",
--         "Qatar","Russia","Saudi Arabia","Singapore","South Korea","Sri Lanka","Syria","Taiwan","Tajikistan","Thailand",
--         "Timor-Leste","Turkey","Turkmenistan","United Arab Emirates","Uzbekistan","Vietnam","Yemen") then 'Asia'
--         
-- 		when Country in ("Antigua and Barbuda","Bahamas","Barbados","Belize","Canada","Costa Rica","Cuba","Dominica",
--          "Dominican Republic","El Salvador","Grenada","Guatemala","Haiti","Honduras","Jamaica","Mexico",
--         "Nicaragua","Panama","Saint Vincent and the Grenadines","United States") then 'North_America'
--         
-- 		when Country in ("Argentina","Bolivia","Brazil","Chile","Colombia","Ecuador","Guyana","Paraguay","Peru","Suriname",
--          "Uruguay","Venezuela") then 'South_America'
--          
-- 		when Country in ("Australia","Fiji","Kiribati","Marshall Islands","Micronesia","Nauru","New Zealand","Palau",
--          "Papua New Guinea","Samoa","Solomon Islands","Tonga","Tuvalu","Vanuatu") then 'Australia_and_Oceania'
--     
-- 		when Country in ("Albania","Andorra", "Armenia","Austria","Azerbaijan","Belarus","Belgium","Bosnia and Herzegovina",
--           "Bulgaria","Croatia","Cyprus","Czechia","Denmark","Estonia","Finland","France","Georgia","Germany",
--           "Greece","Hungary","Iceland","Ireland","Italy","Kazakhstan","Kosovo","Latvia","Liechtenstein","Lithuania",
--           "Luxembourg","Malta","Moldova","Monaco","Montenegro","Netherlands","Macedonia, FYR","Norway","Poland","Portugal",
--           "Romania","Russia","San Marino","Serbia","Slovakia","Slovenia","Spain","Sweden","Switzerland","Turkey",
--          "Ukraine","United Kingdom","Vatican City") then 'Europe'
--     
-- 		when Country in ("Algeria","Angola","Benin","Botswana","Burkina Faso","Burundi","Cabo Verde","Cameroon","Central African Republic",
--           "Chad","Comoros","Congo, Dem. Rep", "Congo, Rep.","Cote d'Ivoire","Djibouti","Egypt","Equatorial Guinea","Eritrea",
--           "Eswatini (formerly Swaziland)","Ethiopia","Gabon","Gambia","Ghana","Guinea","Guinea-Bissau","Kenya", "Lesotho",
--           "Liberia",'Libya',"Madagascar","Malawi","Mali","Mauritania","Mauritius","Morocco","Mozambique","Namibia",
--           "Niger","Nigeria","Rwanda","Sao Tome and Principe","Senegal","Seychelles","Sierra Leone","Somalia","South Africa",
--           "South Sudan","Sudan","Tanzania","Togo","Tunisia","Uganda","Zambia","Zimbabwe") then 'Africa'
--     
-- 	end as Continents,
--     round(sum(highest_yearly_earnings),0) as total_earnings
--     
-- From yt_data.`global youtube statistics`
-- Group by Continents
-- order by total_earnings desc)

-- select 
-- 	sum(total_earnings) as all_continent_earnings,
--     round(1.0*sum(case when continents = 'Asia' then total_earnings else 0 end) / nullif (sum(total_earnings),0)*100,2) as pct_earnings_asia,
--     round(1.0*sum(case when continents = 'North_America' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_north_america,
-- 	round(1.0*sum(case when continents = 'South_America' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_south_america,
-- 	round(1.0*sum(case when continents = 'Europe' then total_earnings else 0 end) / nullif (sum(total_earnings),0)*100,2) as pct_earnings_europe,
--     round(1.0*sum(case when continents = 'Australia_and_Oceania' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_australia_and_cceania,
-- 	round(1.0*sum(case when continents = 'Africa' then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as pct_earnings_south_africa
--  
--  from pct_earnings )
--  
--  select 
-- 	pct_earnings_asia + pct_earnings_north_america + pct_earnings_south_america + pct_earnings_europe + pct_earnings_australia_and_cceania + pct_earnings_south_africa as Total_pct

-- from pct_table ;


#1c. Top 8 countries, % pay

-- with earning_number as (
-- select 
--     Country,
--     round(sum(highest_yearly_earnings),0) as total_earnings 
-- from yt_data.`global youtube statistics`
-- group by Country 
-- order by total_earnings desc
-- limit 8)

-- select 
-- sum(total_earnings) as all_countries_earnnings,
-- round(sum(case when Country = "United States" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as US_pct_earn,
-- round(sum(case when Country = "India" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as India_pct_earn,
-- round(sum(case when Country = "Brazil" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as Brazil_pct_earn,
-- round(sum(case when Country = "South Korea" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as South_Korea_pct_earn,
-- round(sum(case when Country = "United Kingdom" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as United_Kingdom_pct_earn,
-- round(sum(case when Country = "Pakistan" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as Pakistan_pct_earn,
-- round(sum(case when Country = "Argentina" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as Argentina_pct_earn,
-- round(sum(case when Country = "Russia" then total_earnings else 0 end) / nullif(sum(total_earnings),0)*100,2) as Russia_pct_earn

-- from earning_number;

-- United States
-- India
-- Brazil
-- South Korea
-- United Kingdom
-- Pakistan
-- Argentina
-- Russia

#1d. Top 8 channel types, % views;


	
select 
		channel_type,
		sum(`video views`) as total_views

	from `global youtube statistics`
	group by channel_type
	order by total_views desc
	limit 8
    
with channel_view_number as (
    select 
		channel_type,
		sum(`video views`) as total_views

	from `global youtube statistics`
	group by channel_type
	order by total_views desc
	limit 8)
    
select 
    sum(total_views) as all_channels_view,
	round(sum(case when channel_type = "Entertainment" then total_views else 0 end) / sum(total_views) *100,2) as entertainment_views,
    round(sum(case when channel_type = "Music" then total_views else 0 end) / sum(total_views) *100,2) as Music_views,
    round(sum(case when channel_type = "Education" then total_views else 0 end) / sum(total_views) *100,2) as Education_views,
    round(sum(case when channel_type = "People" then total_views else 0 end) / sum(total_views) *100,2) as People_views,
    round(sum(case when channel_type = "Games" then total_views else 0 end) / sum(total_views) *100,2) as Games_views,
    round(sum(case when channel_type = "Comedy" then total_views else 0 end) / sum(total_views) *100,2) as Comedy_views,
    round(sum(case when channel_type = "Film" then total_views else 0 end) / sum(total_views) *100,2) as Film_views,
    round(sum(case when channel_type = "News" then total_views else 0 end) / sum(total_views) *100,2) as News_views
from channel_view_number

;

-- Entertainment
-- Music
-- Education
-- People
-- Games
-- Comedy
-- Film
-- News
