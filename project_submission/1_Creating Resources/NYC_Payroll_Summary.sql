-- Use the same file format as used for creating the External Tables during the LOAD step.
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
FORMAT_OPTIONS (
FIELD_TERMINATOR = ',',
FIRST_ROW = 2,
USE_TYPE_DEFAULT = FALSE
))
GO

-- Storage path where the result set will persist
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'synapsefs259855_synapsesa259855_dfs_core_windows_net') 
  CREATE EXTERNAL DATA SOURCE [synapsefs259855_synapsesa259855_dfs_core_windows_net] 
  WITH (
      LOCATION = 'abfss://synapsefs259855@synapsesa259855.dfs.core.windows.net' 
  )
GO


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
LOCATION = '/dirstaging/',
DATA_SOURCE = [synapsefs259855_synapsesa259855_dfs_core_windows_net],
FILE_FORMAT = [SynapseDelimitedTextFormat]
)
GO








SELECT TOP 100 * FROM dbo.NYC_Payroll_Summary
GO