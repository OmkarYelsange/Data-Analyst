# PROJECT 1 -  DATA CLEANING
# 1. REMOVE DUPLICATES
# 2. STANDARDIZE THE DATA
# 3. NULL VALUES OR BLANK VALUES
# 4. REMOVE ANY COLUMN

SELECT * 
FROM layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs;


SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company, location, total_laid_off, `date`, percentage_laid_off) AS row_num
FROM layoffs_staging;



WITH duplicates_cte AS
(
SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company, location, total_laid_off, `date`, 
percentage_laid_off, industry, stage, funds_raised, country) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicates_cte	
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging
WHERE company = 'Cazoo';
