ADD JAR /usr/hdp/2.6.5.3006-29/hive2/lib/hive-hcatalog-core.jar;

DROP TABLE IF EXISTS amort;

CREATE EXTERNAL TABLE amort (
  Key INT,
  Value struct < assetValue: DOUBLE, principalAmount: DOUBLE, zipcode: STRING, startDate: STRING >
 )
 ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe';
 
 load data inpath 'abfs:///json/*.json' into table amort;
 
 select 
   key, 
   value.assetvalue,
   value.principalAmount,
   value.zipcode,
   value.startDate
 from amort;