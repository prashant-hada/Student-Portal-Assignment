-- CreateEnum
CREATE TYPE "EnglishTest" AS ENUM ('IELTS', 'TOEFL', 'PTE', 'DUOLINGO', 'OTHER');

-- CreateTable
CREATE TABLE "AcademicInfo" (
    "id" TEXT NOT NULL,
    "interestedCountry" "Country" NOT NULL,
    "englishTest" "EnglishTest" NOT NULL,
    "testScore" INTEGER NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "AcademicInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AcademicInfo_studentId_key" ON "AcademicInfo"("studentId");

-- AddForeignKey
ALTER TABLE "AcademicInfo" ADD CONSTRAINT "AcademicInfo_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
