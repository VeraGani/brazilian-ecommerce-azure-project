/*
===========================================================
Project: Brazilian E-Commerce Data Warehouse
File: 01_polybase_setup.sql

Purpose:
Configure PolyBase to access CSV files stored in
Azure Data Lake Storage Gen2.
===========================================================
*/

-- Create a master key
CREATE MASTER KEY;

-- Create a database scoped credential
CREATE DATABASE SCOPED CREDENTIAL olist_credential
WITH
    IDENTITY = 'Managed Identity';

-- Create an external data source
CREATE EXTERNAL DATA SOURCE olist_data_source
WITH (
    LOCATION = 'abfss://olist-data@veraoliststorage26.dfs.core.windows.net',
    CREDENTIAL = olist_credential
);

-- Create an external file format for CSV files
CREATE EXTERNAL FILE FORMAT csv_file_format
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        STRING_DELIMITER = '"',
        FIRST_ROW = 2
    )
);