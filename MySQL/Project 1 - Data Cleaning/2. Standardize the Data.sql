# PROJECT 1 -  DATA CLEANING
# 2. STANDARDIZE THE DATA
SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT * 
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%'
ORDER BY 1;

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT * 
FROM layoffs_staging2;

SELECT `date`
FROM layoffs_staging2
LIMIT 10;

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y') 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y'); 

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT * 
FROM layoffs_staging2;

SELECT date_added,
STR_TO_DATE(date_added,'%m/%d/%Y') 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET date_added = STR_TO_DATE(date_added,'%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN date_added DATE;
