# Introduction

[![Build Status](https://dev.azure.com/justinfrizzell/Wide%20World%20Importers/_apis/build/status%2FJustinFrizzell.wide-world-importers-sql-project?branchName=main)](https://dev.azure.com/justinfrizzell/Wide%20World%20Importers/_build/latest?definitionId=4&branchName=main)

A SQL project based on the [WideWorldImporters](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-ver16) database. I've created new SQL objects in the `Challenges` schema:

- [Challenges.MonthlySalesSummary](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/Views/MonthlySalesSummary.sql) - A view of monthly sales figures split by city
- [Challenges.TopSellingProductsByCity](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/Views/TopSellingProductsByCity.sql) - A view of the top 5 selling products split for each city
- [Challenges.StockItemSalesDistribution](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/Views/StockItemSalesDistribution.sql) - A view showing the cumulative distribution of revenue by product
- [Challenges.ufn_GetTotalOrderWeight](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/Functions/ufn_GetTotalOrderWeight.sql) - A scalar function returning the total weight of a given OrderID
- [Challenges.ufn_DaysSinceLastInvoice](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/Functions/ufn_DaysSinceLastInvoice.sql) - A tabular function returning the date of the previous invoice, current invoice and the number of days since the last invoice for an InvoiceID
- [Challenges.usp_PurgeCustomerData](https://github.com/JustinFrizzell/wide-world-importers-sql-project/blob/main/WideWorldImporters/Challenges/StoredProcedures/usp_PurgeCustomerData.sql) - A stored procedure to remoove customer data from the database after a GDPR request

The project has been built into a `.dacpac` file for easy deployment using either SQL Server Data Tools (SSDT) or Azure Data Studio (see Installation).

CI/CD is achieved using Azure Pipelines to validate the build process. SQLFluff is used to ensure consistency across code.

Project structure:

![Screenshot showing structure](https://raw.githubusercontent.com/JustinFrizzell/wide-world-importers-sql-project/main/project_structure.png)

# Installation

## WorldWideImporters

WorldWideImporters is a sample database provided by Microsoft, to install follow [this guide](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-oltp-install-configure?view=sql-server-ver16).

## SQLFluff

SQLFluff is a SQL linter and formatter, to install follow [this guide](https://docs.sqlfluff.com/en/stable/gettingstarted.html).

## Project deployment

This repository builds into a Data-Tier Application Package (`.dacpac`), which is a single file containing the full database schema. This can be used to deploy the database to various environments using SQL Server Data Tools in Visual Studio or Azure Data Studio.

To deploy, download the latest `.dacpac` from [Releases](https://github.com/JustinFrizzell/wide-world-importers-sql-project/releases) and follow [this guide](https://www.sqlservercentral.com/articles/sql-server-dacpac-in-azure-data-studio). This will add the Challenges schema to the WorldWideImporters database installed above.

![Screenshot showing deployment](https://raw.githubusercontent.com/JustinFrizzell/wide-world-importers-sql-project/main/deployment.png)