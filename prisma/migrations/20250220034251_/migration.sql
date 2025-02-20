/*
  Warnings:

  - The values [IN_PROGRESS] on the enum `OrderStatus` will be removed. If these variants are still used in the database, this will fail.
  - The `ingredients` column on the `Product` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `cretaedAt` on the `Restaurant` table. All the data in the column will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "OrderStatus_new" AS ENUM ('PENDING', 'IN_PREPARATION', 'FINISHED');
ALTER TABLE "Order" ALTER COLUMN "status" TYPE "OrderStatus_new" USING ("status"::text::"OrderStatus_new");
ALTER TYPE "OrderStatus" RENAME TO "OrderStatus_old";
ALTER TYPE "OrderStatus_new" RENAME TO "OrderStatus";
DROP TYPE "OrderStatus_old";
COMMIT;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "ingredients",
ADD COLUMN     "ingredients" TEXT[];

-- AlterTable
ALTER TABLE "Restaurant" DROP COLUMN "cretaedAt",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
