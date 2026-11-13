# Retail E-Commerce Sales & Customer Analysis

An end-to-end, self-directed data analytics portfolio project using a synthetic retail e-commerce dataset. This project demonstrates data cleaning, SQL analysis, spreadsheet analysis, and dashboard development using Python, MySQL, Excel, and Power BI.

> **Dataset note:** This project uses synthetic demonstration data. It does not contain genuine customer records and does not represent the performance of a real retailer.

## Project Objectives

- Clean and standardize a messy retail orders dataset.
- Handle missing values, duplicate records, inconsistent dates, and invalid data.
- Analyze sales, customers, products, locations, payment methods, and order statuses.
- Perform business analysis using SQL.
- Build an Excel dashboard using PivotTables, PivotCharts, and slicers.
- Create an interactive Power BI dashboard to explore additional insights.

## Tools & Technologies

- **Python:** Pandas, NumPy
- **Database:** MySQL
- **Spreadsheet:** Microsoft Excel
- **Visualization:** Microsoft Power BI

## Project Workflow

### 1. Data Cleaning with Python

Started with a deliberately messy dataset containing 2,000 records and 20 columns.

The cleaning process included:
- Removing duplicate Order IDs.
- Standardizing date formats.
- Cleaning numeric columns.
- Handling missing and invalid values.
- Standardizing city, category, and other text fields.
- Validating email formats.

After removing duplicate orders, the cleaned dataset contained **1,985 records**.

### 2. SQL Business Analysis

Imported the cleaned dataset into MySQL using phpMyAdmin.

Created and solved 70 SQL analysis questions divided into three levels:

- **Basic:** SELECT, filtering, sorting, aggregation, and distinct counts.
- **Intermediate:** GROUP BY, HAVING, conditional analysis, and business segmentation.
- **Advanced:** Window functions, rankings, running totals, LAG, customer analysis, and monthly trends.

Database: `ecommerce_analysis`  
Table: `retail_orders`

### 3. Excel Analysis & Dashboard

Used Excel formulas, PivotTables, PivotCharts, and slicers to analyze the dataset.

The dashboard includes:
- Total Sales and Total Orders KPI cards.
- Sales by Payment Method and Sales Channel.
- Monthly Sales Trend.
- Sales by Category.
- Sales by Discount.
- Orders by Status.

Interactive slicers:
- State
- Order Year
- Coupon Code
- Order Category

### 4. Power BI Dashboard

Created a complementary dashboard to explore additional business insights.

The dashboard includes:
- Average Order Value
- Average Customer Rating
- Total Units Sold
- Unique Customers
- Sales by State
- Sales by Product
- Customers by City
- Average Customer Rating by Category
- Sales by Order Category

Interactive slicers:
- State
- Order Year
- Product Category
- Payment Method

## Key Results

| Metric | Result |
|---|---:|
| Original Records | 2,000 |
| Cleaned Records | 1,985 |
| Total Sales Amount | 20,653,655.20 |
| Average Order Value | 10,404.86 |
| Unique Customers | 444 |
| Total Units Sold | Approximately 5,000 |
| Average Customer Rating | 3.98 |
| Cancelled Orders | 118 |

*These results are based on the synthetic dataset. Dashboard values may change when filters are applied.*

## Project Files

| File | Description |
|---|---|
| `retail_sales_orders.csv` | Original messy dataset |
| `Retail_Sales_Analysis.py` | Python data-cleaning script |
| `retail_sales_orders_cleaned.csv` | Cleaned dataset |
| `retail_sales_orders_cleaned.xlsx` | Cleaned Excel dataset |
| `retail_sales_orders_analysed.xlsx` | Excel analysis workbook and dashboard |
| `Excel_dashboard.png` | Excel dashboard screenshot |
| `PowerBi_dashboard.png` | Power BI dashboard screenshot |
| `Retail_sales_analysis_report.docx` | Detailed project report |
| `Retail_Sales_Analysis.pbix` | Power bi File |
| `Retail_Sales_Analysis.sql` | Sql file |


## Data Cleaning Notes

- Duplicate records were removed using `Order_ID`.
- Inconsistent date formats and text values were standardized.
- Invalid numeric values were handled during cleaning.
- Negative or invalid quantities were set to zero for this exercise. In a real business scenario, negative quantities should be investigated because they may represent returns.
- Missing customer ratings are excluded from average-rating calculations when represented as NULL.
- Some sales queries include cancelled orders unless they explicitly filter them out.
- Profit and profit margin were not calculated because the dataset does not contain product cost information.

## Limitations

This is a self-directed portfolio project using synthetic data. It demonstrates practical data analytics skills and an end-to-end workflow, rather than production reporting for a real company.

## Author

Created as a personal data analytics portfolio project to demonstrate practical skills in Python, MySQL, Excel, and Power BI.