/*
  Warnings:

  - The values [None,Less than 1 year,1-2 years,More then 2 years] on the enum `EducationGap` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "EducationGap_new" AS ENUM ('NONE', 'LESS_THAN_A_YEAR', 'ONE_TO_TWO_YEARS', 'MORE_THAN_TWO_YEARS');
ALTER TABLE "Student" ALTER COLUMN "educationGap" TYPE "EducationGap_new" USING ("educationGap"::text::"EducationGap_new");
ALTER TYPE "EducationGap" RENAME TO "EducationGap_old";
ALTER TYPE "EducationGap_new" RENAME TO "EducationGap";
DROP TYPE "EducationGap_old";
COMMIT;
