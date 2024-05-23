IF OBJECT_ID('dbo.NYC_Payroll_Summary') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[NYC_Payroll_Summary];
END

CREATE EXTERNAL TABLE [dbo].[NYC_Payroll_Summary](
[FiscalYear] [int] NULL,
[AgencyName] [varchar](50) NULL,
[TotalPaid] [float] NULL
)
WITH (
LOCATION = '/NYC_Payroll_Summary/',
DATA_SOURCE = [synapsefs259435_synapsesa259435_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO

SELECT TOP 100 * FROM dbo.NYC_Payroll_Summary
GO