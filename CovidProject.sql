-- Normal selection
SELECT *
FROM CovidProject..deaths

SELECT *
FROM CovidProject..vaccinations


-- Total cases and deaths in each continent
SELECT continent, MAX(total_cases) as TotalCases, MAX(CAST(total_deaths AS int)) as TotalDeaths
FROM CovidProject..deaths
WHERE continent IS NOT NULL
GROUP BY continent


-- Death percentage globally
SELECT MAX(total_cases) as TotalCases, MAX(CAST(total_deaths as bigint)) as TotalDeaths, MAX(CAST(total_deaths as bigint))/MAX(total_cases) * 100 AS DeathPercentage
FROM CovidProject..deaths
--WHERE continent IS NOT NULL


-- new cases and deaths every day
SELECT location, date, population, new_cases, new_deaths
FROM CovidProject..deaths
WHERE continent IS NOT NULL
ORDER BY 1,2


-- Total test and vaccinations by continent
SELECT continent, MAX(total_tests) as TotalTests, MAX(total_vaccinations) as TotalVaccinations
FROM CovidProject..vaccinations
WHERE continent IS NOT NULL
GROUP BY continent


-- Percent population infected
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From CovidProject..Deaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- ICU and Hosp patients in each continent
SELECT continent, COUNT(icu_patients) as icu_patients, COUNT(hosp_patients) as hosp_patients
FROM CovidProject..deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 1,2



