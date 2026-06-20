# PROJECT 1 -  DATA CLEANING
# 3. NULL VALUES OR BLANK VALUES

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off = 0
AND percentage_laid_off = 0;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = '';

SELECT * 
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
OR total_laid_off = '';

UPDATE layoffs_staging2
SET total_laid_off = 0  
WHERE total_laid_off = '';

SELECT funds_raised
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET funds_raised = 0  
WHERE funds_raised = '';

SELECT *
FROM layoffs_staging2
WHERE total_laid_off = 0
AND percentage_laid_off = 0
AND funds_raised = 0;

DELETE
FROM layoffs_staging2
WHERE total_laid_off = 0
AND percentage_laid_off = 0
AND funds_raised = 0;

SELECT *
FROM layoffs_staging2;