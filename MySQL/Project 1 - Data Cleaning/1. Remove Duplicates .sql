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


# 1. REMOVE DUPLICATES
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` text,
  `date` text,
  `percentage_laid_off` bigint DEFAULT NULL,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` text,
  `country` text,
  `date_added` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company, location, total_laid_off, `date`, 
percentage_laid_off, industry, stage, funds_raised, country) AS row_num
FROM layoffs_staging;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT * 
FROM layoffs_staging2;
