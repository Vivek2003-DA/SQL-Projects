use weekday_4pm;
-- project Athletes Solution.

-- 1.Show how many medal counts present for entire data.

select medal,count(medal) as medal_count from athlete1 group by medal order by medal_count;

-- 2.Show count of unique Sports are present in olympics.
select count(distinct(sport)) as unique_sport_count from athlete1;

-- 3.Show how many different medals won by Team India in data.
select medal, count(medal) as medal_count from athlete1 where team='india' group by medal order by medal_count;

-- 4.Show event wise medals won by india show from highest to lowest medals won in order.
select team,event,count(medal) as medal_count from athlete1
 where team = 'india' and medal != 'NoMedal' 
 group by event order by medal_count
desc;

-- 5.Show event and yearwise medals won by india in order of year.
select event,year,count(medal) as medal_count from athlete1 
where team='india' and medal != 'NoMedal'
group by event,year order by year desc;

-- 6.Show the country with maximum medals won gold, silver, bronze
select year,team,count(medal) as medal_count from athlete1
where medal!='NoMedal' group by team,year order by medal_count desc limit 1;

-- 7.Show the top 10 countries with respect to gold medals.
select team,count(medal) as gold_medal from athlete1
where medal='gold' group by team order by  gold_medal desc limit 10;

-- 8.Show in which year did United States won most medals.
select year,count(medal) as medal_count from athlete1 
where team = 'United States' and medal != 'NoMedal' group by year
order by medal_count desc limit 1;

-- 9.In which sports United States has most medals
select sport, count(medal) as medal_count from athlete1
where team = 'United States' and medal != 'NoMedal'  
group by sport order by medal_count desc limit 1;

-- 10.Find top 3 players who have won most medals along with their sports and country
select name, sport as sport1, team, count(medal) as medal_count from athlete1 
where medal <> 'NoMedal' group by name ,sport1, team
order by medal_count desc limit 3;


-- 11.Find player with most gold medals in cycling along with his country.
select team,name,sport, count(medal) as medal_count from athlete1
where sport = 'cycling' and medal='gold'
group by name,team,sport order by medal_count desc limit 1;

-- 12.Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country
select name,team,sport,count(medal) as medal_count from athlete1 where sport = 'basketball' and 
medal <> 'NoMedal' group by name, team, sport order by medal_count;

-- 13.Find out the count of different medals of the top basketball player.
select name,medal,count(medal) as medal_count from athlete1 where name='Tamika Devonne Catchings'
and medal<>'NoMedal' group by medal order by medal_count desc;

-- 14.Find out medals won by male, female each year . Export this data and plot graph in excel.
select year , sex, count(medal) as medal_count from athlete1
where medal <> 'NoMedal' group by year,sex order by year asc;


