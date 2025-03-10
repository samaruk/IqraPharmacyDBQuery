USE [master]
GO
/****** Object:  Database [Moghbazar]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE DATABASE [Moghbazar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Moghbazar', FILENAME = N'E:\Project\Running\SQLData\MSSQL13.MSSQLSERVER\MSSQL\DATA\Moghbazar.mdf' , SIZE = 3809280KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Moghbazar_log', FILENAME = N'E:\Project\Running\SQLData\MSSQL13.MSSQLSERVER\MSSQL\DATA\Moghbazar_log.ldf' , SIZE = 925696KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Moghbazar] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Moghbazar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Moghbazar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Moghbazar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Moghbazar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Moghbazar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Moghbazar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Moghbazar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Moghbazar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Moghbazar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Moghbazar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Moghbazar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Moghbazar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Moghbazar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Moghbazar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Moghbazar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Moghbazar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Moghbazar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Moghbazar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Moghbazar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Moghbazar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Moghbazar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Moghbazar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Moghbazar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Moghbazar] SET RECOVERY FULL 
GO
ALTER DATABASE [Moghbazar] SET  MULTI_USER 
GO
ALTER DATABASE [Moghbazar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Moghbazar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Moghbazar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Moghbazar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Moghbazar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Moghbazar', N'ON'
GO
ALTER DATABASE [Moghbazar] SET QUERY_STORE = OFF
GO
USE [Moghbazar]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Moghbazar]
GO
/****** Object:  UserDefinedTableType [dbo].[AmountListType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[AmountListType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[InfoId] [uniqueidentifier] NOT NULL,
	[Due] [float] NOT NULL,
	[Paid] [float] NOT NULL,
	[NetAmount] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ChangedItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ChangedItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IdList]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[IdList] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemList]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemList] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemPaymentType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemPaymentType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[TotalPayablePrice] [float] NOT NULL,
	[TotalPayablePriceDiff] [float] NOT NULL,
	[TotalDiscountDiff] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemReceiveType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemReceiveType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitQuentitySold] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Position] [int] NOT NULL,
	[DefaultVat] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL,
	[ActivateAt] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitVAT] [float] NOT NULL,
	[UnitDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ChangeAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemReceiveVoucherImageType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemReceiveVoucherImageType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[Content] [varbinary](max) NULL,
	[Icon] [varbinary](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[Size] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemSaleInfoType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemSaleInfoType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[DeliveryCharge] [float] NOT NULL DEFAULT ((0)),
	[Address] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[DoctorId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000'),
	[AdmissionId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000')
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemSaleType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemSaleType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[TotalPayableSalePrice] [float] NOT NULL,
	[TotalPayableTradePrice] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Position] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[RelationId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ListType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MRPChangedType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[MRPChangedType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[MRPBefore] [float] NOT NULL,
	[MRPAfter] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[NewItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[NewItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[GenericName] [nvarchar](max) NULL,
	[Strength] [nvarchar](max) NULL,
	[BatchName] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL,
	[Suplier] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalStock] [float] NOT NULL,
	[OffLineId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[OnlineMerge]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[OnlineMerge] AS TABLE(
	[OnLineId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[MRP] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[OnlineMergeType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[OnlineMergeType] AS TABLE(
	[OnLineId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[MRP] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductReturnItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ProductReturnItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleId] [uniqueidentifier] NOT NULL,
	[ProductReturnId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL DEFAULT ((0)),
	[UnitPurchaseVAT] [float] NOT NULL DEFAULT ((0)),
	[UnitPurchaseDiscount] [float] NOT NULL DEFAULT ((0)),
	[BranchId] [uniqueidentifier] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[SoldDiscount] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[ReturnDiscountP] [float] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductReturnType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ProductReturnType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[SaleDiscount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
	[CashReturn] [float] NOT NULL,
	[DueReturn] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[PaidAfter] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PurchaseByReturnItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[PurchaseByReturnItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseByReturnId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[SoldQnt] [float] NOT NULL,
	[ReturnQnt] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[UnitSoldPrice] [float] NOT NULL,
	[UnitReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitPurchaseVAT] [float] NOT NULL,
	[UnitPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PurchaseByReturnType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[PurchaseByReturnType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ComputerId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[SoldBy] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[ItemSold] [float] NOT NULL,
	[ItemReturn] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PurchaseInfoType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[PurchaseInfoType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ChallanNo] [nvarchar](max) NULL,
	[ChallanDate] [datetime] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[OrderInfoId] [uniqueidentifier] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[DefaultVAT] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SalePrice] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[ReduceAmount] [float] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
	[FileCount] [int] NOT NULL,
	[MimeType] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SpecialDiscount] [float] NOT NULL,
	[DiscountReason] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL DEFAULT ('00000000-0000-0000-0000-000000000000')
)
GO
/****** Object:  UserDefinedTableType [dbo].[ReceiveForReturnType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ReceiveForReturnType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL,
	[Quantity] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ReceiveType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ReceiveType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[Sold] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[UnitDiscount] [float] NOT NULL,
	[RowId] [int] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ReturnAccountModelType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[ReturnAccountModelType] AS TABLE(
	[ReturnDiscountAccountId] [uniqueidentifier] NOT NULL,
	[CashFrom] [uniqueidentifier] NOT NULL,
	[InventoryDueId] [uniqueidentifier] NOT NULL,
	[InventoryAccountId] [uniqueidentifier] NOT NULL,
	[RewardPointLiability] [uniqueidentifier] NOT NULL,
	[RewardPointExpense] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SalePaymentMathodType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[SalePaymentMathodType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[PaymentMethodId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[TransactionId] [nvarchar](max) NULL,
	[CardNo] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SalePaymentModelType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[SalePaymentModelType] AS TABLE(
	[SaleInfoId] [uniqueidentifier] NOT NULL,
	[RelativeType] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[NetSaleAmount] [float] NOT NULL,
	[Paid] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[CashAmount] [float] NOT NULL,
	[ChangedAmount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[DeliveryCharge] [float] NOT NULL,
	[PreviousDue] [float] NOT NULL,
	[Vat] [float] NOT NULL DEFAULT ((0)),
	[TotalVat] [float] NOT NULL DEFAULT ((0))
)
GO
/****** Object:  UserDefinedTableType [dbo].[SalesAccountModelType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[SalesAccountModelType] AS TABLE(
	[SalesRevenue] [uniqueidentifier] NOT NULL,
	[InventoryDue] [uniqueidentifier] NOT NULL,
	[SaleDiscount] [uniqueidentifier] NOT NULL,
	[CashInCounter] [uniqueidentifier] NOT NULL,
	[CostOfGoodsSold] [uniqueidentifier] NOT NULL,
	[InventoryAsset] [uniqueidentifier] NOT NULL,
	[VatPayable] [uniqueidentifier] NOT NULL,
	[RewardPointLiability] [uniqueidentifier] NOT NULL,
	[RewardPointExpense] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SuplierReturnItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[SuplierReturnItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[SuplierReturnId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[PurchaseQnt] [float] NOT NULL,
	[ReturnQnt] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitPurchaseVAT] [float] NOT NULL,
	[UnitPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SuplierReturnType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[SuplierReturnType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchasedBy] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[ItemPurchased] [float] NOT NULL,
	[ItemReturn] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[PurchasedPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TransactionType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[TransactionType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[FiscalYearId] [uniqueidentifier] NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[SourceType] [int] NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UnsalableProductItemType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[UnsalableProductItemType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[UnsalableProductId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Quantiry] [float] NOT NULL,
	[UnitTP] [float] NOT NULL,
	[UnitMRP] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[PayableTP] [float] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UnsalableProductSalvageValueType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[UnsalableProductSalvageValueType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[UnsalableProductId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[ReceivedValue] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UnsalableProductType]    Script Date: 3/10/2025 11:02:17 AM ******/
