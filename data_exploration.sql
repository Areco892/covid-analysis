-- Preview of the Data
select *
from deaths
limit 10

select *
from vaccinations
limit 10

-- Deaths table: location, date, total_cases, new_cases, total_deaths, population
select location, date, total_cases, new_cases, total_deaths, population
from deaths
order by 1,2

-- Total cases vs Total deaths (Death Rate Percentage)
select location, date, total_cases, total_deaths, (total_deaths::float/total_cases::float)*100 as death_rate_percentage
from deaths
order by 1,2

-- Total cases vs Population (Percentage of the population who got infected in the United States)
select location, date, population, total_cases, (total_cases::float/population::float)* 100 as case_percentage
from deaths
where location ~* 'united states'
order by 1,2 

-- Highest infection rate countries
select location, population, highest_infection_count, infection_rate,
Rank() over (order by infection_rate DESC) as rank
from(
    select location, population, MAX(total_cases) as highest_infection_count, MAX((total_cases/population)*100) as infection_rate
    from deaths
    group by location, population
)
where infection_rate is not null

-- Highest death rate countries
select location, population, MAX(total_deaths) as heighest_death_count, MAX((total_deaths/population)*100) as death_rate
from deaths
group by location, population
order by death_rate DESC

-- Total deaths per continent
select continent, sum(total_deaths_count) as total_deaths_per_continent
from (  
    select location, continent, max(total_deaths) as total_deaths_count
    from deaths
    group by location, continent
)
GROUP BY continent