import pandas as pd

df = pd.read_excel("CovidDeaths.xlsx")
df.to_csv("CovidDeaths.csv", index=False)

df = pd.read_excel("CovidVaccinations.xlsx")
df.to_csv("CovidVaccinations.csv", index=False)