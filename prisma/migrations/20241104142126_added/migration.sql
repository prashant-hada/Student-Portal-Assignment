-- CreateEnum
CREATE TYPE "DocumentCategory" AS ENUM ('TENTH_MARKSHEET', 'TWELFTH_MARSHEET', 'PASSPORT', 'TEST_CERTIFICATE', 'SOP', 'CV', 'EXPERIENCE', 'BACHELOR_DEGREE');

-- CreateTable
CREATE TABLE "StudentDocuments" (
    "id" TEXT NOT NULL,
    "category" "DocumentCategory" NOT NULL,
    "file_key" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "StudentDocuments_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "StudentDocuments" ADD CONSTRAINT "StudentDocuments_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "Student"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
