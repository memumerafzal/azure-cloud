Count number of items Use the count operator to discover the number of
records in an input record set.

The following example returns the number of records in the StormEvent
table. The query results reveal the StormEvent table has five entries.

StormEvent \| count

Return first number of items Use the top operator to see the first N
records of your input record set, sorted by your specified columns. The
columns correspond to data properties defined in the dedicated table.

The following example returns the first three data records for
StormEvent. The results table shows the storm event name, the severity,
and the forecasted duration.

StormEvent \| top 3 by event severity duration

Aggregate content Use the summarize operator to create a table that
aggregates the content of the input record set based on your
specifications.

The following example returns an aggregate table for StormEvent. The
results table shows the average (avg) severity level of each storm type
for each region for all (count) data records in the dedicated table.
StormEvent \| summarize count(), avg(severity) by type, region
