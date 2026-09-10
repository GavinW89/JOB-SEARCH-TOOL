-- CreateEnum
CREATE TYPE "ApplicationStatus" AS ENUM ('SAVED', 'APPLIED', 'PHONE_SCREEN', 'INTERVIEWING', 'OFFER', 'REJECTED', 'WITHDRAWN', 'GHOSTED');

-- CreateEnum
CREATE TYPE "JobSource" AS ENUM ('USAJOBS', 'REMOTEOK', 'WE_WORK_REMOTELY', 'CLEARANCEJOBS', 'DICE', 'OTHER');

-- CreateEnum
CREATE TYPE "RoleCategory" AS ENUM ('SOFTWARE_DEVELOPER', 'APPLICATION_DEVELOPER', 'WEB_DEVELOPER', 'DATA_ANALYST', 'CYBER_SECURITY', 'OTHER');

-- CreateTable
CREATE TABLE "Company" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "website" TEXT,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Application" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "companyId" TEXT NOT NULL,
    "source" "JobSource" NOT NULL,
    "roleCategory" "RoleCategory" NOT NULL,
    "status" "ApplicationStatus" NOT NULL DEFAULT 'SAVED',
    "postingUrl" TEXT,
    "salaryRange" TEXT,
    "resumeVersion" TEXT,
    "dateFound" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateApplied" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Application_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Application_status_idx" ON "Application"("status");

-- CreateIndex
CREATE INDEX "Application_source_idx" ON "Application"("source");

-- AddForeignKey
ALTER TABLE "Application" ADD CONSTRAINT "Application_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
