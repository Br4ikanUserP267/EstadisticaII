import pandas as pd
archivo = 'C:/Users/USUARIO/Documents/termo.xlsx'

df = pd.read_excel(archivo, sheet_name='Hoja1')

df.describe()

print(df)