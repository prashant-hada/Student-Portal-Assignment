/*
  Warnings:

  - Added the required column `title` to the `Student` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Title" AS ENUM ('MR', 'MRS', 'MISS', 'DR', 'PROF');

-- CreateEnum
CREATE TYPE "RegistrationStage" AS ENUM ('STAGE1', 'STAGE2', 'STAGE3', 'STAGE4', 'STAGE5', 'STAGE6');

-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "registrationStage" "RegistrationStage" NOT NULL DEFAULT 'STAGE1',
ADD COLUMN     "title" "Title" NOT NULL;
