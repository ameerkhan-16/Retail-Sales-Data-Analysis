import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

df = pd.read_csv('retail_orders.csv')



df = df.drop_duplicates(subset='Order_ID')


df['Email'] = df['Email'].fillna('NA')
df['City'] = df['City'].fillna('NA')
df['Product_Category'] = df['Product_Category'].fillna('NA')
df['Coupon_Code'] = df['Coupon_Code'].fillna('NA')
df['Discount'] = df['Discount'].fillna('NA')


df['Order_ID'] = df['Order_ID'].str.replace('ORD-','')
df['Order_ID'] = df['Order_ID'].astype(int)
df['Order_Date'] = pd.to_datetime(df['Order_Date'],format='mixed')
df['Delivery_Date'] = pd.to_datetime(df['Delivery_Date'],format='mixed',errors='coerce')

df['Customer_ID'] = df['Customer_ID'].str.replace('CUST-','')
df['Customer_ID'] = df['Customer_ID'].astype(int)



df['Quantity'] = df['Quantity'].str.replace('O','0')
df['Quantity'] = pd.to_numeric(df['Quantity'],errors='coerce').astype('Int64')
df['Quantity'] = df['Quantity'].fillna(0)
df['Quantity'] = np.where(df['Quantity'] < 0,0,df['Quantity'])


df['Unit_Price'] = df['Unit_Price'].str.replace('O','0')
df['Unit_Price'] = df['Unit_Price'].str.replace('₹','')
df['Unit_Price'] = df['Unit_Price'].str.replace(',','')
df['Unit_Price'] = pd.to_numeric(df['Unit_Price'],errors='coerce')
df['Unit_Price'] = np.where(df['Unit_Price'] < 0, np.nan,df['Unit_Price'] )



df['Shipping_Fee'] = df['Shipping_Fee'].str.replace('O','0')
df['Shipping_Fee'] = df['Shipping_Fee'].str.replace('₹','')
df['Shipping_Fee'] = df['Shipping_Fee'].str.replace(',','')
df['Shipping_Fee'] = pd.to_numeric(df['Shipping_Fee'],errors='coerce')
df['Shipping_Fee'] = df['Shipping_Fee'].fillna(df['Shipping_Fee'].mean()).round(2)




df['Discount'] = np.where((df['Discount'].str.contains('%')== False) & (df['Discount'] != 'NA'), np.char.add((pd.to_numeric(df['Discount'], errors='coerce')*100).astype(str),'%'),df['Discount'])



df['Sales_Amount'] = df['Sales_Amount'].str.replace('O','0')
df['Sales_Amount'] = df['Sales_Amount'].str.replace('₹','')
df['Sales_Amount'] = df['Sales_Amount'].str.replace(',','')
df['Sales_Amount'] = pd.to_numeric(df['Sales_Amount'],errors='coerce')
df['Sales_Amount'] = df['Sales_Amount'].fillna((df['Quantity']*df['Unit_Price']) - ((pd.to_numeric(df['Discount'].astype(str).str.replace('%','',regex=False),errors='coerce').fillna(0)*(df['Quantity']*df['Unit_Price']))/100)).round(2)



df['Customer_Rating'] = df['Customer_Rating'].fillna('NA')


df['Customer_Name'] = df['Customer_Name'].str.strip()
df['Customer_Name'] = df['Customer_Name'].str.capitalize()



cols = ['City','State','Product_Category','Product','Payment_Method','Order_Status','Sales_Channel']
for col in cols:
    df[col] = df[col].str.strip()
    df[col] = df[col].str.title()


df['City'] =df['City'].replace('Ahemdabad','Ahmedabad')
df['City'] =df['City'].replace('Na','NA')
df['Product_Category'] = df['Product_Category'].str.replace('Home And Kitchen','Home & Kitchen')
df['Product_Category'] =df['Product_Category'].replace('Na','NA')
df['Coupon_Code'] = df['Coupon_Code'].str.strip()
df['Payment_Method'] = df['Payment_Method'].str.replace('Upi','UPI')

df['Email'] = np.where((df['Email'].str.contains(r'^[\w\.-]+@[\w\.-]+\.\w+$')) | (df['Email'] == 'NA'),df['Email'],'Invalid')



print(df.dtypes)
print(df.isna().sum())
print(df.head(10))
print(df['Sales_Channel'].nunique())
print(df['Sales_Channel'].unique())
print(df['Coupon_Code'].nunique())
print(df['Coupon_Code'].unique())
print(df['Order_Status'].nunique())
print(df['Order_Status'].unique())
print(df['Payment_Method'].nunique())
print(df['Payment_Method'].unique())
print(df['Product_Category'].nunique())
print(df['Product_Category'].unique())



df.to_excel('retail_orders_cleaned.xlsx',index=False)
df.to_csv('retail_orders_cleaned.csv',index=False)