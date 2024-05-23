-- Use the same file format as used for creating the External Tables during the LOAD step.
IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
FORMAT_OPTIONS (
FIELD_TERMINATOR = ',',
USE_TYPE_DEFAULT = FALSE
))
GO

-- Storage path where the result set will persist
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'synapsefs259435_synapsesa259435_dfs_core_windows_net') 
  CREATE EXTERNAL DATA SOURCE [synapsefs259435_synapsesa259435_dfs_core_windows_net] 
  WITH (
      LOCATION = 'abfss://synapsefs259435@synapsesa259435.dfs.core.windows.net' 
  )
GO