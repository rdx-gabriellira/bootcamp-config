SELECT
external_id AS externalId,
coalesce(parent_external_id, "") as parentExternalId,
name AS name,
description AS description,
'from RAW' AS source,
Dataset_id('src:001:sap:ds') AS dataSetId,

json_tuple(metadata,'site','type', 'cycle time', 'Function', 'src', 'Machine type') AS (site, type, cycle_time, function, src, machine_type),
to_metadata(site,type, cycle_time, function, src, machine_type) AS metadata

FROM
`src:001:sap:db`.`assets`;
