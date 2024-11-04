-- CreateEnum
CREATE TYPE "MaritalStatus" AS ENUM ('SINGLE', 'MARRIED', 'DIVORCED', 'WIDOW');

-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE', 'OTHER');

-- CreateEnum
CREATE TYPE "Country" AS ENUM ('INDIA', 'USA', 'CANADA', 'UK', 'AUSTRALIA');

-- CreateTable
CREATE TABLE "Student" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "mobile_no" TEXT NOT NULL,
    "emergency_no" TEXT NOT NULL,
    "maritalStatus" "MaritalStatus" NOT NULL DEFAULT 'SINGLE',
    "gender" "Gender" NOT NULL DEFAULT 'OTHER',
    "dob" TIMESTAMP(3) NOT NULL,
    "passport_no" TEXT,
    "passport_expiry_date" TEXT,

    CONSTRAINT "Student_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Student_email_key" ON "Student"("email");
