-- Preview of the Data
select *
from deaths
limit 10

select *
from vaccinations
limit 10

-- Select Data that we are going to be using
select location, date, total_cases, new_cases, total_deaths, population
from deaths
order by 1,2

-- Looking at the total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths::float/total_cases::float)*100 as death_rate_percentage
from deaths
order by 1,2
