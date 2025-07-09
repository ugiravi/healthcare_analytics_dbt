# Healthcare Analytics DBT Project

This project uses dbt to build a data pipeline for healthcare analytics. It integrates patient demographic, admission, and vital sign data to create enriched datasets and analytics-ready marts.

## Project Structure

- **staging**: Raw data transformations and cleaning
- **intermediate**: Business logic and data aggregation models
- **marts**: Final aggregated tables for analytics and reporting
- **macros**: Custom reusable SQL functions for data transformations
- **seeds**: Static CSV data files loaded into the warehouse
- **snapshots**: Historical snapshots of patient data for auditing

## Features

- Cleans and normalizes gender data
- Calculates patient age at admission
- Flags readmissions and high-risk vital signs
- Calculates length of stay and vital sign summaries
- Implements incremental models for efficient data processing

## Technologies

- dbt (Data Build Tool)
- PostgreSQL (data warehouse)
- SQL & Jinja Macros for transformations

## How to Run

1. Install dependencies:
   ```bash
   dbt deps