CREATE TYPE [dbo].[UnsalableProductType] AS TABLE(
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[TotalProduct] [float] NOT NULL,
	[TotalQuantiry] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[PayableTP] [float] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[GetAbsoluteRequiredQuantity]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE function [dbo].[GetAbsoluteRequiredQuantity](@DailyAvgSoldQuantity float, @AvgSoldQuantity float, @TotalSaleVoucher float, @MinSoldDays float, @MinVoucherCount float, @MinQuantity float)
returns float
as
begin

 IF @MinVoucherCount > 0 And @TotalSaleVoucher< @MinVoucherCount*2
 BEGIN
 Set @AvgSoldQuantity = @AvgSoldQuantity*@TotalSaleVoucher/ (@MinVoucherCount*2)
 END
return CEILING([dbo].[MaxValue](@DailyAvgSoldQuantity*@MinSoldDays, @AvgSoldQuantity*@MinVoucherCount, @MinQuantity))
	
	--if(@UnitConversion>1)
	--return CEILING([dbo].[MaxValue](@DailyAvgSoldQuantity*@MinSoldDays, @AvgSoldQuantity*@MinVoucherCount, [dbo].[MaxValue]( [dbo].[GtMinStock]([dbo].[GtMinStock](1000/(@UnitConversion*@UnitSalePrice),@DailyAvgSoldQuantity*@MinSoldDays*2),[dbo].[GtMinStock](@AvgSoldQuantity*@MinVoucherCount*2,@MinQuantity*2)), @UnitConversion, @MinQuantity))/@UnitConversion)*@UnitConversion
	--return [dbo].[MaxValue]([DailyAvgSoldQuantity]*@MinSoldDays, [AvgSoldQuantity]*@MinVoucherCount, [dbo].[MaxValue]( [dbo].[GtMinStock]([dbo].[GtMinStock](1000/(@UnitConversion*@UnitSalePrice),@DailyAvgSoldQuantity*@MinSoldDays*2),[dbo].[GtMinStock](@AvgSoldQuantity*@MinVoucherCount*2,@MinQuantity*2)), @UnitConversion, @MinQuantity))
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetRequiredQuantity]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE function [dbo].[GetRequiredQuantity](@DailyAvgSoldQuantity float, @AvgSoldQuantity float, @UnitConversion float, @UnitSalePrice float, @MinSoldDays float, @MinVoucherCount float, @MinQuantity float)
returns float
as
begin
return CEILING([dbo].[MaxValue](@DailyAvgSoldQuantity*@MinSoldDays, @AvgSoldQuantity*@MinVoucherCount, @MinQuantity)/@UnitConversion)*@UnitConversion
	
	--if(@UnitConversion>1)
	--return CEILING([dbo].[MaxValue](@DailyAvgSoldQuantity*@MinSoldDays, @AvgSoldQuantity*@MinVoucherCount, [dbo].[MaxValue]( [dbo].[GtMinStock]([dbo].[GtMinStock](1000/(@UnitConversion*@UnitSalePrice),@DailyAvgSoldQuantity*@MinSoldDays*2),[dbo].[GtMinStock](@AvgSoldQuantity*@MinVoucherCount*2,@MinQuantity*2)), @UnitConversion, @MinQuantity))/@UnitConversion)*@UnitConversion
	--return [dbo].[MaxValue]([DailyAvgSoldQuantity]*@MinSoldDays, [AvgSoldQuantity]*@MinVoucherCount, [dbo].[MaxValue]( [dbo].[GtMinStock]([dbo].[GtMinStock](1000/(@UnitConversion*@UnitSalePrice),@DailyAvgSoldQuantity*@MinSoldDays*2),[dbo].[GtMinStock](@AvgSoldQuantity*@MinVoucherCount*2,@MinQuantity*2)), @UnitConversion, @MinQuantity))
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetSerialNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[GetSerialNo] 
(
	  @Access nvarchar(max)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @SerialNo int;
	SELECT @SerialNo=IsNull(Max([Type]),0)+1 FROM [dbo].[ItemSaleInfo] where CreatedAt> CAST(GETDATE() AS date) And ChangeLog=@Access
	-- Return the result of the function
	RETURN @SerialNo;

END
GO
/****** Object:  UserDefinedFunction [dbo].[GtMaxStock]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GtMaxStock] 
(
	  @Param1 float,
	  @Param2 float
)
RETURNS float
AS
BEGIN
	if @Param1 < @Param2
    return @Param2
	RETURN isnull(@Param1,@Param2);

END
GO
/****** Object:  UserDefinedFunction [dbo].[GtMinStock]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GtMinStock] 
(
	  @Param1 float,
	  @Param2 float
)
RETURNS float
AS
BEGIN
	if @Param1 > @Param2
    return @Param2
	RETURN isnull(@Param1,@Param2);

END
GO
/****** Object:  UserDefinedFunction [dbo].[HasAccess]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[HasAccess] 
(
	@Id Uniqueidentifier,
	@DesignationId Uniqueidentifier,
	@Controller nvarchar(30),
	@Action nvarchar(30)
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;

	if exists(SELECT acs.[Id]
  FROM [dbo].[Access] acs 
  inner join [dbo].[ActionMethod] acmd on acs.[ActionMethodId]=acmd.Id
  inner join [dbo].[ActionController] aclr on acmd.ControllerId=aclr.Id
  left join [dbo].[Access] nacs on nacs.[AccessType]=2 and acs.[ActionMethodId]=acmd.Id and nacs.RelativeId =@Id And acs.Id = nacs.Id
  where  aclr.Name=@Controller and acmd.Name=@Action and nacs.[RelativeId] is null and (acs.[AccessType]=4 or acs.[AccessType]=3 or (acs.[AccessType]=1 and acs.RelativeId=@Id)  or  
                            (acs.[AccessType]=0 and acs.RelativeId=@DesignationId)))
	begin
		set @isValid=1;
	end
	else 
	Begin 
		set @isValid=0;
	End
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForLate]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsValidForLate] 
(
	  @Time AS DateTime,
	  @LateDuration float,
	  @UserId uniqueidentifier,-- Currently not using. Reserved for future use.
	  @ShiftId uniqueidentifier
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1,@minDuration int;
	if exists(SELECT [Id] FROM [dbo].[Attendance] where [ShiftId]=@ShiftId and [Date]=cast (@Time as Date))
	begin
		set @isValid=0;
	end
	else 
	Begin 
		select top 1  @minDuration= [Duration] from [dbo].[LateEntrySetting] where [StartDate]<=@Time and [EndDate]>=@Time order by [CreatedAt] desc
		if (@LateDuration<@minDuration)
		begin
			set @isValid=0;
		end
	End
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForParchase]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsValidForParchase] 
(
	  @List AS dbo.ItemReceiveType READONLY
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;
	if exists(Select i.Id FROM [dbo].[Item] i inner JOIN @List l on i.Id = l.[ItemId] where i.[IsDeleted] = 1)
	begin
		set @isValid=0;
	end
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForParchaseCancel]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsValidForParchaseCancel] 
(
	  @Id [Uniqueidentifier]
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;
	if exists(SELECT [Id] FROM [dbo].[ItemReceive] where [UnitQuentitySold]>0 and [PurchaseInfoId]=@Id)
	begin
		set @isValid=0;
	end
	if exists(SELECT [Id] FROM [dbo].[PurchaseInfo] where [PaymentStatus]>0 and [Id]=@Id)
	begin
		set @isValid=0;
	end
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForReturn]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsValidForReturn] 
(
	  @Info AS  [dbo].[ProductReturnType] READONLY,
	  @List AS [dbo].[ProductReturnItemType] READONLY
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;
	if exists( Select itmsl.[ItemId] From (Select itmsl.ItemSaleInfoId, itmsl.[ItemId],lst.UnitQuentity [rtnQuentity] , Sum(itmsl.[UnitQuentity]) [UnitQuentity]
  FROM [dbo].[ItemSale] itmsl
  inner join @Info nf on itmsl.ItemSaleInfoId = nf.ItemSaleInfoId
  Inner Join @List lst on itmsl.ItemId=lst.ItemId And itmsl.ItemSaleInfoId = nf.ItemSaleInfoId

  Group By itmsl.ItemSaleInfoId, itmsl.[ItemId],lst.UnitQuentity) itmsl


  left join (SELECT [ItemId]
	  ,[ItemSaleInfoId]
      ,Sum([UnitQuentity]) [ReturnQuentity]
  FROM [dbo].[ProductReturnItem] pdctrtnitm
  inner join [dbo].[ProductReturn] pdctrtn on pdctrtnitm.ProductReturnId = pdctrtn.Id
  group by [ItemId]
	  ,[ItemSaleInfoId]) rtn on itmsl.ItemSaleInfoId=rtn.ItemSaleInfoId and itmsl.[ItemId] = rtn.[ItemId]

	  where (itmsl.[UnitQuentity] - [rtnQuentity] - IsNull([ReturnQuentity],0)) < 0 )
	begin
		set @isValid=0;
	end
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForSale]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[IsValidForSale] 
(
	  @List AS [dbo].[ItemSaleType] READONLY
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;
	if exists(Select i.Id FROM [dbo].[Item] i inner JOIN @List l on i.Id = l.[ItemId] where i.[TotalStock]<l.[UnitQuentity])
	begin
		set @isValid=0;
	end
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[IsValidForUnsalableProduct]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[IsValidForUnsalableProduct] 
(
@Info AS [dbo].[UnsalableProductType] READONLY,
@List AS [dbo].[UnsalableProductItemType] READONLY
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE @isValid bit=1;
	if exists( Select itm.Id
  FROM @List lst
  inner join [dbo].[Item] itm on lst.ItemId = itm.Id
	  where itm.TotalStock < lst.Quantiry)
	begin
		set @isValid=0;
	end
	-- Return the result of the function
	RETURN @isValid;

END
GO
/****** Object:  UserDefinedFunction [dbo].[MaxDate]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[MaxDate](@Date1 datetime, @Date2 datetime)
returns datetime
as
begin
  if @Date1 > @Date2
    return @Date1
  return isnull(@Date2,@Date1)
end
GO
/****** Object:  UserDefinedFunction [dbo].[MaxValue]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[MaxValue](@Value1 float, @Value2 float, @Value3 float)
returns float
as
begin
  if @Value1 > @Value2
    if @Value1 > @Value3
    return @Value1
	else 
	return isnull(@Value3,@Value1)
  else if @Value2 > @Value3
  return @Value2
  
  return isnull(@Value3,@Value2)
end
GO
/****** Object:  UserDefinedFunction [dbo].[MinDate]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[MinDate](@Date1 datetime, @Date2 datetime)
returns datetime
as
begin
  if @Date1 < @Date2
    return @Date1
  return isnull(@Date2,@Date1)
end
GO
/****** Object:  UserDefinedFunction [dbo].[MinValue]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[MinValue] 
(
	  @Param1 Int,
	  @Param2 Int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @value int;
	set @value= Case When @Param1 < @Param2 
                   Then @Param1 Else @Param2 End;
	RETURN @value;

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewOrderVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[NewOrderVoucherNo] 
(
	  
)
RETURNS varchar(12)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(12);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 4), SPACE(1), '0') FROM [dbo].[OrderInfo] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN @VoucherNo;

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewPurchaseByReturnVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[NewPurchaseByReturnVoucherNo] 
(
	  
)
RETURNS varchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(12);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 4), SPACE(1), '0') FROM [dbo].[PurchaseByReturn] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, 12);

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewReturnVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[NewReturnVoucherNo] 
(
	  
)
RETURNS varchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(12);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 4), SPACE(1), '0') FROM [dbo].[ProductReturn] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, 12);

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewSuplierReturnVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[NewSuplierReturnVoucherNo] 
(
	  
)
RETURNS varchar(10)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(12);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 4), SPACE(1), '0') FROM [dbo].[SuplierReturn] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, 12);

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewUnsaleVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[NewUnsaleVoucherNo] 
(
	  
)
RETURNS varchar(12)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(14);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 6), SPACE(1), '0') FROM [dbo].[UnsalableProduct] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, 14);

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewVoucherNo]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[NewVoucherNo] 
(
	  
)
RETURNS varchar(12)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @VoucherNo varchar(14);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+ REPLACE(STR(count(Id)+1, 6), SPACE(1), '0') FROM [dbo].[ItemSaleInfo] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, 14);

END
GO
/****** Object:  UserDefinedFunction [dbo].[NewVoucherNoWithPrice]    Script Date: 3/10/2025 11:02:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[NewVoucherNoWithPrice] 
(
	  @SalePrice float
)
RETURNS nvarchar(25)
AS
BEGIN
	-- Declare the return variable here
	--Cast(Cast(ROUND(235.515,0) as int) as nvarchar(20))
	DECLARE @VoucherNo nvarchar(25);
	SELECT @VoucherNo=convert(nvarchar(8), GETDATE(), 112)+Cast(Cast(ROUND(@SalePrice,0) as int) as nvarchar(20))+ REPLACE(STR(count(Id)+1, 6), SPACE(1), '0') FROM [dbo].[ItemSaleInfo] where CreatedAt> CAST(GETDATE() AS date)
	-- Return the result of the function
	RETURN SUBSTRING(@VoucherNo, 3, len(@VoucherNo)-2);

END
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Access]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Access](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ActionMethodId] [int] NOT NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[AccessType] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Access] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccessType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessType](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AccessType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[AccountCode] [nvarchar](10) NOT NULL,
	[AccountName] [nvarchar](100) NOT NULL,
	[AccountDescription] [nvarchar](max) NULL,
	[Credit] [float] NOT NULL,
	[Debit] [float] NOT NULL,
	[AccountStartDate] [datetime] NOT NULL,
	[AccountDepreciationType] [int] NOT NULL,
	[AccountDepreciationLife] [int] NOT NULL,
	[AccountDepreciationSalvageValue] [float] NOT NULL,
	[IsEditable] [bit] NOT NULL,
	[IncreaseType] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountGroup]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroup](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsEditable] [bit] NOT NULL,
	[IncreaseType] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AccountGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountGroupCategory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroupCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsEditable] [bit] NOT NULL,
	[IncreaseType] [int] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AccountGroupCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReference]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReference](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Position] [float] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AccountReference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReporting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReporting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Editable] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AccountReporting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountReportingItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountReportingItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[ReportId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AccountReportingItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionController]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionController](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Rout] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ActionController] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionMethod]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionMethod](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ControllerId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ActionMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionMethodGroup]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionMethodGroup](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ActionMethodGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionMethodGroupItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionMethodGroupItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ActionMethodId] [int] NOT NULL,
	[ActionMethodGroupId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ActionMethodGroupItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[Country] [nvarchar](100) NULL,
	[District] [nvarchar](100) NULL,
	[Thana] [nvarchar](100) NULL,
	[Address] [nvarchar](max) NULL,
	[Lat] [float] NOT NULL,
	[Lng] [float] NOT NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AddressInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdjustHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdjustHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ReceiveId] [uniqueidentifier] NOT NULL,
	[SaleUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[PurchaseVat] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[TotalPurchaseDiscount] [float] NOT NULL,
	[TotalPurchaseVat] [float] NOT NULL,
	[UnitQuentityChanged] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[TPChanged] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[TPBefore] [float] NOT NULL,
	[MRPBefore] [float] NOT NULL,
	[TPAfter] [float] NOT NULL,
	[MRPAfter] [float] NOT NULL,
 CONSTRAINT [PK_dbo.AdjustHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdjustItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdjustItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AdjustHistoryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AdjustItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvanceSalary]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceSalary](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[RePayment] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AdvanceSalary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvanceSalaryRePayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceSalaryRePayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AdvanceSalaryId] [uniqueidentifier] NOT NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AdvanceSalaryRePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppData]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppData](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Selector] [nvarchar](max) NULL,
	[From] [nvarchar](max) NULL,
	[GroupBy] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NULL,
	[Daily] [nvarchar](max) NULL,
	[Fields] [nvarchar](max) NULL,
	[DateFields] [nvarchar](max) NULL,
	[SortBy] [nvarchar](max) NULL,
	[IsDesending] [bit] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppFirewall]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppFirewall](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ApplicationName] [nvarchar](max) NULL,
	[serviceName] [nvarchar](max) NULL,
	[Protocol] [int] NOT NULL,
	[LocalPorts] [nvarchar](max) NULL,
	[RemotePorts] [nvarchar](max) NULL,
	[LocalAddresses] [nvarchar](max) NULL,
	[RemoteAddresses] [nvarchar](max) NULL,
	[IcmpTypesAndCodes] [nvarchar](max) NULL,
	[Direction] [int] NOT NULL,
	[Interfaces] [nvarchar](max) NULL,
	[InterfaceTypes] [nvarchar](max) NULL,
	[Enabled] [bit] NOT NULL,
	[Grouping] [nvarchar](max) NULL,
	[Profiles] [int] NOT NULL,
	[EdgeTraversal] [bit] NOT NULL,
	[Action] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AppFirewall] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppPage]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppPage](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ViewPath] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[MethodId] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppPage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppScript]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppScript](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Version] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppScript] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppText]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppText](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AppText] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[ShiftId] [uniqueidentifier] NOT NULL,
	[DailyAttendanceId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[InterAt] [datetime] NOT NULL,
	[OutAt] [datetime] NOT NULL,
	[LogInAt] [datetime] NOT NULL,
	[LogOutAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[LateDuration] [float] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[IsOut] [int] NOT NULL,
	[AdjustmentType] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Attendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceDeduction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceDeduction](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AttnDate] [datetime] NOT NULL,
	[AttnMonth] [int] NOT NULL,
	[AttnYear] [int] NOT NULL,
	[Holiday] [float] NOT NULL,
	[WorkingDay] [float] NOT NULL,
	[PresentDay] [float] NOT NULL,
	[LeaveApprvDays] [float] NOT NULL,
	[AbsentDeduction] [float] NOT NULL,
	[LateDeduction] [float] NOT NULL,
	[LeaveDeduction] [float] NOT NULL,
	[PayableDays] [float] NOT NULL,
	[LateDays] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AttendanceDeduction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AutoSalaryPayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AutoSalaryPayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SalaryPaymentId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Basic] [float] NOT NULL,
	[WorkingHour] [float] NOT NULL,
	[Attended] [float] NOT NULL,
	[AttendedHour] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[LeaveHour] [float] NOT NULL,
	[LateEntry] [float] NOT NULL,
	[LateEntryHour] [float] NOT NULL,
	[Absent] [float] NOT NULL,
	[AbsentHour] [float] NOT NULL,
	[OverTime] [float] NOT NULL,
	[OverTimeHour] [float] NOT NULL,
	[ScheduledBonus] [float] NOT NULL,
	[Loan] [float] NOT NULL,
	[Advance] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[Deduction] [float] NOT NULL,
	[WorkingDays] [float] NOT NULL,
	[NetPayable] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.AutoSalaryPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceSheetSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceSheetSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Editable] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BalanceSheetSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceSheetSettingItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceSheetSettingItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[AccountGroupId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BalanceSheetSettingItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BalanceTransfer]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BalanceTransfer](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AmountFromId] [uniqueidentifier] NOT NULL,
	[AmountToId] [uniqueidentifier] NOT NULL,
	[TransferAt] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BalanceTransfer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[GLAccount] [nvarchar](max) NULL,
	[AccountNo] [nvarchar](35) NOT NULL,
	[Type] [int] NOT NULL,
	[BankName] [nvarchar](35) NOT NULL,
	[BranchName] [nvarchar](35) NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BankAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccountAddress]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccountAddress](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BankAccountId] [uniqueidentifier] NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NULL,
	[PostCode] [nvarchar](max) NULL,
	[DistrictId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BankAccountAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccountContact]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccountContact](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BankAccountId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](35) NOT NULL,
	[Designation] [nvarchar](35) NULL,
	[Phone] [nvarchar](25) NULL,
	[Mobile] [nvarchar](25) NULL,
	[Email] [nvarchar](20) NULL,
	[Priority] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BankAccountContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankTransaction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankTransaction](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[Descroption] [nvarchar](max) NULL,
	[CheckNumber] [nvarchar](max) NULL,
	[IsDeposit] [bit] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BankTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[From] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[Reference] [nvarchar](max) NULL,
	[Subtotal] [float] NOT NULL,
	[Tax] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[TaxType] [int] NOT NULL,
	[TotalTax] [float] NOT NULL,
	[ReferanceType] [int] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Bill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Quentity] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[TaxRate] [float] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[TaxRateId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[BillId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BillItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillPayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillPayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BillId] [uniqueidentifier] NOT NULL,
	[PaidFromAccountId] [uniqueidentifier] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BillPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BonusStructure]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BonusStructure](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[PeriodType] [int] NOT NULL,
	[BonusCount] [int] NOT NULL,
	[AmountType] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BonusStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brance](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Brance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Branch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[Stock] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.BranchProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Welcome] [nvarchar](max) NULL,
	[WelcomeText] [nvarchar](max) NULL,
	[CopyrightText] [nvarchar](max) NULL,
	[LogoUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.BranchSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashIn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashIn](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AmountFromId] [uniqueidentifier] NOT NULL,
	[AmountToId] [uniqueidentifier] NOT NULL,
	[CashInDate] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CashIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashOut]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashOut](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AmountFromId] [uniqueidentifier] NOT NULL,
	[AmountToId] [uniqueidentifier] NOT NULL,
	[CashOutDate] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.CashOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCEmail]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCEmail](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CCEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[EntityId] [uniqueidentifier] NOT NULL,
	[ChangeFrom] [nvarchar](max) NULL,
	[ChangeType] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Before] [nvarchar](max) NULL,
	[Change] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Info] [nvarchar](max) NULL,
	[Transations] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeSalePositionHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeSalePositionHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ItemReceiveIdBefore] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SalePositionAfter] [float] NOT NULL,
	[SalePositionBefore] [float] NOT NULL,
	[ActivateAtAfter] [datetime] NOT NULL,
	[ActivateAtBefore] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.ChangeSalePositionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CheckInOut]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckInOut](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[AttendanceId] [int] NOT NULL,
	[PunchedAt] [datetime] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[VerifyMode] [int] NOT NULL,
	[InOutMode] [int] NOT NULL,
	[WorkCode] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CheckInOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cheque]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cheque](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TransactionId] [uniqueidentifier] NOT NULL,
	[BankId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[ChequeNo] [nvarchar](60) NOT NULL,
	[ChequeDate] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Cheque] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyStockBatch]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyStockBatch](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[BatchId] [uniqueidentifier] NOT NULL,
	[CompanyStockItemId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitQuentitySold] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CompanyStockBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyStockEmpty]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyStockEmpty](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[TotalItem] [float] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[BatchMRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CompanyStockEmpty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyStockItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyStockItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[BatchId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[BatchMRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CompanyStockItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Computer]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computer](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[OSVersion] [nvarchar](max) NULL,
	[Is64BitProcessor] [bit] NOT NULL,
	[Is64BitOS] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[LastLoginAt] [datetime] NOT NULL,
	[LastLogoutAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CounterAccess] [nvarchar](max) NULL,
	[History] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Computer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[ContactName] [nvarchar](100) NULL,
	[Designation] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ContactInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CounterProductRelation]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CounterProductRelation](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductId1] [uniqueidentifier] NOT NULL,
	[ProductId2] [uniqueidentifier] NOT NULL,
	[CounterId1] [uniqueidentifier] NOT NULL,
	[CounterId2] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_CounterProductRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CustomerId] [nvarchar](max) NULL,
	[Sex] [nvarchar](max) NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[PostCode] [nvarchar](max) NULL,
	[PostOffice] [nvarchar](max) NULL,
	[Thana] [nvarchar](max) NULL,
	[Zilla] [nvarchar](max) NULL,
	[LandPhone] [nvarchar](max) NULL,
	[CellPhone] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FileCount] [int] NOT NULL,
	[MaxDue] [float] NOT NULL,
	[CustomerType] [nvarchar](max) NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDue](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalProfit] [float] NOT NULL,
	[Profit] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[AdjustAmount] [float] NOT NULL,
	[CancelAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerDue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDueHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDueHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[CustomerDueId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[AdjustAmount] [float] NOT NULL,
	[CancelAmount] [float] NOT NULL,
	[ChangeAmount] [float] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerDueHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerExtraDiscount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerExtraDiscount](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[CashReturn] [float] NOT NULL,
	[DueReturn] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[DiscountP] [float] NOT NULL,
	[TradeMargin] [float] NOT NULL,
	[TradeMarginP] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[PaidAfter] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerExtraDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerInvestigationPicture]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInvestigationPicture](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[InvestigationId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[IconPath] [nvarchar](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[ImageCount] [int] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[HospitalId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerInvestigationPicture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[DueId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[DueBefore] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[From] [nvarchar](max) NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPaymentToInvoice]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPaymentToInvoice](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[PaymentId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[SaleInfoId] [uniqueidentifier] NOT NULL,
	[NetAmount] [float] NOT NULL,
	[DueBefore] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[CashReturn] [float] NOT NULL,
	[DueReturn] [float] NOT NULL,
	[ExtraDiscount] [float] NOT NULL,
	[PaidAfter] [float] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[Return] [float] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerPaymentToInvoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPicture]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPicture](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Content] [varbinary](max) NULL,
	[Icon] [varbinary](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[Size] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerPicture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPrescriptionPicture]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPrescriptionPicture](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[PrescriptionName] [nvarchar](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[VisitDate] [datetime] NOT NULL,
	[ChiefComplaint] [nvarchar](max) NULL,
	[PhysicalExamination] [nvarchar](max) NULL,
	[HospitalId] [uniqueidentifier] NOT NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[IconPath] [nvarchar](max) NULL,
	[ImageCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerPrescriptionPicture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPrescriptionPictureList]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPrescriptionPictureList](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[IconPath] [nvarchar](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[Size] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.CustomerPrescriptionPictureList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyAttendance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyAttendance](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[InterAt] [datetime] NOT NULL,
	[OutAt] [datetime] NOT NULL,
	[LogInAt] [datetime] NOT NULL,
	[LogOutAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[AllowedDuration] [float] NOT NULL,
	[LateDuration] [float] NOT NULL,
	[ShiftingCount] [float] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[AbNormalityCount] [int] NOT NULL,
	[SolvedCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DailyAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyCashFlow]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyCashFlow](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[BeforeBalance] [float] NOT NULL,
	[In] [float] NOT NULL,
	[Out] [float] NOT NULL,
	[AfterBalance] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DailyCashFlow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyCashFlowItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyCashFlowItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[DailyCashFlowId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[BeforeBalance] [float] NOT NULL,
	[In] [float] NOT NULL,
	[Out] [float] NOT NULL,
	[AfterBalance] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DailyCashFlowItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyCounterStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyCounterStock](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Before] [float] NOT NULL,
	[In] [float] NOT NULL,
	[Out] [float] NOT NULL,
	[After] [float] NOT NULL,
	[Purchase] [float] NOT NULL,
	[Sale] [float] NOT NULL,
	[Return] [float] NOT NULL,
	[Adjustment] [float] NOT NULL,
	[PurchaseCancel] [float] NOT NULL,
	[PurchaseByReturn] [float] NOT NULL,
	[SuplierReturn] [float] NOT NULL,
	[ProductDeleted] [float] NOT NULL,
	[ProductActivated] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DailyCounterStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyInOut]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyInOut](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[BeforeBalance] [float] NOT NULL,
	[In] [float] NOT NULL,
	[Out] [float] NOT NULL,
	[AfterBalance] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DailyInOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyItemSales]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyItemSales](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Day] [datetime] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemCount] [float] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[IsPharmacy] [bit] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DailyItemSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySale](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[CashInHand] [float] NOT NULL,
	[CashInBank] [float] NOT NULL,
	[CashMismatch] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVat] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Due] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DailySale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySales]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySales](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Day] [datetime] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[IsPharmacy] [bit] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DailySales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyStock](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Before] [float] NOT NULL,
	[In] [float] NOT NULL,
	[Out] [float] NOT NULL,
	[After] [float] NOT NULL,
	[Purchase] [float] NOT NULL,
	[Sale] [float] NOT NULL,
	[Return] [float] NOT NULL,
	[Adjustment] [float] NOT NULL,
	[PurchaseCancel] [float] NOT NULL,
	[PurchaseByReturn] [float] NOT NULL,
	[SuplierReturn] [float] NOT NULL,
	[ProductDeleted] [float] NOT NULL,
	[ProductActivated] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[UnitChanged] [float] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[StockType] [nvarchar](30) NULL,
 CONSTRAINT [PK_dbo.DailyStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyStockChanged]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyStockChanged](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ChangedCount] [float] NOT NULL,
	[BatchCount] [int] NOT NULL,
	[ProductStock] [float] NOT NULL,
	[BatchStock] [float] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[TPChanged] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DailyStockChanged] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyStockSummary]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyStockSummary](
	[Id] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DailyStockSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[SoldAmount] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[StartAmount] [float] NOT NULL,
	[EndAmount] [float] NOT NULL,
	[AdjustAmount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[TradeAmount] [float] NOT NULL,
	[DiscountAmount] [float] NOT NULL,
	[VatAmount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DayInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayInfoItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayInfoItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DayInfoId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DayInfoItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Schema] [nvarchar](max) NULL,
	[Table] [nvarchar](max) NULL,
	[Column] [nvarchar](max) NULL,
	[Before] [nvarchar](max) NULL,
	[After] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](max) NULL,
	[KeyValue] [nvarchar](max) NULL,
	[TableId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DBChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBDataDeleteHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBDataDeleteHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TableId] [uniqueidentifier] NOT NULL,
	[RowId] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[IsRestored] [bit] NOT NULL,
	[RestoredBy] [uniqueidentifier] NOT NULL,
	[RestoredAt] [datetime] NOT NULL,
	[RestoredRemarks] [nvarchar](max) NULL,
	[RestoredActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DBDataDeleteHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBSchema]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBSchema](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TableId] [uniqueidentifier] NOT NULL,
	[Column] [nvarchar](max) NULL,
	[Position] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Nullable] [bit] NOT NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DBSchema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DBTable]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DBTable](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Catalog] [nvarchar](max) NULL,
	[Schema] [nvarchar](max) NULL,
	[Table] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[SortBy] [nvarchar](max) NULL,
	[IsEditable] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.DBTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Depreciation]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depreciation](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[FixedAssetId] [uniqueidentifier] NOT NULL,
	[AssetAccountId] [uniqueidentifier] NOT NULL,
	[AccumulatedDepreciationAccountId] [uniqueidentifier] NOT NULL,
	[DepreciationExpenseAccountId] [uniqueidentifier] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Depreciation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[LeaveStructureId] [uniqueidentifier] NOT NULL,
	[Rank] [float] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesignationAccess]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesignationAccess](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[AccessId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DesignationAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[AppName] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[Platform] [nvarchar](max) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[HasAccess] [bit] NOT NULL,
	[AccessType] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[IsEditable] [nvarchar](50) NULL,
	[DisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Device] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceAccess]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceAccess](
	[Id] [uniqueidentifier] NOT NULL,
	[AccessDeviceId] [uniqueidentifier] NOT NULL,
	[CreatorDeviceId] [uniqueidentifier] NOT NULL,
	[HasAccess] [bit] NOT NULL,
	[AccessType] [nvarchar](max) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.DeviceAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceAccessLog]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceAccessLog](
	[Id] [uniqueidentifier] NOT NULL,
	[DeviceId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ChangeType] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.DeviceAccessLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceActivity]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceActivity](
	[Id] [uniqueidentifier] NOT NULL,
	[DeviceId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[UrlReferrer] [nvarchar](max) NULL,
	[UserAgent] [nvarchar](max) NULL,
	[UserHostAddress] [nvarchar](max) NULL,
	[UserHostName] [nvarchar](max) NULL,
	[AbsolutePath] [nvarchar](max) NULL,
	[AbsoluteUri] [nvarchar](max) NULL,
	[Authority] [nvarchar](max) NULL,
	[DnsSafeHost] [nvarchar](max) NULL,
	[Host] [nvarchar](max) NULL,
	[SessionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.DeviceActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[DepartmentId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[BMDCNo] [nvarchar](max) NULL,
	[ChamberAddress] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[DoctorFeesId] [uniqueidentifier] NOT NULL,
	[Fee] [float] NOT NULL,
	[DoctorTitle] [nvarchar](max) NULL,
	[MaxDiscount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBonus]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBonus](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[RelationType] [int] NOT NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[BonusStructureId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeBonus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeBonusDetails]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeBonusDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeBonusId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BonusStructureId] [uniqueidentifier] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeBonusDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLoan]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLoan](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[LoanName] [nvarchar](max) NULL,
	[LoanDate] [datetime] NOT NULL,
	[LoanAmount] [float] NOT NULL,
	[RepaymentAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[RepaymentStartAt] [datetime] NOT NULL,
	[LoanType] [int] NOT NULL,
	[Interest] [float] NOT NULL,
	[BaseInstallment] [float] NOT NULL,
	[Installment] [float] NOT NULL,
	[TotalInstallment] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[InstallmentCopleted] [float] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeLoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLoanRepayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLoanRepayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[EmployeeLoanId] [uniqueidentifier] NOT NULL,
	[RePaymentMonth] [datetime] NOT NULL,
	[RePaymentAmount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeLoanRepayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeePromotion]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeePromotion](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[PromotionDate] [datetime] NOT NULL,
	[EffectiveFrom] [datetime] NOT NULL,
	[PrevDesigId] [uniqueidentifier] NOT NULL,
	[NewDesigId] [uniqueidentifier] NOT NULL,
	[PrevBasic] [float] NOT NULL,
	[NewBasic] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeePromotion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeShift]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeShift](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[ActivateAt] [datetime] NOT NULL,
	[ActiveTo] [datetime] NOT NULL,
	[StartAt] [time](7) NOT NULL,
	[EndAt] [time](7) NOT NULL,
	[Duration] [float] NOT NULL,
	[StartDayOfMonth] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[EndDayOfMonth] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.EmployeeShift] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeShiftException]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeShiftException](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.EmployeeShiftException] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseDocuments]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseDocuments](
	[Id] [uniqueidentifier] NOT NULL,
	[ExpenseItemId] [uniqueidentifier] NOT NULL,
	[Content] [varbinary](max) NULL,
	[Icon] [varbinary](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[Size] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ExpenseDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Responsible] [uniqueidentifier] NOT NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[ExpenseAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[FileCount] [int] NOT NULL,
	[MimeType] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ExpenseItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExpenseType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ExpenseType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraDiscount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraDiscount](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SaleId] [uniqueidentifier] NOT NULL,
	[SoldBy] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[DiscountP] [float] NOT NULL,
	[TradeMargin] [float] NOT NULL,
	[TradeMarginP] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
	[CashReturn] [float] NOT NULL,
	[DueReturn] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[PaidAfter] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ExtraDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FiscalYear]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FiscalYear](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[FYBegin] [datetime] NOT NULL,
	[FYEnd] [datetime] NOT NULL,
	[FYStatus] [int] NOT NULL,
	[TotalCredit] [float] NOT NULL,
	[TotalDebit] [float] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.FiscalYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixedAsset]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAsset](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[Number] [nvarchar](max) NULL,
	[PurchaseAt] [datetime] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[WarrantyExpiry] [datetime] NOT NULL,
	[SerialNumber] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[LastDepreciationAt] [datetime] NOT NULL,
	[IsDepreciatable] [int] NOT NULL,
	[DepreciationStartAt] [datetime] NOT NULL,
	[DepreciationCostLimit] [float] NOT NULL,
	[DepreciationSalvageValue] [float] NOT NULL,
	[DepreciationMethod] [int] NOT NULL,
	[AvaragingMethod] [int] NOT NULL,
	[DepreciationRateType] [int] NOT NULL,
	[Rate] [float] NOT NULL,
	[DepreciationLife] [int] NOT NULL,
	[DepreciationEndtAt] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[DepreciationCost] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.FixedAsset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FixedAssetType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FixedAssetType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[AssetAccountId] [uniqueidentifier] NOT NULL,
	[AccumulatedDepreciationAccountId] [uniqueidentifier] NOT NULL,
	[DepreciationExpenseAccountId] [uniqueidentifier] NOT NULL,
	[DepreciationMethod] [int] NOT NULL,
	[AvaragingMethod] [int] NOT NULL,
	[DepreciationRateType] [int] NOT NULL,
	[Rate] [float] NOT NULL,
	[DepreciationLife] [int] NOT NULL,
	[DepreciationEndtAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.FixedAssetType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenericName]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenericName](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.GenericName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GridData]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GridData](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[GridId] [nvarchar](max) NULL,
	[Columns] [nvarchar](max) NULL,
	[SummaryColumns] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[GridUrl] [nvarchar](max) NULL,
	[PageUrl] [nvarchar](max) NULL,
	[Filter] [nvarchar](max) NULL,
	[SortBy] [nvarchar](max) NULL,
	[IsDescending] [bit] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[LoadedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.GridData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HandDiscount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HandDiscount](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Discount] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.HandDiscount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoldInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoldInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[IsSold] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HoldInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoldItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoldItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[HoldInfoId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[TotalPayableSalePrice] [float] NOT NULL,
	[TotalPayableTradePrice] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[IsSold] [int] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_dbo.HoldItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Days] [float] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Holidays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Hospital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Increment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Increment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[PreviousSalary] [float] NOT NULL,
	[CurrentSalary] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[IncrementAmount] [float] NOT NULL,
	[EffectiveFrom] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Increment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryAlert]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryAlert](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[ActionType] [int] NOT NULL,
	[RequiredQuentity] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.InventoryAlert] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDue](
	[Id] [uniqueidentifier] NOT NULL,
	[SaleInfoId] [uniqueidentifier] NOT NULL,
	[RelativeType] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[NetSaleAmount] [float] NOT NULL,
	[Paid] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[OrginalDue] [float] NOT NULL,
 CONSTRAINT [PK_dbo.InventoryDue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDuePayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDuePayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Paid] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[PatientId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.InventoryDuePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDuePaymentItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDuePaymentItem](
	[Id] [uniqueidentifier] NOT NULL,
	[DueId] [uniqueidentifier] NOT NULL,
	[DuePaymentId] [uniqueidentifier] NOT NULL,
	[Paid] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.InventoryDuePaymentItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[ChangedItemCount] [int] NOT NULL,
	[SaleData] [datetime] NOT NULL,
	[Page] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.InventoryInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[InventoryInfoId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[HasChanged] [bit] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.InventoryItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Investigation]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Investigation](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Investigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IqraGrid]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IqraGrid](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[RelationType] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.IqraGrid] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IqraGridChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IqraGridChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ChangeId] [uniqueidentifier] NOT NULL,
	[ChangeType] [nvarchar](max) NULL,
	[RelationType] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.IqraGridChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[GenericName] [nvarchar](max) NULL,
	[Strength] [nvarchar](max) NULL,
	[BatchName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[ManufacturerId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[CurrentStock] [float] NOT NULL,
	[TotalStock] [float] NOT NULL,
	[MaxStockWhenPurchase] [float] NOT NULL,
	[MinStockToAlert] [float] NOT NULL,
	[SoldDaysForParchaseRequired] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[MaxSaleDiscount] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[RackItemId] [uniqueidentifier] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[PurchaseVat] [float] NOT NULL,
	[TotalPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[GenericNameId] [uniqueidentifier] NOT NULL,
	[IsExpairDateRequired] [nvarchar](max) NULL,
	[ExpairDateAlert] [float] NOT NULL,
 CONSTRAINT [PK_dbo.Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemDeleteHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDeleteHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemHistoryId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[TPChanged] [float] NOT NULL,
	[PayableTPChanged] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemDeleteHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[GenericName] [nvarchar](max) NULL,
	[Strength] [nvarchar](max) NULL,
	[BatchName] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[CurrentStock] [float] NOT NULL,
	[TotalStock] [float] NOT NULL,
	[MinStockToAlert] [float] NOT NULL,
	[SoldDaysForParchaseRequired] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[MaxSaleDiscount] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[UnitChangeConversion] [float] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[RackItemId] [uniqueidentifier] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[PurchaseVat] [float] NOT NULL,
	[TotalPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ManufacturerId] [uniqueidentifier] NOT NULL,
	[MaxStockWhenPurchase] [float] NOT NULL,
	[IsExpairDateRequired] [nvarchar](max) NULL,
	[ExpairDateAlert] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemPurchase]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPurchase](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitQuentitySold] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Position] [int] NOT NULL,
	[DefaultVat] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL,
	[ActivateAt] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemPurchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemReceive]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemReceive](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitQuentitySold] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Position] [int] NOT NULL,
	[DefaultVat] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL,
	[ActivateAt] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitVAT] [float] NOT NULL,
	[UnitDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ChangeAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemReceive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemReceiveVoucherImage]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemReceiveVoucherImage](
	[Id] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[Content] [varbinary](max) NULL,
	[Icon] [varbinary](max) NULL,
	[MimeType] [nvarchar](max) NULL,
	[Size] [bigint] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSale](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[TotalPayableSalePrice] [float] NOT NULL,
	[TotalPayableTradePrice] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Position] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSaleBatch]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSaleBatch](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[ItemSaleId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[BeforeStock] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UnitTP] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSaleBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSaleInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSaleInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[DeliveryCharge] [float] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSaleInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSalePayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSalePayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[SaleBy] [uniqueidentifier] NOT NULL,
	[SaleAt] [datetime] NOT NULL,
	[PayableAmount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[DiscountP] [float] NOT NULL,
	[ExtraDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CashAmount] [float] NOT NULL,
	[ChangedAmount] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[DeliveryCharge] [float] NOT NULL,
	[PreviousDue] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[Paid] [float] NOT NULL,
	[Return] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSalePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSales]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSales](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemCount] [float] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[IsPharmacy] [bit] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[PurchaseVat] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemStockChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemStockChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[StockAfterChanged] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[TotalTPDiscount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ItemStockChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ItemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LaberText]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaberText](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LaberText] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LateEntry]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LateEntry](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[ShiftId] [uniqueidentifier] NOT NULL,
	[AttendanceId] [uniqueidentifier] NOT NULL,
	[EntryTime] [datetime] NOT NULL,
	[EnterAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[RejectedBy] [uniqueidentifier] NOT NULL,
	[RejectedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LateEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LateEntrySetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LateEntrySetting](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Duration] [int] NOT NULL,
	[SlotLimit] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[RoundBy] [int] NOT NULL,
	[IsDefault] [int] NOT NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LateEntrySetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveCategory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.LeaveCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[Days] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ApprovedDays] [int] NOT NULL,
	[OverFlowType] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.LeaveInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveItem](
	[Id] [uniqueidentifier] NOT NULL,
	[LeaveInfoId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.LeaveItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveStructure]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStructure](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LeaveStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveStructureItems]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStructureItems](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[LeaveStructureId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Monthly] [float] NOT NULL,
	[Yearly] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LeaveStructureItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licence]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licence](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ActivateAt] [datetime] NOT NULL,
	[Content] [varbinary](max) NULL,
 CONSTRAINT [PK_dbo.Licence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanAccount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LoanAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanApprover]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanApprover](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[LoanStructureId] [uniqueidentifier] NOT NULL,
	[LoanApproverId] [uniqueidentifier] NOT NULL,
	[Position] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LoanApprover] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanStructure]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanStructure](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[LoanAccountId] [uniqueidentifier] NOT NULL,
	[LoanTypeId] [uniqueidentifier] NOT NULL,
	[InterestRate] [real] NOT NULL,
	[MaxAmount] [real] NOT NULL,
	[MinAmount] [real] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LoanStructure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoanType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.LoanType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogedInSession]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogedInSession](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[DeviceId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[LastAccessAt] [datetime] NOT NULL,
	[AccessCount] [int] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AccessType] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.LogedInSession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualJournal]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualJournal](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[FiscalYearId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[TaxType] [int] NOT NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[DebitTax] [float] NOT NULL,
	[CreditTax] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ManualJournal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManualJournalItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManualJournalItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ManualJournalId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[TaxRateId] [uniqueidentifier] NOT NULL,
	[TaxRate] [float] NOT NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[DebitTax] [float] NOT NULL,
	[CreditTax] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ManualJournalItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuAccess]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuAccess](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[AccessType] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MenuAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CssId] [nvarchar](max) NULL,
	[CssClass] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MenuCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MenuCategoryId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CssId] [nvarchar](max) NULL,
	[CssClass] [nvarchar](max) NULL,
	[ParentId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MergedDatabase]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MergedDatabase](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[DatabaseName] [nvarchar](max) NULL,
	[BranchName] [nvarchar](max) NULL,
	[ServerAddress] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
	[PassWord] [nvarchar](max) NULL,
	[Counter] [nvarchar](max) NULL,
	[Rank] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MergedDatabase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlySalary]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlySalary](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Paid] [float] NOT NULL,
	[Basic] [float] NOT NULL,
	[OverTime] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[WorkingDays] [float] NOT NULL,
	[Attend] [float] NOT NULL,
	[AutoAttend] [float] NOT NULL,
	[Advance] [float] NOT NULL,
	[Deduction] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[PaidBy] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Employee] [int] NOT NULL,
	[Prepared] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MonthlySalary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlyStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyStock](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ProductStock] [float] NOT NULL,
	[BatchStock] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.MonthlyStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movement]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movement](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MovementTypeId] [uniqueidentifier] NOT NULL,
	[MoveOut] [datetime] NOT NULL,
	[MoveIn] [datetime] NOT NULL,
	[AttnDate] [datetime] NOT NULL,
	[Destination] [nvarchar](max) NULL,
	[Purpose] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Movement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovementDetail]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovementDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MovementId] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[ContactPerson] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[EMail] [nvarchar](max) NULL,
	[Purpose] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Conveyance] [float] NOT NULL,
	[TransPort] [nvarchar](max) NULL,
	[ConveyanceApproved] [float] NOT NULL,
	[AuthorizedBy] [nvarchar](max) NULL,
	[ConveyanceBillStatus] [int] NOT NULL,
	[TransId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MovementDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovementType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovementType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[IsBillable] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MovementType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MRPChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MRPChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemHistoryId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[MRPBefore] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[MRPAfter] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.MRPChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NextOrderItemList]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NextOrderItemList](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Priority] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.NextOrderItemList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineData]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineData](
	[Id] [uniqueidentifier] NOT NULL,
	[OnLineId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[GenericName] [nvarchar](max) NULL,
	[Strength] [nvarchar](max) NULL,
	[Category] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineMerge]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineMerge](
	[Id] [uniqueidentifier] NOT NULL,
	[OffLineId] [uniqueidentifier] NOT NULL,
	[OnLineId] [uniqueidentifier] NOT NULL,
	[Stock] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_OnlineMerge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpeningClosingBalance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpeningClosingBalance](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[OpeningDebit] [float] NOT NULL,
	[OpeningCredit] [float] NOT NULL,
	[ClosingDebit] [float] NOT NULL,
	[ClosingCredit] [float] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[FiscalYearId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OpeningClosingBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderAccess]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderAccess](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OrderAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderByLastDaySale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderByLastDaySale](
	[Id] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[TotalSuplier] [int] NOT NULL,
	[PrintedSuplier] [int] NOT NULL,
	[TotalItem] [int] NOT NULL,
	[TotalQuentity] [int] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OrderByLastDaySale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderByLastDaySaleItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderByLastDaySaleItem](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderByLastDaySaleItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderByLastDaySalePrinted]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderByLastDaySalePrinted](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.OrderByLastDaySalePrinted] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderEmails]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderEmails](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[OrderInfoId] [uniqueidentifier] NOT NULL,
	[To] [nvarchar](max) NULL,
	[CC] [nvarchar](max) NULL,
	[Body] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[IsDelivered] [bit] NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OrderEmails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[SuplierEmail] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[OrderedQuentity] [int] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[Voucher] [nvarchar](max) NULL,
	[TotalSalePrice] [float] NOT NULL,
	[TotalPayablePrice] [float] NOT NULL,
	[Type] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TotalVat] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ApprovedStatus] [nvarchar](max) NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedChangeHistory] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OrderInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[OrderInfoId] [uniqueidentifier] NOT NULL,
	[CalculatedDays] [int] NOT NULL,
	[CalculatedQuentity] [float] NOT NULL,
	[OrderedQuentity] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[DefaultVat] [float] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[Position] [int] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AddFrom] [nvarchar](max) NULL,
	[Parameter] [nvarchar](max) NULL,
	[LoadedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[StockQuantity] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItemAdjust]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItemAdjust](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[OrderInfoId] [uniqueidentifier] NOT NULL,
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[CalculatedQuentity] [float] NOT NULL,
	[OrderedQuentity] [float] NOT NULL,
	[QuentityChanged] [float] NOT NULL,
	[Quentity] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[TPChanged] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[MRPChanged] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[AdjustType] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.OrderItemAdjust] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Section] [nvarchar](max) NULL,
	[MaxValue] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverTime]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTime](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[ApprovedDuration] [float] NOT NULL,
	[Amount] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OverTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverTimeApplication]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTimeApplication](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[MonthlyMax] [float] NOT NULL,
	[Days] [int] NOT NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[DailyMinutes] [float] NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[RoundBy] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OverTimeApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OverTimeSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OverTimeSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [float] NOT NULL,
	[RoundBy] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[MonthlyMax] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.OverTimeSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](30) NULL,
	[Gender] [nvarchar](max) NULL,
	[BloodGroup] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[AlternativeMobile] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Bed] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Paid] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Rank] [float] NOT NULL,
 CONSTRAINT [PK_dbo.PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsDefault] [nvarchar](max) NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Group] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PaymentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermanantDeleteHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermanantDeleteHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[DeletedId] [uniqueidentifier] NOT NULL,
	[DeleteFrom] [nvarchar](max) NULL,
	[Amount] [float] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[DeletedChanges] [nvarchar](max) NULL,
	[Info] [nvarchar](max) NULL,
	[Transations] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PermanantDeleteHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCounter]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCounter](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ProductCounter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductManufacturer]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductManufacturer](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[WebSite] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ProductManufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReturn](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[SaleDiscount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
	[CashReturn] [float] NOT NULL,
	[DueReturn] [float] NOT NULL,
	[DueAfter] [float] NOT NULL,
	[PaidAfter] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ProductReturn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReturnItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReturnItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleId] [uniqueidentifier] NOT NULL,
	[ProductReturnId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitPurchaseVAT] [float] NOT NULL,
	[UnitPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[SoldDiscount] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[ReturnDiscountP] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ProductReturnItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[IsDefault] [bit] NOT NULL,
	[Rank] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ProductUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseByReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseByReturn](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[ComputerId] [nvarchar](max) NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[SoldBy] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[ItemSold] [float] NOT NULL,
	[ItemReturn] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.PurchaseByReturn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseByReturnItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseByReturnItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseByReturnId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[SoldQnt] [float] NOT NULL,
	[ReturnQnt] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[SoldPrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[UnitSoldPrice] [float] NOT NULL,
	[UnitReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitPurchaseVAT] [float] NOT NULL,
	[UnitPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.PurchaseByReturnItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ChallanNo] [nvarchar](max) NULL,
	[ChallanDate] [datetime] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[Discount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[OrderInfoId] [uniqueidentifier] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[DefaultVAT] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SalePrice] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[ReduceAmount] [float] NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
	[FileCount] [int] NOT NULL,
	[MimeType] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SpecialDiscount] [float] NOT NULL,
	[DiscountReason] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.PurchaseInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QueryBuilder]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QueryBuilder](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Columns] [nvarchar](max) NULL,
	[GridStatment] [nvarchar](max) NULL,
	[FromTable] [nvarchar](max) NULL,
	[SqlCriteria] [nvarchar](max) NULL,
	[GridGroupBy] [nvarchar](max) NULL,
	[DefaultSortBy] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.QueryBuilder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RackItems]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RackItems](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[RackId] [uniqueidentifier] NOT NULL,
	[CellId] [nvarchar](max) NULL,
	[Row] [int] NOT NULL,
	[Column] [int] NOT NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.RackItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racks]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racks](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[RackId] [nvarchar](max) NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Racks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RewardPoint]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardPoint](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Total] [float] NOT NULL,
	[Pending] [float] NOT NULL,
	[Spent] [float] NOT NULL,
	[Converted] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.RewardPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RewardPointHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardPointHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelationId] [uniqueidentifier] NOT NULL,
	[Changed] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Pending] [float] NOT NULL,
	[Spent] [float] NOT NULL,
	[Converted] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.RewardPointHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RewardPointSetting]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RewardPointSetting](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[SaleAmount] [float] NOT NULL,
	[Point] [float] NOT NULL,
	[Conversion] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.RewardPointSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Salary] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SalaryInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[MonthSalaryId] [uniqueidentifier] NOT NULL,
	[Basic] [float] NOT NULL,
	[OverTime] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[OtherBenefit] [float] NOT NULL,
	[WorkingDays] [float] NOT NULL,
	[Attend] [float] NOT NULL,
	[AutoAttend] [float] NOT NULL,
	[Advance] [float] NOT NULL,
	[OtherDeduction] [float] NOT NULL,
	[PayableAmount] [float] NOT NULL,
	[Status] [nvarchar](100) NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[PaidBy] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[LeaveWithoutPay] [float] NOT NULL,
	[Absent] [float] NOT NULL,
	[LateEntryDeduction] [float] NOT NULL,
	[EarlyOut] [float] NOT NULL,
	[SalaryEarned] [float] NOT NULL,
	[TotalDeduction] [float] NOT NULL,
 CONSTRAINT [PK_dbo.SalaryItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryPayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryPayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Basic] [float] NOT NULL,
	[WorkingHour] [float] NOT NULL,
	[Attended] [float] NOT NULL,
	[AttendedHour] [float] NOT NULL,
	[Leave] [float] NOT NULL,
	[LeaveHour] [float] NOT NULL,
	[LateEntry] [float] NOT NULL,
	[LateEntryHour] [float] NOT NULL,
	[Absent] [float] NOT NULL,
	[AbsentHour] [float] NOT NULL,
	[OverTime] [float] NOT NULL,
	[OverTimeHour] [float] NOT NULL,
	[ScheduledBonus] [float] NOT NULL,
	[Loan] [float] NOT NULL,
	[Advance] [float] NOT NULL,
	[Bonus] [float] NOT NULL,
	[Deduction] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[PaidBy] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ChangedData] [nvarchar](max) NULL,
	[AutoDataId] [uniqueidentifier] NOT NULL,
	[WorkingDays] [float] NOT NULL,
	[NetPayable] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SalaryPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalaryRepayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalaryRepayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SalaryPaymentId] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[PaidAt] [datetime] NOT NULL,
	[PaidBy] [uniqueidentifier] NOT NULL,
	[PayableAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SalaryRepayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleInfoDesktop]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleInfoDesktop](
	[Id] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[PaymentType] [nvarchar](max) NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[ItemCount] [int] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[RewardPoint] [float] NOT NULL,
	[RewardPointTK] [float] NOT NULL,
	[Value] [float] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[DeliveryCharge] [float] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[DoctorId] [uniqueidentifier] NOT NULL,
	[AdmissionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SaleInfoDesktop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleItemDesktop]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleItemDesktop](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[TotalPayableSalePrice] [float] NOT NULL,
	[TotalPayableTradePrice] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[VatType] [int] NOT NULL,
	[IsDelivered] [int] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[CurrentStock] [float] NOT NULL,
	[TotalStock] [float] NOT NULL,
	[Position] [float] NOT NULL,
 CONSTRAINT [PK_dbo.SaleItemDesktop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalePaymentMathod]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePaymentMathod](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemSaleInfoId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[TransactionId] [nvarchar](max) NULL,
	[CardNo] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SalePaymentMathod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesErrorWithImages]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesErrorWithImages](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SaleId] [uniqueidentifier] NOT NULL,
	[Image] [varbinary](max) NULL,
	[PreviousItems] [nvarchar](max) NULL,
	[AfterItems] [nvarchar](max) NULL,
	[SaleInfo] [nvarchar](max) NULL,
	[PreviousAmount] [float] NOT NULL,
	[AfterAmount] [float] NOT NULL,
	[ComputerId] [nvarchar](max) NULL,
	[ScreenShot] [varbinary](max) NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_dbo.SalesErrorWithImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleServiceItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleServiceItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SaleId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[DefaultRate] [float] NOT NULL,
	[Rate] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SaleServiceItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedPurchase]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedPurchase](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[ChallanNo] [nvarchar](max) NULL,
	[PurchasePrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[TradePrice] [float] NOT NULL,
	[SalePrice] [float] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
	[ItemCount] [int] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[FileCount] [int] NOT NULL,
	[MimeType] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Items] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SavedPurchase] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedStock](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[BatchMRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[SummaryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SavedStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaveStockSummary]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaveStockSummary](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[BatchMRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[ItemCount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SaveStockSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServerEventLog]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServerEventLog](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MachineName] [nvarchar](max) NULL,
	[Index] [int] NOT NULL,
	[Category] [nvarchar](max) NULL,
	[CategoryNumber] [smallint] NOT NULL,
	[EventID] [int] NOT NULL,
	[EntryType] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[ReplacementStrings] [nvarchar](max) NULL,
	[InstanceId] [bigint] NOT NULL,
	[TimeGenerated] [datetime] NOT NULL,
	[TimeWritten] [datetime] NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ServerEventLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_dbo.ServiceItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiftTime]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiftTime](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[ShiftId] [uniqueidentifier] NOT NULL,
	[StartAt] [datetime] NOT NULL,
	[EndAt] [datetime] NOT NULL,
	[Duration] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ShiftTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SMSHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[ApiResponse] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SMSHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLErrors]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLErrors](
	[Id] [uniqueidentifier] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NOT NULL,
	[ErrorState] [int] NOT NULL,
	[ErrorProcedure] [nvarchar](max) NULL,
	[ErrorLine] [int] NOT NULL,
	[ErrorMessage] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SQLErrors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLQuery]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLQuery](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SortBy] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[SumCols] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.SQLQuery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SQLQueryToExecute]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SQLQueryToExecute](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SQLQueryToExecute] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockCompare]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCompare](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FromStock] [uniqueidentifier] NOT NULL,
	[ToStock] [uniqueidentifier] NOT NULL,
	[Quantity] [float] NOT NULL,
	[TP] [float] NOT NULL,
	[MRP] [float] NOT NULL,
	[BatchMRP] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[ItemCount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.StockCompare] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockOpening]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockOpening](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Purchase] [float] NOT NULL,
	[Stock] [float] NOT NULL,
	[Sale] [float] NOT NULL,
	[Return] [float] NOT NULL,
	[Adjust] [float] NOT NULL,
	[OpeningDate] [datetime] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.StockOpening] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockTransferInfo]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransferInfo](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FromId] [uniqueidentifier] NOT NULL,
	[ToId] [uniqueidentifier] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[TotalProduct] [int] NOT NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[Voucher] [nvarchar](max) NULL,
	[TotalMRP] [float] NOT NULL,
	[PayableTP] [float] NOT NULL,
	[ChangedStatus] [nvarchar](max) NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[LastChangedBy] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.StockTransferInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockTransferItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransferItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FromItemId] [uniqueidentifier] NOT NULL,
	[ToItemId] [uniqueidentifier] NOT NULL,
	[StockTransferInfoId] [uniqueidentifier] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[QuantityTransfered] [float] NOT NULL,
	[QuantityApproved] [float] NOT NULL,
	[UnitTP] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[UnitMRP] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[Vat] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[LastChangedAt] [datetime] NOT NULL,
	[LastChangedBy] [uniqueidentifier] NOT NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_dbo.StockTransferItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenuItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenuItem](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[MenuCategoryId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ActionMethodId] [int] NOT NULL,
	[ControllerId] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SubMenuItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenuItemAccess]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenuItemAccess](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SubMenuItemId] [uniqueidentifier] NOT NULL,
	[MenuItemId] [uniqueidentifier] NOT NULL,
	[MenuCategoryId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SubMenuItemAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplier]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplier](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SuplierId] [nvarchar](max) NULL,
	[AccountNo] [nvarchar](max) NULL,
	[AccountName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[WebSite] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Vat] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SuplierOrderCategoryId] [uniqueidentifier] NOT NULL,
	[CounterId] [uniqueidentifier] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Suplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierDue](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[TotalReceivableAmount] [float] NOT NULL,
	[Receive] [float] NOT NULL,
	[ReceivableAmountDue] [float] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierDue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierDueHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierDueHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[SuplierDueId] [uniqueidentifier] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[DueAmount] [float] NOT NULL,
	[ChangeAmount] [float] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[TotalReceivableAmount] [float] NOT NULL,
	[Receive] [float] NOT NULL,
	[ReceivableAmountDue] [float] NOT NULL,
	[ReceivableAmountChanged] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierDueHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierOrderCategory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierOrderCategory](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierOrderCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierPayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierPayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseId] [uniqueidentifier] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[PurchaseAmount] [float] NOT NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[PurchaseAt] [datetime] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierPaymentAdjust]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierPaymentAdjust](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseId] [uniqueidentifier] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[PurchaseAmount] [float] NOT NULL,
	[AdjustAmount] [float] NOT NULL,
	[PurchaseAt] [datetime] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[Type] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierPaymentAdjust] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierReturn](
	[Id] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchasedBy] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[ItemPurchased] [float] NOT NULL,
	[ItemReturn] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[PurchasedPrice] [float] NOT NULL,
	[ReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[PurchaseVAT] [float] NOT NULL,
	[PurchaseDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierReturn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuplierReturnItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuplierReturnItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[SuplierReturnId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[VoucharNo] [nvarchar](max) NULL,
	[PurchaseQnt] [float] NOT NULL,
	[ReturnQnt] [float] NOT NULL,
	[TotalPurchasePrice] [float] NOT NULL,
	[PurchasePrice] [float] NOT NULL,
	[ReturnAmount] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitReturnPrice] [float] NOT NULL,
	[ReturnDiscount] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalReturnDiscount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitPurchaseVAT] [float] NOT NULL,
	[UnitPurchaseDiscount] [float] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SuplierReturnItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierAdvance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierAdvance](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[AdvanceAmount] [float] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[TotalAdvanced] [float] NOT NULL,
	[RefundedAmount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.SupplierAdvance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierAdvanceHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierAdvanceHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[AdvanceId] [uniqueidentifier] NOT NULL,
	[TotalAdvanced] [float] NOT NULL,
	[AdvanceAmount] [float] NOT NULL,
	[RefundedAmount] [float] NOT NULL,
	[ChangeAmount] [float] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SupplierAdvanceHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierAdvancePayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierAdvancePayment](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[AdvanceId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[AdvanceAmount] [float] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.SupplierAdvancePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableJoin]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableJoin](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[FromTableId] [uniqueidentifier] NOT NULL,
	[ToTableId] [uniqueidentifier] NOT NULL,
	[JoinType] [nvarchar](max) NULL,
	[FromColumn] [nvarchar](max) NULL,
	[ToColumn] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.TableJoin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxComponent]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxComponent](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Rate] [float] NOT NULL,
	[IsRecoverable] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.TaxComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxRate]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxRate](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Rate] [float] NOT NULL,
	[Components] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.TaxRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxRateComponent]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxRateComponent](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TaxRateId] [uniqueidentifier] NOT NULL,
	[TaxComponentId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.TaxRateComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestItems]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestItems](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BName] [nvarchar](max) NULL,
	[SubText] [nvarchar](max) NULL,
	[M] [float] NOT NULL,
	[M1] [float] NOT NULL,
	[M2] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextData]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextData](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Text1] [nvarchar](max) NULL,
	[Text2] [nvarchar](max) NULL,
	[Text3] [nvarchar](max) NULL,
	[Text4] [nvarchar](max) NULL,
	[Text5] [nvarchar](max) NULL,
	[Text6] [nvarchar](max) NULL,
	[Text7] [nvarchar](max) NULL,
	[Text8] [nvarchar](max) NULL,
	[Text9] [nvarchar](max) NULL,
	[Numb1] [float] NULL,
	[Numb2] [float] NULL,
	[Numb3] [float] NULL,
	[Numb4] [float] NULL,
	[Numb5] [float] NULL,
	[Numb6] [float] NULL,
	[Numb7] [float] NULL,
	[Numb8] [float] NULL,
	[Numb9] [float] NULL,
 CONSTRAINT [PK_dbo.TextData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TPChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TPChangeHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemHistoryId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[TPBefore] [float] NOT NULL,
	[TPChanged] [float] NOT NULL,
	[TPAfter] [float] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[Stock] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[Relation] [nvarchar](max) NULL,
	[RelativeId] [uniqueidentifier] NOT NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[ChangeLog] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TPChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainedLabel]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainedLabel](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[Label] [nvarchar](max) NULL,
	[Matrix] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.TrainedLabel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Debit] [float] NOT NULL,
	[Credit] [float] NOT NULL,
	[FiscalYearId] [uniqueidentifier] NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[SourceType] [int] NOT NULL,
	[SourceId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UnitType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[VoucherNo] [nvarchar](max) NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[TotalProduct] [float] NOT NULL,
	[TotalQuantiry] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[PayableTP] [float] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UnsalableProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProductBatch]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProductBatch](
	[Id] [uniqueidentifier] NOT NULL,
	[UnsalableProductItemId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[Quantiry] [float] NOT NULL,
	[UnitTP] [float] NOT NULL,
	[UnitMRP] [float] NOT NULL,
	[UnitDiscount] [float] NOT NULL,
	[UnitVat] [float] NOT NULL,
	[UnitPurchase] [float] NOT NULL,
 CONSTRAINT [PK_dbo.UnsalableProductBatch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProductItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProductItem](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ItemReceiveId] [uniqueidentifier] NOT NULL,
	[UnsalableProductId] [uniqueidentifier] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Quantiry] [float] NOT NULL,
	[UnitTP] [float] NOT NULL,
	[UnitMRP] [float] NOT NULL,
	[TotalMRP] [float] NOT NULL,
	[TotalTP] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[TotalVat] [float] NOT NULL,
	[PayableTP] [float] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UnsalableProductItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProductSalvageValue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProductSalvageValue](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[UnsalableProductId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[SalvageValue] [float] NOT NULL,
	[ReceivedValue] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UnsalableProductSalvageValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProductSalvageValueAccount]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProductSalvageValueAccount](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UnsalableProductSalvageValueAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnsalableProductSalvageValueReceived]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnsalableProductSalvageValueReceived](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[UnsalableProductSalvageValueId] [uniqueidentifier] NOT NULL,
	[AccountId] [uniqueidentifier] NOT NULL,
	[Amount] [float] NOT NULL,
	[Due] [float] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.UnsalableProductSalvageValueReceived] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrgentAlertList]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrgentAlertList](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[MinStockToAlert] [float] NOT NULL,
	[MaxStockWhenPurchas] [float] NOT NULL,
	[AlertType] [nvarchar](max) NULL,
	[Remarks] [nvarchar](max) NULL,
	[ActivityId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UrgentAlertList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[TypeId] [uniqueidentifier] NOT NULL,
	[DesignationId] [uniqueidentifier] NOT NULL,
	[SalaryId] [uniqueidentifier] NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](16) NOT NULL,
	[PAddress] [nvarchar](max) NULL,
	[CAddress] [nvarchar](max) NULL,
	[AttendanceId] [int] NOT NULL,
	[HourlyOverTimeRate] [float] NOT NULL,
	[WorkingMinutes] [int] NOT NULL,
	[LeaveStructureId] [uniqueidentifier] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[MaxSaleDiscount] [int] NOT NULL,
	[CounterAccess] [nvarchar](max) NULL,
	[MaxDue] [float] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouseStockPositionChange]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouseStockPositionChange](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[ReferenceId] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[StockBefore] [float] NOT NULL,
	[StockAfter] [float] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[TPBefore] [float] NOT NULL,
	[TPChange] [float] NOT NULL,
	[TPAfter] [float] NOT NULL,
	[MRPBefore] [float] NOT NULL,
	[MRPChange] [float] NOT NULL,
	[MRPAfter] [float] NOT NULL,
	[DiscountBefore] [float] NOT NULL,
	[DiscountChange] [float] NOT NULL,
	[DiscountAfter] [float] NOT NULL,
 CONSTRAINT [PK_dbo.WareHouseStockPositionChange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WareHouseStocks]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WareHouseStocks](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[SuplierId] [uniqueidentifier] NOT NULL,
	[PurchaseInfoId] [uniqueidentifier] NOT NULL,
	[SalesUnitTypeId] [uniqueidentifier] NOT NULL,
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitConversion] [float] NOT NULL,
	[UnitQuentity] [float] NOT NULL,
	[UnitQuentitySold] [float] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[TotalTradePrice] [float] NOT NULL,
	[UnitSalePrice] [float] NOT NULL,
	[TotalSoldPrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[TotalVAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[TotalDiscount] [float] NOT NULL,
	[Position] [int] NOT NULL,
	[DefaultVat] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL,
	[ActivateAt] [datetime] NOT NULL,
	[Type] [int] NOT NULL,
	[DefaultDiscount] [float] NOT NULL,
	[MarginDiscount] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[UnitVAT] [float] NOT NULL,
	[UnitDiscount] [float] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ChangeAt] [datetime] NOT NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[FreeQuantity] [float] NOT NULL,
	[FreeAmount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.WareHouseStocks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weekend]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weekend](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[From] [datetime] NOT NULL,
	[To] [datetime] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Weekend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeekendException]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekendException](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[UpdatedBy] [uniqueidentifier] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ChangeLog] [nvarchar](max) NULL,
	[BranchId] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Application] [nvarchar](max) NULL,
	[ApprovedBy] [uniqueidentifier] NOT NULL,
	[ApprovedAt] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.WeekendException] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__Increas__52AE4273]  DEFAULT ((0)) FOR [IncreaseType]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AccountGroup] ADD  DEFAULT ((0)) FOR [IncreaseType]
GO
ALTER TABLE [dbo].[AccountGroup] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AccountGroupCategory] ADD  DEFAULT ((0)) FOR [IncreaseType]
GO
ALTER TABLE [dbo].[AccountGroupCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AccountReporting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AccountReportingItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AccountId]
GO
ALTER TABLE [dbo].[AccountReportingItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ActionMethodGroup] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ActionMethodGroupItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [TPChanged]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [MRPChanged]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [TPBefore]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [MRPBefore]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [TPAfter]
GO
ALTER TABLE [dbo].[AdjustHistory] ADD  DEFAULT ((0)) FOR [MRPAfter]
GO
ALTER TABLE [dbo].[AdjustItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdjustHistoryId]
GO
ALTER TABLE [dbo].[AdvanceSalary] ADD  DEFAULT ((0)) FOR [RePayment]
GO
ALTER TABLE [dbo].[AdvanceSalary] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AdvanceSalary] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CounterId]
GO
ALTER TABLE [dbo].[AdvanceSalaryRePayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((0)) FOR [IsOut]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((0)) FOR [AdjustmentType]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AttendanceDeduction] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[AutoSalaryPayment] ADD  DEFAULT ((0)) FOR [WorkingDays]
GO
ALTER TABLE [dbo].[AutoSalaryPayment] ADD  DEFAULT ((0)) FOR [NetPayable]
GO
ALTER TABLE [dbo].[AutoSalaryPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BalanceSheetSetting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BalanceSheetSettingItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BankAccount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AccountId]
GO
ALTER TABLE [dbo].[BankAccount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BankAccountAddress] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BankAccountContact] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BankTransaction] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [TotalTax]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [ReferanceType]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ReferenceId]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BillItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BillId]
GO
ALTER TABLE [dbo].[BillItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BillPayment] ADD  DEFAULT ((0)) FOR [DueAmount]
GO
ALTER TABLE [dbo].[BillPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[BonusStructure] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Branch] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CompanyId]
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[CCEmail] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[CheckInOut] ADD  DEFAULT ((0)) FOR [VerifyMode]
GO
ALTER TABLE [dbo].[CheckInOut] ADD  DEFAULT ((0)) FOR [InOutMode]
GO
ALTER TABLE [dbo].[CheckInOut] ADD  DEFAULT ((0)) FOR [WorkCode]
GO
ALTER TABLE [dbo].[Cheque] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Computer] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [Id]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ProductId1]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ProductId2]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CounterId1]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CounterId2]
GO
ALTER TABLE [dbo].[CounterProductRelation] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_FileCount]  DEFAULT ((0)) FOR [FileCount]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [MaxDue]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [TotalDiscount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [TotalTP]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [TotalProfit]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [Profit]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [ReturnAmount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [ReturnDiscount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [AdjustAmount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [CancelAmount]
GO
ALTER TABLE [dbo].[CustomerDue] ADD  DEFAULT ((0)) FOR [DueAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [ReturnAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [DueAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [AdjustAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [CancelAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ((0)) FOR [ChangeAmount]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ReferenceId]
GO
ALTER TABLE [dbo].[CustomerDueHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[CustomerExtraDiscount] ADD  DEFAULT ((0)) FOR [PaidAfter]
GO
ALTER TABLE [dbo].[CustomerInvestigationPicture] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [HospitalId]
GO
ALTER TABLE [dbo].[CustomerPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ReferenceId]
GO
ALTER TABLE [dbo].[CustomerPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ((0)) FOR [CashReturn]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ((0)) FOR [DueReturn]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ((0)) FOR [ExtraDiscount]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ((0)) FOR [PaidAfter]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RelativeId]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[CustomerPaymentToInvoice] ADD  DEFAULT ((0)) FOR [Return]
GO
ALTER TABLE [dbo].[CustomerPrescriptionPicture] ADD  DEFAULT ((0)) FOR [ImageCount]
GO
ALTER TABLE [dbo].[DailyAttendance] ADD  DEFAULT ((0)) FOR [AbNormalityCount]
GO
ALTER TABLE [dbo].[DailyAttendance] ADD  DEFAULT ((0)) FOR [SolvedCount]
GO
ALTER TABLE [dbo].[DailyAttendance] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[DailyAttendance] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DailyCashFlow] ADD  DEFAULT ('2010-01-01 00:00') FOR [From]
GO
ALTER TABLE [dbo].[DailyCashFlow] ADD  DEFAULT ('2010-01-01 00:00') FOR [To]
GO
ALTER TABLE [dbo].[DailyInOut] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DailyItemSales] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DailySale] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DailySale] ADD  DEFAULT ((0)) FOR [Due]
GO
ALTER TABLE [dbo].[DailySale] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[DailySales] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DayInfo] ADD  DEFAULT ((0)) FOR [TradeAmount]
GO
ALTER TABLE [dbo].[DayInfo] ADD  DEFAULT ((0)) FOR [DiscountAmount]
GO
ALTER TABLE [dbo].[DayInfo] ADD  DEFAULT ((0)) FOR [VatAmount]
GO
ALTER TABLE [dbo].[DayInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DayInfoItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[DBChangeHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [TableId]
GO
ALTER TABLE [dbo].[DBTable] ADD  DEFAULT ((0)) FOR [IsEditable]
GO
ALTER TABLE [dbo].[Depreciation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Designation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Designation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [LeaveStructureId]
GO
ALTER TABLE [dbo].[Designation] ADD  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[Designation] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[DeviceAccess] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[DeviceAccess] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[DeviceActivity] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [SessionId]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [DesignationId]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [DepartmentId]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [GroupId]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [DoctorFeesId]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [Fee]
GO
ALTER TABLE [dbo].[Doctor] ADD  DEFAULT ((0)) FOR [MaxDiscount]
GO
ALTER TABLE [dbo].[EmployeeBonus] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [StartDate]
GO
ALTER TABLE [dbo].[EmployeeBonus] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [EndDate]
GO
ALTER TABLE [dbo].[EmployeeBonus] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BonusStructureId]
GO
ALTER TABLE [dbo].[EmployeeBonus] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[EmployeeBonusDetails] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BonusStructureId]
GO
ALTER TABLE [dbo].[EmployeeBonusDetails] ADD  DEFAULT ((0)) FOR [Month]
GO
ALTER TABLE [dbo].[EmployeeBonusDetails] ADD  DEFAULT ((0)) FOR [Year]
GO
ALTER TABLE [dbo].[EmployeeBonusDetails] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [LoanType]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [Interest]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [BaseInstallment]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [Installment]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [TotalInstallment]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[EmployeeLoan] ADD  DEFAULT ((0)) FOR [InstallmentCopleted]
GO
ALTER TABLE [dbo].[EmployeeLoanRepayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[EmployeePromotion] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[EmployeeShift] ADD  DEFAULT ((0)) FOR [EndDayOfMonth]
GO
ALTER TABLE [dbo].[EmployeeShift] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ExpenseDocuments] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ExpenseDocuments] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ExpenseDocuments] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ExpenseDocuments] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ExpenseDocuments] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [ApprovedAt]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ((0)) FOR [FileCount]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CounterId]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[ExpenseItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [UserId]
GO
ALTER TABLE [dbo].[ExpenseType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  CONSTRAINT [DF_ExtraDiscount_ActivityId]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ReferenceId]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ((0)) FOR [CashReturn]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ((0)) FOR [DueReturn]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ((0)) FOR [DueAfter]
GO
ALTER TABLE [dbo].[ExtraDiscount] ADD  DEFAULT ((0)) FOR [PaidAfter]
GO
ALTER TABLE [dbo].[FiscalYear] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[FiscalYear] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[FixedAsset] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[FixedAsset] ADD  DEFAULT ((0)) FOR [DepreciationCost]
GO
ALTER TABLE [dbo].[FixedAsset] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[FixedAssetType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[GridData] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [LoadedAt]
GO
ALTER TABLE [dbo].[Holidays] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Increment] ADD  DEFAULT ((0)) FOR [IncrementAmount]
GO
ALTER TABLE [dbo].[Increment] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [EffectiveFrom]
GO
ALTER TABLE [dbo].[Increment] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Increment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[InventoryAlert] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[InventoryAlert] ADD  DEFAULT ((0)) FOR [ActionType]
GO
ALTER TABLE [dbo].[InventoryAlert] ADD  DEFAULT ((0)) FOR [RequiredQuentity]
GO
ALTER TABLE [dbo].[InventoryAlert] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[InventoryDue] ADD  DEFAULT ((0)) FOR [OrginalDue]
GO
ALTER TABLE [dbo].[InventoryDuePayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [PatientId]
GO
ALTER TABLE [dbo].[InventoryDuePayment] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[InventoryItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_ManufacturerId]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ManufacturerId]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF_Item_MaxStockWhenPurchase]  DEFAULT ((0)) FOR [MaxStockWhenPurchase]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__RackItemId__531856C7]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RackItemId]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__TotalTrade__540C7B00]  DEFAULT ((0)) FOR [TotalTradePrice]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__TotalSaleP__55009F39]  DEFAULT ((0)) FOR [TotalSalePrice]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__UnitPurcha__55F4C372]  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__PurchaseVa__56E8E7AB]  DEFAULT ((0)) FOR [PurchaseVat]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__TotalPurch__57DD0BE4]  DEFAULT ((0)) FOR [TotalPurchaseDiscount]
GO
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__BranchId__38B96646]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [GenericNameId]
GO
ALTER TABLE [dbo].[Item] ADD  DEFAULT ((0)) FOR [ExpairDateAlert]
GO
ALTER TABLE [dbo].[ItemCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [UnitChangeConversion]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ItemId]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RackItemId]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [TotalTradePrice]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [TotalSalePrice]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [PurchaseVat]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [TotalPurchaseDiscount]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ManufacturerId]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [MaxStockWhenPurchase]
GO
ALTER TABLE [dbo].[ItemHistory] ADD  DEFAULT ((0)) FOR [ExpairDateAlert]
GO
ALTER TABLE [dbo].[ItemPurchase] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemPurchase] ADD  DEFAULT ((0)) FOR [FreeQuantity]
GO
ALTER TABLE [dbo].[ItemPurchase] ADD  DEFAULT ((0)) FOR [FreeAmount]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [MarginDiscount]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [UnitVAT]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [UnitDiscount]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [ChangeAt]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [FreeQuantity]
GO
ALTER TABLE [dbo].[ItemReceive] ADD  DEFAULT ((0)) FOR [FreeAmount]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CreatedBy]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[ItemReceiveVoucherImage] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ((0)) FOR [PurchasePrice]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ((0)) FOR [PurchaseVAT]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ((0)) FOR [PurchaseDiscount]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemSale] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[ItemSaleBatch] ADD  CONSTRAINT [DF__ItemSaleB__ItemS__08AB2BC8]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ItemSaleId]
GO
ALTER TABLE [dbo].[ItemSaleBatch] ADD  DEFAULT ((0)) FOR [UnitTP]
GO
ALTER TABLE [dbo].[ItemSaleBatch] ADD  DEFAULT ((0)) FOR [PurchaseDiscount]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [PurchasePrice]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [PurchaseVAT]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [PurchaseDiscount]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [RewardPoint]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [RewardPointTK]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ((0)) FOR [DeliveryCharge]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [DoctorId]
GO
ALTER TABLE [dbo].[ItemSaleInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [CashAmount]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [ChangedAmount]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [Due]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [RewardPoint]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [RewardPointTK]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [DeliveryCharge]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [PreviousDue]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [Vat]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [TotalVat]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [Paid]
GO
ALTER TABLE [dbo].[ItemSalePayment] ADD  DEFAULT ((0)) FOR [Return]
GO
ALTER TABLE [dbo].[ItemSales] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemSetting] ADD  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[ItemSetting] ADD  DEFAULT ((0)) FOR [PurchaseDiscount]
GO
ALTER TABLE [dbo].[ItemSetting] ADD  DEFAULT ((0)) FOR [PurchaseVat]
GO
ALTER TABLE [dbo].[ItemSetting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ItemStockChangeHistory] ADD  DEFAULT ((0)) FOR [TotalTradePrice]
GO
ALTER TABLE [dbo].[ItemStockChangeHistory] ADD  DEFAULT ((0)) FOR [TotalSalePrice]
GO
ALTER TABLE [dbo].[ItemStockChangeHistory] ADD  DEFAULT ((0)) FOR [TotalTPDiscount]
GO
ALTER TABLE [dbo].[ItemType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LateEntry] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LateEntrySetting] ADD  DEFAULT ((0)) FOR [RoundBy]
GO
ALTER TABLE [dbo].[LateEntrySetting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [RelativeId]
GO
ALTER TABLE [dbo].[LateEntrySetting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LeaveCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LeaveCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[LeaveInfo] ADD  DEFAULT ((0)) FOR [ApprovedDays]
GO
ALTER TABLE [dbo].[LeaveInfo] ADD  DEFAULT ((0)) FOR [OverFlowType]
GO
ALTER TABLE [dbo].[LeaveInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LeaveItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [StartAt]
GO
ALTER TABLE [dbo].[LeaveItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [EndAt]
GO
ALTER TABLE [dbo].[LeaveItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LeaveStructure] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LeaveStructureItems] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LoanAccount] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LoanApprover] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LoanStructure] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[LoanType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ((0)) FOR [TaxType]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ((0)) FOR [Debit]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ((0)) FOR [Credit]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ((0)) FOR [DebitTax]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ((0)) FOR [CreditTax]
GO
ALTER TABLE [dbo].[ManualJournal] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [Date]
GO
ALTER TABLE [dbo].[MenuAccess] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[MenuCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[MenuItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ParentId]
GO
ALTER TABLE [dbo].[MenuItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[MergedDatabase] ADD  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[MonthlySalary] ADD  DEFAULT ((0)) FOR [Employee]
GO
ALTER TABLE [dbo].[MonthlySalary] ADD  DEFAULT ((0)) FOR [Prepared]
GO
ALTER TABLE [dbo].[MonthlySalary] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Movement] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[MovementDetail] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[MovementType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OnlineData] ADD  CONSTRAINT [DF_OnlineData_Name]  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[OpeningClosingBalance] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OrderByLastDaySaleItem] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[OrderEmails] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ((0)) FOR [TotalVat]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ((0)) FOR [TotalDiscount]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ('2000-01-01 00:00') FOR [ApprovedAt]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ApprovedBy]
GO
ALTER TABLE [dbo].[OrderInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [LoadedAt]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[OrderSetting] ADD  DEFAULT ((0)) FOR [MaxValue]
GO
ALTER TABLE [dbo].[OverTime] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [DailyMinutes]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [StartAt]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [EndAt]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [Duration]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [RoundBy]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [Value]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OverTimeApplication] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[OverTimeSetting] ADD  DEFAULT ((0)) FOR [RoundBy]
GO
ALTER TABLE [dbo].[OverTimeSetting] ADD  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OverTimeSetting] ADD  DEFAULT ((0)) FOR [MonthlyMax]
GO
ALTER TABLE [dbo].[OverTimeSetting] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[PaymentMethod] ADD  DEFAULT ((0)) FOR [Rank]
GO
ALTER TABLE [dbo].[PaymentType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AccountId]
GO
ALTER TABLE [dbo].[ProductCounter] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [PurchasePrice]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [PurchaseVAT]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [PurchaseDiscount]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [SaleDiscount]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [RewardPoint]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [RewardPointTK]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [SoldPrice]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ReferenceId]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [CashReturn]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [DueReturn]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [DueAfter]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ((0)) FOR [PaidAfter]
GO
ALTER TABLE [dbo].[ProductReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [UnitPurchasePrice]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [UnitPurchaseVAT]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [UnitPurchaseDiscount]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [SoldPrice]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [SoldDiscount]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [ReturnDiscount]
GO
ALTER TABLE [dbo].[ProductReturnItem] ADD  DEFAULT ((0)) FOR [ReturnDiscountP]
GO
ALTER TABLE [dbo].[PurchaseByReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[PurchaseByReturnItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [MarginDiscount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [ReduceAmount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [TotalDiscount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [FreeQuantity]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [FreeAmount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [FileCount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ((0)) FOR [SpecialDiscount]
GO
ALTER TABLE [dbo].[PurchaseInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[RackItems] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Racks] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SalaryInfo] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [LeaveWithoutPay]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [Absent]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [LateEntryDeduction]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [EarlyOut]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [SalaryEarned]
GO
ALTER TABLE [dbo].[SalaryItem] ADD  DEFAULT ((0)) FOR [TotalDeduction]
GO
ALTER TABLE [dbo].[SalaryPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AutoDataId]
GO
ALTER TABLE [dbo].[SalaryPayment] ADD  DEFAULT ((0)) FOR [WorkingDays]
GO
ALTER TABLE [dbo].[SalaryPayment] ADD  DEFAULT ((0)) FOR [NetPayable]
GO
ALTER TABLE [dbo].[SalaryPayment] ADD  DEFAULT ((0)) FOR [PaidAmount]
GO
ALTER TABLE [dbo].[SalaryPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SalaryRepayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [EmployeeId]
GO
ALTER TABLE [dbo].[SalaryRepayment] ADD  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SalaryRepayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SaleInfoDesktop] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[SaleInfoDesktop] ADD  DEFAULT ((0)) FOR [DeliveryCharge]
GO
ALTER TABLE [dbo].[SaleInfoDesktop] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [DoctorId]
GO
ALTER TABLE [dbo].[SaleInfoDesktop] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AdmissionId]
GO
ALTER TABLE [dbo].[SaleItemDesktop] ADD  DEFAULT ((0)) FOR [Position]
GO
ALTER TABLE [dbo].[SalesErrorWithImages] ADD  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[SavedStock] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [SummaryId]
GO
ALTER TABLE [dbo].[SaveStockSummary] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ((0)) FOR [Index]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ((0)) FOR [CategoryNumber]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ((0)) FOR [EventID]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ((0)) FOR [EntryType]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ((0)) FOR [InstanceId]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [TimeGenerated]
GO
ALTER TABLE [dbo].[ServerEventLog] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [TimeWritten]
GO
ALTER TABLE [dbo].[SMSHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ActivityId]
GO
ALTER TABLE [dbo].[SMSHistory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CustomerId]
GO
ALTER TABLE [dbo].[SQLErrors] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[StockCompare] ADD  DEFAULT ((0)) FOR [ItemCount]
GO
ALTER TABLE [dbo].[StockOpening] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SubMenuItem] ADD  DEFAULT ((0)) FOR [ActionMethodId]
GO
ALTER TABLE [dbo].[SubMenuItem] ADD  DEFAULT ((0)) FOR [ControllerId]
GO
ALTER TABLE [dbo].[SubMenuItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SubMenuItemAccess] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Suplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [SuplierOrderCategoryId]
GO
ALTER TABLE [dbo].[Suplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [CounterId]
GO
ALTER TABLE [dbo].[Suplier] ADD  DEFAULT ((0)) FOR [MarginDiscount]
GO
ALTER TABLE [dbo].[Suplier] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SuplierDueHistory] ADD  CONSTRAINT [DF_SuplierDueHistory_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[SuplierOrderCategory] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SuplierPayment] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SuplierPayment] ADD  DEFAULT ('2000-01-01 00:00') FOR [Date]
GO
ALTER TABLE [dbo].[SuplierPayment] ADD  CONSTRAINT [DF__SuplierPa__Accou__1D1C38C9]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [AccountId]
GO
ALTER TABLE [dbo].[SuplierPaymentAdjust] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SuplierReturn] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SuplierReturnItem] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[SupplierAdvance] ADD  DEFAULT ((0)) FOR [TotalAdvanced]
GO
ALTER TABLE [dbo].[SupplierAdvance] ADD  DEFAULT ((0)) FOR [RefundedAmount]
GO
ALTER TABLE [dbo].[TaxComponent] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[TaxRate] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[TaxRateComponent] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[UnitType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__HourlyOver__07E124C1]  DEFAULT ((0)) FOR [HourlyOverTimeRate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__WorkingMin__08D548FA]  DEFAULT ((0)) FOR [WorkingMinutes]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__LeaveStruc__21A0F6C4]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [LeaveStructureId]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [MaxSaleDiscount]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ((0)) FOR [MaxDue]
GO
ALTER TABLE [dbo].[UserType] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
ALTER TABLE [dbo].[Weekend] ADD  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [BranchId]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrderByLastDaySaleItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[CreateOrderByLastDaySaleItem]
  @UserId [Uniqueidentifier],
  @ComputerId [nvarchar](70),
  @ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

  
declare @from Date = DATEADD(day, -1, GetDate()), @to Date = GetDate(), @orderId [uniqueidentifier] =NewId();


if exists(SELECT [Id] FROM [dbo].[OrderByLastDaySale] where [Date] >= @from and [Date] <= @to)
	begin
		 SET @ErrorCode = -4
    RETURN;
	end

  BEGIN TRAN

BEGIN TRY



INSERT INTO [dbo].[OrderByLastDaySale]
           ([Id]
           ,[Status]
           ,[Remarks]
           ,[TotalSuplier]
           ,[PrintedSuplier]
           ,[TotalItem]
           ,[TotalQuentity]
           ,[Vat]
           ,[Discount]
           ,[TotalTP]
           ,[TotalMRP]
           ,[ComputerId]
           ,[Date]
           ,[CreatedAt]
           ,[CreatedBy])

  Select 
		@orderId,0,''
	  ,Count( Distinct SuplierId) [SuplierCount]
	  ,0
	  ,Count( Distinct [ItemId]) [ItemCount]
      ,-Sum([Quantity]) [Quantity]
	  ,0
	  ,0
      ,-Sum([UnitTradePrice]*[Quantity]) [TotalTP]
      ,-Sum([UnitSalePrice]*[Quantity]) [TotalMRP]
      ,@ComputerId
      ,@from
      ,GetDate()
      ,@UserId From (

SELECT [ItemId]
	  ,itm.SuplierId
	  ,itm.[UnitTradePrice]
	  ,itm.[UnitSalePrice]
      ,Sum([StockChanged]) [Quantity]
  FROM [dbo].[ItemStockChangeHistory] hstr
  left join [dbo].[Item] itm on hstr.[ItemId] = itm.Id
  where ([Type] = 1 or [Type] = 2 or [Type] = 5) And  hstr.[CreatedAt]>=@from And hstr.[CreatedAt]<@to

  Group by [ItemId]
	  ,itm.SuplierId
	  ,itm.[UnitTradePrice]
	  ,itm.[UnitSalePrice]

) itm
where itm.Quantity < 0


INSERT INTO [dbo].[OrderByLastDaySaleItem]
           ([Id]
           ,[OrderId]
           ,[ItemId]
           ,[SuplierId]
           ,[Quantity])      

Select NewId(), @orderId,[ItemId], [SuplierId], -[Quantity]
 From (

SELECT [ItemId]
	  ,itm.SuplierId
      ,Sum([StockChanged]) [Quantity]
  FROM [dbo].[ItemStockChangeHistory] hstr
  left join [dbo].[Item] itm on hstr.[ItemId] = itm.Id
  where ([Type] = 1 or [Type] = 2 or [Type] = 5) And  hstr.[CreatedAt]>=@from And hstr.[CreatedAt]<@to

  Group by [ItemId]
	  ,itm.SuplierId

) itm
where itm.Quantity < 0



   COMMIT TRAN
    SET @ErrorCode = 1
END TRY
BEGIN CATCH
 SET @ErrorCode = -6
  ROLLBACK TRAN
  declare @ErrorId uniqueidentifier=newId();
      EXECUTE [dbo].[SetError]
		@ErrorId,
		@Remarks = NULL 

END CATCH
  


END
GO
/****** Object:  StoredProcedure [dbo].[ItemReceived]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE PROCEDURE [dbo].[ItemReceived] @List AS dbo.ItemReceiveType READONLY,
@Info AS [dbo].[PurchaseInfoType] READONLY,
@image AS [dbo].[ItemReceiveVoucherImageType] READONLY,
@PayableAccountId uniqueidentifier,
@StockAccountId uniqueidentifier,
@DiscountAccountId uniqueidentifier,
@BonusAccountId uniqueidentifier,
@FiscalYearId uniqueidentifier,
@BranchId uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

  IF [dbo].[IsValidForParchase](@List) = 0
  BEGIN
    SET @ErrorCode = -5
    RETURN;
  END 



  BEGIN TRAN

    BEGIN TRY

	
	  --@BonusAccountId
	  Declare @TradePrice float=0,@discount float,@bonus float,@total float,@InfoId uniqueidentifier,@CreatedBy uniqueidentifier,@date datetime=GetDate(), @SuplierId uniqueidentifier,@AllDiscount float ;
	  select @InfoId=Id, @CreatedBy = CreatedBy, @SuplierId = SuplierId, @TradePrice=TradePrice, @discount=TotalDiscount, @bonus =[FreeAmount], @AllDiscount = [SpecialDiscount] + [ReduceAmount]+ TotalDiscount  from @Info;
	  set @total= @TradePrice + @AllDiscount + @bonus;

	  
      EXECUTE [dbo].[SP_SetMRPChangeHistory]  @List, @InfoId,@CreatedBy

      INSERT INTO [dbo].[ItemReceive]
           ([Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount]
           ,[MarginDiscount]
           ,[UnitPurchasePrice]
           ,[UnitVAT]
           ,[UnitDiscount]
           ,[CreatedAt]
           ,[ChangeAt]
           ,[BranchId]
           ,[FreeQuantity]
           ,[FreeAmount])
     SELECT
          [Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount]
           ,[MarginDiscount]
           ,[UnitPurchasePrice]
           ,[UnitVAT]
           ,[UnitDiscount]
           ,[CreatedAt]
           ,[ChangeAt]
           ,[BranchId]
           ,[FreeQuantity]
           ,[FreeAmount]
        FROM @List;
      INSERT INTO [dbo].[PurchaseInfo]
           ([Id]
           ,[SuplierId]
           ,[VoucherNo]
           ,[ChallanNo]
           ,[ChallanDate]
           ,[PaymentType]
           ,[Discount]
           ,[VAT]
           ,[TradePrice]
           ,[OrderInfoId]
           ,[ItemCount]
           ,[Status]
           ,[DefaultDiscount]
           ,[DefaultVAT]
           ,[Type]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[SalePrice]
           ,[MarginDiscount]
           ,[ReduceAmount]
           ,[PaymentStatus]
           ,[PaidAmount]
           ,[TotalDiscount]
           ,[FreeQuantity]
           ,[FreeAmount]
           ,[FileCount]
           ,[MimeType]
           ,[BranchId]
		   ,[SpecialDiscount]
		   ,[DiscountReason]
		   ,[Remarks])
        SELECT
          [Id]
           ,[SuplierId]
           ,[VoucherNo]
           ,[ChallanNo]
           ,[ChallanDate]
           ,[PaymentType]
           ,[Discount]
           ,[VAT]
           ,[TradePrice]
           ,[OrderInfoId]
           ,[ItemCount]
           ,[Status]
           ,[DefaultDiscount]
           ,[DefaultVAT]
           ,[Type]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[SalePrice]
           ,[MarginDiscount]
           ,[ReduceAmount]
           ,[PaymentStatus]
           ,[PaidAmount]
           ,[TotalDiscount]
           ,[FreeQuantity]
           ,[FreeAmount]
           ,[FileCount]
           ,[MimeType]
           ,[BranchId]
		   ,[SpecialDiscount]
		   ,[DiscountReason]
		   ,[Remarks]
        FROM @Info;
      INSERT INTO [dbo].[ItemReceiveVoucherImage]
           ([Id]
           ,[PurchaseInfoId]
           ,[Content]
           ,[Icon]
           ,[MimeType]
           ,[Size]
           ,[Name]
           ,[BranchId]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[IsDeleted]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[ChangeLog])
        SELECT [Id]
           ,[PurchaseInfoId]
           ,[Content]
           ,[Icon]
           ,[MimeType]
           ,[Size]
           ,[Name]
           ,[BranchId]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[IsDeleted]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[ChangeLog] FROM @image;

      -- Insert ItemPurchase 
      EXECUTE [dbo].[SP_AddItemPurchase] @List, @Info

      -- only for inventory and we will remove this code after inventory with discussion
      UPDATE i
      SET [UnitSalePrice] = l.[UnitSalePrice],
          [UnitTradePrice] = l.[UnitTradePrice],
          [UnitConversion] = l.[UnitConversion],
		  [UnitPurchasePrice]=l.[UnitPurchasePrice],
		  PurchaseDiscount=l.[Discount],
		  PurchaseVat=l.[Vat]
      FROM [dbo].[ItemSetting] i
      INNER JOIN @List l ON i.Id = l.[ItemId]

      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] + l.[UnitQuentity]) * i.UnitSalePrice,
          [TotalTradePrice] = i.[TotalTradePrice] + l.TotalTradePrice,
          i.[TotalStock] = i.[TotalStock] + l.[UnitQuentity],
          i.[UnitSalePrice] = l.[UnitSalePrice],
          i.[UnitTradePrice] =
                                CASE
                                  WHEN i.[TotalStock] < 1 THEN l.[UnitTradePrice]
                                  ELSE i.[UnitTradePrice]
                                END,
          
          i.[MGFDate] =
                         CASE
                           WHEN i.[TotalStock] < 1 THEN l.[MGFDate]
                           ELSE i.[MGFDate]
                         END,
          i.[EXPDate] =
                         CASE
                           WHEN i.[TotalStock] < 1 THEN l.[EXPDate]
                           ELSE i.[EXPDate]
                         END,
          i.[BatchName] =
                           CASE
                             WHEN i.[TotalStock] < 1 THEN l.[BatchName]
                             ELSE i.[BatchName]
                           END,
          i.[ItemReceiveId] =
                               CASE
                                 WHEN i.[TotalStock] < 1 THEN l.[Id]
                                 ELSE i.[ItemReceiveId]
                               END,
          i.[CurrentStock] =
                              CASE
                                WHEN i.[TotalStock] < 1 THEN  l.[UnitQuentity]
                                ELSE i.[CurrentStock]
                              END,
          i.[PurchaseDiscount] =
                         CASE
                           WHEN i.[TotalStock] < 1 THEN l.[Discount]
                           ELSE i.[PurchaseDiscount]
                         END,
          i.[PurchaseVat] =
                         CASE
                           WHEN i.[TotalStock] < 1 THEN l.[Vat]
                           ELSE i.[PurchaseVat]
                         END,
          i.[UnitPurchasePrice] =
                         CASE
                           WHEN i.[TotalStock] < 1 THEN l.[UnitPurchasePrice]
                           ELSE i.[UnitPurchasePrice]
                         END
      FROM [dbo].[Item] i
      INNER JOIN @List l
        ON i.Id = l.[ItemId]

		
UPDATE itm
   SET [TotalStock] =[Quantity]
      ,[TotalTradePrice] = rcv.TP
      ,[TotalSalePrice] = [Quantity]*stng.UnitSalePrice
      ,[TotalPurchaseDiscount] = rcv.[Discount]
  FROM [dbo].[Item] itm
  inner join [dbo].[ItemSetting] stng on itm.Id = stng.Id
  inner join (
SELECT rcv.[ItemId]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitTradePrice]) [TP]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [Quantity]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitDiscount]) [Discount]
  FROM [dbo].[ItemReceive] rcv
  INNER JOIN @List lst on rcv.ItemId = lst.ItemId
  where rcv.[UnitQuentity] > rcv.[UnitQuentitySold]
  group by rcv.[ItemId]) rcv on itm.Id = rcv.ItemId



		-- we need this to change the satus of OrderInfo when this orer is received.
      UPDATE o
      SET [Status] = i.[Status] -- [Status] comes from ItemReceive html page
      FROM [dbo].[OrderInfo] o
      INNER JOIN @Info i
        ON o.[Id] = i.OrderInfoId

      --Insert ItemStockChangeHistory
      EXECUTE [dbo].[SP_ItemStockChangeHistoryByPurchase] @Info, @List

	  --Insert SuplierDue For this Purchase
      EXECUTE [dbo].[SP_AddSuplierDue]  @SuplierId, @InfoId, @CreatedBy, @TradePrice, 'Due'

	  --Insert ItemStockChangeHistory
      EXECUTE [dbo].[SP_Add_Transaction] @PayableAccountId,0,@TradePrice,@FiscalYearId,@date,1,@InfoId,@BranchId
	  if(@AllDiscount>0)
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @DiscountAccountId,0, @AllDiscount, @FiscalYearId,@date,1,@InfoId,@BranchId
	  END
	  if(@bonus>0)
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @BonusAccountId,0,@bonus,@FiscalYearId,@date,1,@InfoId,@BranchId
	  END
      EXECUTE [dbo].[SP_Add_Transaction] @StockAccountId,@total,0,@FiscalYearId,@date,1,@InfoId,@BranchId


--	  @AccountId uniqueidentifier,
--@Debit float,
--@Credit float,
--@FiscalYearId uniqueidentifier,
--@TransDate DateTime,
--@SourceType int,
--@SourceId uniqueidentifier


    COMMIT TRAN
    SET @ErrorCode = 1;

  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = @BranchId
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[PurchaseCancel]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PurchaseCancel]
  @Id [Uniqueidentifier],
  @UserId [Uniqueidentifier],
  @FiscalYearId uniqueidentifier,
  @ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

  
IF [dbo].[IsValidForParchaseCancel](@Id) = 0
  BEGIN
    SET @ErrorCode = -5
    RETURN;
  END 
  else  if exists(SELECT [Id] FROM [dbo].[PurchaseInfo] where [Status]=11 and [Id]=@Id)
	begin
		 SET @ErrorCode = -4
    RETURN;
	end

  BEGIN TRAN

BEGIN TRY



	  --@BonusAccountId
	  Declare @TradePrice float=0, @SuplierId uniqueidentifier;
	  -- TradePrice is nagetive because of cancel
	  select @SuplierId = SuplierId, @TradePrice= -TradePrice  from [dbo].[PurchaseInfo] where Id = @Id;

UPDATE [dbo].[ItemReceive]
   SET [Type] = 2
	  ,[UnitQuentitySold]=[UnitQuentity]
 WHERE [PurchaseInfoId]=@Id
 
UPDATE [dbo].[PurchaseInfo]
   SET [Status] = 11
	  ,[PaidAmount]=[TradePrice]
	  ,[PaymentStatus]=1
 WHERE [Id]=@Id

 update itm 
 set  [TotalSalePrice] = ([TotalStock] - itmrcv.[UnitQuentity]) * itm.UnitSalePrice
 ,[TotalTradePrice] = itm.[TotalTradePrice] - itmrcv.TotalTradePrice
 ,itm.[TotalStock] =itm.[TotalStock]-itmrcv.[UnitQuentity]
 ,itm.[CurrentStock] = case when itm.[ItemReceiveId] =itmrcv.Id then 0 else itm.[CurrentStock]  end
 from [dbo].[Item] itm 
 inner join [dbo].[ItemReceive] itmrcv on itmrcv.[PurchaseInfoId]=@Id and itm.Id=itmrcv.ItemId

 --Update Item whose [CurrentStock] is nagetive or zero
		UPDATE i
	   SET i.[UnitTradePrice] = itmrcvData.[UnitTradePrice]
		  ,i.[CurrentStock] = itmrcvData.[UnitQuentity] -- we already subtruct (itmrcv.[UnitQuentity]-itmrcv.[UnitQuentitySold]) [UnitQuentity]
		  ,i.[UnitPurchasePrice] = itmrcvData.[UnitPurchasePrice]
		  ,i.[PurchaseDiscount] = itmrcvData.[Discount]
		  ,i.[PurchaseVat] = itmrcvData.[Vat]
		  ,i.[MGFDate] = itmrcvData.[MGFDate]
		  ,i.[EXPDate] = itmrcvData.[EXPDate]
		  ,i.[BatchName] = itmrcvData.[BatchName]
		  ,i.[ItemReceiveId] =itmrcvData.[Id]
		  FROM [dbo].[Item] i 
		  -- inner join with canceled receiveItem Data.
		  inner join (SELECT [ItemId] FROM [dbo].[ItemReceive] where [PurchaseInfoId]=@Id) l on i.Id = l.[ItemId] and i.[CurrentStock]<=0 
		  -- inner join with first comming receiveItem Data.
		  inner join (SELECT top 1 itmrcv.[Id]
      ,(itmrcv.[UnitQuentity]-itmrcv.[UnitQuentitySold]) [UnitQuentity] -- CurrentStock
      ,itmrcv.[UnitTradePrice]
      ,itmrcv.[MGFDate]
      ,itmrcv.[EXPDate]
	  ,itmrcv.[BatchName]
	  ,itmrcv.[UnitPurchasePrice]
	  ,itmrcv.[Discount]
	  ,itmrcv.[VAT]
	  ,itmrcv.[ItemId]
  FROM [dbo].[ItemReceive] itmrcv  inner JOIN (SELECT [ItemId] FROM [dbo].[ItemReceive] where [PurchaseInfoId]=@Id) l on itmrcv.[ItemId] = l.[ItemId]
  --itmrcv.[Type] =2 for cancel.
  where itmrcv.[UnitQuentity]>itmrcv.[UnitQuentitySold] and itmrcv.[Type]<2
  order by  itmrcv.[ActivateAt] ASC) itmrcvData on i.Id=itmrcvData.[ItemId]


  -- Add ItemStockChangeHistory
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,ItemId
           ,itmrcv.Id
           ,4
           ,-itmrcv.[UnitQuentity]
           ,TotalStock
           ,GetDate()
           ,@UserId
		   ,-(itmrcv.[TotalTradePrice] + itmrcv.FreeAmount)
		   ,-itmrcv.[UnitSalePrice]*itmrcv.[UnitQuentity]
		   ,-itmrcv.[TotalDiscount]
		   from [dbo].[Item] itm 
 inner join [dbo].[ItemReceive] itmrcv on itmrcv.[PurchaseInfoId]=@Id and itm.Id=itmrcv.ItemId

 -- Add Transaction with reverse amount of transaction which was related to @Id
 INSERT INTO [dbo].[Transaction]
           ([Id]
           ,[CreatedAt]
           ,[AccountId]
           ,[Debit]
           ,[Credit]
           ,[FiscalYearId]
           ,[TransDate]
           ,[SourceType]
           ,[SourceId]
			,[BranchId])
    SELECT NewId()
      ,GetDate()
      ,[AccountId]
      ,[Credit]
      ,[Debit]
      ,@FiscalYearId
      ,GetDate()
      ,13 -- For Purchase Cancel
      ,[SourceId]
      ,[BranchId]
  FROM [dbo].[Transaction]
  where [SourceId]=@Id





  
	  --Insert SuplierDue For this Purchase
      EXECUTE [dbo].[SP_AddSuplierDue]  @SuplierId, @Id, @UserId, @TradePrice, 'Due Cancel'



   COMMIT TRAN
    SET @ErrorCode = 1
END TRY
BEGIN CATCH
 SET @ErrorCode = -6
  ROLLBACK TRAN
  declare @ErrorId uniqueidentifier=newId();
      EXECUTE [dbo].[SetError]
		@ErrorId,
		@Remarks = NULL 

END CATCH
  


END
GO
/****** Object:  StoredProcedure [dbo].[SetError]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SetError] 
@Id uniqueIdentifier,
@Remarks nvarchar(max)
AS   

INSERT INTO [dbo].[SQLErrors]
    ([Id]
    ,[ErrorNumber]
    ,[ErrorSeverity]
    ,[ErrorState]
    ,[ErrorProcedure]
    ,[ErrorLine]
    ,[ErrorMessage]
    ,[Remarks]
    ,[CreatedAt])
VALUES
    (@Id
    ,ERROR_NUMBER() 
    ,ERROR_SEVERITY()
    ,ERROR_STATE()
    ,ERROR_PROCEDURE()
    ,ERROR_LINE()
    ,ERROR_MESSAGE()
    ,@Remarks
    ,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_FiscalYear]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_FiscalYear] 
@OldFiscalYearId [uniqueidentifier],
@NewFiscalYearId [uniqueidentifier],
@AssetsId [uniqueidentifier],
@OwnersEquityId [uniqueidentifier],
@LiabilityId [uniqueidentifier],
@UserId [uniqueidentifier],
@Name nvarchar(500),
@BranchId [uniqueidentifier],
@ErrorCode int out
AS
BEGIN
  	
	BEGIN TRAN
    BEGIN TRY  

Declare @AccountTable table
     ([AccountId] [uniqueidentifier],
      [Debit] float,
	  [Credit] float);
Declare @CurrentDate DateTime =GetDate();
	
UPDATE [dbo].[FiscalYear]
   SET [UpdatedAt] = @CurrentDate
      ,[UpdatedBy] = @UserId
      ,[FYEnd] = @CurrentDate
      ,[FYStatus] = 0
 WHERE Id=@OldFiscalYearId


 
INSERT INTO [dbo].[FiscalYear]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[FYBegin]
           ,[FYEnd]
           ,[FYStatus]
           ,[TotalCredit]
           ,[TotalDebit]
           ,[Name]
		   ,[BranchId])
     VALUES
           (@NewFiscalYearId
           , @CurrentDate
		   ,@UserId
           , @CurrentDate
		   ,@UserId
           ,0
           ,null
           ,@CurrentDate
           ,'2100-01-01 00:00'
           ,1
           ,0
           ,0
           ,@Name
		   ,@BranchId)



	  insert into @AccountTable
Select acnt.[Id] [AccountId]
	  ,IsNull(sum(trnsn.[Debit]),0) [Debit]
	  ,IsNull(sum(trnsn.[Credit]),0) [Credit]
  FROM [dbo].[Account] acnt
  inner join [dbo].[AccountGroup] acntgrp on acnt.[GroupId]=acntgrp.Id
  inner join [dbo].[AccountGroupCategory] acntgrpctgr on acntgrp.CategoryId=acntgrpctgr.Id
  left join [dbo].[Transaction] trnsn on acnt.Id=trnsn.AccountId and trnsn.FiscalYearId=@OldFiscalYearId
  where acnt.[IsDeleted] = 0 and (acntgrp.CategoryId = @AssetsId or acntgrp.CategoryId = @OwnersEquityId or acntgrp.CategoryId = @LiabilityId) 
   group by acnt.[Id]

 
 UPDATE ocb
   SET [UpdatedAt] = @CurrentDate
      ,[UpdatedBy] = @UserId
      ,[ClosingDebit] = acnt.[Debit]
      ,[ClosingCredit] = acnt.[Credit]
	  from [dbo].[OpeningClosingBalance] ocb
	  inner join @AccountTable acnt on ocb.AccountId=acnt.[AccountId]
	  where [FiscalYearId]=@OldFiscalYearId

	  INSERT INTO [dbo].[OpeningClosingBalance]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[OpeningDebit]
           ,[OpeningCredit]
           ,[ClosingDebit]
           ,[ClosingCredit]
           ,[AccountId]
           ,[FiscalYearId]
		   ,[BranchId])
     Select NewId()
           , @CurrentDate
		   ,@UserId
           , @CurrentDate
		   ,@UserId
           ,0
           ,null
           ,0
           ,0
           ,acnt.[Debit]
           ,acnt.[Credit]
           ,acnt.[AccountId]
           ,@OldFiscalYearId
		   ,@BranchId
		    from @AccountTable acnt 
			where AccountId Not in (Select AccountId from [dbo].[OpeningClosingBalance] where [FiscalYearId]=@OldFiscalYearId)

			
	  INSERT INTO [dbo].[OpeningClosingBalance]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[OpeningDebit]
           ,[OpeningCredit]
           ,[ClosingDebit]
           ,[ClosingCredit]
           ,[AccountId]
           ,[FiscalYearId]
		   ,[BranchId])
     Select NewId()
           , @CurrentDate
		   ,@UserId
           , @CurrentDate
		   ,@UserId
           ,0
           ,null
           ,acnt.[Debit]
           ,acnt.[Credit]
           ,0
           ,0
           ,acnt.[AccountId]
           ,@NewFiscalYearId
		   ,@BranchId
		    from @AccountTable acnt 


			
INSERT INTO [dbo].[Transaction]
           ([Id]
           ,[CreatedAt]
           ,[AccountId]
           ,[Debit]
           ,[Credit]
           ,[FiscalYearId]
           ,[TransDate]
           ,[SourceType]
           ,[SourceId]
		   ,[BranchId])
     Select NewId()
           ,@CurrentDate
           ,acnt.[AccountId]
           ,acnt.[Debit]
           ,acnt.[Credit]
           ,@NewFiscalYearId
           ,@CurrentDate
           ,00
           ,acnt.[AccountId]
		   ,@BranchId
		    from @AccountTable acnt 



	
    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = @BranchId
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_Item_Sale_Transaction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_Item_Sale_Transaction] 
@Info AS [dbo].[ItemSaleInfoType] READONLY,
@PaymentModel AS [dbo].[SalePaymentModelType] READONLY,
@Accounts AS [dbo].[SalesAccountModelType] READONLY,
@FiscalYearId uniqueidentifier
AS
BEGIN
  Declare @InfoId uniqueidentifier, @BranchId uniqueidentifier, @TradePrice float=0,@SalePrice float,@Cash float = 0,@vat float = 0,@Discount float = 0,@Due float = 0,@SalesRevenueId uniqueidentifier, @TransDate datetime=GetDate(),
  @InventoryDueId uniqueidentifier,@SaleDiscountId uniqueidentifier,@CashInCounterId uniqueidentifier,@CostOfGoodsSoldId uniqueidentifier,@InventoryAssetId uniqueidentifier,@VatPayable uniqueidentifier;
	  
	  -- @TradePrice = PayableTradePrice(TradePrice) + [PurchaseDiscount] = [PurchasePrice] + [PurchaseVAT]
	  -- Here SalePrice is Payable SalePrice and SalePrice+TotalDiscount is Total sale price with discount. i.e. SalesRevenue.
	  select @InfoId=Id, @BranchId=BranchId, @TradePrice=TradePrice + [PurchaseDiscount], @SalePrice=SalePrice+TotalDiscount- TotalVAT,@vat=TotalVAT, @Discount=TotalDiscount from @Info;
	  select @Due=Due from @PaymentModel;
	  --Cash = Cash + Vat; But Sales Revenue is without Vat;
	  set @Cash = @SalePrice - @Discount- @Due + @vat;

	  select @SalesRevenueId=SalesRevenue, @InventoryDueId=InventoryDue, @SaleDiscountId=SaleDiscount, @CashInCounterId=CashInCounter, 
	  @CostOfGoodsSoldId=CostOfGoodsSold, @InventoryAssetId=InventoryAsset, @VatPayable=VatPayable from @Accounts;
	  
   EXECUTE [dbo].[SP_Add_Transaction] @CashInCounterId,@Cash ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   EXECUTE [dbo].[SP_Add_Transaction] @SalesRevenueId,0,@SalePrice,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   if @vat>0
   BEGIN
   EXECUTE [dbo].[SP_Add_Transaction] @VatPayable,0,@vat,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   END

   if @Discount>0
   Begin
   EXECUTE [dbo].[SP_Add_Transaction] @SaleDiscountId, @Discount ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   End
      if @Due>0
   Begin
   EXECUTE [dbo].[SP_Add_Transaction] @InventoryDueId, @Due ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   End

   EXECUTE [dbo].[SP_Add_Transaction] @InventoryAssetId,0, @TradePrice, @FiscalYearId, @TransDate, 24, @InfoId, @BranchId;
   EXECUTE [dbo].[SP_Add_Transaction] @CostOfGoodsSoldId, @TradePrice , 0, @FiscalYearId,@TransDate, 24, @InfoId, @BranchId;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_LateEntry]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_LateEntry] 
@EmployeeId [uniqueidentifier],
@ShiftId [uniqueidentifier],
@AttendanceId [uniqueidentifier],
@EnterAt datetime,
@StartAt datetime, -- Shift Start1At
@LateDuration float
AS
BEGIN
  	INSERT INTO [dbo].[LateEntry]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[EmployeeId]
           ,[ShiftId]
           ,[AttendanceId]
           ,[EntryTime]
           ,[EnterAt]
           ,[Duration]
           ,[Status]
           ,[RejectedBy]
           ,[RejectedAt])
     VALUES
           (newId()
           ,GetDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,GetDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,0
           ,null
           ,@EmployeeId
           ,IsNull(@ShiftId,'00000000-0000-0000-0000-000000000000')
           ,@AttendanceId
           ,@StartAt
           ,@EnterAt
           ,@LateDuration
           ,1
           ,'00000000-0000-0000-0000-000000000000'
           ,GetDate() )
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_OverTime]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_OverTime] 
@EmployeeId uniqueidentifier,
@StartAt DateTime,
@EndAt DateTime
AS
BEGIN
  
  Declare @Duration int = DATEDIFF(minute,@StartAt,@EndAt),@ApprovedDuration int = 0,@Status int = 1;
SELECT @ApprovedDuration=[Duration] FROM [dbo].[OverTimeApplication] where [EmployeeId]=@EmployeeId and [FromDate]<=@StartAt and [ToDate]>=@EndAt and [StartAt]>=@StartAt and [EndAt]<=@EndAt 
  

  if(@ApprovedDuration >0)
  Begin 
  set @Status= 2
  End

  if(@Status=1)
  Begin
	  SELECT top 1 @ApprovedDuration=[Duration] FROM [dbo].[OverTimeApplication] where [IsDefault]=1 and [FromDate]<=@StartAt and [ToDate]>=@EndAt  order by [CreatedAt] desc
	  if(@ApprovedDuration < 1 or @ApprovedDuration>@Duration)
	  Begin
		return;
	  End
	  set @ApprovedDuration=0;
  End
  INSERT INTO [dbo].[OverTime]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[EmployeeId]
           ,[StartAt]
           ,[EndAt]
           ,[Duration]
           ,[ApprovedDuration]
           ,[Amount]
           ,[Status]
           ,[ApprovedBy]
           ,[ApprovedAt])
     VALUES
           (newId()
           ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,0
		   ,null
           ,@EmployeeId
           ,@StartAt
           ,@EndAt
           ,@Duration
           ,@ApprovedDuration
           ,0
           ,@Status
           ,'00000000-0000-0000-0000-000000000000'
           ,'2100-01-01 00:00')


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_Product_Sale_Transaction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_Product_Sale_Transaction] 
@Info AS [dbo].[ItemSaleInfoType] READONLY,
@PaymentMethod AS [dbo].[SalePaymentMathodType] READONLY,
@PaymentModel AS [dbo].[SalePaymentModelType] READONLY,
@Accounts AS [dbo].[SalesAccountModelType] READONLY,
@PayableTP As [float],
@PurchaseDiscount As [float],
@FiscalYearId uniqueidentifier
AS
BEGIN
  Declare @InfoId uniqueidentifier, @BranchId uniqueidentifier, @TradePrice float=0,@SalePrice float, @RewardPoint float =0, @PayableTPDiscount float =0,
  @Cash float = 0,@vat float = 0,@Discount float = 0,@Due float = 0,@SalesRevenueId uniqueidentifier, @TransDate datetime=GetDate(),
  @InventoryDueId uniqueidentifier,@SaleDiscountId uniqueidentifier,@CashInCounterId uniqueidentifier,@CostOfGoodsSoldId uniqueidentifier,
  @InventoryAssetId uniqueidentifier,@VatPayable uniqueidentifier, @RewardPointExpense uniqueidentifier, @RewardPointLiability uniqueidentifier;
	  
	  -- @TradePrice = PayableTradePrice(TradePrice) + [PurchaseDiscount] = [PurchasePrice] + [PurchaseVAT]
	  -- Here SalePrice is Payable SalePrice and SalePrice+TotalDiscount is Total sale price with discount. i.e. SalesRevenue.
	  select @InfoId=Id, @BranchId=BranchId, @TradePrice=TradePrice + [PurchaseDiscount], @SalePrice=SalePrice+TotalDiscount- TotalVAT,
	  @vat=TotalVAT, @Discount=TotalDiscount, @RewardPoint = [RewardPointTK] from @Info;
	  select @Due=Due from @PaymentModel;
	  --Cash = Cash + Vat; But Sales Revenue is without Vat;
	  set @Cash = @SalePrice - @Discount- @Due + @vat;
	  Set @PayableTPDiscount = @PayableTP + @PurchaseDiscount;

	  select @SalesRevenueId=SalesRevenue, @InventoryDueId=InventoryDue, @SaleDiscountId=SaleDiscount, @CashInCounterId=CashInCounter, 
	  @CostOfGoodsSoldId=CostOfGoodsSold, @InventoryAssetId=InventoryAsset, @VatPayable=VatPayable, @RewardPointExpense=RewardPointExpense, @RewardPointLiability=RewardPointLiability from @Accounts;


	  if exists(SELECT [Id] FROM @PaymentMethod)
	begin
		INSERT INTO [dbo].[SalePaymentMathod]
		   select [Id]
           ,[ItemSaleInfoId]
           ,[AccountId]
           ,[Amount]
           ,[TransactionId]
           ,[CardNo]
           ,[Mobile]
           ,[Note] from @PaymentMethod


		     INSERT INTO [dbo].[Transaction]
           ([Id]
           ,[CreatedAt]
           ,[AccountId]
           ,[Debit]
           ,[Credit]
           ,[FiscalYearId]
           ,[TransDate]
           ,[SourceType]
           ,[SourceId]
		   ,[BranchId])

		   select NewId()
           ,GetDate()
           ,[AccountId]
           ,[Amount]
           ,0
           ,@FiscalYearId
           ,@TransDate
           ,24
           ,@InfoId
		   ,@BranchId from @PaymentMethod

	end
	else 
	Begin 
		EXECUTE [dbo].[SP_Add_Transaction] @CashInCounterId,@Cash ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
	End

	  
   EXECUTE [dbo].[SP_Add_Transaction] @SalesRevenueId,0,@SalePrice,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;

   if @RewardPoint>0
   BEGIN
   EXECUTE [dbo].[SP_Add_Transaction] @RewardPointExpense,@RewardPoint,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   EXECUTE [dbo].[SP_Add_Transaction] @RewardPointLiability,0,@RewardPoint,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   END

   if @vat>0
   BEGIN
   EXECUTE [dbo].[SP_Add_Transaction] @VatPayable,0,@vat,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   END

   if @Discount>0
   Begin
   EXECUTE [dbo].[SP_Add_Transaction] @SaleDiscountId, @Discount ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   End
   --   if @Due>0
   --Begin
   --EXECUTE [dbo].[SP_Add_Transaction] @InventoryDueId, @Due ,0,@FiscalYearId,@TransDate,24,@InfoId,@BranchId;
   --End

   EXECUTE [dbo].[SP_Add_Transaction] @InventoryAssetId,0, @PayableTPDiscount, @FiscalYearId, @TransDate, 24, @InfoId, @BranchId;
   EXECUTE [dbo].[SP_Add_Transaction] @CostOfGoodsSoldId, @PayableTPDiscount, 0, @FiscalYearId,@TransDate, 24, @InfoId, @BranchId;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_ReduceHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_ReduceHistory] 
	@Id AS [uniqueidentifier], 
	@ItemId AS [uniqueidentifier], 
	@Quantity As [float],  
	@ItemReceiveId AS [uniqueidentifier], 
	@Creator uniqueidentifier
AS
BEGIN
  
INSERT INTO [dbo].[ChangeHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[ActivityId]
           ,[EntityId]
           ,[ChangeFrom]
           ,[ChangeType]
           ,[Amount]
           ,[Before]
           ,[Change]
           ,[Remarks]
           ,[Info]
           ,[Transations])
     VALUES
           (Newid()
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,'00000000-0000-0000-0000-000000000000'
           ,@ItemId
           ,'ReduceQuantity'
           ,''
           ,@Quantity
           ,CAST(@ItemReceiveId as nvarchar(36))
           ,CAST(@Id as nvarchar(36))
           ,''
           ,''
           ,'')
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Add_Transaction]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Add_Transaction] 
@AccountId uniqueidentifier,
@Debit float,
@Credit float,
@FiscalYearId uniqueidentifier,
@TransDate DateTime,
@SourceType int,
@SourceId uniqueidentifier,
@BranchId uniqueidentifier
AS
BEGIN
  INSERT INTO [dbo].[Transaction]
           ([Id]
           ,[CreatedAt]
           ,[AccountId]
           ,[Debit]
           ,[Credit]
           ,[FiscalYearId]
           ,[TransDate]
           ,[SourceType]
           ,[SourceId]
		   ,[BranchId])
     VALUES
           (NewId()
           ,GetDate()
           ,@AccountId
           ,@Debit
           ,@Credit
           ,@FiscalYearId
           ,@TransDate
           ,@SourceType
           ,@SourceId
		   ,@BranchId)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddAttendance]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddAttendance] 
@EmployeeId [uniqueidentifier],
@ShiftId [uniqueidentifier],
@EnterAt datetime,
@StartAt datetime, -- Shift Start1At
@LateDuration float,
@Comments nvarchar(2000),
--1 For AbNormal
@Abnormal int,
@ErrorCode int out
AS
BEGIN

  DECLARE @DailyAttendanceId [uniqueidentifier],@AttendanceId [uniqueidentifier]=newId(),@Date Date=cast(@StartAt as Date), @EnterTime DateTime=@EnterAt, @outAt DateTime=DATEADD(MINUTE, -1,@EnterAt);

  BEGIN TRY 

  
  SELECT @DailyAttendanceId=[Id] FROM [dbo].[DailyAttendance] where [EmployeeId]=@EmployeeId  and  [Date] = @Date;
  	  IF (@DailyAttendanceId is not null)
		BEGIN
			UPDATE [dbo].[DailyAttendance]
				   SET [UpdatedAt] = GetDate()
					  ,[LateDuration] += @LateDuration
					  ,[ShiftingCount] += 1
					  ,[AbNormalityCount] =case when  @Abnormal = 1 or @Abnormal = 2 then [AbNormalityCount]+1 else 0 end
					  ,[Status]= case when  @Abnormal = 1 or @Abnormal = 2 then 1 else [Status] end
				 where [Id]=@DailyAttendanceId
		END
	  else
		BEGIN
			set @DailyAttendanceId=newId();

			INSERT INTO [dbo].[DailyAttendance]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[EmployeeId]
           ,[Date]
           ,[InterAt]
           ,[OutAt]
           ,[LogInAt]
           ,[LogOutAt]
           ,[Duration]
           ,[AllowedDuration]
           ,[LateDuration]
           ,[ShiftingCount]
           ,[Comments]
		   ,[AbNormalityCount]
		   ,[Status])
     VALUES
           (@DailyAttendanceId
          ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,0
           ,@EmployeeId
           ,@Date
           ,@EnterTime
           ,@outAt
           ,@outAt
           ,@outAt
           ,0
           ,0
           ,@LateDuration
           ,1
           ,@Comments
		   ,case when  @Abnormal = 1 or @Abnormal = 2 then 1 else 0 end
		   ,case when  @Abnormal = 1 or @Abnormal = 2 then 1 else 0 end)
		END


INSERT INTO [dbo].[Attendance]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[EmployeeId]
           ,[ShiftId]
           ,[DailyAttendanceId]
           ,[Date]
           ,[InterAt]
           ,[OutAt]
           ,[LogInAt]
           ,[LogOutAt]
           ,[Duration]
           ,[LateDuration]
           ,[Comments]
		   ,[Status]
		   ,[AdjustmentType]
		   ,IsOut)
     VALUES
           (@AttendanceId
           ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,getDate()
           ,'00000000-0000-0000-0000-000000000000'
           ,0
           ,@EmployeeId
           ,IsNull(@ShiftId,'00000000-0000-0000-0000-000000000000')
           ,@DailyAttendanceId
           ,@Date
           ,@EnterTime
           ,@outAt
           ,@outAt
           ,@outAt
           ,0
           ,@LateDuration
           ,@Comments
		   ,1
		   ,@Abnormal
		   ,0)


		   -- Check for Late entry
if(@LateDuration>0)
Begin
	exec [dbo].[SP_Add_LateEntry] 
	@EmployeeId,
	@ShiftId,
	@AttendanceId,
	@EnterAt,
	@StartAt, -- Shift Start1At
	@LateDuration
End

If(@EnterAt<@StartAt)
Begin
Execute [dbo].[SP_Add_OverTime] @EmployeeId, @EnterAt, @StartAt
End

  END TRY
  BEGIN CATCH
  DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = 'From SP_AddAttendance'
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddAttendanceOut]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddAttendanceOut] 
@EmployeeId [uniqueidentifier],
@AttendanceId [uniqueidentifier],
@DailyAttendanceId [uniqueidentifier],
@PunchAt datetime,
@Duration float,
--1 For AbNormal
@Abnormal int,
@ErrorCode int out
AS
BEGIN

BEGIN TRY

  DECLARE @ShiftEndAt datetime = @PunchAt, @Date Date=cast(@PunchAt as Date),  @outAt Time=DATEADD(MINUTE, -1,cast(@PunchAt as time));

		  UPDATE [dbo].[DailyAttendance]
						   SET [UpdatedAt] = GetDate()
							  ,Duration+=ISNULL( @Duration,0)
							  ,[OutAt]=@PunchAt
							  ,[AbNormalityCount] =case when  @Abnormal = 1 or @Abnormal = 2 then [AbNormalityCount]+1 else 0 end
							  ,[Status]= case when  @Abnormal = 1 or @Abnormal = 2 then 1 else [Status] end
						 where [Id]=@DailyAttendanceId

				 
		UPDATE [dbo].[Attendance]
		   SET [UpdatedAt] = GetDate()
			  ,[OutAt] = @PunchAt
			  ,[Duration] = ISNULL( @Duration,0)
			  ,IsOut=1
			  ,[AdjustmentType]=case when  @Abnormal = 1 or @Abnormal = 2 then @Abnormal else [Status] end
		 WHERE [Id]=@AttendanceId
		   
SELECT @ShiftEndAt=DATEADD(millisecond ,DATEDIFF(millisecond, 0, [EndAt]) ,[Date]) FROM [dbo].[EmployeeShift] sft  inner join [dbo].[Attendance] tndnc on sft.Id=tndnc.[ShiftId] where tndnc.Id=@AttendanceId
	
If(@ShiftEndAt<@PunchAt)
Begin
Execute [dbo].[SP_Add_OverTime] @EmployeeId, @ShiftEndAt, @PunchAt
End




END TRY
  BEGIN CATCH

    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = 'From [SP_AddAttendanceOut]'

  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddCustomerDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddCustomerDue] 
	@CustomerId AS [uniqueidentifier],
	@AdmissionId AS [uniqueidentifier],
	@SaleId AS [uniqueidentifier],
	@CreatedBy AS [uniqueidentifier],
	@SoldPrice As [float],
	@Discount As [float],
	@Due As [float],
	@TP As [float],
	@Relation As [nvarchar](max) NULL
AS
BEGIN

DECLARE @CustomerDueId AS [uniqueidentifier],
		@TotalAmount  As [float] = 0,
		@DiscountAmount  As [float] = 0,
		@ReturnAmount  As [float] = 0,
		@PaidAmount  As [float] = 0,
		@DueAmount  As [float] = 0,
		@AdjustAmount  As [float] = 0,
		@CancelAmount  As [float] = 0;
		
SELECT @CustomerDueId = [Id]
      ,@TotalAmount = [TotalAmount]
      ,@DiscountAmount = [TotalDiscount]
      ,@ReturnAmount = [ReturnAmount]
      ,@PaidAmount = [PaidAmount]
      ,@DueAmount = [DueAmount]
      ,@AdjustAmount = [AdjustAmount]
      ,@CancelAmount = [CancelAmount]
  FROM [dbo].[CustomerDue]
  Where CustomerId = @CustomerId


  Set @CreatedBy = IsNull(@CreatedBy,'00000000-0000-0000-0000-000000000000');

  IF @CustomerDueId is null
  BEGIN

  Set @CustomerDueId =NewId();

  
Set @TotalAmount = 0;
Set @DiscountAmount = 0;
Set @ReturnAmount = 0;
Set @PaidAmount = 0;
Set @DueAmount = 0;
Set @AdjustAmount = 0;
Set @CancelAmount = 0;

INSERT INTO [dbo].[CustomerDue]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CustomerId]
           ,[TotalAmount]
           ,[TotalDiscount]
           ,[Discount]
           ,[TotalTP]
           ,[TotalProfit]
           ,[Profit]
           ,[ReturnAmount]
           ,[ReturnDiscount]
           ,[PaidAmount]
           ,[AdjustAmount]
           ,[CancelAmount]
           ,[DueAmount])
     VALUES
           (@CustomerDueId
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,@SoldPrice + @Discount
           ,@Discount
           ,Case when (@SoldPrice + @Discount) > 0 then 100*@Discount/(@SoldPrice + @Discount) else -99999 end
           ,@TP
           ,@SoldPrice - @TP
           ,Case when @TP > 0 then 100*(@SoldPrice - @TP)/@TP else 99999 end
           ,0
           ,0
           ,@SoldPrice - @Due
           ,0
           ,0
           ,@Due)
  END
  ELSE
  BEGIN
  
UPDATE [dbo].[CustomerDue]
   SET [Discount] = Case when ([TotalAmount] + @SoldPrice + @Discount) > 0 then 100*([TotalDiscount] + @Discount)/([TotalAmount] + @SoldPrice + @Discount) else -99999 end
      ,[Profit] = Case when ([TotalTP] + @TP) > 0 then 100*([TotalProfit] + (@SoldPrice - @TP))/([TotalTP] + @TP) else 99999 end
      ,[DueAmount] = [DueAmount] + @Due
	  ,[TotalDiscount] = [TotalDiscount] + @Discount
	  ,[TotalAmount] = [TotalAmount] + (@SoldPrice + @Discount)
	  ,[TotalTP] = [TotalTP] + @TP
	  ,[TotalProfit] = [TotalProfit] + (@SoldPrice - @TP)
	  ,[PaidAmount] = [PaidAmount] + @SoldPrice - @Due
 WHERE [Id] = @CustomerDueId

  END

INSERT INTO [dbo].[CustomerDueHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CustomerId]
           ,[CustomerDueId]
           ,[TotalAmount]
           ,[Discount]
           ,[ReturnAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[AdjustAmount]
           ,[CancelAmount]
           ,[ChangeAmount]
           ,[Relation]
           ,[RelativeId]
           ,[Date]
           ,[Remarks]
           ,[ActivityId]
		   ,AdmissionId)
     VALUES
           (NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,@CustomerDueId
           ,@TotalAmount + (@SoldPrice + @Discount)
           ,@DiscountAmount + @Discount
           ,@ReturnAmount
           ,@PaidAmount + @SoldPrice - @Due
           ,@DueAmount + @Due
           ,@AdjustAmount
           ,@CancelAmount
           ,@Due
           ,@Relation
           ,@SaleId
           ,GetDate()
           ,''
           ,'00000000-0000-0000-0000-000000000000'
		   ,@AdmissionId)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddItemPurchase]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SP_AddItemPurchase] 
  @List AS dbo.ItemReceiveType READONLY,
  @Info AS [dbo].[PurchaseInfoType] READONLY

AS
BEGIN
	
	INSERT INTO [dbo].[ItemPurchase]
           ([Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount]
           ,[MarginDiscount]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[BranchId]
           ,[FreeQuantity]
           ,[FreeAmount])

SELECT l.[Id]
           ,l.[ItemId]
           ,l.[SuplierId]
           ,l.[PurchaseInfoId]
           ,l.[SalesUnitTypeId]
           ,l.[PurchaseUnitTypeId]
           ,l.[UnitConversion]
           ,l.[UnitQuentity]
           ,l.[UnitQuentitySold]
           ,l.[UnitTradePrice]
           ,l.[TotalTradePrice]
           ,l.[UnitSalePrice]
           ,l.[TotalSoldPrice]
           ,l.[VAT]
           ,l.[TotalVAT]
           ,l.[Discount]
           ,l.[TotalDiscount]
           ,l.[Position]
           ,l.[DefaultVat]
           ,l.[MGFDate]
           ,l.[EXPDate]
           ,l.[BatchName]
           ,l.[ActivateAt]
           ,inf.[Type]
           ,l.[DefaultDiscount]
           ,l.[MarginDiscount]
           ,inf.[CreatedAt]
           ,inf.[CreatedBy]
           ,inf.[UpdatedAt]
           ,inf.[UpdatedBy]
           ,inf.[BranchId]
           ,l.[FreeQuantity]
           ,l.[FreeAmount]
  FROM @List l 
  inner join @Info inf on l.[PurchaseInfoId]=inf.Id


END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddMergedNewItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_AddMergedNewItem]
@List AS [dbo].[NewItemType] READONLY,
@ErrorCode int out
AS
BEGIN
    BEGIN TRY

	
	INSERT INTO [dbo].[OnlineData]
           ([Id]
           ,[OnLineId]
           ,[Stock]
           ,[MRP]
           ,[UpdatedAt]
           ,[Name]
           ,[GenericName]
           ,[Strength]
           ,[Category])
     Select NewId()
           ,Id
           ,TotalStock
           ,UnitSalePrice
           ,GetDate()
           ,[Name]
           ,[GenericName]
           ,[Strength]
           ,[Category]
		   From @List


		   
INSERT INTO [dbo].[OnlineMerge]
           ([Id]
           ,[OffLineId]
           ,[OnLineId]
           ,[Stock]
           ,[MRP]
           ,[UpdatedAt])
     Select NewId()
           ,OffLineId
           ,Id
           ,TotalStock
           ,UnitSalePrice
           ,GetDate()
		   From @List

    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = NULL
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddRewardPointHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddRewardPointHistory] 
	@CustomerId AS [uniqueidentifier], 
	@Relation As [nvarchar](max) NULL,
	@RelativeId AS [uniqueidentifier], 
	@Changed As [float], 
	@Total As [float], 
	@Pending As [float], 
	@Spent As [float], 
	@Converted As [float],  
	@Remarks As [nvarchar](max) NULL,
	@CreatedBy AS [uniqueidentifier]
AS
BEGIN


INSERT INTO [dbo].[RewardPointHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CustomerId]
           ,[Relation]
           ,[RelationId]
           ,[Changed]
           ,[Total]
           ,[Pending]
           ,[Spent]
           ,[Converted]
           ,[Remarks])
     Select NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,@Relation
           ,@RelativeId
           ,@Changed
           ,@Total
           ,@Pending
           ,@Spent
           ,@Converted
           ,@Remarks
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddSuplierDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddSuplierDue] 
	@SuplierId AS [uniqueidentifier], 
	@PurchaseId AS [uniqueidentifier], 
	@CreatedBy AS [uniqueidentifier], 
	@Amount As [float], 
	@Relation As [nvarchar](max) NULL
AS
BEGIN

DECLARE @SuplierDueId AS [uniqueidentifier],
		@TotalAmount  As [float] = 0,
		@PaidAmount  As [float] = 0,
		@DueAmount  As [float] = 0,
		@TotalReceivableAmount  As [float] = 0,
		@Receive  As [float] = 0,
		@ReceivableAmountDue  As [float] = 0;

		
SELECT @SuplierDueId = [Id]
      ,@TotalAmount = [TotalAmount]
      ,@PaidAmount = [PaidAmount]
      ,@DueAmount = [DueAmount]
      ,@TotalReceivableAmount = [TotalReceivableAmount]
      ,@Receive = [Receive]
      ,@ReceivableAmountDue = [ReceivableAmountDue]
  FROM [dbo].[SuplierDue]
  Where SuplierId = @SuplierId

  IF @SuplierDueId is null
  BEGIN

  Set @SuplierDueId =NewId();

INSERT INTO [dbo].[SuplierDue]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[SuplierId]
           ,[TotalAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[TotalReceivableAmount]
           ,[Receive]
           ,[ReceivableAmountDue])
     VALUES
           (@SuplierDueId
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@SuplierId
           ,@Amount
           ,0
           ,@Amount
		   ,0
		   ,0
		   ,0)
  END
  ELSE
  BEGIN
  
UPDATE [dbo].[SuplierDue]
   SET [TotalAmount] = [TotalAmount] + @Amount
      ,[DueAmount] = [DueAmount] + @Amount
 WHERE [Id] = @SuplierDueId

  END

  
INSERT INTO [dbo].[SuplierDueHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[SuplierId]
           ,[SuplierDueId]
           ,[TotalAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[ChangeAmount]
           ,[Relation]
           ,[RelativeId]
           ,[Remarks]
           ,[ActivityId]
           ,[TotalReceivableAmount]
           ,[Receive]
           ,[ReceivableAmountDue]
           ,[ReceivableAmountChanged]
		   ,[Date])
     VALUES
           (NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@SuplierId
           ,@SuplierDueId
           ,@TotalAmount+@Amount
           ,@PaidAmount
           ,@DueAmount + @Amount
           ,@Amount
           ,@Relation
           ,@PurchaseId
           ,''
           ,'00000000-0000-0000-0000-000000000000'
		   ,@TotalReceivableAmount
		   ,@Receive
		   ,@ReceivableAmountDue
		   ,0
		   ,GetDate())

END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddSuplierReceivable]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_AddSuplierReceivable] 
	@SuplierId AS [uniqueidentifier], 
	@UnsalableProductId AS [uniqueidentifier], 
	@CreatedBy AS [uniqueidentifier], 
	@Amount As [float]
AS
BEGIN

DECLARE @SuplierDueId AS [uniqueidentifier],
		@TotalAmount  As [float] = 0,
		@PaidAmount  As [float] = 0,
		@DueAmount  As [float] = 0,
		@TotalReceivableAmount  As [float] = 0,
		@Receive  As [float] = 0,
		@ReceivableAmountDue  As [float] = 0;

		
SELECT @SuplierDueId = [Id]
      ,@TotalAmount = [TotalAmount]
      ,@PaidAmount = [PaidAmount]
      ,@DueAmount = [DueAmount]
      ,@TotalReceivableAmount = [TotalReceivableAmount]
      ,@Receive = [Receive]
      ,@ReceivableAmountDue = [ReceivableAmountDue]
  FROM [dbo].[SuplierDue]
  Where SuplierId = @SuplierId

  IF @SuplierDueId is null
  BEGIN

  Set @SuplierDueId =NewId();

INSERT INTO [dbo].[SuplierDue]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[SuplierId]
           ,[TotalAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[TotalReceivableAmount]
           ,[Receive]
           ,[ReceivableAmountDue])
     VALUES
           (@SuplierDueId
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@SuplierId
           ,0
           ,0
           ,0
		   ,@Amount
		   ,0
		   ,@Amount)
  END
  ELSE
  BEGIN
  
UPDATE [dbo].[SuplierDue]
   SET [TotalReceivableAmount] = [TotalReceivableAmount] + @Amount
      ,[ReceivableAmountDue] = [ReceivableAmountDue] + @Amount
 WHERE [Id] = @SuplierDueId

  END

  
INSERT INTO [dbo].[SuplierDueHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[SuplierId]
           ,[SuplierDueId]
           ,[TotalAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[ChangeAmount]
           ,[Relation]
           ,[RelativeId]
           ,[Remarks]
           ,[ActivityId]
           ,[TotalReceivableAmount]
           ,[Receive]
           ,[ReceivableAmountDue]
           ,[ReceivableAmountChanged]
		   ,[Date])
     VALUES
           (NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@SuplierId
           ,@SuplierDueId
           ,@TotalAmount
           ,@PaidAmount
           ,@DueAmount
           ,0
           ,'Return'
           ,@UnsalableProductId
           ,''
           ,'00000000-0000-0000-0000-000000000000'
		   ,@TotalReceivableAmount+@Amount
		   ,@Receive
		   ,@ReceivableAmountDue + @Amount
		   ,@Amount
		   ,GetDate())

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CancelSale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_CancelSale] @List AS [dbo].[IdList] READONLY
AS
BEGIN
  
  
UPDATE inf
   SET [IsDelivered] = 2
   From [dbo].[ItemSaleInfo] inf 
   Where Id in (Select Id From @List)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_CompanyStockEmpty]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_CompanyStockEmpty] 
@CompanyId uniqueidentifier,
@Remarks nvarchar(max),
@ActivityId uniqueidentifier,
@Creator uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;
    SET @ErrorCode = -6
  BEGIN TRAN
    BEGIN TRY
	  
Declare @Id uniqueidentifier =NewId(),@BatchId uniqueidentifier;
INSERT INTO [dbo].[CompanyStockEmpty]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CompanyId]
           ,[TotalItem]
           ,[Quantity]
           ,[TP]
           ,[MRP]
           ,[BatchMRP]
           ,[Discount]
           ,[Status]
           ,[Remarks]
           ,[ActivityId])
     Select @Id
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CompanyId
           ,Count(*) [TotalItem] 
      ,IsNull(Sum([UnitQuentity] - [UnitQuentitySold]),0) [Quantity]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0) [TP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*stng.UnitSalePrice),0) [MRP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitSalePrice),0) [BatchMRP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.[UnitDiscount]),0) [Discount]
           ,'Active'
           ,@Remarks
           ,@ActivityId
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  inner join [dbo].[ItemSetting] stng on rcv.ItemId = stng.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And itm.ManufacturerId = @CompanyId


  DEclare @List table (RowId int, ItemId [uniqueidentifier]);
  insert INTO @List
  SELECT ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId,Id FROM [dbo].[Item] where ManufacturerId = @CompanyId
--getting all receive for the list of item to be changed

--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier], @CompanyStockItemId uniqueidentifier, @AdjustHistoryId uniqueidentifier;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @List
SELECT @CurrentTempID = MIN(RowId) from @List
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
    -- Get one record
    SELECT TOP 1 
    @ItemId = ItemId
    FROM @List
    WHERE RowId = @CurrentTempID
 
 Set @CompanyStockItemId = NewId();
 Set @AdjustHistoryId = NewId();
 
INSERT INTO [dbo].[CompanyStockItem]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[BatchId]
           ,[CompanyId]
           ,[ItemId]
           ,[Quantity]
           ,[TP]
           ,[MRP]
           ,[BatchMRP]
           ,[Discount])
     Select @CompanyStockItemId
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@Id
           ,@CompanyId
           ,ItemId
      ,IsNull(Sum([UnitQuentity] - [UnitQuentitySold]),0) [Quantity]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0) [TP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*stng.UnitSalePrice),0) [MRP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitSalePrice),0) [BatchMRP]
      ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.[UnitDiscount]),0) [Discount]
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  inner join [dbo].[ItemSetting] stng on rcv.ItemId = stng.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And rcv.ItemId = @ItemId
  Group By ItemId

  
INSERT INTO [dbo].[CompanyStockBatch]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[BatchId]
           ,[CompanyStockItemId]
           ,[CompanyId]
           ,[ItemId]
           ,[ItemReceiveId]
           ,[Quantity]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[TotalSoldPrice])
     Select NewId()
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@Id
           ,@CompanyStockItemId
           ,@CompanyId
           ,@ItemId
           ,rcv.Id
           ,[UnitQuentity] - [UnitQuentitySold]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[TotalSoldPrice]
  FROM [dbo].[ItemReceive] rcv
  where rcv.UnitQuentity>rcv.UnitQuentitySold And rcv.ItemId = @ItemId
  
INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice])
     select
           NewId()
           ,ItemId
           ,@Id
           ,16
           ,-IsNull(Sum([UnitQuentity] - [UnitQuentitySold]),0)
           ,0
           ,GetDate()
           ,@Creator
           ,-IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0)
           ,-IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*stng.UnitSalePrice),0)
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  inner join [dbo].[ItemSetting] stng on rcv.ItemId = stng.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And rcv.ItemId = @ItemId
  Group By ItemId



  
INSERT INTO [dbo].[AdjustHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[ItemId]
           ,[ReceiveId]
           ,[SaleUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitQuentity]
           ,[BranchId]
           ,[SalePrice]
           ,[PurchasePrice]
           ,[PurchaseDiscount]
           ,[PurchaseVat]
           ,[TotalSalePrice]
           ,[TotalPurchasePrice]
           ,[TotalPurchaseDiscount]
           ,[TotalPurchaseVat]
           ,[UnitQuentityChanged]
           ,[TotalTradePrice]
           ,[Description]
           ,[ActivityId]
           ,[TPChanged]
           ,[MRPChanged]
           ,[TPBefore]
           ,[MRPBefore]
           ,[TPAfter]
           ,[MRPAfter])
     Select NewId()
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,ItemId
           ,'00000000-0000-0000-0000-000000000000'
           ,'00000000-0000-0000-0000-000000000000'
           ,'00000000-0000-0000-0000-000000000000'
           ,0
           ,'00000000-0000-0000-0000-000000000000'
           ,0
           ,0
           ,0
           ,0
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*itm.UnitSalePrice),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitPurchasePrice),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitDiscount),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitVAT),0)
           ,-IsNull(Sum([UnitQuentity] - [UnitQuentitySold]),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0)
           ,itm.[Name]
           ,@ActivityId
           ,-IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0)
           ,-IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*itm.UnitSalePrice),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice),0)
           ,IsNull(Sum(([UnitQuentity] - [UnitQuentitySold])*itm.UnitSalePrice),0)
           ,0
           ,0
		   
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  inner join [dbo].[ItemSetting] stng on rcv.ItemId = stng.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And rcv.ItemId = @ItemId
  Group By ItemId,itm.[Name]

  
INSERT INTO [dbo].[AdjustItem]
           ([Id]
           ,[ItemId]
           ,[ItemReceiveId]
           ,[UnitQuentity]
           ,[TotalSalePrice]
           ,[TotalPurchasePrice]
           ,[TotalVAT]
           ,[TotalDiscount]
           ,[TotalTradePrice]
           ,[CreatedAt]
           ,[BranchId]
           ,[AdjustHistoryId])
     Select NewId()
           ,@ItemId
           ,rcv.Id
           ,[UnitQuentity] - [UnitQuentitySold]
           ,([UnitQuentity] - [UnitQuentitySold])*itm.UnitSalePrice
           ,([UnitQuentity] - [UnitQuentitySold])*rcv.UnitPurchasePrice
           ,([UnitQuentity] - [UnitQuentitySold])*rcv.UnitVAT
           ,([UnitQuentity] - [UnitQuentitySold])*rcv.UnitDiscount
           ,([UnitQuentity] - [UnitQuentitySold])*rcv.UnitTradePrice
           ,GETDATE()
           ,'00000000-0000-0000-0000-000000000000'
           ,@AdjustHistoryId
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And rcv.ItemId = @ItemId


	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1
END

UPDATE rcv
   SET [UnitQuentitySold] = [UnitQuentity]
  FROM [dbo].[ItemReceive] rcv
  inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
  inner join [dbo].[ItemSetting] stng on rcv.ItemId = stng.Id
  where rcv.UnitQuentity>rcv.UnitQuentitySold And itm.ManufacturerId = @CompanyId

UPDATE [dbo].[Item]
   SET [CurrentStock] = 0
      ,[TotalStock] = 0
      ,[TotalTradePrice] = 0
      ,[TotalSalePrice] = 0
      ,[TotalPurchaseDiscount] = 0
 WHERE ManufacturerId = @CompanyId
 
    COMMIT TRAN
    SET @ErrorCode = 1;

END TRY

BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @ErrorId uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @ErrorId, @Remarks = NULL
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ComputerClose]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:    	<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ComputerClose]
-- Add the parameters for the stored procedure here
@ComputerId nvarchar(500),
@UserId uniqueidentifier
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
  DECLARE @date date = CAST(GETDATE() AS date);
  DECLARE @infoId [uniqueidentifier], @BranchId [uniqueidentifier];
  SELECT
    @infoId = i.[Id],@BranchId =i.BranchId
  FROM [dbo].[DayInfo] i
  WHERE CreatedAt >= @date;
  IF (@infoId IS NOT NULL)
  BEGIN
    INSERT INTO [dbo].[DayInfoItem] ([Id]
    , [ComputerId]
    , [UserId]
    , [DayInfoId]
    , [Type]
    ,[CreatedAt]
	,[BranchId])
      VALUES (NEWID(), @ComputerId, @UserId, @infoId, 2,GetDate(),@BranchId)

    UPDATE [dbo].[Computer]
    SET [IsActive] = 0
    WHERE Id = @ComputerId
  END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateItemHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_CreateItemHistory] 
	@ItemId AS [uniqueidentifier],
	@HistoryId AS [uniqueidentifier],
	@InfoId AS [uniqueidentifier],
	@CreatedBy AS [uniqueidentifier]
AS
BEGIN
  
INSERT INTO [dbo].[ItemHistory]
           ([Id]
           ,[Name]
           ,[GenericName]
           ,[Strength]
           ,[BatchName]
           ,[TypeId]
           ,[CategoryId]
           ,[CounterId]
           ,[SuplierId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[ItemReceiveId] -- We Store ItemSaleInfoId here
           ,[UnitConversion]
           ,[Code]
           ,[UnitSalePrice]
           ,[UnitTradePrice]
           ,[CurrentStock]
           ,[TotalStock]
           ,[MinStockToAlert]
           ,[SoldDaysForParchaseRequired]
           ,[Vat]
           ,[Discount]
           ,[PurchaseDiscount]
           ,[MaxSaleDiscount]
           ,[MGFDate]
           ,[EXPDate]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[UnitChangeConversion]
           ,[ItemId]
           ,[RackItemId]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
           ,[UnitPurchasePrice]
           ,[PurchaseVat]
           ,[TotalPurchaseDiscount]
           ,[BranchId])
     SELECT @HistoryId
           ,Name
           ,GenericName
           ,Strength
           ,BatchName
           ,TypeId
           ,CategoryId
           ,CounterId
           ,SuplierId
           ,SalesUnitTypeId
           ,PurchaseUnitTypeId
           ,@InfoId
           ,UnitConversion
           ,Code
           ,UnitSalePrice
           ,UnitTradePrice
           ,CurrentStock
           ,TotalStock
           ,MinStockToAlert
           ,SoldDaysForParchaseRequired
           ,Vat
           ,Discount
           ,PurchaseDiscount
           ,MaxSaleDiscount
           ,MGFDate
           ,EXPDate
           ,GetDate()
           ,@CreatedBy
           ,UpdatedAt
           ,UpdatedBy
           ,IsDeleted
           ,ChangeLog
           ,-4
           ,Id
           ,RackItemId
           ,TotalTradePrice
           ,TotalSalePrice
           ,UnitPurchasePrice
           ,PurchaseVat
           ,TotalPurchaseDiscount
           ,BranchId
		   
  FROM [dbo].[Item]
  Where Id=@ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CreateMRPChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_CreateMRPChangeHistory] 
	@ItemId AS [uniqueidentifier],
	@MRPBefore As [float],
	@MRPAfter As [float],
	@HistoryId AS [uniqueidentifier],
	@CreatedBy AS [uniqueidentifier],
	@MRPChanged As [float] Out
AS
BEGIN


Select @MRPChanged=Sum(IsNull((rcv.UnitQuentity - rcv.UnitQuentitySold)*(@MRPAfter - @MRPBefore),0))
		   FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentity > rcv.UnitQuentitySold

  INSERT INTO [dbo].[MRPChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ItemHistoryId]
           ,[ItemReceiveId]
           ,[MRPBefore]
           ,[MRPChanged]
           ,[MRPAfter]
           ,[CreatedAt]
           ,[CreatedBy])
      SELECT NewId()
           ,@ItemId
           ,@HistoryId
           ,Id
           ,(rcv.UnitQuentity - rcv.UnitQuentitySold)*@MRPBefore
           ,(rcv.UnitQuentity - rcv.UnitQuentitySold)*(@MRPAfter - @MRPBefore)
           ,(rcv.UnitQuentity - rcv.UnitQuentitySold)*@MRPAfter
           ,GetDate()
           ,@CreatedBy
		   FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentity > rcv.UnitQuentitySold
  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_DayClose]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:  	<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DayClose] @ComputerId nvarchar(500),
@UserId uniqueidentifier,
@AdjustAmount float,
@Remarks nvarchar(max)
AS
BEGIN
  -- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
  SET NOCOUNT ON;
  DECLARE @infoId uniqueidentifier,@BranchId uniqueidentifier;
  UPDATE d
  SET [AdjustAmount] = @AdjustAmount,
      [Remarks] = @Remarks,
	  d.SoldAmount=data.[Amount],
	  d.TradeAmount=data.[TradePrice],
	  d.DiscountAmount=data.[TotalDiscount],
	  d.VatAmount=data.[TotalVat],
      [Status] = 2,
      @infoId = [Id],
	  @BranchId = BranchId
	  from [dbo].[DayInfo] d inner join (select IsNull(Sum([SalePrice]),0) [Amount]
      ,IsNull(Sum([TradePrice]),0) [TradePrice]
      ,IsNull(Sum([TotalDiscount]),0) [TotalDiscount]
      ,IsNull(Sum([TotalVat]),0) [TotalVat]
	  ,cast(GETDATE() as date) [CreatedAt]
	  FROM [dbo].[ItemSaleInfo]
  where  [CreatedAt]>=cast(GETDATE() as date)) data on d.CreatedAt>=data.[CreatedAt]
  WHERE d.[CreatedAt] >= CAST(GETDATE() AS date)
  AND [ComputerId] = @ComputerId;

  INSERT INTO [dbo].[DayInfoItem] ([Id]
  , [ComputerId]
  , [UserId]
  , [DayInfoId]
  , [Type]
  , [CreatedAt]
  , [BranchId])
    VALUES (NEWID(), @ComputerId, @UserId, @infoId, 3, GETDATE(), @BranchId)

END

/****** Object:  StoredProcedure [dbo].[SP_LoginByComputer]    Script Date: 01-11-17 12.19.15 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SP_Generate_Bonus]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Generate_Bonus] 
@BranchId uniqueidentifier,
@UserId uniqueidentifier,
@EmployeeBonusId uniqueidentifier,
@BonusStructureId uniqueidentifier,
@DesignationId uniqueidentifier,
@EmployeeId uniqueidentifier,
@RelationType int,
@AmountType int,
@Amount int
AS
BEGIN
  
 

 
 
INSERT INTO [dbo].[EmployeeBonusDetails]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[EmployeeBonusId]
           ,[EmployeeId]
           ,[SalaryId]
           ,[Amount]
           ,[PaidAt]
           ,[Status]
           ,[Remarks]
           ,[BonusStructureId]
           ,[Month]
           ,[Year]
		   ,[BranchId])
SELECT newId()
           ,getDate()
           ,@UserId
           ,getDate()
           ,@UserId
           ,0
           ,null
           ,@EmployeeBonusId
           ,empl.[Id]
           ,'00000000-0000-0000-0000-000000000000'
           ,case when @AmountType=0 then @Amount else  IsNull(slri.[Salary],dslri.[Salary])*@Amount/100 end
           ,'2100-01-01 00:00'
           ,0
           ,''
           ,@BonusStructureId
           ,MONTH(GETDATE())
           ,Year(GETDATE())
		   ,@BranchId
  FROM [dbo].[User] empl
  inner join [dbo].[Designation] dgn on empl.[DesignationId]=dgn.Id
  inner join [dbo].[SalaryInfo] dslri on dgn.SalaryId=dslri.Id
  left join [dbo].[SalaryInfo] slri on empl.SalaryId=slri.Id
  

  where ((@RelationType=0 and empl.Id=@EmployeeId) or (@RelationType=1 and dgn.Id=@DesignationId) or (@RelationType=2)) and empl.Id not in (SELECT emplbns.[RelativeId]
  FROM [dbo].[EmployeeBonus] emplbns
  where emplbns.[IsDeleted] = 0 and emplbns.[RelationType] = 3 and emplbns.[StartDate]<= getDate() and emplbns.[EndDate]>=getDate() and emplbns.[BonusStructureId]= @BonusStructureId)


END
GO
/****** Object:  StoredProcedure [dbo].[SP_Get_History_By_ItemId]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_Get_History_By_ItemId] 
	@ItemId AS [uniqueidentifier],
	@Name As Nvarchar(Max),
	@TotalStock [float]
AS
BEGIN


  Declare  @History table (
	[Id] [uniqueidentifier] NOT NULL,
	[Type] [int] NOT NULL,
	[StockChanged] [float] NOT NULL,
	[StockAfterChanged] [float] NOT NULL,
	[RowId] [int] NOT NULL
  )

  -- Get All Active ItemReceive By @ItemId 
  insert INTO @History
  SELECT Id, [Type], [StockChanged], [StockAfterChanged], ROW_NUMBER() OVER(ORDER BY [CreatedAt] ASC) AS RowId 
  FROM [dbo].[ItemStockChangeHistory] hstr 
  Where hstr.ItemId = @ItemId 


--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @Type [int] = 0,@StockChanged [float] = 0, @StockAfterChanged [float] = 0, @StockBefore [float] = 0;
 

--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @History
SELECT @CurrentTempID = MIN(RowId) from @History
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@Type=Type
	,@StockChanged=StockChanged
	,@StockAfterChanged=StockAfterChanged
    FROM @History
    WHERE RowId = @CurrentTempID

	--If Sold Quantity Is less than the receive
	if(ABS(@StockChanged + @StockBefore -  @StockAfterChanged)>1)
	Begin
	  Select @Id [Id],@ItemId [ItemId],@Name [Name],@TotalStock [TotalStock],@Type [Type],@StockChanged [StockChanged],@StockAfterChanged [@StockAfterChanged], @StockChanged + @StockBefore -  @StockAfterChanged [Diff]
	End
	Set @StockBefore=@StockAfterChanged;

	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMergedData]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[SP_GetMergedData] 
@List AS [dbo].[IdList] READONLY
AS
BEGIN

SELECT [TotalStock]
      ,[UnitSalePrice]
	  ,mrg.OnLineId
    FROM [dbo].[Item] itm
  inner join [dbo].[OnlineMerge] mrg  on itm.Id = mrg.[OffLineId]
  inner join @List lst on mrg.[OnLineId] = lst.[Id]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryByPurchase]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryByPurchase] @Info AS [dbo].[PurchaseInfoType] READONLY,
@List AS [dbo].[ItemReceiveType] READONLY
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
		   ,[TotalTradePrice]
		   ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,ItemId
           ,l.Id
           ,0
           ,[UnitQuentity]
           ,TotalStock
           ,GetDate()
           ,inf.[CreatedBy]
		   ,l.[TotalTradePrice] + l.[FreeAmount]
		   ,itm.[UnitSalePrice]*[UnitQuentity]
		   ,l.[TotalDiscount]
		   from @List l 
		   inner join @Info inf on l.[PurchaseInfoId]=inf.Id
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryByPurchaseByReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryByPurchaseByReturn] @List AS [dbo].[PurchaseByReturnItemType] READONLY
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
		   ,[TotalTradePrice]
		   ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,ItemId
           ,l.Id
           ,5
           ,[ReturnQnt]
           ,TotalStock
           ,GetDate()
           ,l.[CreatedBy]
		   ,itmstng.[UnitTradePrice]*l.[ReturnQnt]
		   ,itm.UnitSalePrice*l.[ReturnQnt]
		   ,itmstng.[UnitPurchasePrice]*l.[ReturnQnt]*itmstng.[PurchaseDiscount]/100
		   from @List l 
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryByReduce]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryByReduce] 
	@Id AS [uniqueidentifier], 
	@ItemId AS [uniqueidentifier], 
	@Quantity As [float],  
	@TP As [float],  
	@MRP As [float],  
	@Creator uniqueidentifier
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice])
     select
           NewId()
           ,@ItemId
           ,@Id
           ,3
           ,-@Quantity
           ,TotalStock - @Quantity
           ,GetDate()
           ,@Creator
           ,@TP
           ,@MRP
		   from  [dbo].[Item] itm where Id = @ItemId
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryByReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryByReturn] @List AS [dbo].[ProductReturnItemType] READONLY, 
@Creator uniqueidentifier
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,ItemId
           ,l.Id
           ,2
           ,[UnitQuentity]
           ,TotalStock
           ,GetDate()
           ,@Creator
		   ,itmstng.[UnitTradePrice]*l.UnitQuentity
		   ,itmstng.UnitSalePrice*l.UnitQuentity
		   ,0 -- When Return then discount 0;
		   from @List l 
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryBySale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryBySale] @List AS [dbo].[ItemSaleType] READONLY, 
@Creator uniqueidentifier
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice])
     select
           NewId()
           ,ItemId
           ,[ItemSaleInfoId]
           ,1
           ,[UnitQuentity]
           ,TotalStock
           ,GetDate()
           ,@Creator
           ,itm.[TotalTradePrice]
           ,itm.[TotalSalePrice]
		   from  (select ItemId, [ItemSaleInfoId], Sum(-[UnitQuentity]) [UnitQuentity] from  @List l group by ItemId, [ItemSaleInfoId]) l 
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryBySuplierReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryBySuplierReturn] @List AS [dbo].[SuplierReturnItemType] READONLY
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,l.ItemId
           ,l.Id
           ,6
           ,-[ReturnQnt]
           ,TotalStock
           ,GetDate()
           ,l.CreatedBy
		   ,-itmrcv.[UnitTradePrice]*l.[ReturnQnt]
		   ,-itm.[UnitSalePrice]*l.[ReturnQnt]
		   ,-itmrcv.[UnitDiscount]*l.[ReturnQnt]
		   from @List l 
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
 inner join [dbo].[ItemReceive] itmrcv on l.[ItemReceiveId]=itmrcv.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ItemStockChangeHistoryByUnsalableProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ItemStockChangeHistoryByUnsalableProduct] @List AS [dbo].[UnsalableProductItemType] READONLY
AS
BEGIN
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,l.ItemId
           ,l.[UnsalableProductId]
           ,11
           ,-[Quantiry]
           ,TotalStock
           ,GetDate()
           ,l.CreatedBy
           ,-[TotalTradePrice]
           ,-[TotalSalePrice]
		   ,-[TotalTPDiscount]
		   from( 
		   Select l.ItemId,[UnsalableProductId],l.CreatedBy, Sum(l.[Quantiry]) [Quantiry], TotalStock
		   ,Sum(IsNull(itmrcv.[UnitTradePrice]*l.[Quantiry],0)) [TotalTradePrice]
		   ,Sum(IsNull(itm.[UnitSalePrice]*l.[Quantiry],0)) [TotalSalePrice]
		   ,Sum(IsNull(itmrcv.[UnitDiscount]*l.[Quantiry],0)) [TotalTPDiscount]
		   From  @List l
			inner join [dbo].[ItemReceive] itmrcv on l.[ItemReceiveId]=itmrcv.Id
		   inner join [dbo].[Item] itm on l.ItemId=itm.Id
		   
		   Group by l.ItemId, [UnsalableProductId], l.CreatedBy,TotalStock) l
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginByComputer]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:    	<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LoginByComputer] 
	@UserName nvarchar(30),
	@Password nvarchar(30),
	@ComputerId nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Id [uniqueidentifier], @BranchId [uniqueidentifier],@DesignationId [uniqueidentifier],
	@Name [nvarchar](100), @CAddress [nvarchar](500), @CounterAccess [nvarchar](500),
	@TypeId [uniqueidentifier],@starAmount float=0,@maxDue float=0,@MaxSaleDiscount [int]=0;
	select @Id=[Id],@DesignationId =[DesignationId], @BranchId = [BranchId], @Name=Name, @CAddress = CounterAccess, @TypeId=TypeId,@MaxSaleDiscount=MaxSaleDiscount, @maxDue = MaxDue FROM [dbo].[User] u where u.UserName=@UserName and u.[Password]=@Password and u.IsDeleted=0
    if(@Id is not null)
	begin 

		IF [dbo].[HasAccess](@Id,@DesignationId,'Sales','Create') = 0
		  BEGIN
			select null [Id],null [BranchId],null [Name],null [TypeId],@starAmount [StartAmount],null [DesignationId],0 [MaxSaleDiscount],null [CAddress],null [CounterAccess]
			RETURN;
		  END 
		Select @CounterAccess = CounterAccess From [dbo].[Computer] where Id=@ComputerId

		INSERT INTO [dbo].[DayInfoItem]
           ([Id]
           ,[ComputerId]
           ,[UserId]
           ,[DayInfoId]
           ,[Type]
           ,[CreatedAt]
		   ,[BranchId])
     VALUES
           (newId()
           ,@ComputerId
           ,@Id
           ,'00000000-0000-0000-0000-000000000000'
           ,1
           ,GETDATE()
		   ,@BranchId)


	end
	select @Id [Id], @BranchId [BranchId], @Name [Name], @TypeId [TypeId], @starAmount [StartAmount], @DesignationId [DesignationId], @MaxSaleDiscount [MaxSaleDiscount], @maxDue [MaxDue], @CAddress [CAddress], @CounterAccess [CounterAccess]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Merge]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Merge] 
@List AS [dbo].[OnlineMergeType] READONLY,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;


  BEGIN TRAN

    BEGIN TRY

	
UPDATE mrg
   SET [Stock] = lst.[Stock]
      ,[MRP] = lst.[MRP]
      ,[UpdatedAt] = GetDate()
	  From [dbo].[OnlineMerge] mrg 
	  inner join @List lst on mrg.[OnLineId] = lst.[OnLineId]


    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = NULL
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_OnAttendanceEventFire]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_OnAttendanceEventFire] @UserId uniqueidentifier,
@Time datetime,
@ErrorCode int OUT
AS
BEGIN
  DECLARE @LateDuration float,
          @EmployeeId [uniqueidentifier],
          @DailyAttendanceId [uniqueidentifier],
          @AttedanceId [uniqueidentifier],
          @LastAttedanceDate datetime,
          @EnterAt datetime,
          @EndAt datetime,
          @shiftId [uniqueidentifier],
          @IsOut bit,
          @shift1Id [uniqueidentifier]='00000000-0000-0000-0000-000000000000',
          @Start1At datetime = @Time,
          @End1At datetime= @Time,
          @shift2Id [uniqueidentifier]='00000000-0000-0000-0000-000000000000',
          @Start2At datetime= @Time,
          @End2At datetime= @Time,
          @Distance1 int = 0,
          @Distance2 int = 0,
          @MaxDate datetime;

  -- Getting EmployeeId of this app by fingure print appId.
  SELECT @EmployeeId = [Id] FROM [dbo].[User] WHERE [Id] = @UserId;

  IF (@EmployeeId IS NULL)
  BEGIN
    SET @ErrorCode = -3;
    RETURN;
  END
  -- Last entry
  SELECT TOP 1
    @AttedanceId = [Id],
    @LastAttedanceDate = [Date],
    @EnterAt = [InterAt],
	@MaxDate = Case When [InterAt]> [OutAt] then [InterAt] else [OutAt] end,
    @shiftId = [ShiftId],
    @DailyAttendanceId = DailyAttendanceId,
    @IsOut = CAST(IIF(IsOut = 1, 1, 0) AS bit)
  FROM [dbo].[Attendance] WHERE [EmployeeId] = @EmployeeId AND [InterAt] < @Time ORDER BY [InterAt] DESC

	 IF (DATEDIFF(MINUTE, @MaxDate, @Time)>1)
	  BEGIN
	  
		SET @ErrorCode = -1;
		return;
	  END

  --First roashting of min-distance of startAt Date
  SELECT TOP 1
    @shift1Id = [Id],
    @Start1At = DATEADD(millisecond, DATEDIFF(millisecond, 0, [StartAt]), CAST((CAST(@Time AS date)) AS datetime)),
    @End1At = DATEADD(millisecond, DATEDIFF(millisecond, 0, [EndAt]), CAST((CAST(@Time AS date)) AS datetime)),
    @Distance1 = [Distance]
  FROM (SELECT [Id], [StartAt], [EndAt], ABS(DATEDIFF(MINUTE, [StartAt], CAST(@Time AS time))) [Distance] FROM [dbo].[EmployeeShift] 
  WHERE [EmployeeId] = @EmployeeId AND [ActivateAt] <= @Time AND [ActiveTo] >= @Time AND [StartDayOfMonth] <= DATEPART(DAY, @Time) AND [EndDayOfMonth] >= DATEPART(DAY, @Time)) data
  ORDER BY [Distance] ASC

  --First roashting of min-distance of [EndAt] Date
  SELECT TOP 1
    @shift2Id = [Id],
    @Start2At = DATEADD(millisecond, DATEDIFF(millisecond, 0, [StartAt]), CAST((CAST(@Time AS date)) AS datetime)),
    @End2At = DATEADD(millisecond, DATEDIFF(millisecond, 0, [EndAt]), CAST((CAST(@Time AS date)) AS datetime)),
    @Distance2 = [Distance]
  FROM (SELECT [Id], [StartAt], [EndAt], ABS(DATEDIFF(MINUTE, [EndAt], CAST(@Time AS time))) [Distance] FROM [dbo].[EmployeeShift]
  WHERE [EmployeeId] = @EmployeeId AND [ActivateAt] <= @Time AND [ActiveTo] >= @Time AND [StartDayOfMonth] <= DATEPART(DAY, @Time) AND [EndDayOfMonth] >= DATEPART(DAY, @Time)) data
  ORDER BY [Distance] ASC

  --select @IsOut [Out],@AttedanceId [AttedanceId] ;
  IF (@IsOut IS NULL OR @IsOut = 1)
  BEGIN
    IF ((@Distance1 <= @Distance2) OR (@shiftId = @shift2Id AND @LastAttedanceDate = CAST(@Time AS date)))-- its means its near to [StartAt] that means enter;
    BEGIN
      SET @ErrorCode = 1;
      SET @LateDuration = CASE WHEN @Time > @Start1At THEN DATEDIFF(MINUTE, @Start1At, @Time) ELSE 0 END;
      IF (@LateDuration < 0 OR [dbo].[IsValidForLate](@Time, @LateDuration, @EmployeeId, @shift1Id) = 0)
      BEGIN
        SET @LateDuration = 0;
      END

      EXECUTE [dbo].[SP_AddAttendance] @EmployeeId,
                                       @shift1Id,
                                       @Time,
                                       @Start1At,
                                       @LateDuration,
                                       '',
                                       0,
                                       @ErrorCode OUTPUT
    END
    ELSE -- its means its near to [EndAt] that means Out. But there is no entry data, So we have to insert a default entry value frist and then out.;
    BEGIN

      -- Seeking for the shift that is valid for the same day
      --if exists(SELECT Id FROM [dbo].[EmployeeShift]  where [EmployeeId]=@EmployeeId and [ActivateAt]<=@Time and [ActiveTo]>=@Time  and [EndAt]>=Cast(@Time as Time) and [StartDayOfMonth]<=DATEPART(day,@Time) and [EndDayOfMonth]>= DATEPART(day,@Time))

      IF ((1440 - @Distance1) <= @Distance2) -- we are seeking shift for next day. ex when entrat 23:20 but entry time is 01:00 am.
      BEGIN

        SELECT TOP 1
          @shift1Id = [Id],
          @Start1At = DATEADD(millisecond, DATEDIFF(millisecond, 0, [StartAt]), DATEADD(DAY, 1, CAST((CAST(@Time AS date)) AS datetime)))
        FROM [dbo].[EmployeeShift]
        WHERE [EmployeeId] = @EmployeeId AND [ActivateAt] <= @Time AND [ActiveTo] >= @Time AND [StartDayOfMonth] <= DATEPART(DAY, @Time) AND [EndDayOfMonth] >= DATEPART(DAY, @Time)
        ORDER BY [StartAt] ASC

        SET @LateDuration = 0;

        EXECUTE [dbo].[SP_AddAttendance] @EmployeeId,
                                         @shift1Id,
                                         @Time,
                                         @Start1At,
                                         @LateDuration,
                                         '',
                                         0,
                                         @ErrorCode OUTPUT

      END
      ELSE
      BEGIN
        SET @ErrorCode = 2;
        EXECUTE [dbo].[SP_AddAttendance] @EmployeeId,
                                         @shift2Id,
                                         @Time,
                                         @Start2At,
                                         0,
                                         '',
                                         2,
                                         @ErrorCode OUTPUT;
        SELECT TOP 1
          @AttedanceId = [Id],
          @EnterAt = [InterAt],
          @shiftId = [ShiftId],
          @DailyAttendanceId = DailyAttendanceId,
          @IsOut = CAST(IIF(IsOut = 1, 1, 0) AS bit)
        FROM [dbo].[Attendance]
        WHERE [EmployeeId] = @EmployeeId
        ORDER BY [Date] DESC, [InterAt] DESC

        SET @LateDuration = [dbo].[MinValue](DATEDIFF(MINUTE, @Start2At, @End2At), DATEDIFF(MINUTE, @Start2At, @Time)); -- Here @LateDuration is duration. But not lateDuration here.

        SET @ErrorCode = 3;
        EXECUTE [dbo].[SP_AddAttendanceOut] @EmployeeId,
                                            @AttedanceId,
                                            @DailyAttendanceId,
                                            @Time,
                                            @LateDuration,
                                            1,
                                            @ErrorCode OUTPUT
      END




    END
  END
  ELSE
  BEGIN
    IF (@Distance1 IS NULL OR (@Distance1 >= @Distance2) OR (@shiftId = @shift2Id AND @LastAttedanceDate = CAST(@Time AS date))) -- @Distance1 is null when there is no shift for the employee.
    BEGIN
      IF ((@shiftId = @shift2Id AND @LastAttedanceDate = CAST(@Time AS date)) OR @shift2Id IS NULL)
      BEGIN
        SET @ErrorCode = 4;
        SET @LateDuration = [dbo].[MinValue](DATEDIFF(MINUTE, @EnterAt, @End2At), DATEDIFF(MINUTE, @EnterAt, @Time)); -- Here @LateDuration is duration. But not lateDuration here.
        EXECUTE [dbo].[SP_AddAttendanceOut] @EmployeeId,
                                            @AttedanceId,
                                            @DailyAttendanceId,
                                            @Time,
                                            @LateDuration,
                                            0,
                                            @ErrorCode OUTPUT
      END
      ELSE
      BEGIN
        SELECT
          @EndAt=DATEADD(millisecond ,DATEDIFF(millisecond, 0, [EndAt]) ,CAST((CAST(@LastAttedanceDate AS DATE)) AS DATETIME))
        FROM [dbo].[EmployeeShift]
        WHERE [Id] = @shiftId;
        SET @LateDuration = DATEDIFF(MINUTE, @EnterAt, @EndAt); -- Here @LateDuration is duration. But not lateDuration here.
        DECLARE @min int = ABS(DATEDIFF(MINUTE, @EndAt, @Start2At));
        DECLARE @Abnormal int = IIF(@min > 10, 2, 0);-- we need it to decide is it thge same shift from before 00 to after 00.
        SET @ErrorCode = 5;
        EXECUTE [dbo].[SP_AddAttendanceOut] @EmployeeId,
                                            @AttedanceId,
                                            @DailyAttendanceId,
                                            @EndAt,
                                            @LateDuration,
                                            @Abnormal,
                                            @ErrorCode OUTPUT

        SET @ErrorCode = 6;
        EXECUTE [dbo].[SP_AddAttendance] @EmployeeId,
                                         @shift2Id,
                                         @Start2At,
                                         @Start2At,
                                         0,
                                         '',
                                         @Abnormal,
                                         @ErrorCode OUTPUT
        SELECT TOP 1
          @AttedanceId = [Id],
          @EnterAt = [InterAt],
          @shiftId = [ShiftId],
          @DailyAttendanceId = DailyAttendanceId,
          @IsOut = CAST(IIF(IsOut = 1, 1, 0) AS bit)
        FROM [dbo].[Attendance]
        WHERE [EmployeeId] = @EmployeeId
        ORDER BY [Date] DESC, [InterAt] DESC
        SET @LateDuration = [dbo].[MinValue](DATEDIFF(MINUTE, @Start2At, @End2At), DATEDIFF(MINUTE, @Start2At, @Time)); -- Here @LateDuration is duration. But not lateDuration here.
        SET @Abnormal = IIF(@min > 10, 1, 0);

        SET @ErrorCode = 7;
        EXECUTE [dbo].[SP_AddAttendanceOut] @EmployeeId,
                                            @AttedanceId,
                                            @DailyAttendanceId,
                                            @Time,
                                            @LateDuration,
                                            @Abnormal,
                                            @ErrorCode OUTPUT
      END
    END
    ELSE
    BEGIN

      SET @ErrorCode = 8;
      SELECT
        @EndAt=DATEADD(millisecond ,DATEDIFF(millisecond, 0, [EndAt]) ,CAST((CAST(@LastAttedanceDate AS DATE)) AS DATETIME))
      FROM [dbo].[EmployeeShift]
      WHERE [Id] = @shiftId;
      SET @LateDuration = DATEDIFF(MINUTE, @EnterAt, @EndAt); -- Here @LateDuration is duration. But not lateDuration here.
      --Declare @min int=ABS(DATEDIFF(Minute, @EndAt, @Start2At)), @Abnormal int=IIF(@min>10,2,0);
      EXECUTE [dbo].[SP_AddAttendanceOut] @EmployeeId,
                                          @AttedanceId,
                                          @DailyAttendanceId,
                                          @EndAt,
                                          @LateDuration,
                                          2,
                                          @ErrorCode OUTPUT

      SET @ErrorCode = 9;
      SET @LateDuration =
                         CASE
                           WHEN @Time > @Start1At THEN DATEDIFF(MINUTE, @Start1At, @Time)
                           ELSE 0
                         END;
      IF (@LateDuration < 0
        OR [dbo].[IsValidForLate](@Time, @LateDuration, @EmployeeId, @shift1Id) = 0)
      BEGIN
        SET @LateDuration = 0;
      END
      EXECUTE [dbo].[SP_AddAttendance] @EmployeeId,
                                       @shift1Id,
                                       @Time,
                                       @Start1At,
                                       @LateDuration,
                                       '',
                                       1,
                                       @ErrorCode OUTPUT
    END
  END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PaymentReceive]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[SP_PaymentReceive] @List AS [dbo].[ItemPaymentType] READONLY,
@InfoId [uniqueidentifier],@Discount [float],@TotalDiscount [float],@Amount [float],
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;


  BEGIN TRAN
    BEGIN TRY

		UPDATE itmsl
   SET itmsl.[Discount] = l.[Discount]
      ,itmsl.[TotalPayableSalePrice] = l.[TotalPayablePrice]
	  ,itmsl.[TotalDiscount]=l.[TotalDiscount]
	  from [dbo].[ItemSale] itmsl
	  inner join @List l on l.Id=itmsl.Id

	  
	UPDATE [dbo].[ItemSaleInfo]
   SET [SalePrice] = @Amount
      ,[Discount] = @Discount
	  ,[TotalDiscount]=@TotalDiscount
	  where Id=@InfoId

      
      --Update ItemReceive
      UPDATE i
      SET [TotalSoldPrice] = [TotalSoldPrice] + l.[TotalPayablePriceDiff],
	  [Discount]=@Discount,
	  [TotalDiscount]=@TotalDiscount

      FROM [dbo].[ItemReceive] i
      INNER JOIN @List l
        ON i.[Id] = l.[ItemReceiveId];


		-- Update Report
		
UPDATE i
   SET [SalePrice] = i.[SalePrice]+l.[TotalPayablePriceDiff]
      ,[Discount] = i.[Discount]+l.[TotalDiscountDiff]
      ,[UpdatedAt] = GetDate()
	  FROM [dbo].[ItemSales] i 
      INNER JOIN @List l ON i.[ItemId] = l.[ItemId];

		UPDATE i
   SET [SalePrice] = i.[SalePrice]+l.[TotalPayablePriceDiff]
      ,[Discount] = i.[Discount]+l.[TotalDiscountDiff]
      ,[UpdatedAt] = GetDate()
 FROM [dbo].[DailySales] i
	  inner join [dbo].[ItemSale] itmsl on cast(itmsl.[CreatedAt] as date)=i.[Day]
      INNER JOIN @List l ON itmsl.[ItemId] = l.[ItemId]


	  UPDATE i
   SET [SalePrice] = i.[SalePrice]+l.[TotalPayablePriceDiff]
      ,[Discount] = i.[Discount]+l.[TotalDiscountDiff]
      ,[UpdatedAt] = GetDate()
	  from [dbo].[DailyItemSales] i
      INNER JOIN @List l ON i.[ItemId] = l.[ItemId]
	  inner join [dbo].[ItemSale] itmsl on i.[ItemId]=itmsl.[ItemId]
	  where i.[ItemId] = itmsl.[ItemId] and cast([CreatedAt] as date)=i.[Day];
    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = NULL
    SET @ErrorCode = -6;
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProductReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [dbo].[SP_ProductReturn] @List AS [dbo].[ProductReturnItemType] READONLY,
@Info AS [dbo].[ProductReturnType] READONLY,
@Accounts As [dbo].ReturnAccountModelType READONLY,
@FiscalYearId uniqueidentifier,
@BranchId uniqueidentifier,
@VoucherNo nvarchar(10) out,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;
  IF [dbo].[IsValidForReturn](@Info, @List) = 0
  BEGIN
    SET @ErrorCode = -4
    RETURN;
  END
  Declare 
@InventoryAccountId uniqueidentifier,
@CashInCounterId uniqueidentifier,
@InventoryDueId uniqueidentifier,
@ReturnDiscountAccountId uniqueidentifier,
@RewardPointLiability uniqueidentifier,
@ReturnMRP  As [float] = 0,
@ReturnDiscount  As [float] = 0,
@ReturnTP  As [float] = 0,
@RewardPointExpense uniqueidentifier,

@TradePrice float=0,
@returnAmount float,
@Discount float,
@rewpoint float,
@rewpointTK float,
@SaleId uniqueidentifier,
@InfoId uniqueidentifier,
@CustomerId uniqueidentifier,
@CreatedBy AS [uniqueidentifier], 
@date datetime=GetDate(), 
@DueReturn float, 
@CashReturn float,
@SalePrice float,
@AdmissionId uniqueidentifier;


Select @InventoryAccountId = InventoryAccountId,
@CashInCounterId = CashFrom,
@InventoryDueId = InventoryDueId,
@ReturnDiscountAccountId = ReturnDiscountAccountId,
@RewardPointLiability = RewardPointLiability,
@RewardPointExpense = RewardPointExpense 
From @Accounts


	   SELECT @ReturnMRP = Sum(sl.[UnitSalePrice]*lst.UnitQuentity)
	  ,@ReturnDiscount = Sum((sl.[TotalDiscount]/sl.UnitQuentity)*lst.UnitQuentity)
	  ,@ReturnTP = Sum((sl.[TotalPayableTradePrice]/sl.UnitQuentity)*lst.UnitQuentity)
       FROM @List lst
	   inner join [dbo].[ItemSale] sl on lst.[ItemSaleId] = sl.Id

	   
	  select @InfoId=Id, @SaleId=ItemSaleInfoId, @SalePrice = SalePrice, @DueReturn=DueReturn,  @CashReturn=CashReturn,  @returnAmount=[ReturnAmount], @rewpoint= -RewardPoint, @rewpointTK=RewardPointTK,@CreatedBy = CreatedBy,@CustomerId=[CustomerId], @AdmissionId = AdmissionId from @Info;
	  SELECT @TradePrice=Sum((i.[UnitTradePrice])*l.[UnitQuentity])  FROM [dbo].[ItemSetting] i INNER JOIN @List l ON i.Id = l.[ItemId]

	  set @Discount=@TradePrice-@returnAmount;
	  
	   Set @ReturnMRP = IsNull(@ReturnMRP, @SalePrice);
	   Set @ReturnDiscount = IsNull(@ReturnDiscount, 0);
	   Set @ReturnTP = IsNull(@ReturnTP, @TradePrice);
	   
	  if @CustomerId <> '00000000-0000-0000-0000-000000000000'
	  Begin
	  Select @AdmissionId = AdmissionId From [dbo].[Customer] where Id = @CustomerId
	  END
	  


  BEGIN TRAN
    BEGIN TRY
	set @VoucherNo= [dbo].[NewReturnVoucherNo]();
      INSERT INTO [dbo].[ProductReturn]
     SELECT [Id]
      ,[CustomerId]
      ,[ItemSaleInfoId]
      ,[PaymentType]
      ,@VoucherNo
      ,[ItemCount]
      ,[SalePrice]
      ,[TradePrice]
      ,[Discount]
      ,[Vat]
      ,[ReturnAmount]
      ,[ComputerId]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[PurchasePrice]
      ,[PurchaseVAT]
      ,[PurchaseDiscount]
      ,IsNull(@ReturnDiscount,0)--[SaleDiscount]
      ,[RewardPoint]
      ,[RewardPointTK]
	  ,[BranchId]
	  ,IsNull(@ReturnMRP,[SoldPrice])
	  ,[ReferenceId]
	  ,@AdmissionId
      ,[CashReturn]
      ,[DueReturn]
      ,[DueAfter]
      ,[PaidAfter]
      ,[Remarks]
      ,[ActivityId]
	  from @Info

      INSERT INTO [dbo].[ProductReturnItem]
     SELECT lst.[Id]
      ,lst.[ItemId]
      ,lst.[ItemSaleId]
      ,lst.[ProductReturnId]
      ,lst.[ItemReceiveId]
      ,lst.[SalesUnitTypeId]
      ,lst.[UnitQuentity]
      ,stng.[UnitSalePrice]
      ,stng.[UnitSalePrice]*lst.[UnitQuentity]
      ,stng.[UnitTradePrice]
      ,stng.[UnitTradePrice]*lst.[UnitQuentity]
      ,[ReturnAmount]
      ,lst.[Discount]
      ,lst.[VAT]
      ,GetDate()
      ,lst.[UnitPurchasePrice]
      ,[UnitPurchaseVAT]
      ,[UnitPurchaseDiscount]
      ,lst.[BranchId]
	  ,IsNull(lst.[UnitQuentity] * sl.UnitSalePrice,lst.[SoldPrice])
	  ,IsNull(lst.[UnitQuentity]*sl.[Discount] * sl.UnitSalePrice/100,lst.[SoldDiscount])
	  ,IsNull(lst.[UnitQuentity] * sl.TotalPayableSalePrice/sl.UnitQuentity - [ReturnAmount], lst.[ReturnDiscount])
	  ,lst.[ReturnDiscountP]
       FROM @List lst
	   inner join [dbo].[ItemSetting] stng on lst.ItemId = stng.Id
	   left join [dbo].[ItemSale] sl on lst.[ItemSaleId] = sl.Id


	--Insert into Stock

EXECUTE [dbo].[SP_SetReceiveForReturn] 
   @List
  ,@ErrorCode OUTPUT;

  IF @ErrorCode < 0
  BEGIN
    ROLLBACK TRAN
    RETURN;
  END

      --Update Items
      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] + l.[UnitQuentity]) * i.UnitSalePrice,
          [TotalTradePrice] = i.[TotalTradePrice] + (itmstng.[UnitTradePrice]* l.[UnitQuentity]),
		  [TotalStock] = [TotalStock] + l.[UnitQuentity]
      FROM [dbo].[Item] i
		    inner join [dbo].[ItemSetting] itmstng on i.[Id]=itmstng.Id
      INNER JOIN (select [ItemId], SUM([UnitQuentity]) [UnitQuentity], SUM([TotalTradePrice]) [TotalTradePrice]  from @List group by [ItemId] ) l
        ON i.Id = l.[ItemId];

		Declare @Creator uniqueidentifier = (select CreatedBy from @Info);
	  --Insert ItemStockChangeHistory
		EXECUTE [dbo].[SP_ItemStockChangeHistoryByReturn]  @List,@Creator

   


	  
	  
	EXECUTE [dbo].[SP_ReturnCustomerDue] 
   @InfoId
  ,@CustomerId
  ,@AdmissionId
  ,@returnAmount
  ,@CreatedBy
  ,'Return'
  ,@ReturnMRP
  ,@ReturnDiscount
  ,@ReturnTP
  ,@DueReturn
  ,@CashReturn
  ,@ErrorCode OUTPUT

    IF @ErrorCode < 0
  BEGIN
    ROLLBACK TRAN
    RETURN;
  END
  
  Set @DueReturn = IsNull(@DueReturn,0);

  if(@DueReturn>0)
  BEGIN
	EXECUTE [dbo].[SP_SetInvoiceListDue] 
	@InfoId, 
	@SaleId, 
	@CustomerId, 
	@CashReturn, 
	@DueReturn, 
	@CreatedBy, 
	@ErrorCode OUTPUT
  END

    IF @ErrorCode < 0
  BEGIN
    ROLLBACK TRAN
    RETURN;
  END

  --Set  @CashReturn = @returnAmount - @DueReturn;


      EXECUTE [dbo].[SP_Add_Transaction] @InventoryAccountId,@TradePrice,0,@FiscalYearId,@date,4,@InfoId,@BranchId
	  if(@CashReturn>0)
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @CashInCounterId, 0,@CashReturn,@FiscalYearId,@date,4,@InfoId,@BranchId
	  END
	  ELSE
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @InventoryDueId, 0,@DueReturn,@FiscalYearId,@date,4,@InfoId,@BranchId
	  END
	  -- here @CustomerAccountId is Profit or loss Account sent from c#
	  if(@Discount>0)
	  BEGIN
	  EXECUTE [dbo].[SP_Add_Transaction] @ReturnDiscountAccountId,0,@Discount,@FiscalYearId,@date,4,@InfoId,@BranchId
	  END
	  Else IF(@Discount<0)
	  BEGIN
	  set @Discount=abs(@Discount);
	  EXECUTE [dbo].[SP_Add_Transaction] @ReturnDiscountAccountId,@Discount,0,@FiscalYearId,@date,4,@InfoId,@BranchId
	  END
	  -- RewardPoint Section
	  -- We calculate reward point as nagative amount
	if @rewpoint< 0 And  @CustomerId <> '00000000-0000-0000-0000-000000000000'
	Begin

	 Declare 
		@Total  As [float] = 0,
		@Pending  As [float] = 0, 
		@Spent  As [float] = 0,
		@Converted  As [float] = 0,
		@TransDate datetime=GetDate();

		
select @Total=[Total],@Pending = [Pending] + @rewpoint, @Spent = [Spent] - @rewpoint, @Converted=[Converted]
  FROM [dbo].[RewardPoint]
  Where [CustomerId] = @CustomerId
	  
		EXECUTE  [dbo].[SP_AddRewardPointHistory]
		@CustomerId, 
		'Return',
		@InfoId, 
		@rewpoint, 
		@Total, 
		@Pending, 
		@Spent, 
		@Converted,  
		'',
		@CreatedBy;

		  UPDATE [dbo].[RewardPoint]
   SET [Total] = @Total
      ,[Pending] = @Pending
      ,[Spent] = @Spent
      ,[Converted] = @Converted
  Where [CustomerId] = @CustomerId


     if @rewpointTK>0
   BEGIN
   EXECUTE [dbo].[SP_Add_Transaction] @RewardPointExpense,0,@rewpointTK,@FiscalYearId,@TransDate,4,@InfoId,@BranchId;
   EXECUTE [dbo].[SP_Add_Transaction] @RewardPointLiability,@rewpointTK,0,@FiscalYearId,@TransDate,4,@InfoId,@BranchId;
   END


   


	End






    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = @BranchId
    SET @ErrorCode = -6;
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ProductSale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_ProductSale] @List AS [dbo].[ItemSaleType] READONLY,
@Info AS [dbo].[ItemSaleInfoType] READONLY,
@PaymentMethod AS [dbo].[SalePaymentMathodType] READONLY,
@PaymentModel AS [dbo].[SalePaymentModelType] READONLY,
@Accounts AS [dbo].[SalesAccountModelType] READONLY,
@FiscalYearId uniqueidentifier,
@PrevDue float out,
@ErrorCode int out,
@Voucher nvarchar(25) out
AS
BEGIN
  SET NOCOUNT ON;
  IF [dbo].[IsValidForSale](@List) = 0
  BEGIN
    SET @ErrorCode = -5
    RETURN;
  END

  BEGIN TRAN


    BEGIN TRY
	
	  Declare @BranchId uniqueidentifier, @Creator uniqueidentifier, @InfoId uniqueidentifier, @AdmissionId uniqueidentifier, @CustomerId uniqueidentifier, @PayableTP [float] = 0, @PurchaseDiscount [float] =0;
	  select @InfoId = Id, @BranchId=BranchId, @Creator=CreatedBy, @CustomerId = CustomerId, @AdmissionId = AdmissionId from @Info;


	  if @CustomerId <> '00000000-0000-0000-0000-000000000000'
	  Begin
	  Select @AdmissionId = AdmissionId From [dbo].[Customer] where Id = @CustomerId
	  END
	  
		
EXECUTE [dbo].[SP_SetReceive] 
   @List
  ,@InfoId
  ,@Creator
  ,@PayableTP OUTPUT
  ,@PurchaseDiscount OUTPUT
  ,@ErrorCode OUTPUT;

  IF(@ErrorCode<0)
  BEGIN
  
    ROLLBACK TRAN

	return;
  END
  ELSE
  BEGIN
	
	


  --[dbo].[NewVoucherNoWithPrice]
  set @Voucher= [dbo].[NewVoucherNo] ();

      INSERT INTO [dbo].[ItemSaleInfo]
        SELECT [Id]
      ,[CustomerId]
      ,[ReferenceId]
      ,[PaymentType]
      ,@Voucher
      ,[ItemCount]
      ,[SalePrice]
      ,@PayableTP
      ,[Discount]
      ,[TotalDiscount]
      ,[VAT]
      ,[TotalVAT]
      ,[ComputerId]
	  --[Type]
      ,[dbo].[GetSerialNo]([ChangeLog])
      ,[VatType]
      ,GetDate()
      ,[CreatedBy]
      ,GetDate()
      ,[UpdatedBy]
      ,[IsDeleted]
	  ,ChangeLog
	  ,[IsDelivered]
	  ,[PurchasePrice]
	  ,[PurchaseVAT]
	  ,[PurchaseDiscount]
	  ,[RewardPoint]
	  ,[RewardPointTK]
	  ,[BranchId]
	  ,[ActivityId] 
	  ,[DeliveryCharge]
      ,[Address]  
      ,[Remarks]
	  ,[DoctorId]
	  ,@AdmissionId
	   FROM @Info;

		--UpDate Report Info
		-- *** Not Using Currently. Its only for report
		--EXECUTE [dbo].[SP_UpdateReportForSale] @List



		

		
UPDATE itm
   SET [TotalStock] =IsNull([Quantity],0)
      ,[TotalTradePrice] = IsNull(rcv.TP,0)
      ,[TotalSalePrice] = IsNull([Quantity],0)*stng.UnitSalePrice
      ,[TotalPurchaseDiscount] = IsNull(rcv.[Discount],0)
  FROM [dbo].[Item] itm
  inner join [dbo].[ItemSetting] stng on itm.Id = stng.Id
  left join (
SELECT rcv.[ItemId]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitTradePrice]) [TP]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [Quantity]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitDiscount]) [Discount]
  FROM [dbo].[ItemReceive] rcv
  INNER JOIN (Select ItemId From  @List Group by ItemId) lst on rcv.ItemId = lst.ItemId
  where rcv.[UnitQuentity] > rcv.[UnitQuentitySold]
  group by rcv.[ItemId]) rcv on itm.Id = rcv.ItemId
  where itm.Id in (Select ItemId From  @List)



	  --Store Due Information
	  EXECUTE [dbo].[SP_SetSalePayment] @Info, @PaymentModel, @PayableTP, @AdmissionId, @PrevDue OUTPUT;

	  --Store Due Information
	  EXECUTE [dbo].[SP_SetSaleRewardPoint] @Info, @PaymentModel;

	  --Set Sale Transaction
	  EXECUTE [dbo].[SP_Add_Product_Sale_Transaction] @Info, @PaymentMethod, @PaymentModel, @Accounts,@PayableTP, @PurchaseDiscount, @FiscalYearId;
	  



    COMMIT TRAN
    SET @ErrorCode = 1;

	END -- End of ErrorCode
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id,
                             @Remarks = NULL
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PurchaseByItem]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_PurchaseByItem] @List AS [dbo].[PurchaseByReturnItemType] READONLY,
@Info AS [dbo].[PurchaseByReturnType] READONLY,
@SaleAccountId uniqueidentifier,
@PettyCashAccountId uniqueidentifier,
@SaleDiscountAccountId uniqueidentifier,
@ReturnDiscountAccountId uniqueidentifier,
@InventoryAccountId uniqueidentifier,
@CostOfGoodsSoldAccountId uniqueidentifier,
@FiscalYearId uniqueidentifier,
@BranchId uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

 --   -- Protect to return multiple time
 -- if exists(Select i.Id FROM [dbo].[PurchaseByReturnItem] i inner JOIN @List l on i.[ItemSaleId] = l.[ItemSaleId])
	--begin
	--	set @ErrorCode=-4;
	--	return;
	--end


  BEGIN TRAN

    BEGIN TRY

	INSERT INTO [dbo].[PurchaseByReturn]
     SELECT [Id]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[ComputerId]
      ,[CustomerId]
      ,[SoldBy]
      ,[ItemSaleInfoId]
      ,[VoucharNo]
      ,[ItemSold]
      ,[ItemReturn]
      ,[TotalSoldPrice]
      ,[SoldPrice]
      ,[ReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[Vat]
      ,[PurchasePrice]
      ,[PurchaseVAT]
      ,[PurchaseDiscount]
	  ,[BranchId]
	  from @Info
      INSERT INTO [dbo].[PurchaseByReturnItem]
     SELECT [Id]
      ,[ItemId]
      ,[ItemSaleId]
      ,[ItemReceiveId]
      ,[SalesUnitTypeId]
      ,[PurchaseByReturnId]
      ,[CreatedBy]
      ,[CreatedAt]
      ,[VoucharNo]
      ,[SoldQnt]
      ,[ReturnQnt]
      ,[TotalSoldPrice]
      ,[SoldPrice]
      ,[ReturnAmount]
      ,[UnitSoldPrice]
      ,[UnitReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[UnitTradePrice]
      ,[TotalTradePrice]
      ,[VAT]
      ,[UnitPurchasePrice]
      ,[UnitPurchaseVAT]
      ,[UnitPurchaseDiscount]
	  ,[BranchId]
        FROM @List;

		--Insert into Stock

		
INSERT INTO [dbo].[ItemReceive]
           ([Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount]
           ,[MarginDiscount]
           ,[UnitPurchasePrice]
           ,[UnitVAT]
           ,[UnitDiscount]
		   ,[BranchId])
     select l.Id
           ,l.ItemId
           ,itm.SuplierId
           ,l.[PurchaseByReturnId]
           ,itm.SalesUnitTypeId
           ,itmstng.PurchaseUnitTypeId
           ,itmstng.UnitConversion
           ,l.[ReturnQnt]
           ,0
           ,itmstng.[UnitTradePrice]
           ,itmstng.[UnitTradePrice]*l.[ReturnQnt]
           ,itm.UnitSalePrice
           ,0
           ,itmstng.PurchaseVat
           ,itmstng.[UnitPurchasePrice]*l.[ReturnQnt]*itmstng.PurchaseVat/100
           ,itmstng.[PurchaseDiscount]
           ,itmstng.[UnitPurchasePrice]*l.[ReturnQnt]*itmstng.[PurchaseDiscount]/100
           ,0
           ,0
           ,'2000/01/01 00:00'
           ,'2100/01/01 00:00'
           ,''
           ,GetDate()
           ,4
           ,0
		   ,0
		   ,itmstng.[UnitPurchasePrice]
		   ,itmstng.PurchaseVat*itmstng.[UnitPurchasePrice]/100
		   ,itmstng.[PurchaseDiscount]*itmstng.[UnitPurchasePrice]/100
		   ,@BranchId
		   FROM @List l 
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id
		   inner join [dbo].[Item] itm on l.[ItemId]=itm.Id;

      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] - l.[ReturnQnt]) * i.UnitSalePrice,
          [TotalTradePrice] = i.[TotalTradePrice] - l.[TotalTradePrice],
          i.[TotalStock] = i.[TotalStock] + l.[ReturnQnt],
          i.[UnitTradePrice] =
                                CASE
                                  WHEN i.[CurrentStock] < 1 THEN itmstng.[UnitTradePrice]
                                  ELSE i.[UnitTradePrice]
                                END,
          
          
          i.[ItemReceiveId] =
                               CASE
                                 WHEN i.[CurrentStock] < 1 THEN l.[Id]
                                 ELSE i.[ItemReceiveId]
                               END,
          i.[CurrentStock] =
                              CASE
                                WHEN i.[CurrentStock] < 1 THEN l.[ReturnQnt]
                                ELSE i.[CurrentStock]
                              END,
          i.[PurchaseDiscount] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[PurchaseDiscount]
                           ELSE i.[PurchaseDiscount]
                         END,
          i.[PurchaseVat] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[PurchaseVat]
                           ELSE i.[PurchaseVat]
                         END,
          i.[UnitPurchasePrice] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[UnitPurchasePrice]
                           ELSE i.[UnitPurchasePrice]
                         END
      FROM [dbo].[Item] i
      INNER JOIN @List l ON i.Id = l.[ItemId]
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id

      

      --Insert ItemStockChangeHistory
      EXECUTE [dbo].[SP_ItemStockChangeHistoryByPurchaseByReturn] @List



	  Declare @TradePrice float=0,@discount float,@returnDiscount float,@returnAmount float,@total float,@InfoId uniqueidentifier,@date datetime=GetDate();
	  select @InfoId=Id, @discount=TotalDiscount, @returnDiscount=TotalReturnDiscount, @returnAmount=ReturnPrice from @Info;
	  --we consider price with vat but excluded discount. So we added discount.
	  SELECT  @TradePrice=sum((i.[UnitTradePrice]+i.[UnitPurchasePrice]*i.[PurchaseDiscount]/100)*l.[ReturnQnt]) FROM [dbo].[ItemSetting] i
      INNER JOIN @List l ON i.Id = l.[ItemId]

--	  @SaleAccountId uniqueidentifier,
--@PettyCashAccountId uniqueidentifier,
--@SaleDiscountAccountId uniqueidentifier,
--@ReturnDiscountAccountId uniqueidentifier,
--@InventoryAccountId uniqueidentifier,
--@CostOfGoodsSoldAccountId uniqueidentifier,

		   

	  set @total=@returnAmount+@discount+@returnDiscount;


	        --Insert ItemStockChangeHistory
      EXECUTE [dbo].[SP_Add_Transaction] @PettyCashAccountId,0,@returnAmount,@FiscalYearId,@date,15,@InfoId,@BranchId
	  if(@discount>0)
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @SaleDiscountAccountId,0,@discount,@FiscalYearId,@date,15,@InfoId,@BranchId
	  END
	  if(@returnDiscount>0)
	  BEGIN
      EXECUTE [dbo].[SP_Add_Transaction] @ReturnDiscountAccountId,0,@returnDiscount,@FiscalYearId,@date,15,@InfoId,@BranchId
	  END
      EXECUTE [dbo].[SP_Add_Transaction] @SaleAccountId,@total,0,@FiscalYearId,@date,15,@InfoId,@BranchId
      EXECUTE [dbo].[SP_Add_Transaction] @InventoryAccountId,@TradePrice,0,@FiscalYearId,@date,15,@InfoId,@BranchId
      EXECUTE [dbo].[SP_Add_Transaction] @CostOfGoodsSoldAccountId,0,@TradePrice,@FiscalYearId,@date,15,@InfoId,@BranchId


--	  @AccountId uniqueidentifier,
--@Debit float,
--@Credit float,
--@FiscalYearId uniqueidentifier,
--@TransDate DateTime,
--@SourceType int,
--@SourceId uniqueidentifier



set @ErrorCode= 1;


    COMMIT TRAN

  END TRY
  BEGIN CATCH

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = @BranchId

  END CATCH



END
GO
/****** Object:  StoredProcedure [dbo].[SP_PurchaseByReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[SP_PurchaseByReturn] @List AS [dbo].[PurchaseByReturnItemType] READONLY,
@Info AS [dbo].[PurchaseByReturnType] READONLY,
@PettyCashAccountId uniqueidentifier,
@ReturnDiscountAccountId uniqueidentifier,
@InventoryAccountId uniqueidentifier,
@FiscalYearId uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

 --   -- Protect to return multiple time
 -- if exists(Select i.Id FROM [dbo].[PurchaseByReturnItem] i inner JOIN @List l on i.[ItemSaleId] = l.[ItemSaleId])
	--begin
	--	set @ErrorCode=-4;
	--	return;
	--end


  BEGIN TRAN

    BEGIN TRY

	INSERT INTO [dbo].[PurchaseByReturn]
     SELECT [Id]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[ComputerId]
      ,[CustomerId]
      ,[SoldBy]
      ,[ItemSaleInfoId]
      ,[dbo].[NewPurchaseByReturnVoucherNo]()
      ,[ItemSold]
      ,[ItemReturn]
      ,[TotalSoldPrice]
      ,[SoldPrice]
      ,[ReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[Vat]
      ,[PurchasePrice]
      ,[PurchaseVAT]
      ,[PurchaseDiscount]
	  ,[BranchId]
	  from @Info

      INSERT INTO [dbo].[PurchaseByReturnItem]
     SELECT [Id]
      ,[ItemId]
      ,[ItemSaleId]
      ,[ItemReceiveId]
      ,[SalesUnitTypeId]
      ,[PurchaseByReturnId]
      ,[CreatedBy]
      ,[CreatedAt]
      ,[VoucharNo]
      ,[SoldQnt]
      ,[ReturnQnt]
      ,[TotalSoldPrice]
      ,[SoldPrice]
      ,[ReturnAmount]
      ,[UnitSoldPrice]
      ,[UnitReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[UnitTradePrice]
      ,[TotalTradePrice]
      ,[VAT]
      ,[UnitPurchasePrice]
      ,[UnitPurchaseVAT]
      ,[UnitPurchaseDiscount]
	  ,[BranchId]
        FROM @List;

		--Insert into Stock

		
INSERT INTO [dbo].[ItemReceive]
           ([Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount]
           ,[MarginDiscount]
           ,[UnitPurchasePrice]
           ,[UnitVAT]
           ,[UnitDiscount]
		   ,[BranchId])
     select l.Id
           ,l.ItemId
           ,itm.SuplierId
           ,l.[PurchaseByReturnId]
           ,itm.SalesUnitTypeId
           ,itmstng.PurchaseUnitTypeId
           ,itmstng.UnitConversion
           ,l.[ReturnQnt]
           ,0
           ,itmstng.[UnitTradePrice]
           ,itmstng.[UnitTradePrice]*l.[ReturnQnt]
           ,itm.UnitSalePrice
           ,0
           ,itmstng.PurchaseVat
           ,itmstng.[UnitPurchasePrice]*l.[ReturnQnt]*itmstng.PurchaseVat/100
           ,itmstng.[PurchaseDiscount]
           ,itmstng.[UnitPurchasePrice]*l.[ReturnQnt]*itmstng.[PurchaseDiscount]/100
           ,0
           ,0
           ,'2000/01/01 00:00'
           ,'2100/01/01 00:00'
           ,''
           ,GetDate()
           ,4
           ,0
		   ,0
		   ,itmstng.[UnitPurchasePrice]
		   ,itmstng.PurchaseVat*itmstng.[UnitPurchasePrice]/100
		   ,itmstng.[PurchaseDiscount]*itmstng.[UnitPurchasePrice]/100
		   ,l.BranchId
		   FROM @List l 
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id
		   inner join [dbo].[Item] itm on l.[ItemId]=itm.Id;

      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] + l.[ReturnQnt]) * i.UnitSalePrice,
          [TotalTradePrice] = i.[TotalTradePrice] + l.[TotalTradePrice],
          i.[TotalStock] = i.[TotalStock] + l.[ReturnQnt],
          i.[UnitTradePrice] =
                                CASE
                                  WHEN i.[CurrentStock] < 1 THEN itmstng.[UnitTradePrice]
                                  ELSE i.[UnitTradePrice]
                                END,
          
          
          i.[ItemReceiveId] =
                               CASE
                                 WHEN i.[CurrentStock] < 1 THEN l.[Id]
                                 ELSE i.[ItemReceiveId]
                               END,
          i.[CurrentStock] =
                              CASE
                                WHEN i.[CurrentStock] < 1 THEN l.[ReturnQnt]
                                ELSE i.[CurrentStock]
                              END,
          i.[PurchaseDiscount] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[PurchaseDiscount]
                           ELSE i.[PurchaseDiscount]
                         END,
          i.[PurchaseVat] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[PurchaseVat]
                           ELSE i.[PurchaseVat]
                         END,
          i.[UnitPurchasePrice] =
                         CASE
                           WHEN i.[CurrentStock] < 1 THEN itmstng.[UnitPurchasePrice]
                           ELSE i.[UnitPurchasePrice]
                         END
      FROM [dbo].[Item] i
      INNER JOIN @List l ON i.Id = l.[ItemId]
		   inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id

      

      --Insert ItemStockChangeHistory
      EXECUTE [dbo].[SP_ItemStockChangeHistoryByPurchaseByReturn] @List



	  Declare @TradePrice float=0,@discount float,@returnAmount float,@InfoId uniqueidentifier,@BranchId uniqueidentifier,@date datetime=GetDate();
	  select @InfoId=Id, @BranchId=BranchId, @returnAmount=ReturnPrice from @Info;
	  --we consider price with vat but excluded discount. So we added discount.
	  SELECT  @TradePrice=sum((i.[UnitTradePrice]+i.[UnitPurchasePrice]*i.[PurchaseDiscount]/100)*l.[ReturnQnt]) FROM [dbo].[ItemSetting] i INNER JOIN @List l ON i.Id = l.[ItemId]

	  set @Discount=@TradePrice-@returnAmount;


      EXECUTE [dbo].[SP_Add_Transaction] @PettyCashAccountId,0,@returnAmount,@FiscalYearId,@date,16,@InfoId, @BranchId
      EXECUTE [dbo].[SP_Add_Transaction] @InventoryAccountId,@TradePrice,0,@FiscalYearId,@date,16,@InfoId, @BranchId
	  if(@Discount>0)
	  BEGIN
	  EXECUTE [dbo].[SP_Add_Transaction] @ReturnDiscountAccountId,0,@Discount,@FiscalYearId,@date,16,@InfoId,@BranchId
	  END
	  Else IF(@Discount<0)
	  BEGIN
	  set @Discount=abs(@Discount);
	  EXECUTE [dbo].[SP_Add_Transaction] @ReturnDiscountAccountId,@Discount,0,@FiscalYearId,@date,16,@InfoId,@BranchId
	  END

--	  @AccountId uniqueidentifier,
--@Debit float,
--@Credit float,
--@FiscalYearId uniqueidentifier,
--@TransDate DateTime,
--@SourceType int,
--@SourceId uniqueidentifier



set @ErrorCode= 1;


    COMMIT TRAN

  END TRY
  BEGIN CATCH

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = NULL

  END CATCH



END
GO
/****** Object:  StoredProcedure [dbo].[SP_ReduceStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ReduceStock] 
	@ItemId AS [uniqueidentifier], 
	@Quantity As [float], 
	@UnitMRP As [float],  
	@Creator uniqueidentifier,  
	@ErrorCode As [Int] Out
AS
BEGIN



  BEGIN TRAN


    BEGIN TRY

DECLARE @Receive AS [dbo].[ReceiveType],@HistoryId uniqueidentifier,@TotalQuantity As [float] = @Quantity;
  Set @ErrorCode = 1;

  -- Get All Active ItemReceive By @ItemId 
  insert INTO @Receive
  SELECT Id, [ItemId], rcv.UnitQuentity - rcv.UnitQuentitySold [Stock], rcv.UnitQuentitySold,
  UnitTradePrice, UnitDiscount, ROW_NUMBER() OVER(ORDER BY rcv.[ActivateAt] ASC) AS RowId 
  FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentity > rcv.UnitQuentitySold
  Order by rcv.[ActivateAt] -- Order by Get Oldest Entry First. 



--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @Stock [float], @Sold [float], @UnitTradePrice [float], @UnitDiscount [float], @TP [float] = 0, @MRP [float] = @Quantity*@UnitMRP;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Receive
SELECT @CurrentTempID = MIN(RowId) from @Receive
 
WHILE @CurrentTempID <= @MaxTempID And @Quantity > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@Stock=Stock
	,@Sold=Sold
	,@UnitTradePrice=UnitTradePrice
	,@UnitDiscount=UnitDiscount
    FROM @Receive
    WHERE RowId = @CurrentTempID

	--If Sold Quantity Is less than the receive
	if(@Quantity <= @Stock)
	Begin


		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Quantity
		where Id=@Id;

		Set @TP = @TP+@Quantity*@UnitTradePrice

		EXECUTE [dbo].[SP_Add_ReduceHistory] 
   @HistoryId
  ,@ItemId
  ,@Quantity
  ,@Id
  ,@Creator



	End
	Else
	Begin
	-- Update this Receive By all of the remaining Quantity(@Stock) in this receive

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Stock
		where Id=@Id;

		
		Set @TP = @TP+@Stock*@UnitTradePrice

			EXECUTE [dbo].[SP_Add_ReduceHistory] 
   @HistoryId
  ,@ItemId
  ,@Quantity
  ,@Id
  ,@Creator


	End


	
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;

	--Search For next batch for newxt sale when current batch stock is zero after this sale
	if(@Quantity = @Stock And @CurrentTempID <= @MaxTempID)
	Begin
	SELECT TOP 1 
    @Id = Id
    FROM @Receive
    WHERE RowId = @CurrentTempID
	End

	--Reset @Quantity and when @Quantity is not greater than 0 then loop exit. 
	Set @Quantity =  @Quantity - @Stock;
END


EXECUTE [dbo].[SP_ItemStockChangeHistoryByReduce] 
	@Id , 
	@ItemId, 
	@TotalQuantity,  
	@TP,  
	@MRP,  
	@Creator


UPDATE itm
   SET [TotalStock] =[Quantity]
      ,[TotalTradePrice] = rcv.TP
      ,[TotalSalePrice] = [Quantity]*stng.UnitSalePrice
      ,[TotalPurchaseDiscount] = rcv.[Discount]
  FROM [dbo].[Item] itm
  inner join [dbo].[ItemSetting] stng on itm.Id = stng.Id
  inner join (
SELECT rcv.[ItemId]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitTradePrice]) [TP]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [Quantity]
      ,Sum((rcv.[UnitQuentity] - rcv.[UnitQuentitySold])*rcv.[UnitDiscount]) [Discount]
  FROM [dbo].[ItemReceive] rcv
  where rcv.[UnitQuentity] > rcv.[UnitQuentitySold] And ItemId = @ItemId
  group by rcv.[ItemId]) rcv on itm.Id = rcv.ItemId

if(@Quantity>0)
Begin
SET @ErrorCode = -4
    ROLLBACK TRAN

END
ELSE
BEGIN
    COMMIT TRAN
    SET @ErrorCode = 1;
END
END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    Set @Id = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = NULL
  END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ReturnCustomerDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_ReturnCustomerDue] 
	@InfoId AS [uniqueidentifier], 
	@CustomerId AS [uniqueidentifier], 
	@AdmissionId AS [uniqueidentifier], 
	@returnAmount AS [float], 
	@CreatedBy AS [uniqueidentifier], 
	@Relation As [nvarchar](max) NULL,
	@ReturnMRP  As [float],
	@ReturnDiscount  As [float],
	@ReturnTP  As [float],
	@DueReturn As [float],
	@CashReturn  As [float],
	@ErrorCode As [Int] Out

AS
BEGIN

	--@Amount As [float], 

DECLARE @CustomerDueId AS [uniqueidentifier],
		@TotalAmount  As [float] = 0,
		@PaidAmount  As [float] = 0,
		@DueAmount  As [float] = 0,
		@DiscountAmount  As [float] = 0,
		@TReturnAmount  As [float] = 0,
		@AdjustAmount  As [float] = 0,
		@CancelAmount  As [float] = 0;

		

SELECT @CustomerDueId = [Id]
      ,@TotalAmount = [TotalAmount]
      ,@DiscountAmount = [TotalDiscount]
      ,@TReturnAmount = [ReturnAmount]
      ,@PaidAmount = [PaidAmount]
      ,@DueAmount = [DueAmount]
      ,@AdjustAmount = [AdjustAmount]
      ,@CancelAmount = [CancelAmount]
  FROM [dbo].[CustomerDue]
  Where CustomerId = @CustomerId


  if @CustomerDueId is Null Or @CustomerId = '00000000-0000-0000-0000-000000000000'
  Begin
   if @DueReturn>0
   BEGIN
   Set @ErrorCode = -11;
   END
  return;
  END


  if @DueReturn - @DueAmount>0.0001
  BEGIN
   Set @ErrorCode = -12;
   return;
  END
  ELSE IF  abs(@DueReturn + @CashReturn - @returnAmount)>0.0001
  BEGIN
   Set @ErrorCode = -13;
   return;
  END

  
UPDATE [dbo].[CustomerDue]
   SET [Discount] = Case when [TotalAmount] - (@ReturnMRP ) > 0 then 100*([TotalDiscount] - @ReturnDiscount)/([TotalAmount] - (@ReturnMRP)) else -99999 end
      ,[Profit] = Case when ([TotalTP] - @ReturnTP) > 0 then 100*([TotalProfit] + (@ReturnMRP - @ReturnTP))/([TotalTP] - @ReturnTP) else 99999 end
	  ,[PaidAmount] = [PaidAmount] - @CashReturn
      ,[DueAmount] = [DueAmount] - @DueReturn
	  ,[ReturnAmount] = [ReturnAmount] + (@ReturnMRP)
	  ,[ReturnDiscount] = [ReturnDiscount] + @ReturnDiscount
	  ,[TotalDiscount] = [TotalDiscount] - @ReturnDiscount
	  ,[TotalAmount] = [TotalAmount] - (@ReturnMRP)
	  ,[TotalTP] = [TotalTP] - @ReturnTP
	  ,[TotalProfit] = [TotalProfit] + (@ReturnMRP - @ReturnTP)
 WHERE [Id] = @CustomerDueId


INSERT INTO [dbo].[CustomerDueHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CustomerId]
           ,[CustomerDueId]
           ,[TotalAmount]
           ,[Discount]
           ,[ReturnAmount]
           ,[PaidAmount]
           ,[DueAmount]
           ,[AdjustAmount]
           ,[CancelAmount]
           ,[ChangeAmount]
           ,[Relation]
           ,[RelativeId]
           ,[Date]
           ,[Remarks]
           ,[ActivityId]
		   ,AdmissionId)
     VALUES
           (NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,@CustomerDueId
           ,@TotalAmount - (@ReturnMRP)
           ,@DiscountAmount - @ReturnDiscount
           ,@TReturnAmount + (@ReturnMRP)
           ,@PaidAmount - @CashReturn
           ,@DueAmount - @DueReturn
           ,0
           ,0
           ,-@DueReturn
           ,@Relation
           ,@InfoId
           ,GetDate()
           ,''
           ,'00000000-0000-0000-0000-000000000000'
		   ,@AdmissionId)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[SP_SaveStock] 

AS
BEGIN
  SET NOCOUNT ON;
    BEGIN TRY
	BEGIN TRANSACTION;
	
Declare @To DateTime= GetDate();
Declare @From DateTime= DATEADD(day, -1, @To);

select top 1 @From = [To] From [dbo].[DailyStockChanged] dlstkcngd order by [To] desc;


INSERT INTO [dbo].[DailyStockChanged]  WITH (TABLOCKX)
           ([Id]
           ,[ItemId]
           ,[ChangedCount]
           ,[BatchCount]
           ,[ProductStock]
           ,[BatchStock]
           ,[StockChanged]
           ,[TP]
           ,[TPChanged]
           ,[MRP]
           ,[MRPChanged]
           ,[PurchaseDiscount]
           ,[CreatedAt]
           ,[From]
           ,[To])

Select NewId()
      ,hstr.[ItemId]
      ,[ChangedCount]
      ,Count(*) [BatchCount]
	  ,itm.TotalStock
      ,Sum(rcv.[UnitQuentity] - rcv.[UnitQuentitySold]) [BatchStock]
	  ,[StockChanged]
      ,Sum(rcv.[UnitTradePrice]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [TP]
	  ,[TPChanged]
      ,Sum(itm.[UnitSalePrice]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [MRP]
	  ,[MRPChanged]
      ,Sum(rcv.[UnitDiscount]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [PurchaseDiscount] 
	  ,GetDate()
	  ,@From
	  ,@To
	  From (

SELECT [ItemId]
      ,Count(*) [ChangedCount]
      ,Sum([StockChanged]) [StockChanged]
      ,Sum([TotalTradePrice]) [TPChanged]
      ,Sum([TotalSalePrice]) [MRPChanged]
  FROM [dbo].[ItemStockChangeHistory] hstr
  Where CreatedAt >= @From And CreatedAt < @To
  Group by [ItemId]
) hstr
inner join [dbo].[ItemReceive] rcv on hstr.ItemId = rcv.ItemId
inner join [dbo].[Item] itm on hstr.ItemId = itm.Id
group by hstr.[ItemId], itm.[UnitSalePrice], itm.TotalStock, [ChangedCount], [StockChanged], [TPChanged], [MRPChanged]
 

 
-- Get Date of from DateTime.
Declare @Date Date= CAST(GetDate() AS DATE);
-- Check if DailyStockSummary Exist. If not then insert.
if not exists(SELECT [Id] FROM [dbo].[DailyStockSummary] where [CreatedAt]>=@Date)
	begin
 

INSERT INTO [dbo].[DailyStockSummary]
           ([Id]
           ,[CounterId]
           ,[Quantity]
           ,[TP]
           ,[MRP]
           ,[CreatedAt])
     Select NewId()
           ,Id
           ,[UnitQuentityByCounter]
           ,[TotalTPByCounter]
           ,[TotalSalePriceByCounter]
           ,GetDate()
		   from (
SELECT cntr.Id, cntr.[Name][CounterName]
, isnull(Sum(itmrcv.[UnitTradePrice] * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)[TotalTPByCounter]
, isnull(Sum(itmrcv.UnitQuentity - itmrcv.UnitQuentitySold), 0)[UnitQuentityByCounter]
, isnull(Count(itm.Id), 0)[TotalItem]
, isnull(Sum(itm.UnitSalePrice * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)[TotalSalePriceByCounter]
FROM[dbo].[Item] itm
inner join[dbo].[ProductCounter] cntr on itm.[CounterId] = cntr.Id
left join[dbo].[ItemReceive] itmrcv on itm.Id = itmrcv.ItemId and itmrcv.UnitQuentity > itmrcv.UnitQuentitySold
where itm.IsDeleted=0 
group by cntr.Id, cntr.[Name]) data 

End --End Of [DailyStockSummary]


-- Get First Date of month.
Set @Date = DATEADD(day, -DATEPART(day, @Date)+1, @Date);
-- Check if Monthly Stock Exist. If not then insert.
if not exists(SELECT [Id] FROM [dbo].[MonthlyStock] where [CreatedAt]>=@Date)
	begin

	
INSERT INTO [dbo].[MonthlyStock] WITH (TABLOCKX)
           ([Id]
           ,[ItemId]
           ,[ProductStock]
           ,[BatchStock]
           ,[TP]
           ,[MRP]
           ,[PurchaseDiscount]
           ,[CreatedAt])

Select NewId()
      ,itm.[Id]
	  ,itm.TotalStock
      ,IsNull([BatchStock],0) [BatchStock]
      ,IsNull([TP],0) [TP]
      ,IsNull([MRP],0) [MRP]
      ,IsNull(rcv.[PurchaseDiscount],0) [PurchaseDiscount] 
	  ,GetDate()
	  From [dbo].[Item] itm 
	  left join (
	  
SELECT rcv.[ItemId]
      ,Sum(rcv.[UnitQuentity] - rcv.[UnitQuentitySold]) [BatchStock]
      ,Sum(rcv.[UnitTradePrice]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [TP]
      ,Sum(itm.[UnitSalePrice]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [MRP]
      ,Sum(rcv.[UnitDiscount]*(rcv.[UnitQuentity] - rcv.[UnitQuentitySold])) [PurchaseDiscount] 
  FROM [dbo].[ItemReceive] rcv
inner join [dbo].[Item] itm on rcv.ItemId = itm.Id
where rcv.[UnitQuentity] > rcv.[UnitQuentitySold]
group by rcv.[ItemId]

	  ) rcv on itm.Id = rcv.ItemId

	end

	COMMIT;
  END TRY
  BEGIN CATCH
    DECLARE @Id uniqueidentifier = NEWID(), @Remarks nvarchar(max) = 'From Stock Saved';
    EXECUTE [dbo].[SetError] @Id, @Remarks
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SaveStockFromWeb]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SP_SaveStockFromWeb] @name nvarchar(1000),
@creator [uniqueidentifier],
@activityId [uniqueidentifier],
@branchId [uniqueidentifier]
AS
BEGIN

Declare @summaryId [uniqueidentifier] = NewId();

INSERT INTO [dbo].[SaveStockSummary]
           ([Id]
           ,[Name]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[ItemCount]
           ,[Quantity]
           ,[TP]
           ,[MRP]
           ,[BatchMRP]
           ,[Discount]
           ,[ActivityId])
     Select @summaryId
           ,@name
           ,GetDate()
           ,@creator
           ,GetDate()
           ,@creator
           ,0
           ,null
           ,@branchId
		   ,Count(itm.Id)
		   ,isnull(Sum(itmrcv.UnitQuentity - itmrcv.UnitQuentitySold), 0)
           ,isnull(Sum(itmrcv.[UnitTradePrice] * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itm.UnitSalePrice * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itmrcv.UnitSalePrice * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itmrcv.UnitDiscount * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,@activityId
FROM[dbo].[Item] itm
left join[dbo].[ItemReceive] itmrcv on itm.Id = itmrcv.ItemId and itmrcv.UnitQuentity > itmrcv.UnitQuentitySold



INSERT INTO [dbo].[SavedStock]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[ItemId]
           ,[Quantity]
           ,[TP]
           ,[MRP]
           ,[BatchMRP]
           ,[Discount]
           ,[ActivityId]
		   ,[SummaryId])
     Select NewId()
           ,GetDate()
           ,@creator
           ,GetDate()
           ,@creator
           ,0
           ,null
           ,@branchId
           ,itm.Id
           ,isnull(Sum(itmrcv.UnitQuentity - itmrcv.UnitQuentitySold), 0)
           ,isnull(Sum(itmrcv.[UnitTradePrice] * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itm.UnitSalePrice * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itmrcv.UnitSalePrice * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,isnull(Sum(itmrcv.UnitDiscount * (itmrcv.UnitQuentity - itmrcv.UnitQuentitySold)), 0)
           ,@activityId
		   ,@summaryId
FROM[dbo].[Item] itm
left join[dbo].[ItemReceive] itmrcv on itm.Id = itmrcv.ItemId and itmrcv.UnitQuentity > itmrcv.UnitQuentitySold
Group by itm.Id

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetInvoiceDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetInvoiceDue] 
	@RelatedId AS [uniqueidentifier], 
	@SaleInfoId AS [uniqueidentifier], 
	@CustomerId AS [uniqueidentifier], 
	@UserId AS [uniqueidentifier], 
	@CashReturn As [float] Out,
	@DueReturn As [float] Out, 
	@ErrorCode As [Int] Out
AS
BEGIN
DECLARE @Id [uniqueidentifier],@InfoId [uniqueidentifier], @DueAfter [float] = 0, @DueReturnForword [float] =0, @Paid [float],@PaidAfter [float] =0, @NetAmount [float],@PaidAmount [float], @PrevDue [float];
  Set @ErrorCode = 1;
  SELECT @Id = pmnt.Id,@InfoId = info.Id, @PrevDue = pmnt.Due, @Paid = pmnt.Paid, @NetAmount = pmnt.PayableAmount 
  FROM [dbo].[ItemSalePayment] pmnt
  inner join [dbo].[ItemSaleInfo] info on pmnt.ItemSaleInfoId = info.Id
  Where info.Id = @SaleInfoId

  if(@NetAmount is null)
  Begin
    if(0 < @CashReturn)
	  Begin
	  Set @ErrorCode = -16;
	  End
  Return ;
  End
  --ELSE
  --BEGIN
  --Set @CashReturn = 0;
  --END


  
  if(@Paid < @CashReturn)
  Begin
  Set @ErrorCode = -15;
  Return ;
  End
  ELSE 
  BEGIN
  Set @PaidAfter = @Paid - @CashReturn;
  END


   if(@PrevDue < @DueReturn)
	Begin
	Set @DueReturnForword = @DueReturn - @PrevDue
	Set @DueAfter = 0;
	End
	Else
	Begin
	Set @DueAfter = @PrevDue - @DueReturn;
	  if(@DueAfter < 0.01)-- Small amount of due close to Zoro
		Begin
		  Set @DueAfter = 0;
		End
	END

			
INSERT INTO [dbo].[CustomerPaymentToInvoice]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[PaymentId]
           ,[CustomerId]
           ,[SaleInfoId]
           ,[NetAmount]
           ,[DueBefore]
           ,[PaidAmount]
           ,[DueAfter]
		   ,[Relation]
		   ,[RelativeId]
		   ,[CashReturn]
		   ,[DueReturn]
		   ,[ExtraDiscount]
		   ,[PaidAfter]
		   ,[Return]
		   ,[Remarks]
		   ,[ActivityId])
     VALUES
           (NewId()
           ,GetDate()
           ,@UserId
           ,GetDate()
           ,@UserId
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,IsNull(@InfoId, '00000000-0000-0000-0000-000000000001')-- From Web with no invoice but Customer
           ,@NetAmount
           ,IsNull(@PrevDue,0)
           ,0
           ,@DueAfter
		   ,'CustomerReturn'
		   ,@RelatedId
		   ,@CashReturn
		   ,@DueReturn - @DueReturnForword --Total due will not be returned from this invoice
		   ,0
		   ,@PaidAfter
		   ,@CashReturn + @DueReturn -- Total Return Amount for this invoice. Return Amount can't be forworded to another invoice but DueReturn can be forworded.
		   ,''
           ,'00000000-0000-0000-0000-000000000000');

UPDATE [dbo].[ItemSalePayment]
   SET [Due] = @DueAfter
      ,[Paid] = @PaidAfter
      ,[Return] = [Return] + @CashReturn + @DueReturn
 WHERE Id= @Id
 Set @DueReturn = @DueReturnForword;



 END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetInvoiceListDue]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetInvoiceListDue] 
	@RelatedId AS [uniqueidentifier], 
	@SaleInfoId AS [uniqueidentifier], 
	@CustomerId AS [uniqueidentifier], 
	@CashReturn As [float],
	@DueReturn As [float], 
	@UserId AS [uniqueidentifier], 
	@ErrorCode As [Int] Out
AS
BEGIN

DECLARE @List AS [dbo].[AmountListType];
  Set @ErrorCode = 1;

  	if not exists(Select info.Id FROM [dbo].[ItemSaleInfo] info where info.Id = @SaleInfoId)
	begin
		return
	end

  execute [dbo].[SP_SetInvoiceDue] 
	@RelatedId , 
	@SaleInfoId, 
	@CustomerId, 
	@UserId, 
	@CashReturn OUTPUT,
	@DueReturn OUTPUT, 
	@ErrorCode OUTPUT;




	if(@DueReturn>0 And @ErrorCode >= 0)
	Begin

  insert INTO @List
  SELECT pmnt.Id,info.Id, pmnt.Due, pmnt.Paid, pmnt.PayableAmount, ROW_NUMBER() OVER(ORDER BY info.[CreatedAt] ASC) AS RowId 
  FROM [dbo].[ItemSalePayment] pmnt
  inner join [dbo].[ItemSaleInfo] info on pmnt.ItemSaleInfoId = info.Id
  Where info.CustomerId = @CustomerId
  Order by info.[CreatedAt] Asc; -- Order by Get Oldest Entry First. 
  --[InfoId]
--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier],@InfoId [uniqueidentifier], @Due [float] = 0, @DueReturnForword [float] = 0, @DueAfter [float] = 0, @Paid [float], @NetAmount [float],@PaidAmount [float], @PrevDue [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @List
SELECT @CurrentTempID = MIN(RowId) from @List
 
WHILE @CurrentTempID <= @MaxTempID And @DueReturn > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@InfoId = InfoId
	,@PrevDue=[Due]
	,@Paid = [Paid]
	,@NetAmount=NetAmount
    FROM @List
    WHERE RowId = @CurrentTempID


   if(@PrevDue < @DueReturn)
	Begin
		Set @DueReturnForword = @DueReturn - @PrevDue
		Set @DueAfter = 0;
	End
	Else
	Begin
		Set @DueAfter = @PrevDue - @DueReturn;
		if(@DueAfter < 0.01)-- Small amount of due close to Zoro
		Begin
			Set @DueAfter = 0;
		End
	END

			
INSERT INTO [dbo].[CustomerPaymentToInvoice]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[PaymentId]
           ,[CustomerId]
           ,[SaleInfoId]
           ,[NetAmount]
           ,[DueBefore]
           ,[PaidAmount]
           ,[DueAfter]
		   ,[Relation]
		   ,[RelativeId]
		   ,[CashReturn]
		   ,[DueReturn]
		   ,[ExtraDiscount]
		   ,[PaidAfter]
		   ,[Return]
		   ,[Remarks]
		   ,[ActivityId])
     VALUES
           (NewId()
           ,GetDate()
           ,@UserId
           ,GetDate()
           ,@UserId
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,IsNull(@InfoId, '00000000-0000-0000-0000-000000000001')-- From Web with no invoice but Customer
           ,@NetAmount
           ,IsNull(@PrevDue,0)
           ,0
           ,@DueAfter
		   ,'DueReturn'
		   ,@RelatedId
		   ,0
		   ,@DueReturn - @DueReturnForword --Total due will not be returned from this invoice
		   ,0
		   ,@Paid
		   ,0 -- Total Return Amount for this invoice. Return Amount can't be forworded to another invoice but DueReturn can be forworded.
		   ,''
           ,'00000000-0000-0000-0000-000000000000');

UPDATE [dbo].[ItemSalePayment]
   SET [Due] = @DueAfter
 WHERE Id= @Id


	
		   Set @DueReturn = @DueReturnForword;

		   if(@DueReturn < 0.01)
			Begin
			  Set @DueReturn = 0;
			End
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;
END

END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetMRPChangeHistory]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetMRPChangeHistory] 
	@List AS dbo.ItemReceiveType READONLY, 
	@InfoId As [uniqueidentifier],
	@CreatedBy As [uniqueidentifier]
AS
BEGIN
DECLARE @MRPChangedList AS [dbo].[MRPChangedType];
  -- Get All Active ItemReceive By @ItemId 
  insert INTO @MRPChangedList
  SELECT [ItemId], itm.[UnitSalePrice], l.[UnitSalePrice], ROW_NUMBER() OVER(ORDER BY itm.Id ASC) AS RowId 
  FROM @List l INNER JOIN [dbo].[Item] itm ON l.[ItemId] = itm.Id
  Where itm.[UnitSalePrice] <> l.[UnitSalePrice]

--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @HistoryId [uniqueidentifier], @MRPBefore [float], @MRPAfter [float],@MRPChanged [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @MRPChangedList
SELECT @CurrentTempID = MIN(RowId) from @MRPChangedList
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
    -- Get one record
    SELECT TOP 1 
     @Id = Id
	,@MRPBefore=[MRPBefore]
	,@MRPAfter=[MRPAfter]
    FROM @MRPChangedList
    WHERE RowId = @CurrentTempID

	Set @HistoryId=NewId();

	EXECUTE [dbo].[SP_CreateItemHistory] 
   @Id
  ,@HistoryId
  ,@InfoId
  ,@CreatedBy;


  Set @MRPChanged = 0;
EXECUTE [dbo].[SP_CreateMRPChangeHistory] 
   @Id
  ,@MRPBefore
  ,@MRPAfter
  ,@HistoryId
  ,@CreatedBy
  ,@MRPChanged OUTPUT

  -- @MRPChanged is null when No Stock
  if @MRPChanged is not null And @MRPChanged> 0
  Begin
   INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
		   ,[TotalTradePrice]
		   ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,@Id
           ,@HistoryId
           ,12
           ,0
           ,TotalStock
           ,GetDate()
           ,@CreatedBy
		   ,0
		   ,IsNull(@MRPChanged,0)
		   ,0
		   from [dbo].[Item] Where Id=@Id

		   End

	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;
END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetReceive]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/
CREATE PROCEDURE [dbo].[SP_SetReceive] 
@List AS [dbo].[ItemSaleType] READONLY, 
@ItemSaleInfoId AS [uniqueidentifier], 
@Creator AS [uniqueidentifier],
@PayableTP As [float] Out,
@PurchaseDiscount As [float] Out,
@ErrorCode As [Int] Out
AS
BEGIN

DECLARE @Item AS [dbo].[ItemType];

  insert INTO @Item
  SELECT ItemId, Id, [UnitQuentity], [UnitSalePrice], ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId FROM @List itm
	
--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier],@RelationId [uniqueidentifier], @UnitSalePrice [float], @Stock [float], @ItemReceiveId AS [uniqueidentifier];
 
DECLARE @RC int
DECLARE @TotalTP float
DECLARE @TotalDiscount float

set @PayableTP =0;
set @PurchaseDiscount =0;

--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = Id
	,@RelationId = RelationId
	,@UnitSalePrice = UnitSalePrice
	,@Stock = Stock
    FROM @Item
    WHERE RowId = @CurrentTempID
 
 -- Update [Item]

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[SP_UpdateReceive] 
   @ItemId
  ,@RelationId
  ,@Stock
  ,@UnitSalePrice
  ,@ItemReceiveId OUTPUT
  ,@TotalTP OUTPUT
  ,@TotalDiscount OUTPUT
  ,@ErrorCode OUTPUT

  IF(@ErrorCode<0)
  BEGIN
	return;
  END
  ELSE
  BEGIN
	
	
 
 Set @PayableTP =@PayableTP+@TotalTP;
 Set @PurchaseDiscount =@PurchaseDiscount+@TotalDiscount;
	-- Insert ItemSale

	
      INSERT INTO [dbo].[ItemSale]
        SELECT [Id]
      ,[ItemId]
      ,[ItemSaleInfoId]
      ,[ItemReceiveId]
      ,[SalesUnitTypeId]
      ,[UnitQuentity]
      ,[UnitSalePrice]
      ,@TotalTP/[UnitQuentity]
      ,[Discount]
      ,[TotalDiscount]
      ,[VAT]
      ,[TotalVAT]
      ,[Description]
      ,GetDate()
      ,[TotalPayableSalePrice]
      ,@TotalTP
      ,[MGFDate]
      ,[EXPDate]
      ,[Type]
      ,[VatType]
      ,[IsDelivered]
      ,[PurchasePrice]
      ,[PurchaseVAT]
      ,[PurchaseDiscount]
      ,[BranchId]
	  ,[Position] FROM @List where Id = @RelationId;
	
      --Update Items
      UPDATE i
      SET ItemReceiveId=IsNull(@ItemReceiveId,'00000000-0000-0000-0000-000000000000')
      FROM [dbo].[Item] i Where Id = @ItemId;

-- Set History
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
     select
           NewId()
           ,@ItemId
           ,@ItemSaleInfoId
           ,1
           ,-@Stock
           ,TotalStock - @Stock 
           ,GetDate()
           ,@Creator
           ,-@TotalTP
           ,-@Stock*@UnitSalePrice --StockOut is always without saleDiscount 
           ,-@TotalDiscount
		   from [dbo].[Item] itm where Id = @ItemId
  END
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetReceiveForReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetReceiveForReturn] 
	@List AS [dbo].[ProductReturnItemType] READONLY,
	@ErrorCode int out

AS
BEGIN

DECLARE @DataList AS [dbo].[ListType];
DECLARE @Item AS [dbo].[ReceiveForReturnType];


  insert INTO @DataList
  SELECT itm.Id,itm.UnitQuentity, ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId 
  FROM @List itm
  


--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier];


DECLARE @SuplierId [uniqueidentifier],@MGFDate [datetime],@EXPDate [datetime],@BatchName [nvarchar](max), @Quantity [float], @TotalQuantity [float], @ReturnQuantity [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @DataList
SELECT @CurrentTempID = MIN(RowId) from @DataList
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@TotalQuantity = Quantity
    FROM @DataList
    WHERE RowId = @CurrentTempID

	
--[Id] [uniqueidentifier] NOT NULL,
--	[SuplierId] [uniqueidentifier] NOT NULL,
--	[MGFDate] [datetime] NOT NULL,
--	[EXPDate] [datetime] NOT NULL,
--	[BatchName] [nvarchar](max) NULL,
--[Quantity]
--	[RowId] [int] NOT NULL

DELETE FROM @Item

  insert INTO @Item
  SELECT itm.Id, IsNull(rcv.SuplierId,'00000000-0000-0000-0000-000000000000'),IsNull(rcv.MGFDate,'1900-01-01 00:00'),IsNull(rcv.EXPDate, '2021-01-01 00:00'),rcv.BatchName,IsNull(btch.[UnitQuentity],@TotalQuantity), ROW_NUMBER() OVER(ORDER BY itm.Id ASC) AS RowId 
  FROM @List itm
  left join [dbo].[ItemSaleBatch] btch on itm.[ItemSaleId] = btch.[ItemSaleId]
  left join [dbo].[ItemReceive] rcv on btch.ItemReceiveId = rcv.Id
  where itm.Id=@Id
  order by btch.[UnitQuentity] desc
	
--sample variables to hold each row's content
 
--helper variables used for looping purpose
DECLARE @MaxID int;
DECLARE @CurrentID int;
 
SELECT @MaxID = MAX(RowId) from @Item
SELECT @CurrentID = MIN(RowId) from @Item
 
WHILE @CurrentID <= @MaxID And @TotalQuantity > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @SuplierId = SuplierId
	,@MGFDate=MGFDate
	,@EXPDate=EXPDate
	,@BatchName=BatchName
	,@Quantity=IsNull(Quantity,@TotalQuantity)
    FROM @Item
    WHERE RowId = @CurrentID

	--If Sold Quantity Is less than the receive
	if(@TotalQuantity <= @Quantity)
	Begin
	  Set @ReturnQuantity = @TotalQuantity;
	End
	Else
	Begin
	Set @ReturnQuantity = @Quantity;

	End

	
INSERT INTO [dbo].[ItemReceive]
           ([Id]
           ,[ItemId]
           ,[SuplierId]
           ,[PurchaseInfoId]
           ,[SalesUnitTypeId]
           ,[PurchaseUnitTypeId]
           ,[UnitConversion]
           ,[UnitQuentity]
           ,[UnitQuentitySold]
           ,[UnitTradePrice]
           ,[TotalTradePrice]
           ,[UnitSalePrice]
           ,[TotalSoldPrice]
           ,[VAT]
           ,[TotalVAT]
           ,[Discount]
           ,[TotalDiscount]
           ,[Position]
           ,[DefaultVat]
           ,[MGFDate]
           ,[EXPDate]
           ,[BatchName]
           ,[ActivateAt]
           ,[Type]
           ,[DefaultDiscount],
		   [UnitPurchasePrice]
      ,[CreatedAt]
      ,[ChangeAt]
		   ,[BranchId])
     select newId()
           ,itmstng.Id
           ,@SuplierId
           ,l.[ProductReturnId]
           ,itmstng.SalesUnitTypeId
           ,itmstng.PurchaseUnitTypeId
           ,itmstng.UnitConversion
           ,@ReturnQuantity
           ,0
           ,itmstng.[UnitTradePrice]
           ,itmstng.[UnitTradePrice]*l.UnitQuentity
           ,itmstng.UnitSalePrice
           ,0
           ,0
           ,0
           ,0
           ,0
           ,0
           ,0
           ,IsNull(@MGFDate,'1900-01-01 00:00')
           ,IsNull(@EXPDate, '2021-01-01 00:00')
           ,@BatchName
           ,GetDate()
           ,1
           ,0
		   ,itmstng.[UnitTradePrice]
		   ,GetDate()
		   ,GetDate()
		   ,l.[BranchId]
		   FROM @List l 
		    inner join [dbo].[ItemSetting] itmstng on l.[ItemId]=itmstng.Id
			where l.Id=@Id


	--Reset @Quantity and when @Quantity is not greater than 0 then loop exit. 
	Set @TotalQuantity =  @TotalQuantity - @ReturnQuantity;
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentID = @CurrentID + 1;
END
  
  
    SELECT @CurrentTempID = @CurrentTempID + 1;

END
if(@TotalQuantity>0)
Begin
SET @ErrorCode = -4
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetReceiveForUnsalableProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetReceiveForUnsalableProduct] 
@List AS [dbo].[UnsalableProductItemType] READONLY, 
@UnsalableProductId AS [uniqueidentifier], 
@Creator AS [uniqueidentifier],
@ErrorMsg nvarchar(100) out
AS
BEGIN

DECLARE @Item AS [dbo].[ItemType];

  insert INTO @Item
  SELECT [ItemId] ,[UnsalableProductId], [Quantiry], [UnitMRP], ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId 
  FROM @List itm
	
--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier], @UnitSalePrice [float], @Stock [float];
 
DECLARE @RC int
DECLARE @TotalTP float
DECLARE @TotalDiscount float


--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = Id
	,@UnitSalePrice = UnitSalePrice
	,@Stock = Stock
    FROM @Item
    WHERE RowId = @CurrentTempID
 
 -- Update [Item]

 

-- TODO: Set parameter values here.

EXECUTE @RC = [dbo].[SP_UpdateReceiveForUnsalableProduct] 
   @ItemId
  ,@Stock
  ,@UnitSalePrice
  ,@TotalTP OUTPUT
  ,@TotalDiscount OUTPUT
  ,@ErrorMsg OUTPUT

  IF(Len(@ErrorMsg)>1)
  BEGIN

	return;
  END
  ELSE
  BEGIN
	
	
      --Update Items
      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] - @Stock)*UnitSalePrice,
	      [TotalTradePrice] = [TotalTradePrice] - @TotalTP,
          [CurrentStock] = [CurrentStock] - @Stock,
		  [TotalStock] = [TotalStock] - @Stock
      FROM [dbo].[Item] i Where Id = @ItemId;

-- Set History
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice])
     select
           NewId()
           ,@ItemId
           ,@UnsalableProductId
           ,11
           ,-@Stock
           ,TotalStock
           ,GetDate()
           ,@Creator
           ,itm.[TotalTradePrice]
           ,itm.[TotalSalePrice]
		   from [dbo].[Item] itm where Id = @ItemId
  END
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetSaleBatch]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetSaleBatch] 
	@ItemId AS [uniqueidentifier], 
	@ItemReceiveId AS [uniqueidentifier], 
	@ItemSaleId AS [uniqueidentifier], 
	@Quantity As [float], 
	@UnitTP As [float], 
	@PurchaseDiscount As [float], 
	@BeforeStock As [float]
AS
BEGIN

INSERT INTO [dbo].[ItemSaleBatch]
           ([Id]
           ,[ItemId]
           ,[ItemReceiveId]
           ,[ItemSaleId]
           ,[UnitQuentity]
		   ,UnitTP
		   ,PurchaseDiscount
           ,[BeforeStock]
           ,[CreatedAt])
     VALUES
           (NewId()
           ,@ItemId
           ,@ItemReceiveId
           ,@ItemSaleId
           ,@Quantity
		   ,@UnitTP
		   ,@PurchaseDiscount
           ,@BeforeStock
           ,GetDate())

END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetSalePayment]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetSalePayment] 
@Info AS [dbo].[ItemSaleInfoType] READONLY,
@PaymentModel AS [dbo].[SalePaymentModelType] READONLY,
@TP As [float],
@AdmissionId As [uniqueidentifier], 
@PrevDue float out
AS
BEGIN

Declare @CustomerId AS [uniqueidentifier], 
	@SaleId AS [uniqueidentifier], 
	@CreatedBy AS [uniqueidentifier], 
	@SoldPrice As [float], 
	@Discount As [float], 
	@Due As [float],
	@Relation As [nvarchar](max) = N'Sale';


  select @CustomerId=inf.[CustomerId],@CreatedBy = CreatedBy, @SoldPrice = inf.SalePrice, @Discount = inf.TotalDiscount, @SaleId = [SaleInfoId], @Due=[Due]  
	  from @PaymentModel mdl 
	inner join @Info inf on mdl.SaleInfoId = inf.Id
Select  @PrevDue = [DueAmount] FROM [dbo].[CustomerDue] cstmrd  Where cstmrd.CustomerId = @CustomerId And @CustomerId <> '00000000-0000-0000-0000-000000000000'

Set @PrevDue = ISNULL(@PrevDue,0);
  
INSERT INTO [dbo].[ItemSalePayment]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[ItemSaleInfoId]
           ,[ComputerId]
           ,[SaleBy]
           ,[SaleAt]
           ,[PayableAmount]
           ,[Discount]
           ,[DiscountP]
           ,[ExtraDiscount]
           ,[BranchId]
           ,[CashAmount]
           ,[ChangedAmount]
		   ,Paid
		   ,[Due]
		   ,[RewardPoint]
		   ,[RewardPointTK]
		   ,[DeliveryCharge]
		   ,[PreviousDue]
		   ,[Vat]
		   ,[TotalVat])
     Select NewId()
           ,GetDate()
           ,inf.[CreatedBy]
           ,GetDate()
           ,inf.[CreatedBy]
           ,0
           ,null
           ,mdl.SaleInfoId
           ,inf.[ComputerId]
           ,inf.[CreatedBy]
           ,GetDate()
           ,mdl.NetSaleAmount
           ,[TotalDiscount]
           ,[Discount] -- %
           ,0
           ,inf.BranchId
           ,mdl.CashAmount
           ,mdl.ChangedAmount
		   ,mdl.[Paid]
		   ,mdl.[Due]
		   ,mdl.[RewardPoint]
		   ,mdl.[RewardPointTK]
		   ,mdl.[DeliveryCharge]
		   ,IsNull(@PrevDue,0)
		   ,mdl.[Vat]
		   ,mdl.[TotalVat]
		   from @PaymentModel mdl 
		   inner join @Info inf on mdl.SaleInfoId = inf.Id

	--where mdl.[Due]>0;
		   
	IF @Due > 0
	BEGIN
      Set @Relation = 'Due'
	END

    EXECUTE [dbo].[SP_AddCustomerDue]  @CustomerId, @AdmissionId, @SaleId, @CreatedBy, @SoldPrice, @Discount, @Due, @TP, @Relation


	  
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetSaleRewardPoint]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetSaleRewardPoint] 
	@Info AS [dbo].[ItemSaleInfoType] READONLY,
	@PaymentModel AS [dbo].[SalePaymentModelType] READONLY
AS
BEGIN

DECLARE @CustomerId AS [uniqueidentifier],
		@SaleId AS [uniqueidentifier], 
		@CreatedBy AS [uniqueidentifier], 
		@RewardPointId AS [uniqueidentifier], 
		@Point  As [float] = 0,
		@Taka  As [float] = 0, 
		@Total  As [float] = 0,
		@Pending  As [float] = 0, 
		@Spent  As [float] = 0,
		@Converted  As [float] = 0;

select @CustomerId=[CustomerId],@CreatedBy = CreatedBy, @SaleId = [Id], @Point=[RewardPoint], @Taka=[RewardPointTK]
	  from @Info

	  IF @CustomerId <> '00000000-0000-0000-0000-000000000000'
	  BEGIN

	  Set @Total=@Point;
	  Set @Pending = @Point;

	  if exists(SELECT [Id] FROM [dbo].[RewardPoint] Where [CustomerId] = @CustomerId)
	begin
		 select @Total=[Total]+@Point,@Pending = [Pending]+@Point, @Spent = [Spent], @Converted=[Converted]
		  FROM [dbo].[RewardPoint] Where [CustomerId] = @CustomerId
	end
	ELSE
	BEGIN
	
INSERT INTO [dbo].[RewardPoint]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[CustomerId]
           ,[Total]
           ,[Pending]
           ,[Spent]
           ,[Converted]
           ,[Remarks])
     VALUES
           (NewId()
           ,GetDate()
           ,@CreatedBy
           ,GetDate()
           ,@CreatedBy
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@CustomerId
           ,@Total
           ,@Pending
           ,0
           ,0
           ,'')
	END




  EXECUTE  [dbo].[SP_AddRewardPointHistory]
	@CustomerId, 
	'Added',
	@SaleId, 
	@Point, 
	@Total, 
	@Pending, 
	@Spent, 
	@Converted,  
	'',
	@CreatedBy;


	Set @Point=0;
	Set @Taka=0;
	Select @Point=[RewardPoint], @Taka=[RewardPointTK]
	from @PaymentModel

	if @Point> 0
	Begin
		Set @Pending = @Pending-@Point;
		Set @Spent = @Spent+@Point;
		Set @Converted = @Converted+@Taka;
		Set @Point=0-@Point;
	  
		EXECUTE  [dbo].[SP_AddRewardPointHistory]
		@CustomerId, 
		'Spent',
		@SaleId, 
		@Point, 
		@Total, 
		@Pending, 
		@Spent, 
		@Converted,  
		'',
		@CreatedBy;
	End


  UPDATE [dbo].[RewardPoint]
   SET [Total] = @Total
      ,[Pending] = @Pending
      ,[Spent] = @Spent
      ,[Converted] = @Converted
  Where [CustomerId] = @CustomerId

	  END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SetStockEmptyByCounter]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_SetStockEmptyByCounter] 
@CounterId uniqueidentifier, 
@Path nvarchar(Max), 
@ActivityId uniqueidentifier, 
@Remarks nvarchar(Max), 
@Creator uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  

  
  BEGIN TRAN


    BEGIN TRY


-- Set History
  INSERT INTO [dbo].[ItemStockChangeHistory]
           ([Id]
           ,[ItemId]
           ,[ReferenceId]
           ,[Type]
           ,[StockChanged]
           ,[StockAfterChanged]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[TotalTradePrice]
           ,[TotalSalePrice]
		   ,[TotalTPDiscount])
Select 
           NewId()
           ,Id
           ,@ActivityId
           ,16
           ,Sum([Stock]) [Stock]
           ,0
           ,GetDate()
           ,@Creator
           ,Sum([TPChanged]) [TPChanged]
           ,Sum([MRPChanged]) [MRPChanged]
           ,Sum([DiscountChanged]) [DiscountChanged]

		   From (

select
           itm.Id
           ,(rcv.UnitQuentitySold - rcv.UnitQuentity) [Stock]
           ,(rcv.UnitQuentitySold - rcv.UnitQuentity)*rcv.UnitTradePrice [TPChanged]
           ,(rcv.UnitQuentitySold - rcv.UnitQuentity)*itm.UnitSalePrice [MRPChanged]
           ,(rcv.UnitQuentitySold - rcv.UnitQuentity)*rcv.UnitTradePrice*rcv.TotalDiscount/rcv.UnitQuentity [DiscountChanged]
		   from [dbo].[Item] itm 
		   inner join [dbo].[ItemReceive] rcv on itm.Id = rcv.ItemId

		   where rcv.UnitQuentitySold < rcv.UnitQuentity And CounterId = @CounterId

		   ) dt

		   Group by Id


UPDATE rcv
   SET [UnitQuentitySold] = [UnitQuentity]
	  From [dbo].[ItemReceive] rcv
	inner join [dbo].[Item] itm  on rcv.ItemId = itm.Id 
	where rcv.UnitQuentitySold < rcv.UnitQuentity And CounterId = @CounterId

		   
UPDATE [dbo].[Item]
   SET [CurrentStock] = 0
      ,[TotalStock] = 0
      ,[TotalTradePrice] = 0
      ,[TotalSalePrice] = 0
      ,[TotalPurchaseDiscount] = 0
	where CounterId = @CounterId


	
INSERT INTO [dbo].[ChangeHistory]
           ([Id]
           ,[CreatedAt]
           ,[CreatedBy]
           ,[UpdatedAt]
           ,[UpdatedBy]
           ,[IsDeleted]
           ,[ChangeLog]
           ,[BranchId]
           ,[ActivityId]
           ,[EntityId]
           ,[ChangeFrom]
           ,[ChangeType]
           ,[Amount]
           ,[Before]
           ,[Change]
           ,[Remarks]
           ,[Info]
           ,[Transations])
     Select NewId()
           ,GetDate()
           ,@Creator
           ,GetDate()
           ,@Creator
           ,0
           ,null
           ,'00000000-0000-0000-0000-000000000000'
           ,@ActivityId
           ,@CounterId
           ,[Name]
           ,'Stock Empty'
           ,0
           ,[Name]
           ,''
           ,@Remarks
           ,@Path
           ,''
  FROM [dbo].[ProductCounter]
  where Id = @CounterId


    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;
    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SuplierReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[SP_SuplierReturn] 
@List AS [dbo].[SuplierReturnItemType] READONLY,
@Info AS [dbo].[SuplierReturnType] READONLY,
@Transactions as [dbo].[TransactionType] READONLY,
@BranchId uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

  BEGIN TRAN

    BEGIN TRY
      INSERT INTO [dbo].[SuplierReturnItem]
        SELECT [Id]
      ,[ItemId]
      ,[ItemReceiveId]
      ,[SalesUnitTypeId]
      ,[SuplierReturnId]
      ,[CreatedBy]
      ,[CreatedAt]
      ,[VoucharNo]
      ,[PurchaseQnt]
      ,[ReturnQnt]
      ,[TotalPurchasePrice]
      ,[PurchasePrice]
      ,[ReturnAmount]
      ,[UnitPurchasePrice]
      ,[UnitReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[UnitTradePrice]
      ,[TotalTradePrice]
      ,[UnitPurchaseVAT]
      ,[UnitPurchaseDiscount]
	  ,[BranchId] FROM @List;

      INSERT INTO [dbo].[SuplierReturn]
        SELECT [Id]
      ,[SuplierId]
      ,[PurchasedBy]
      ,[PurchaseInfoId]
      ,[dbo].[NewSuplierReturnVoucherNo] ()
      ,[ItemPurchased]
      ,[ItemReturn]
      ,[TotalPurchasePrice]
      ,[PurchasedPrice]
      ,[ReturnPrice]
      ,[ReturnDiscount]
      ,[Discount]
      ,[TotalReturnDiscount]
      ,[TotalDiscount]
      ,[PurchasePrice]
      ,[PurchaseVAT]
      ,[PurchaseDiscount]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[BranchId]
	   FROM @Info;

	   INSERT INTO [dbo].[Transaction] SELECT [Id]
      ,GETDATE()
      ,[AccountId]
      ,[Debit]
      ,[Credit]
      ,[FiscalYearId]
      ,[TransDate]
      ,[SourceType] --14 For Suplier Return
      ,[SourceId]
	  ,[BranchId] FROM @Transactions;
      --Update Items
      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] - l.[ReturnQnt])*UnitSalePrice,
	      [TotalTradePrice] = i.[TotalTradePrice] - l.[TotalTradePrice],
          [CurrentStock] = [CurrentStock] - l.[ReturnQnt],
		  [TotalStock] = [TotalStock] - l.[ReturnQnt]
      FROM [dbo].[Item] i
      INNER JOIN (select [ItemId], SUM([ReturnQnt]) [ReturnQnt], SUM([TotalTradePrice]) [TotalTradePrice]  
	  from @List 
	  group by [ItemId] ) l
        ON i.Id = l.[ItemId];

      --Update ItemReceive and later we update ItemReceive  whose [CurrentStock] is nagetive or zero
      UPDATE i
      SET [UnitQuentitySold] = [UnitQuentitySold] + l.[ReturnQnt]
      FROM [dbo].[ItemReceive] i
      INNER JOIN @List l
        ON i.[Id] = l.[ItemReceiveId];

		--ItemReceiveId
		EXECUTE [dbo].[SP_UpdateCurrentStockForSuplierReturn]  @List

		--Insert ItemStockChangeHistory
		EXECUTE [dbo].[SP_ItemStockChangeHistoryBySuplierReturn]  @List

    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = NULL
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UnsalableProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [dbo].[SP_UnsalableProduct] 
@Info AS [dbo].[UnsalableProductType] READONLY,
@SalvageValue AS [dbo].[UnsalableProductSalvageValueType] READONLY,
@List AS [dbo].[UnsalableProductItemType] READONLY,
@Transactions as [dbo].[TransactionType] READONLY,
@BranchId uniqueidentifier,
@ErrorCode int out
AS
BEGIN
  SET NOCOUNT ON;

  IF [dbo].[IsValidForUnsalableProduct](@Info, @List) = 0
  BEGIN
    SET @ErrorCode = -5
    RETURN;
  END

  BEGIN TRAN

    BEGIN TRY

	

      INSERT INTO [dbo].[UnsalableProduct]
        SELECT [Id]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[BranchId]
	  ,[dbo].[NewUnsaleVoucherNo]  ()
      ,[SuplierId]
      ,[TotalProduct]
      ,[TotalQuantiry]
      ,[TotalMRP]
      ,[TotalTP]
      ,[TotalDiscount]
      ,[TotalVat]
      ,[PayableTP]
      ,[SalvageValue]
      ,[TransactionDate]
      ,[Type]
      ,[Remarks] FROM @Info;
      INSERT INTO [dbo].[UnsalableProductSalvageValue]
        SELECT [Id]
      ,[CreatedAt]
      ,[CreatedBy]
      ,[UpdatedAt]
      ,[UpdatedBy]
      ,[IsDeleted]
      ,[ChangeLog]
      ,[BranchId]
      ,[SuplierId]
      ,[UnsalableProductId]
      ,[AccountId]
      ,[SalvageValue]
      ,[ReceivedValue]
      ,[TransactionDate]
      ,[Type]
      ,[Remarks]
	   FROM @SalvageValue;
      INSERT INTO [dbo].[UnsalableProductItem]
        SELECT [Id]
      ,[ItemId]
      ,[ItemReceiveId]
      ,[UnsalableProductId]
      ,[CreatedBy]
      ,[CreatedAt]
      ,[Quantiry]
      ,[UnitTP]
      ,[UnitMRP]
      ,[TotalMRP]
      ,[TotalTP]
      ,[TotalDiscount]
      ,[TotalVat]
      ,[PayableTP]
      ,[SalvageValue]
      ,[Type]
      ,[BranchId]
	   FROM @List;
	  INSERT INTO [dbo].[Transaction] 
	  SELECT [Id]
      ,GETDATE()
      ,[AccountId]
      ,[Debit]
      ,[Credit]
      ,[FiscalYearId]
      ,[TransDate]
      ,[SourceType] --14 For Suplier Return
      ,[SourceId]
	  ,[BranchId] FROM @Transactions;

	  
		
	  Declare @Creator uniqueidentifier, @InfoId uniqueidentifier, @SuplierId uniqueidentifier, @slv float;
	  select @InfoId = Id, @Creator=CreatedBy, @SuplierId=SuplierId, @slv = SalvageValue  from @Info;

	  
	  
      --Update Items
      UPDATE i
      SET [TotalSalePrice] = ([TotalStock] - l.[Quantiry])*UnitSalePrice,
	      [TotalTradePrice] = i.[TotalTradePrice] - l.[TotalTradePrice],
          [CurrentStock] = [CurrentStock] - l.[Quantiry],
		  [TotalStock] = [TotalStock] - l.[Quantiry]
      FROM [dbo].[Item] i
      INNER JOIN (select lst.[ItemId], SUM([Quantiry]) [Quantiry], SUM(rcv.[UnitTradePrice]*[Quantiry]) [TotalTradePrice]  
	  from @List lst
	  INNER JOIN [dbo].[ItemReceive] rcv on lst.ItemReceiveId = rcv.Id
	  group by lst.[ItemId] ) l
        ON i.Id = l.[ItemId];

      --Update ItemReceive and later we update ItemReceive  whose [CurrentStock] is nagetive or zero
      UPDATE i
      SET [UnitQuentitySold] = [UnitQuentitySold] + l.[Quantiry]
      FROM [dbo].[ItemReceive] i
      INNER JOIN @List l
        ON i.[Id] = l.[ItemReceiveId];


		--Insert ItemStockChangeHistory
		EXECUTE [dbo].[SP_ItemStockChangeHistoryByUnsalableProduct]  @List
	
	
	  --Insert Suplier Receivable For this Unusable Product
      EXECUTE [dbo].[SP_AddSuplierReceivable]  @SuplierId, @InfoId, @Creator, @slv


	
    COMMIT TRAN
    SET @ErrorCode = 1;
  END TRY
  BEGIN CATCH
    SET @ErrorCode = -6;

    ROLLBACK TRAN
    DECLARE @Id uniqueidentifier = NEWID();
    EXECUTE [dbo].[SetError] @Id, @Remarks = NULL
  END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCurrentStock]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateCurrentStock] @List AS [dbo].[ItemSaleType] READONLY
AS
BEGIN
  Declare @Item table (RowId int, ItemId [uniqueidentifier]);
  -- model to get all receive for the list of item to be changed
  Declare  @ItemReceive table (Stock float, Id [uniqueidentifier], ItemId [uniqueidentifier],
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL)

  insert INTO @Item
  SELECT ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId,Id
FROM [dbo].[Item] where [CurrentStock]<=0 and Id in (select [ItemId]  from @List group by [ItemId])
--getting all receive for the list of item to be changed
insert INTO @ItemReceive
  SELECT  ([UnitQuentity]-[UnitQuentitySold]) [Stock],[Id],[ItemId],
  [PurchaseUnitTypeId],
	[UnitTradePrice],
	[UnitPurchasePrice],
	[VAT],
	[Discount],
	[MGFDate],
	[EXPDate],
	[BatchName]
FROM [dbo].[ItemReceive] where [ItemId] in (select [ItemId]  from @Item group by [ItemId]) and [UnitQuentity]>[UnitQuentitySold]
order by [ActivateAt] 

--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier] ;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = ItemId
    FROM @Item
    WHERE RowId = @CurrentTempID
 
 -- Update [Item]
 UPDATE i
   SET i.[UnitTradePrice] = rcv.[UnitTradePrice]
		  ,i.[UnitPurchasePrice] = rcv.[UnitPurchasePrice]
		  ,i.[PurchaseUnitTypeId] = rcv.[PurchaseUnitTypeId]
		  ,i.[CurrentStock] = rcv.[Stock]
		  ,i.[PurchaseVat] = rcv.[Vat]
		  ,i.[PurchaseDiscount] = rcv.[Discount]
		  ,i.[MGFDate] = rcv.[MGFDate]
		  ,i.[EXPDate] = rcv.[EXPDate]
		  ,i.[BatchName] = rcv.[BatchName]
		  ,i.[ItemReceiveId] =rcv.[Id]
	  FROM [dbo].[Item] i 
	  inner join (select top 1 * from @ItemReceive where ItemId=@ItemId) rcv on i.Id=rcv.ItemId
      where i.Id=@ItemId
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCurrentStockByList]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateCurrentStockByList] @List AS [dbo].[ItemList] READONLY
AS
BEGIN
  Declare @Item table (RowId int, ItemId [uniqueidentifier]);
  -- model to get all receive for the list of item to be changed
  Declare  @ItemReceive table (Stock float, Id [uniqueidentifier], ItemId [uniqueidentifier],
	[PurchaseUnitTypeId] [uniqueidentifier] NOT NULL,
	[UnitTradePrice] [float] NOT NULL,
	[UnitPurchasePrice] [float] NOT NULL,
	[VAT] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[MGFDate] [datetime] NOT NULL,
	[EXPDate] [datetime] NOT NULL,
	[BatchName] [nvarchar](max) NULL)

  insert INTO @Item
  SELECT ROW_NUMBER() OVER(ORDER BY Id ASC) AS RowId,Id
FROM [dbo].[Item] where [CurrentStock]<=0 and Id in (select [Id]  from @List group by [Id])
--getting all receive for the list of item to be changed
insert INTO @ItemReceive
  SELECT  ([UnitQuentity]-[UnitQuentitySold]) [Stock],[Id],[ItemId],
  [PurchaseUnitTypeId],
	[UnitTradePrice],
	[UnitPurchasePrice],
	[VAT],
	[Discount],
	[MGFDate],
	[EXPDate],
	[BatchName]
FROM [dbo].[ItemReceive] where [ItemId] in (select [ItemId]  from @Item group by [ItemId]) and [UnitQuentity]>[UnitQuentitySold]
order by [ActivateAt] 

--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier] ;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = ItemId
    FROM @Item
    WHERE RowId = @CurrentTempID
 
 -- Update [Item]
 UPDATE i
   SET i.[UnitTradePrice] = rcv.[UnitTradePrice]
		  ,i.[UnitPurchasePrice] = rcv.[UnitPurchasePrice]
		  ,i.[PurchaseUnitTypeId] = rcv.[PurchaseUnitTypeId]
		  ,i.[CurrentStock] = rcv.[Stock]
		  ,i.[PurchaseVat] = rcv.[Vat]
		  ,i.[PurchaseDiscount] = rcv.[Discount]
		  ,i.[MGFDate] = rcv.[MGFDate]
		  ,i.[EXPDate] = rcv.[EXPDate]
		  ,i.[BatchName] = rcv.[BatchName]
		  ,i.[ItemReceiveId] =rcv.[Id]
	  FROM [dbo].[Item] i 
	  inner join (select top 1 * from @ItemReceive where ItemId=@ItemId) rcv on i.Id=rcv.ItemId
      where i.Id=@ItemId
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCurrentStockForSuplierReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateCurrentStockForSuplierReturn] @List AS [dbo].[SuplierReturnItemType] READONLY
AS
BEGIN
  Declare @Item table (RowId int, ItemId [uniqueidentifier]);

  insert INTO @Item
SELECT ROW_NUMBER() OVER(ORDER BY l.ItemId ASC) AS RowId, l.ItemId
FROM @List l inner join [dbo].[Item] itm on l.ItemId=itm.Id inner join [dbo].[ItemReceive] rcv on l.ItemReceiveId=rcv.Id
where itm.ItemReceiveId = l.ItemReceiveId and rcv.[UnitQuentity]=rcv.[UnitQuentitySold]

--sample variables to hold each row's content
DECLARE @ItemId [uniqueidentifier],@ItemReceiveId [uniqueidentifier], @qnt float;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = ItemId
    FROM @Item
    WHERE RowId = @CurrentTempID

	
    SELECT TOP 1 
    @ItemReceiveId = Id,@qnt = rcv.[UnitQuentity] - rcv.[UnitQuentitySold]
    FROM [dbo].[ItemReceive] rcv
    WHERE ItemId = @ItemId and rcv.[UnitQuentity]>rcv.[UnitQuentitySold]
	order by [ActivateAt]
 
 -- Update 
    UPDATE itm
      SET ItemReceiveId = ISNULL(@ItemReceiveId,ItemReceiveId),
          CurrentStock = ISNULL(@qnt,0)
      FROM [dbo].[Item] itm
	  where itm.Id=@ItemId
   
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateItemReceiveForSuplierReturn]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateItemReceiveForSuplierReturn] 
@Id [uniqueidentifier],
@ItemId [uniqueidentifier], 
@UnitQuentity [float]
AS
BEGIN
  Declare @Item table (RowId int, Id [uniqueidentifier], [UnitQuentity] [float], [UnitQuentitySold] [float]);

  insert INTO @Item
SELECT ROW_NUMBER() OVER(ORDER BY CreatedAt ASC) AS RowId,Id, [UnitQuentity] - [UnitQuentitySold], [UnitQuentitySold]
FROM [dbo].[ItemReceive] where ItemId = @ItemId and [UnitQuentitySold]<[UnitQuentity] and [Type] <> 3

--sample variables to hold each row's content
DECLARE @ReceiveId [uniqueidentifier],@qnt [float], @currentStock [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Item
SELECT @CurrentTempID = MIN(RowId) from @Item
 
WHILE @CurrentTempID <= @MaxTempID 
BEGIN
 
    -- Get one record
    SELECT TOP 1 
	@ReceiveId = Id,
	@qnt = UnitQuentity,
	@currentStock = [UnitQuentitySold]
    FROM @Item
    WHERE RowId = @CurrentTempID
	
	set @UnitQuentity = @UnitQuentity - @qnt;

	IF @UnitQuentity <= 0
    BEGIN
        set @qnt=@qnt + @UnitQuentity;
		set @CurrentTempID=@MaxTempID+1;
    END


       UPDATE i
      SET [UnitQuentitySold] = [UnitQuentitySold] + @qnt,
          [TotalSoldPrice] = [TotalSoldPrice] + @qnt*[UnitSalePrice]
      FROM [dbo].[ItemReceive] i
	  where i.Id=@ReceiveId

	  set @currentStock=@currentStock+@qnt;

    SELECT @CurrentTempID = @CurrentTempID + 1

END


       UPDATE i
      SET [UnitQuentitySold] = [UnitQuentity]
      FROM [dbo].[ItemReceive] i
	  where i.Id=@Id


if @currentStock>0
BEGIN
	  UPDATE itm
   SET [ItemReceiveId] = @ReceiveId
      ,[CurrentStock] = case when stock is null then 0 else @currentStock end
      ,[TotalStock] = IsNull(Stock,0)
	  ,[TotalTradePrice] = IsNull(rcv.[TotalTradePrice],0)
      ,[TotalSalePrice] = IsNull(rcv.[TotalSalePrice],0)
      ,[TotalPurchaseDiscount] = IsNull(rcv.[TotalPurchaseDiscount],0)
	  from [dbo].[Item] itm
	  inner join (SELECT [ItemId]
      ,Sum([UnitQuentity] - [UnitQuentitySold]) Stock
      ,Sum(([UnitQuentity] - [UnitQuentitySold])*rcv.[UnitTradePrice]) [TotalTradePrice]
      ,Sum(([UnitQuentity] - [UnitQuentitySold])*itmstng.[UnitSalePrice]) [TotalSalePrice]
      ,Sum(([UnitQuentity] - [UnitQuentitySold])*[UnitDiscount]) [TotalPurchaseDiscount]
  FROM [dbo].[ItemReceive] rcv
  left join [dbo].[ItemSetting] itmstng on rcv.ItemId = itmstng.Id
  where ItemId = @ItemId and [UnitQuentity]>[UnitQuentitySold] and [Type]<>3
  group by [ItemId])  rcv on itm.Id=rcv.ItemId

	  where Id=@ItemId

	  END
	  ELSE
	  BEGIN

	  UPDATE [dbo].[Item]
   SET [ItemReceiveId] = @ReceiveId
      ,[CurrentStock] = 0
      ,[TotalStock] = 0
	  ,[TotalTradePrice] = 0
      ,[TotalSalePrice] = 0
      ,[TotalPurchaseDiscount] = 0
	  where Id=@ItemId
	  END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateLostReceive]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateLostReceive] 
	@ItemId AS [uniqueidentifier], 
	@Quantity As [float], 
	@UnitMRP As [float],
	@TotalTP As [float] Out, 
	@TotalDiscount As [float] Out, 
	@ErrorCode As [Int] Out
AS
BEGIN

DECLARE @Receive AS [dbo].[ReceiveType];
  Set @ErrorCode = 1;
  
  -- Get All Active ItemReceive By @ItemId 
  insert INTO @Receive
  SELECT Id, [ItemId], rcv.UnitQuentitySold, [UnitQuentity],
  UnitTradePrice, UnitDiscount, ROW_NUMBER() OVER(ORDER BY rcv.[ActivateAt] desc) AS RowId -- Order by Get Oldest Entry First. 
  FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentitySold>0
  
  Set @TotalTP = 0;
  Set @TotalDiscount = 0;


--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @Stock [float], @Sold [float], @UnitTradePrice [float], @UnitDiscount [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Receive
SELECT @CurrentTempID = MIN(RowId) from @Receive
 
WHILE @CurrentTempID <= @MaxTempID And @Quantity > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@Stock=Stock
	,@Sold=Sold
	,@UnitTradePrice=UnitTradePrice
	,@UnitDiscount=UnitDiscount
    FROM @Receive
    WHERE RowId = @CurrentTempID

	--If Sold Quantity Is less than the receive
	if(@Quantity <= @Stock)
	Begin
		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Stock - @Quantity
		   ,[TotalSoldPrice] = [TotalSoldPrice] - (@Quantity * @UnitMRP)
		where Id=@Id;

	End
	Else
	Begin

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = 0
		   ,[TotalSoldPrice] = [TotalSoldPrice] - (@Stock * @UnitMRP)
		where Id=@Id;

	End
	--Reset @Quantity and when @Quantity is not greater than 0 then loop exit. 
	Set @Quantity =  @Quantity - @Stock;
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;
END
if(@Quantity>0)
Begin
SET @ErrorCode = -4
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateReceive]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateReceive] 
	@ItemId AS [uniqueidentifier], 
	@ItemSaleId AS [uniqueidentifier], 
	@Quantity As [float], 
	@UnitMRP As [float],
	@ItemReceiveId AS [uniqueidentifier] Out,
	@TotalTP As [float] Out, 
	@TotalDiscount As [float] Out, 
	@ErrorCode As [Int] Out
AS
BEGIN

DECLARE @Receive AS [dbo].[ReceiveType];
  Set @ErrorCode = 1;

  -- Get All Active ItemReceive By @ItemId 
  insert INTO @Receive
  SELECT Id, [ItemId], rcv.UnitQuentity - rcv.UnitQuentitySold [Stock], rcv.UnitQuentitySold,
  UnitTradePrice, UnitDiscount, ROW_NUMBER() OVER(ORDER BY rcv.[ActivateAt] ASC) AS RowId 
  FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentity > rcv.UnitQuentitySold
  Order by rcv.[ActivateAt] -- Order by Get Oldest Entry First. 

  Set @TotalTP = 0;
  Set @TotalDiscount = 0;


--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @Stock [float], @Sold [float], @UnitTradePrice [float], @UnitDiscount [float], @PurchaseDiscount [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Receive
SELECT @CurrentTempID = MIN(RowId) from @Receive
 
WHILE @CurrentTempID <= @MaxTempID And @Quantity > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@Stock=Stock
	,@Sold=Sold
	,@UnitTradePrice=UnitTradePrice
	,@UnitDiscount=UnitDiscount
    FROM @Receive
    WHERE RowId = @CurrentTempID

	--If Sold Quantity Is less than the receive
	if(@Quantity <= @Stock)
	Begin
	  Set @TotalTP = @TotalTP + (@Quantity * @UnitTradePrice);
	  Set @PurchaseDiscount = (@Quantity * @UnitDiscount);
	  Set @TotalDiscount = @TotalDiscount + @PurchaseDiscount;

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Quantity
		   ,[TotalSoldPrice] = [TotalSoldPrice] + (@Quantity * @UnitMRP)
		where Id=@Id;

		EXECUTE [dbo].[SP_SetSaleBatch] 
   @ItemId
  ,@Id
  ,@ItemSaleId
  ,@Quantity
  ,@UnitTradePrice
  ,@PurchaseDiscount
  ,@Stock



	End
	Else
	Begin
	-- Update this Receive By all of the remaining Quantity(@Stock) in this receive
	  Set @TotalTP = @TotalTP + (@Stock * @UnitTradePrice);
	  Set @PurchaseDiscount = (@Stock * @UnitDiscount);
	  Set @TotalDiscount = @TotalDiscount + @PurchaseDiscount;

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Stock
		   ,[TotalSoldPrice] = [TotalSoldPrice] + (@Stock * @UnitMRP)
		where Id=@Id;

	EXECUTE [dbo].[SP_SetSaleBatch] 
   @ItemId
  ,@Id
  ,@ItemSaleId
  ,@Stock
  ,@UnitTradePrice
  ,@PurchaseDiscount
  ,@Stock

	End


	
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;

	--Search For next batch for newxt sale when current batch stock is zero after this sale
	if(@Quantity = @Stock And @CurrentTempID <= @MaxTempID)
	Begin
	SELECT TOP 1 
    @Id = Id
    FROM @Receive
    WHERE RowId = @CurrentTempID
	End

	
	Set @ItemReceiveId = @Id
	--Reset @Quantity and when @Quantity is not greater than 0 then loop exit. 
	Set @Quantity =  @Quantity - @Stock;
END
if(@Quantity>0)
Begin
SET @ErrorCode = -4
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateReceiveForUnsalableProduct]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateReceiveForUnsalableProduct] 
	@ItemId AS [uniqueidentifier], 
	@Quantity As [float], 
	@UnitMRP As [float],
	@TotalTP As [float] Out, 
	@TotalDiscount As [float] Out, 
	@ErrorMsg nvarchar(100) out
AS
BEGIN

DECLARE @Receive AS [dbo].[ReceiveType];
  Set @ErrorMsg = '';

  -- Get All Active ItemReceive By @ItemId 
  insert INTO @Receive
  SELECT Id, [ItemId], rcv.UnitQuentity - rcv.UnitQuentitySold [Stock], rcv.UnitQuentitySold,
  UnitTradePrice, UnitDiscount, ROW_NUMBER() OVER(ORDER BY rcv.[ActivateAt] ASC) AS RowId 
  FROM [dbo].[ItemReceive] rcv 
  Where rcv.ItemId = @ItemId And rcv.UnitQuentity > rcv.UnitQuentitySold
  Order by rcv.[ActivateAt] -- Order by Get Oldest Entry First. 

  Set @TotalTP = 0;
  Set @TotalDiscount = 0;


--sample variables to hold each row's content
DECLARE @Id [uniqueidentifier], @Stock [float], @Sold [float], @UnitTradePrice [float], @UnitDiscount [float];
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @Receive
SELECT @CurrentTempID = MIN(RowId) from @Receive
 
WHILE @CurrentTempID <= @MaxTempID And @Quantity > 0
BEGIN
    -- Get one record
    SELECT TOP 1 
    @Id = Id
	,@Stock=Stock
	,@Sold=Sold
	,@UnitTradePrice=UnitTradePrice
	,@UnitDiscount=UnitDiscount
    FROM @Receive
    WHERE RowId = @CurrentTempID

	--If Sold Quantity Is less than the receive
	if(@Quantity <= @Stock)
	Begin
	  Set @TotalTP = @TotalTP + (@Quantity * @UnitTradePrice);
	  Set @TotalDiscount = @TotalDiscount + (@Quantity * @UnitDiscount);

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Quantity
		   ,[TotalSoldPrice] = [TotalSoldPrice] + (@Quantity * @UnitMRP)
		where Id=@Id;

	End
	Else
	Begin
	-- Update this Receive By all of the remaining Quantity(@Stock) in this receive
	  Set @TotalTP = @TotalTP + (@Stock * @UnitTradePrice);
	  Set @TotalDiscount = @TotalDiscount + (@Stock * @UnitDiscount);

		update [dbo].[ItemReceive]
		Set UnitQuentitySold = @Sold + @Stock
		   ,[TotalSoldPrice] = [TotalSoldPrice] + (@Stock * @UnitMRP)
		where Id=@Id;

	End
	--Reset @Quantity and when @Quantity is not greater than 0 then loop exit. 
	Set @Quantity =  @Quantity - @Stock;
	  -- Increase @CurrentTempID for next ittaration
    SELECT @CurrentTempID = @CurrentTempID + 1;
END
if(@Quantity>0)
Begin

SET @ErrorMsg = 'Not Stock Available.'
	
INSERT INTO [dbo].[SQLErrors]
           ([Id]
           ,[ErrorNumber]
           ,[ErrorSeverity]
           ,[ErrorState]
           ,[ErrorProcedure]
           ,[ErrorLine]
           ,[ErrorMessage]
           ,[Remarks]
           ,[CreatedAt]
           ,[BranchId])
     VALUES
           (NewId()
           ,59
           ,11
           ,10
           ,'SP_UpdateReceiveForUnsalableProduct'
           ,0
           ,Cast(@Stock as nvarchar(30))
           ,Cast(@Sold as nvarchar(30))
           ,GetDate()
           ,@Id)
END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateReportForSale]    Script Date: 3/10/2025 11:02:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







/****** Object:  StoredProcedure [dbo].[SP_ItemSale]    Script Date: 28-12-17 20.24.55 ******/

CREATE PROCEDURE [dbo].[SP_UpdateReportForSale] @List AS [dbo].[ItemSaleType] READONLY
AS
BEGIN
  Declare @tempTable table (RowId int, BranchId [uniqueidentifier], ItemId [uniqueidentifier], [TotalPayablePriceDiff] [float],[TotalDiscountDiff] [float],[TotalPayableTradePrice] [float],[UnitQuentity] [float],IsPharmacy [bit]  )

  insert INTO @tempTable
  SELECT
ROW_NUMBER() OVER(ORDER BY ItemId ASC) AS RowId, BranchId, ItemId, [TotalPayableSalePrice] [TotalPayablePriceDiff], [TotalDiscount] [TotalDiscountDiff],[TotalPayableTradePrice],[UnitQuentity],CAST(case when [Type]=0 then 1 else 0 end as bit) IsPharmacy
FROM @List
 
--sample variables to hold each row's content
DECLARE @BranchId [uniqueidentifier],@ItemId [uniqueidentifier], @TotalPayablePriceDiff [float],@TotalDiscountDiff [float],@TotalPayableTradePrice [float],@UnitQuentity [float],@IsPharmacy [bit] ;
 
--helper variables used for looping purpose
DECLARE @MaxTempID int;
DECLARE @CurrentTempID int;
 
SELECT @MaxTempID = MAX(RowId) from @tempTable
SELECT @CurrentTempID = MIN(RowId) from @tempTable
 
WHILE @CurrentTempID <= @MaxTempID
BEGIN
 
    -- Get one record
    SELECT TOP 1 
    @ItemId = ItemId
	,@BranchId = BranchId
    ,@TotalPayablePriceDiff = TotalPayablePriceDiff
	,@TotalDiscountDiff=TotalDiscountDiff
	,@TotalPayableTradePrice=[TotalPayableTradePrice]
	,@UnitQuentity=[UnitQuentity]
	,@IsPharmacy=IsPharmacy

    FROM @tempTable
    WHERE RowId = @CurrentTempID
 
 -- Update [ItemSales] and always ItemSales Exists.
 UPDATE i
   SET [SalePrice] = i.[SalePrice]+@TotalPayablePriceDiff
      ,[Discount] = i.[Discount]+@TotalDiscountDiff
      ,[UpdatedAt] = GetDate()
	  FROM [dbo].[ItemSales] i 
      where i.[ItemId]=@ItemId


	  --Check For [dbo].[DailyItemSales] if it is exist or not

	  IF EXISTS (SELECT Id FROM [dbo].[DailyItemSales] where [ItemId] = @ItemId and cast(GetDate() as date)=[Day])
		BEGIN

		--UpDate both [dbo].[DailyItemSales] and [dbo].[DailySales]  If Exists. Because  [dbo].[DailyItemSales] dose not exist without [dbo].[DailySales]
					UPDATE i
   SET [SalePrice] = i.[SalePrice]+@TotalPayablePriceDiff
      ,[Discount] = i.[Discount]+@TotalDiscountDiff
      ,[UpdatedAt] = GetDate()
 FROM [dbo].[DailySales] i
	  where cast(GetDate() as date)=[Day] and IsPharmacy=@IsPharmacy


	  UPDATE i
   SET [SalePrice] = i.[SalePrice]+@TotalPayablePriceDiff
      ,[Discount] = i.[Discount]+@TotalDiscountDiff
	  ,[TradePrice]=i.[TradePrice]+@TotalPayableTradePrice
      ,[UpdatedAt] = GetDate()
	  from [dbo].[DailyItemSales] i
      where [ItemId] = @ItemId and cast(GetDate() as date)=[Day]



		END
		ELSE
		BEGIN
		   
		   --Else INSERT  [dbo].[DailyItemSales] but Still need to check for [dbo].[DailySales]

		   INSERT INTO [dbo].[DailyItemSales]
           ([Day]
           ,[ItemId]
           ,[ItemCount]
           ,[CategoryId]
           ,[CounterId]
           ,[SuplierId]
           ,[SalePrice]
           ,[TradePrice]
           ,[Discount]
           ,[IsPharmacy]
           ,[UpdatedAt]
		   ,[BranchId])
     select cast(GetDate() as date)
           ,@ItemId
           ,@UnitQuentity
           ,itm.CategoryId
           ,itm.CounterId
           ,itm.SuplierId
           ,@TotalPayablePriceDiff
           ,@TotalPayableTradePrice
           ,@TotalDiscountDiff
           ,@IsPharmacy
           ,GetDate()
		   ,@BranchId
		   from [dbo].[Item] itm where itm.Id=@ItemId


		   -- Need to check with if IsPharmacy or not

			IF EXISTS (SELECT Id FROM [dbo].[DailySales] where cast(GetDate() as date)=[Day] and IsPharmacy=@IsPharmacy)
			BEGIN
				UPDATE i
		   SET [SalePrice] = i.[SalePrice]+@TotalPayablePriceDiff
			  ,[Discount] = i.[Discount]+@TotalDiscountDiff
			  ,[TradePrice]= i.[TradePrice]+@TotalPayableTradePrice
			  ,[UpdatedAt] = GetDate()
		 FROM [dbo].[DailySales] i
			  where cast(GetDate() as date)=[Day] and IsPharmacy=@IsPharmacy


			END

			ELSE
			BEGIN

			   INSERT INTO [dbo].[DailySales]
           ([Day]
           ,[SalePrice]
           ,[TradePrice]
           ,[Discount]
           ,[IsPharmacy]
           ,[UpdatedAt]
		   ,[BranchId])
     VALUES
           (cast(GetDate() as date)
           ,@TotalPayablePriceDiff
           ,@TotalPayableTradePrice
           ,@TotalDiscountDiff
           ,@IsPharmacy
           ,GetDate()
		   ,@BranchId)
			END
		END

 
    SELECT @CurrentTempID = @CurrentTempID + 1
END
END
GO
USE [master]
GO
ALTER DATABASE [Moghbazar] SET  READ_WRITE 
GO
