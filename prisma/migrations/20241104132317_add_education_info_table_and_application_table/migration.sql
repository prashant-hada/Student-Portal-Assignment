-- CreateEnum
CREATE TYPE "EducationGap" AS ENUM ('None', 'Less than 1 year', '1-2 years', 'More then 2 years');

-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "educationGap" "EducationGap";

-- CreateTable
CREATE TABLE "Education" (
    "id" TEXT NOT NULL,
    "qualification" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "percentage" TEXT NOT NULL,
    "passing_year" TIMESTAMP(3) NOT NULL,
    "country" "Country" NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplicationStatus" (
    "id" TEXT NOT NULL,
    "visaRejectionStatus" BOOLEAN NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "ApplicationStatus_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ApplicationStatus_studentId_key" ON "ApplicationStatus"("studentId");

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApplicationStatus" ADD CONSTRAINT "ApplicationStatus_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
